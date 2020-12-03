class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        # binding.pry
        filename = file.split(" - ")
        new_name = filename[1]
        new_artist = filename[0]
        song = self.new(new_name) 
        song.artist = Artist.find_or_create_by_name(new_artist)
        song
    end

    def artist_name=(artist)
        artist = Artist.find_or_create_by_name(artist)
        artist.add_song(self)
    end
end