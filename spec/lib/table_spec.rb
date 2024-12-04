# frozen_string_literal: true

require 'spec_helper'
require 'table'

RSpec.describe Table do
  let(:table) { Table.new(width: 5, height: 5) }

  describe '#valid_position?' do
    it 'should be true if position is on the table' do
      expect(table.valid_position?(2, 4)).to be true
    end

    it 'should be false if position is outside of the table' do
      expect(table.valid_position?(5, 4)).to be false
    end
  end
end
