# frozen_string_literal: true

require 'spec_helper'
require 'toy_robot'

RSpec.describe ToyRobot do
  let(:toy_robot) { ToyRobot.new }

  describe '#set_position' do
    it 'places the robot on a specified position on the table' do
      expect { toy_robot.set_position(2, 1) }
        .to change(toy_robot, :x).from(nil).to(2)
        .and change(toy_robot, :y).from(nil).to(1)
        .and not_change(toy_robot, :facing)
    end
  end

  describe '#set_direction' do
    context 'when the direction is valid' do
      it 'changes the facing direction of the toy_robot' do
        expect { toy_robot.set_direction('SOUTH') }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and change(toy_robot, :facing).from(nil).to('SOUTH')
      end
    end

    context 'when the direction is not valid' do
      it "doesn't change the facing direction of the toy_robot" do
        expect { toy_robot.set_direction('SOUTHY') }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end
  end

  describe '#placed?' do
    context 'when the position and direction are set' do
      it 'should be true' do
        toy_robot.set_direction('SOUTH')
        toy_robot.set_position(1, 3)

        expect(toy_robot.placed?).to be true
      end
    end

    context 'when the position and the direction are not set' do
      it 'should be false' do
        expect(toy_robot.placed?).to be false
      end
    end
  end
end
