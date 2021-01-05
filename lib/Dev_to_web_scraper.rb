require "Dev_to_web_scraper/version"

# instruction module
module DevToWebScraper
  class Error < StandardError; end

  module Instructions
    def introductions
      puts 'Welcome to dev.to webscraper. This CLi tool gathered articles based on the hashtag provided'
      puts 'If you want to quit, simple type (q) the next time you are prompted to enter a value'
      puts 'Please provide a hashtag to continue..'
      puts ''
    end

    def quit_message
      puts 'You have quit the scraper'
    end

    def invalid_entry
      puts 'Invalid entry, try again'
    end
  end


  class Scraper
    extend Instructions

    def self.get_input
      user_input = gets.chomp
      get_hashtag(user_input)
    end

    def self.get_hashtag(user_input)
      if user_input == 'q'
        quit_message
      elsif user_input.empty?
        invalid_entry
        get_input
      else
        scrape_data(user_input.to_s)
      end
    end

    def self.scrape_data(hashtag)
      puts "Scraped data for #{hashtag}"
      get_input
    end
  end


  Scraper.introductions
  Scraper.get_input
