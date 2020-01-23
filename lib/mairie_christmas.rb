require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    email = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    return email.text
end

def get_townhall_urls

    result = Array.new
    urls_array = Array.new
    names_array = Array.new

    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

    urls = page.xpath('//tr/td[1]/p/a/@href') #limité à la première colonne de villes
    urls.each {|url| urls_array << "https://www.annuaire-des-mairies.com"+url.text.sub(".","")}

    names = page.xpath('//tr/td[1]/p/a')
    names.each {|name| names_array << name.text.downcase.capitalize!}

    for i in 0..urls_array.length-1
        result << {names_array[i] => get_townhall_email(urls_array[i])}
    end
    puts result
    return result
end

get_townhall_urls