require 'spec_helper'
require_relative '../../lib/parser.rb'

RSpec.describe "ToyRobotSimulator" do
  subject { system "./bin/toy_robot_simulator #{file}" }

  context 'when file is not provided' do
    let(:file) { '' }
    it { expect { subject }.to output.to_stderr_from_any_process }
  end

  context 'when file is not provided' do
    let(:file) { 'test.txt' }

    it 'parses the file and outputs the correct report' do
      report =  "Output: 0,3,EAST\n" \
                "Output: 4,2,NORTH\n" \
                "Output: 0,1,SOUTH\n" \
                "Output: 0,1,NORTH\n" \
                "Output: 0,0,WEST\n" \
                "Output: 3,3,NORTH\n" \
                "Output: 3,0,WEST\n"

      expect { subject }.to output(report).to_stdout_from_any_process
    end
  end

end
