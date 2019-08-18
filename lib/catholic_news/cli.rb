class CatholicNews::CLI
	def call
		list_headlines
		info
		selection
	end
	
	def list_headlines
		puts "Today's Headlines"
		puts "_________________"
		CatholicNews::News.all.each.with_index(1) do |s, i|
			puts "#{i}. #{s.headline}"
		end
	end
	
	def info(story)
		puts "#{story.headline}"
		puts ""
		puts story.teaser
		puts ""
		puts "URL: #{story.link}"
		puts ""
	end
	
	def selection
		list_headlines
		input = nil
		
		while input != "exit"
			puts "Options:"
			puts "Enter the number of the story you would like more information on," 
			puts "Type headlines to see the list of headlines again,"
			puts "Or type exit to quit"
			input = gets.strip.downcase
				if input == "headlines"
					list_headlines
				elsif input.to_i > 0
					if story = NewsScraper::News.find(input.to_i)
						info(story)
					end
				else 
					puts "Invalid entry. Please enter headlines, exit, or a number from the list of headlines."
				end
		end
		puts "Thanks for visiting! Check back tomorrow for more news!"
	end
end