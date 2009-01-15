require File.join(File.dirname(__FILE__), '..', 'test_helper')

module Radarb
  class RadarTest < Test::Unit::TestCase
    context "The Radar class" do
      should "make the api call and fetch the response xml when created" do
        Radar.stubs(:parse)
        Fetch.expects(:fetch_url).with("#{API}?lat=123&lng=456")
        Radar.scan('123', '456')
      end

      should "parse the api xml response" do
        Fetch.stubs(:fetch_url).returns('xml')
        Radar.expects(:parse).with('xml').returns('parsed_xml')
        assert_equal 'parsed_xml', Radar.scan('123', '456')
      end

      should "extend the parsed xml with Collectable" do
        Fetch.stubs(:fetch_url).returns('xml')
        parsed_xml = mock {|m| m.expects(:extend).with(Collectable) }
        Radar.stubs(:parse).with('xml').returns(parsed_xml)
        Radar.scan('123', '456')
      end
    end
  end
end