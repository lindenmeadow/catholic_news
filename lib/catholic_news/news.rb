class CatholicNews::News
	attr_accessor :doc, :headline, :teaser, :link
	
  def initialize
	  @doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	  @headline = headline
	  @teaser = teaser
	  @link = link
	end
	
	def self.all_headlines
	  @@all_headlines ||= headlines
	end
	
	def self.all_teasers
	  @@all_teasers ||= teasers
	end
	
	def self.all_links
	  @@all_links ||= links
	end
	
	def self.find_teaser(id)
	  self.all_teasers[id-1]
	end
	
	def self.find_link(l)
	  self.all_links[l-1]
	end
	

	def self.teasers
	  doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	  teaser = doc.search("div.noticia_list_body")
	  teaser.collect{|t| t.text.strip}
	end
	
	def self.links
	  doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	  link = doc.search("div.noticia_list_title h3 b a")
	  link.collect{|l| l.attr("href")}
	end
	
	def self.headlines
	  doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
		headline ||= doc.search("div.noticia_list_title")
		headline.collect{|h| h.text.strip}
	end
end
