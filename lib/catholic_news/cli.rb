class CatholicNews::CLI

  def call
    CatholicNews::News.new.news_stories
    selection
  end

  def list_headlines
	puts "~~~~~~~~~~  Welcome to catholicnewsagency.com  ~~~~~~~~~~".colorize(:green)
	puts ""
	puts "               Here are today's headlines:".colorize(:green)
	puts "               ---------------------------".colorize(:green)
  CatholicNews::Story.all.each_with_index do |h, i|
	      puts "#{i + 1}. #{h.headline}"
	      puts "-------------------------".colorize(:green)
	    end
	end

  def selection
	list_headlines
	input = nil

	while input != "exit"
		puts ""
		puts "Options:".colorize(:yellow)
		puts "-Type the number of a headline for more information".colorize(:yellow)
		puts "-Type headlines to see the list of headlines again".colorize(:yellow)
		puts "-Or type exit to quit".colorize(:yellow)

		input = gets.strip.downcase
		if input == "headlines"
			list_headlines
		elsif input.to_i > 0 && input.to_i <= CatholicNews::Story.all.length
      		story_info = CatholicNews::Story.all[input.to_i-1]
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:green)
			puts "--> " + story_info.teaser
			puts ""
			puts "Full story: www.catholicnewsagency.com#{story_info.link}".colorize(:blue)
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:green)
		elsif input == "exit"
			finish
		else
			puts "Invalid entry.".colorize(:yellow)
		end
	end
  end

  def finish
       puts "Thanks for visiting! Check back tomorrow for more news!".colorize(:green)
  end

end
