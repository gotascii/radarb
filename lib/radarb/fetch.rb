module Radarb
  module Fetch
    def self.fetch_xml(url)
      LibXML::XML::Document.string(fetch_url(url)).root
    end

    def self.fetch_url(url)
      Curl::Easy.perform(url).body_str
    end
  end
end