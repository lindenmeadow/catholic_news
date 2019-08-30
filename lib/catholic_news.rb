require 'open-uri'
require 'nokogiri'

require_relative "./catholic_news/version.rb"
require_relative "./catholic_news/cli.rb"
require_relative "./catholic_news/news.rb"
require_relative "./catholic_news/story.rb"

module CatholicNews
  class Error < StandardError; end
end
