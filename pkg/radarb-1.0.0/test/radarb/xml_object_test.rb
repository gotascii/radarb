require File.join(File.dirname(__FILE__), '..', 'test_helper')

module Radarb
  class Tester
    include Radarb::XmlObject
  end

  class XmlObjectTest < Test::Unit::TestCase
    context "An instance of a class that includes XmlObject" do
      setup do
        @xml = Tester.new
      end

      should "return nil if the node does not exist and name does not end in s" do
        @xml.stubs(:find_first).with("./jack").returns(nil)
        assert_equal nil, @xml.jack
      end

      should "return empty array if the node does not exist and name ends in s" do
        @xml.stubs(:find_first).with("./jacks").returns(nil)
        assert_equal [], @xml.jacks
      end

      should "return string value if node contains a child node and no subset nodes" do
        subset = stub(:count => 0)
        node = stub {|s|
          s.stubs(:find).with("./jack").returns(subset)
          s.stubs(:child).returns("joy")
        }
        @xml.stubs(:find_first).with("./jacks").returns(node)
        assert_equal "joy", @xml.jacks
      end

      should "return subset nodes if they exist" do
        subset = stub(:count => 1, :to_a => [1,2])
        node = stub {|s| s.stubs(:find).with("./jack").returns(subset) }
        @xml.stubs(:find_first).with("./jacks").returns(node)
        assert_equal [1,2], @xml.jacks
      end
    end
  end
end