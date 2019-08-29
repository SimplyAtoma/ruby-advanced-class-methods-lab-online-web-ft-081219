class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
 
  def self.create
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    song.save
    song
  end
  
  def self.find_by_name(song_name)
      hold = Song.all.select{|song| song.name == song_name}
      hold[0]
  end
  
  def self.find_or_create_by_name(song)
    if Song.find_by_name(song)
      return Song.find_by_name(song)
    else 
      Song.create_by_name(song)
    end 
  end
  
  def self.alphabetical
    name_hold = []
    Song.all.each{|song|
      name_hold << song.name
    }
    name_hold.sort 
    name_hold
  end
end
