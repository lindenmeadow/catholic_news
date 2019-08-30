class CatholicNews::Story
	attr_accessor :headline, :teaser, :link

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
