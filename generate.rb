require "bundler/inline"
require "erb"

gemfile do
  gem "faraday"
  gem "feedjira"
end

title = "🐣 juneboku.xyz 🌲"
body = "juneboku.xyz"

puts ERB.new(File.read("template.erb")).result(binding)
