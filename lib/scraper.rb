require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html) 

    scraped_studnets = []

    doc.css("div.student-card").each do |student|
      profile = {
      :name => student.css("h4.student-name").text,
      :location => student.css("p.student-location").text.strip,
      :profile_url => student.css("a").attribute("href").value
      }
      scraped_studnets << profile
    end
    scraped_studnets
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html) 
      profile = {}
      profile[:profile_quote] = doc.css("div.profile-quote").text
      profile[bio] = doc.css("p").text.strip
      profile[:blog] = doc.css("a").attribute("href")
      binding.pry
  
    profile
  end

end


