# frozen_string_literal: true

require 'spec_helper'
require 'commands/report'
require 'toy_robot'

RSpec.describe Commands::Report do
  let(:toy_robot) { ToyRobot.new }
  let(:report_command) { Commands::Report.new(toy_robot) }

  describe 'REPORT command' do
    context 'when the toy_robot is placed on the table' do
      it 'displays the current position and direction' do
        toy_robot.set_direction('SOUTH')
        toy_robot.set_position(2, 3)

        expect { report_command.execute }
          .to output(a_string_including('Output: 2,3,SOUTH')).to_stdout
      end
    end

    context 'when the toy_robot is not placed on the table' do
      it "doesn't display anthing" do
        expect { report_command.execute }
          .to_not output.to_stdout
      end
    end
  end
end
