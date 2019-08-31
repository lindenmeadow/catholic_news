class CatholicNews::News
	
	def news_stories
		@doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))

		@doc.css("div.noticia_list_contenedor").each do |st|
			story = CatholicNews::Story.new
			story.headline = st.css("div.noticia_list_title").text.strip
			story.teaser = st.css("div.noticia_list_body").text.strip
			story.link = st.css("div.noticia_list_title h3 b a").attr("href")
		end
	end
end
