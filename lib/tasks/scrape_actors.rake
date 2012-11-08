desc "Get some actors from wikipedia"

task :scrape_actors => :environment do 
	require 'nokogiri'
	require 'open-uri'
	require 'application_helper'

	include ApplicationHelper

	unwantedlinksarr = ["See also", "References", "Notes", "Footnotes"]
	newlinks = []

	url = "http://en.wikipedia.org/wiki/List_of_Chinese_actresses"
	doc = Nokogiri::HTML(open(url))

	#Get the category list of actors
	doc.css(".mw-headline").each do |elem|
		if !unwantedlinksarr.include? elem.text
			lists = elem.parent.next_element.css("li")
			lists.each do |list|
				if !list.css("a").empty?
					link = list.css("a").first
					
					newlinks.push(link['href']) unless (link['href'].include? '#') || (link['title'].include? "does not exist") 
				end
			end
		end		
	end

	#Save each actor to the database
	newlinks.each do |link|
		page = Nokogiri::HTML(open("http://en.wikipedia.org" + link))
		
		actor = Actor.new
		
		fullname = page.at_css(".firstHeading").text unless page.at_css(".firstHeading") == nil

		if fullname
			split = split(fullname)
			actor.first_name = split[0]
			actor.last_name = split[1]
		end

		actor.dateborn = page.css(".infobox").css("span.bday").text unless page.css(".infobox").css("span.bday") == nil
		actor.image_path = page.css(".infobox").at_css("img")['src'] unless page.css(".infobox").at_css("img") == nil

		if actor.first_name && actor.last_name && actor.dateborn
			actor.save
		end
	end

end