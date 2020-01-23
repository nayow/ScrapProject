require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_email(deputy_url)
    page = Nokogiri::HTML(open(deputy_url))
    email = page.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
    return email.text
end

def deputy_list

    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    names = page.xpath('/html/body/div/div[3]/div/div/section/div/article/div[3]/div/div[3]/div[1]/ul[1]/li[*]/a') # limité à la première colonne de la lettre A
    urls = page.xpath('/html/body/div/div[3]/div/div/section/div/article/div[3]/div/div[3]/div[1]/ul[1]/li[*]/a/@href') # limité à la première colonne de la lettre A

    names_array = Array.new
    urls_array = Array.new
    result = Array.new

    names.each {|name| names_array << name.text.split[1..-1].join(' ')}
    urls.each {|url| urls_array << "http://www2.assemblee-nationale.fr"+url.text}

    for i in 0..names_array.length-1
        result << {"first_name" => names_array[i].split[0], "last_name" => names_array[i].split[1], "email" => get_email(urls_array[i])}
    end
    puts result
    return result

end

deputy_list