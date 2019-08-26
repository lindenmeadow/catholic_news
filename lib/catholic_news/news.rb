class CatholicNews::News
	
	def self.access_page
	  Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	end

	def self.find_teaser(id)
	  self.teasers[id-1]
	end

	def self.find_link(l)
	  self.links[l-1]
	end

	def self.teasers
	  @teasers = access_page.search("div.noticia_list_body")
	  @teasers.collect{|t| t.text.strip}
	end

	def self.links
	  @links = access_page.search("div.noticia_list_title h3 b a")
	  @links.collect{|l| l.attr("href")}
	end

	def self.headlines
	  @headlines = access_page.search("div.noticia_list_title")
	  @headlines.collect{|h| h.text.strip}
	end
end
