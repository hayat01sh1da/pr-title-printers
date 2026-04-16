# rbs_inline: enabled

require_relative './src/application'

branch_name, *_ = ARGV
params = { branch_name: }.reject { |_, value| value&.empty? }
puts Application.run(**params)
