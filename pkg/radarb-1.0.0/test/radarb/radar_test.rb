require File.join(File.dirname(__FILE__), '..', 'test_helper')

module Radarb
  class RadarTest < Test::Unit::TestCase
    context "An instance of the Radar class" do
      setup do
        Fetch.stubs(:fetch_xml).returns('api_response')
        @radar = Radar.new('123', '456')
      end

      should "make the api call and fetch the response xml when created" do
        Fetch.expects(:fetch_xml).with("#{API}?lat=123&lng=456")
        Radar.new('123', '456')
      end

      should "assign api response to root" do
        assert_equal 'api_response', @radar.root
      end

      should "return all radar nodes as an array for blips" do
        nodes = stub(:to_a => [1,2])
        @radar.root.stubs(:find).with('/radars/radar').returns(nodes)
        assert_equal [1,2], @radar.blips
      end

      should "return all blips with type Story for stories" do
        story = stub {|s| s.stubs(:[]).with("type").returns("Story") }
        thing = stub {|s| s.stubs(:[]).with("type").returns("Thing") }
        blips = [thing, story]
        @radar.stubs(:blips).returns(blips)
        assert_equal [story], @radar.stories
      end

      should "return all blips with type Tweet for tweets" do
        tweet = stub {|s| s.stubs(:[]).with("type").returns("Tweet") }
        thing = stub {|s| s.stubs(:[]).with("type").returns("Thing") }
        blips = [thing, tweet]
        @radar.stubs(:blips).returns(blips)
        assert_equal [tweet], @radar.tweets
      end
    end
  end
end