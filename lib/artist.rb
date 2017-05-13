class Artist

  attr_accessor :name


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(name)
    @songs << name
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each { |song| puts "#{song.name}" }
  end

  def self.find_or_create_by_name(artist_name)
    check = @@all.find {|artist| artist.name == artist_name}
    if check
      check
    else
      new_artist = Artist.new(artist_name)
      new_artist.save
      new_artist
    end
  end

  def self.all
    @@all
  end
end
