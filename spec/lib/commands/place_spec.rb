# frozen_string_literal: true

require 'spec_helper'
require 'commands/place'
require 'toy_robot'
require 'table'

RSpec.describe Commands::Place do
  let(:toy_robot) { ToyRobot.new }
  let(:table) { Table.new(width: 5, height: 5) }
  let(:place_command) { Commands::Place.new(toy_robot, table, **kargs) }

  describe 'PLACE command' do
    context 'when the new position on the table is valid' do
      let(:kargs) { { x: 3, y: 1, facing: 'NORTH' } }

      it 'places the robot on the requested position and facing the correct direction' do
        expect { place_command.execute }
          .to change(toy_robot, :x).from(nil).to(3)
          .and change(toy_robot, :y).from(nil).to(1)
          .and change(toy_robot, :facing).from(nil).to('NORTH')
      end

      it 'overrides the old postion and direction' do
        toy_robot.set_position(4, 3)
        toy_robot.set_direction('EAST')

        expect { place_command.execute }
          .to change(toy_robot, :x).from(4).to(3)
          .and change(toy_robot, :y).from(3).to(1)
          .and change(toy_robot, :facing).from('EAST').to('NORTH')
      end
    end

    context 'when the new position on the table is not valid' do
      let(:kargs) { { x: 5, y: 1, facing: 'NORTH' } }

      it "doesn't place the robot outside of the table" do
        expect { place_command.execute }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end
  end
end
