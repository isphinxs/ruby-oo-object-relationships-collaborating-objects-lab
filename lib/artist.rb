class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = self.all.detect {|artist| artist.name == name}
        artist ? artist : self.new(name)
    end

    def print_songs
        song_instances = self.songs
        song_instances.each {|song| puts song.name}
    end
end