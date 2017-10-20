require 'simplecov'

SimpleCov.start do

  add_group 'Models', 'models'

end

# This outputs the report to your public folder
SimpleCov.coverage_dir 'public/coverage'
