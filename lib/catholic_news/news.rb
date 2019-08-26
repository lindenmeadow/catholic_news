class CatholicNews::News
	
	def self.find_teaser(id)
	  self.teasers[id-1]
	end
	
	def self.find_link(l)
	  self.links[l-1]
	end

	def self.teasers
	  doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	  teaser = doc.css("div.noticia_list_body")
	  teaser.collect{|t| t.text.strip}
	end
	
	def self.links
	  doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	  link = doc.css("div.noticia_list_title h3 b a")
	  link.collect{|l| l.attr("href")}
	end
	
	def self.headlines
	  doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
	  headline ||= doc.css("div.noticia_list_title")
	  headline.collect{|h| h.text.strip}
	end
end
