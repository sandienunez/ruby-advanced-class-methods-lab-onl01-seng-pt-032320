require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

def self.create
  song = Song.new 
  song.save
  song 
 # binding.pry
end 

#instantiates a song with a name property
#takes in the string name of a song 
#returns a song instance with that name set as its name property 
def self.new_by_name(song_name)
  song = Song.new
  song.name = name
  song 
end 

def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end
  
   def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical()
    #returns all the songs instances in ascending (a-z) alphabetical order.
    @@all.sort_by{|x| x.name}
  end
  
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
  #class method should not only parse the filename correctly but should also save the song
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    #reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
    @@all.clear
  end


  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
