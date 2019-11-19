# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

# url = 'http://everynoise.com/everynoise1d.cgi?scope=all'
# html = open(url)
# doc = Nokogiri::HTML(html)
# rows = doc.css("tr")
# p genres = rows.map{|genre| genre.css("a").children.text[1..-1]}

url = 'http://everynoise.com/engenremap.html'
html = open(url)
doc = Nokogiri::HTML(html)
rows = doc.css('div.genre')

# genres = rows.map{ |genre| [genre.text[0..-3], genre.attributes["preview_url"].value] }.to_h

genres = rows.map{|genre| genre.text[0..-3]}
# genreUrls = []
genres[3664.. genres.length - 1].map do |genre|
    newGenre = genre
    newGenre.gsub! ' ', '%20'
    newGenre.gsub! '+', '%2B'
    url = 'http://everynoise.com/everynoise1d.cgi?root=' + newGenre + '&scope=all'
    html = open(url)
    doc = Nokogiri::HTML(html)
    iframe = doc.css('a#spotifylink')
    Playlist.create(name: genre, url: iframe[0].attributes["href"].value)
    p genre
    # genreUrls[genre] = iframe[0].attributes["href"].value
    # p genreUrls[genre]
end
p "------------------------DONE------------------------"
p "------------------------DONE------------------------"
p "------------------------DONE------------------------"
p "------------------------DONE------------------------"
p "------------------------DONE------------------------"
# p genreUrls

# genres.forEach do |genre|
#     relatedPlaylists = []
#     newGenre = genre
#     newGenre.gsub! ' ', '%20'
#     newGenre.gsub! '+', '%2B'
#     url = 'http://everynoise.com/everynoise1d.cgi?root=' + newGenre + '&scope=all'
#     html = open(url)
#     doc = Nokogiri::HTML(html)
#     rows = doc.css('a')
#     rows[24..33].forEach do |genre|
#         relatedPlaylists.push(rows[24].children.text)
#         relatedPlaylists.push(genreUrls[rows[24].children.text])
#     end
#     Playlist.create(name: genre, url: genreUrls[genre], relatedPlaylists: relatedPlaylists)
# end

# genres[0].gsub! ' ', '%20'
# genres[0].gsub! '+', '%2B'
# url = 'http://everynoise.com/everynoise1d.cgi?root=' + "pop" + '&scope=all'
# html = open(url)
# doc = Nokogiri::HTML(html)
# rows = doc.css('a')
# p rows[24].children.text
#24-33
# genreURLs = genres[0]

# puts genres.sort.map(&:inspect).join("\n")