class CatholicNews::News
	attr_accessor :doc
	
	@@all = []
	
	def initialize
		@doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	end
	
	def self.all
		@@all
	end
	
	def self.find(id)
		self.all[id-1]
	end
	
	def scrape_stories
		@@all << self.scrape_page
	end
	
	def scrape_page
		@doc.css("div.noticia_list_body").each do |story|
			s = Story.new
			s.headline = story.css("div.noticia_list_title").text.strip
			s.teaser = story.css("div.noticia_list_body").text.strip
			s.link = story.css("a").attr("href").text.strip
		end
	end
end