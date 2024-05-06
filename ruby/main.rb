require_relative './src/application'

branch_name, *_ = ARGV
puts Application.run(branch_name:)
