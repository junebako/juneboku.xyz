require "bundler"
require "erb"
Bundler.require

title = "🐣 juneboku.xyz 🌲"
body = "juneboku.xyz"

puts ERB.new(File.read("template.erb")).result(binding)
