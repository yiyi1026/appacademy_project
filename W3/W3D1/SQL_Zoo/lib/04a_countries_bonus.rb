# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    name
  FROM
    countries
  WHERE
    gdp IS NOT NULL AND gdp > (
      SELECT
        MAX(gdp)
      FROM
        countries
      WHERE
        continent = 'Europe'
   )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  SELECT
    continent, name, area
  FROM
    countries a
  WHERE
    area > (
      SELECT
        MAX(area)
      FROM
        countries b
      WHERE
        a.name != b.name AND a.continent = b.continent
    )
  GROUP BY
    continent, name, area
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  SELECT
    a.name, a.continent
  FROM
    countries a
  WHERE
    a.population > (
      SELECT
        3 * MAX(population)
      FROM
        countries
      WHERE
        continent = a.continent AND countries.name != a.name
    )
  GROUP BY
    a.continent, a.name
  SQL
end
