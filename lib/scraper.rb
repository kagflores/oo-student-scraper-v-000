require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  index_url = 'fixtures/student-site/index.html'

  def self.scrape_index_page(index_url)
    html = File.read(index_url)
    roster = Nokogiri::HTML(html)
    students = {}
    roster.css(".roster-cards-container").each do |student|
      student_header = student.css(".student-card").text
      students[student_header.to_sym] = {
        :name => variable.css(".roster-cards-container").css("h4").text,
        :location => variable.css(".roster-cards-container").css("p").text,
        :profile_url => variable.css(".roster-cards-container").css("a").attribute("href").value
        binding.pry
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
Scraper.scrape_index_page('./fixtures/student-site/index.html')
