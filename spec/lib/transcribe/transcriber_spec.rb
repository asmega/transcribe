require 'spec_helper'

describe Transcribe::Transcriber do
  before(:each) do
    FileUtils.rm_rf("/tmp/transcribe.csv")
  end

  describe :to_csv do
    let(:yaml_path){ Dir.pwd + "/spec/fixtures/en.yml" }
    subject{ described_class.new([yaml_path]) }

    before :each do
      subject.to_csv
    end

    it 'creates a csv' do
      expect(File.exists?("/tmp/transcribe.csv")).to be_true
    end

    it 'add first rows as languages' do
      csv = CSV.read("/tmp/transcribe.csv")
      expect(csv[0][1]).to eql("en")
    end
  end
end
