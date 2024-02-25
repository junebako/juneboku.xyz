require "bundler"
require "erb"
Bundler.require

title = "🐣 juneboku.xyz 🌲"
body = "juneboku.xyz"

feed_urls = %w[
  https://junebako.github.io/sff/june29/nikki.xml
  https://junebako.github.io/sff/june29/zakki.xml
  https://listen.style/p/kimagurefm/rss
  https://listen.style/p/juneboku-life/rss
  https://june29.substack.com/feed?sectionId=70158
]

feeds = feed_urls.map { |feed_url|
  puts "Processing: #{feed_url}"
  [
    feed_url,
    Feedjira.parse(Faraday.get(feed_url).body)
  ]
}

last_updated_at = feeds.map { |_, feed| feed.entries.sort_by(&:published).last.published }.max

File.write("./public/index.html", ERB.new(File.read("template.erb")).result(binding))
