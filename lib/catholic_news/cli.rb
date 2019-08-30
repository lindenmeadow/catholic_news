class CatholicNews::CLI

  def call
    CatholicNews::News.new.news_stories
    selection
  end

  def list_headlines
	puts "~~~~~~~~~~  Welcome to catholicnewsagency.com  ~~~~~~~~~~"
	puts ""
	puts "               Here are today's headlines:"
	puts "               ---------------------------"
  CatholicNews::Story.all.each_with_index do |h, i|
	      puts "#{i + 1}. #{h.headline}"
	      puts "-------------------------"
	    end
	end

  def selection
	list_headlines
	input = nil

	while input != "exit"
		puts ""
		puts "Options:"
		puts "-Type the number of a headline for more information"
		puts "-Type headlines to see the list of headlines again"
		puts "-Or type exit to quit"

		input = gets.strip.downcase
		if input == "headlines"
			list_headlines
		elsif input.to_i > 0 && input.to_i <= CatholicNews::Story.all.length
      		story_info = CatholicNews::Story.all[input.to_i-1]
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
			puts "--> " + story_info.teaser
			puts ""
			puts "Full story: www.catholicnewsagency.com" + story_info.link
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
		elsif input == "exit"
			finish
		else
			puts "Invalid entry."
		end
	end
  end

  def finish
       puts "Thanks for visiting! Check back tomorrow for more news!"
  end

end
