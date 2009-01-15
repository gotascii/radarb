radarb
  by Justin Marney
  http://github.com/vigetlabs/radarb

== DESCRIPTION:

A ruby gem that makes using the http://outside.in/ API simple.

== SYNOPSIS:

require 'radarb'

blips = Radarb::Radar.scan('40.714550', '-74.007124')

blips.each do |blip|
  puts blip.author
  puts blip.url
  puts blip.type
end

blips.stories.each do |story|
  puts story.title
  puts story.body
end

blips.tweets.each do |story|
  puts story.author
  puts story.body
end

story = blips.stories.first

story.places.each do |place|
  puts place.name
  puts place.url
end

story.tags.each do |tag|
  puts tag.name
  puts tag.url
end

== REQUIREMENTS:

sudo gem install curb
sudo gem install gotascii-happymapper -s http://gems.github.com

== INSTALL:

sudo gem install vigetlabs-radarb -s http://gems.github.com

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIXME (different license?)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
