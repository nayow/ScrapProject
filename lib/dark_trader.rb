require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
names = page.xpath('//html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[position()<10]/td[3]/div')
prices = page.xpath('//html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[position()<10]/td[5]/a')

names_array = Array.new
prices_array = Array.new
result = Array.new

names.each do |name|
    names_array << name.text
end

prices.each do |price|
    prices_array << price.text.delete('$,').to_f
end

for i in 0..prices_array.length-1
    result << {names_array[i] => prices_array[i]}
end

puts result,result.class,result[0].class