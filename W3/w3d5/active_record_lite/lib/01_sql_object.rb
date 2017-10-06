require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject


  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    cols = cols.first
    @columns = cols.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end

      define_method("#{col}=") do |arg|
        self.attributes[col] = arg
      end
    end
  end

  def self.table_name=(table_name)
    @table_name =  table_name
    # ...
  end

  def self.table_name(table_name = nil)
    @table_name || self.to_s.downcase.pluralize

  end

  def self.all
    result = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    parse_all(result)
  end

  def self.parse_all(results)
    results.map { |result| new(result) }
  end

  def self.find(id)
    all.find { |obj| obj.id == id }
  end

  def initialize(params = {})
    params.each do |key, value|
      attr_name = key.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}

  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    col_length = columns.length
    question_marks = (["?"] * col_length).join(", ")
    result = DBConnection.execute(<<-SQL, *attribute_values.drop(1))
    INSERT INTO
      #{self.class.table_name} (#{col_names})
    VALUES
      (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
    # ...
  end

  def update
    set_line = self.class.columns.map{|col_name| "#{col_name} = ?" }.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
      SQL
  end

  def save
    id.nil? ? insert : update
  end
end
