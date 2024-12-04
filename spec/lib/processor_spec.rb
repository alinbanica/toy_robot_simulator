# frozen_string_literal: true

require 'spec_helper'
require 'processor'
require 'toy_robot'
require 'table'

RSpec.describe Processor do
  let(:table) { Table.new(width: 5, height: 5) }
  let(:toy_robot) { ToyRobot.new }
  let(:processor) { Processor.new(toy_robot, table) }

  describe '#process' do
    context 'when command string starts with PLACE and command is valid' do
      it 'expects to call the place command with the correct params' do
        kargs = { x: 1, y: 2, facing: 'SOUTH' }

        expect(Commands::Place).to receive(:new)
          .with(toy_robot, table, **kargs)
          .and_call_original

        processor.process('PLACE 1,2,SOUTH')
      end
    end

    context 'when command string starts with PLACE and command is not valid' do
      it 'expects to call the place command with the correct params' do
        expect(Commands::Place).to_not receive(:new)

        processor.process('PLACE 1,2,SOUTHY')
      end
    end

    context 'when command is MOVE' do
      it 'expects to call the move command with the correct params' do
        expect(Commands::Move).to receive(:new)
          .with(toy_robot, table)
          .and_call_original

        processor.process('MOVE')
      end
    end

    context 'when command is LEFT' do
      it 'expects to call the left command with the correct params' do
        expect(Commands::Left).to receive(:new)
          .with(toy_robot)
          .and_call_original

        processor.process('LEFT')
      end
    end

    context 'when command is RIGHT' do
      it 'expects to call the left command with the correct params' do
        expect(Commands::Right).to receive(:new)
          .with(toy_robot)
          .and_call_original

        processor.process('RIGHT')
      end
    end

    context 'when command is REPORT' do
      it 'expects to call the left command with the correct params' do
        expect(Commands::Report).to receive(:new)
          .with(toy_robot)
          .and_call_original

        processor.process('REPORT')
      end
    end

    context 'when invalid command is provided' do
      it 'expects to call the left command with the correct params' do
        expect { processor.process('TEST') }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end

    context 'when empty command is provided' do
      it 'expects to call the left command with the correct params' do
        expect { processor.process('') }
          .to not_change(toy_robot, :x)
          .and not_change(toy_robot, :y)
          .and not_change(toy_robot, :facing)
      end
    end
  end
end
