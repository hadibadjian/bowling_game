require 'spec_helper'
require 'bowling_game/parsers/simple_parser'
require 'bowling_game/controllers/frames_controller'

RSpec.describe BowlingGame::Controllers::FramesController do

  context "correct frames" do

    before(:each) do
      @frames = "4,6 > 5,0".split('>').map(&:strip)
      parser = BowlingGame::Parsers::SimpleParser.new
      @controller = BowlingGame::Controllers::FramesController.new @frames, parser
    end

    it "should return correct number of frames" do
      expect(@controller.number_of_frames).to eql(@frames.count)
    end

    it "should parse frames correctly" do
      expect(@controller.next_frame).to be_kind_of(BowlingGame::Models::Frame)
    end

  end

end
