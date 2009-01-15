require File.join(File.dirname(__FILE__), '..', 'test_helper')

module Radarb
  class ColelctableTest < Test::Unit::TestCase
    context "An object extended by the Collectable module" do
      setup do
        @collectable = [].extend(Collectable)
      end
      
      should "return all items with type Tweet" do
        @collectable.expects(:find_by_type).with('Tweet').returns('tweet!')
        assert_equal 'tweet!', @collectable.tweets
      end

      should "return all items with type Story" do
        @collectable.expects(:find_by_type).with('Story').returns('story!')
        assert_equal 'story!', @collectable.stories
      end

      should "return all items with specified type" do
        tweet = stub(:type => 'Tweet')
        story = stub(:type => 'Story')
        @collectable << tweet
        @collectable << story
        @collectable.find_by_type('Tweet')
        assert_equal [tweet], @collectable.find_by_type('Tweet')
      end
    end
  end
end