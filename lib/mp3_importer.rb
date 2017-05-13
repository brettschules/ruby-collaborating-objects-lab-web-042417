class MP3Importer

  attr_accessor :artist
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir[self.path + "/*"].each do |song|
      name = song.split("./spec/fixtures/mp3s/")
      @files << name[1]
    end
    @files.flatten
  end

    def import
      self.files.each { |file| Song.new_by_filename(file) }
    end
  end
