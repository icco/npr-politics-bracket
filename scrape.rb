#! /usr/bin/env ruby

require "rubygems"
require "bundler"
Bundler.require(:default)
require "zlib"

client = Twitter::REST::Client.new do |config|
end

tweets = File.read("round1-tweets.txt").split("\n")

html = "<h2>Round 1!</h2>\n"
i = 1
tweets.each do |tweet|
  o = client.oembed(tweet)
  html += <<EOH
<div>
  <h3>#{i}. <a href="#{tweet}">#{tweet}</a></h3>
  #{o.html}
</div>

EOH
  i += 1
end

File.open("round1.html", "w"){ |f| f.write html }

