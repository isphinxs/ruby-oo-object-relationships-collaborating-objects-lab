class MP3Importer
    attr_accessor :path

    def initialize(path)
        self.path = path
    end

    def files
        Dir["#{path}/*.mp3"].collect {|file| File.basename(file)}
    end

    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end
end