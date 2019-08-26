class CatholicNews::CLI
  
  def call
    selection
  end
	
  def list_headlines
	puts "~~~~~~~~~~  Welcome to catholicnewsagency.com  ~~~~~~~~~~"
	puts ""
	puts "               Here are today's headlines:"
	puts "               ---------------------------"
	@story = CatholicNews::News.all_headlines
	    @story.each.with_index(1) do |h, i|
	      puts "#{i}. #{h}"
	      puts "-------------------------"
	    end 
	end
	
  def selection
	list_headlines
	input = nil
		
	while input != "exit"
		puts ""
		puts "Options:"
		puts "-Type the number of the headline for more information"
		puts "-Type headlines to see the list of headlines again"
		puts "-Or type exit to quit"
			
		input = gets.strip.downcase
		if input == "headlines"
			list_headlines
		elsif input.to_i > 0 && input.to_i <= 20
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
			puts "--> " + CatholicNews::News.find_teaser(input.to_i)
			puts ""
			puts "Full story: www.catholicnewsagency.com" + CatholicNews::News.find_link(input.to_i)
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
