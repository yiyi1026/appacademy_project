require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 03_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    through_options = self.clss.assoc_options[through_name]
    source_options = through_options.model_class.assoc_options[source_name]
    define_method(name) do
      through_options.model_class
    end
  end
end
