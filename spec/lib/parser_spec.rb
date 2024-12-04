# frozen_string_literal: true

require 'spec_helper'
require 'parser'

RSpec.describe Parser do
  let(:parser) { Parser.new(file_path: file_path) }

  context 'when file name not provided' do
    let(:file_path) { nil }
    it 'raises and exception' do
      expect { parser.parse }.to raise_error('Please provide a file to test the toy_robot_simulator!')
    end
  end

  context "when the file provide doesn't exist" do
    let(:file_path) { File.expand_path('../support/sample_file.txt', __dir__) }

    it 'raises and exception with a correct message' do
      expect { parser.parse }.to raise_error("Provided file doesn't exist!")
    end
  end

  context 'when the file provide is empoty' do
    let(:file_path) { File.expand_path('../support/empty_file.txt', __dir__) }

    it 'parses the file with no output' do
      expect { parser.parse }
        .to_not output
        .to_stdout
    end
  end

  context 'when the file provide exists' do
    let(:file_path) { File.expand_path('../support/test_file.txt', __dir__) }

    it 'parses the file and executes the commands' do
      expect { parser.parse }
        .to output(a_string_including('3,3,NORTH'))
        .to_stdout
    end
  end
end
