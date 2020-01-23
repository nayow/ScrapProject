require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    names = page.xpath('//html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[*]/td[3]/div')
    prices = page.xpath('//html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[*]/td[5]/a')

    names_array = Array.new
    prices_array = Array.new
    result = Array.new

    names.each {|name| names_array << name.text}
    prices.each {|price| prices_array << price.text.delete('$,').to_f}

    for i in 0..prices_array.length-1
        result << {names_array[i] => prices_array[i]}
    end
    # puts result
    return result

end

# crypto_scrapper