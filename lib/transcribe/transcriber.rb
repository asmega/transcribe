require 'csv'
require 'pathname'

module Transcribe
  class Transcriber
    attr_reader :yaml_paths

    def initialize(yaml_paths)
      @yaml_paths = yaml_paths.map{|path| Pathname.new path}
    end

    def to_csv
      CSV.open(out_path, "wb") do |csv|
        csv << ["keys"] + locales
      end
    end

    private

    def locales
      yaml_paths.map{|path| path.basename.to_s.gsub(path.extname, '')}
    end

    def out_path
      "/tmp/transcribe.csv"
    end
  end
end
