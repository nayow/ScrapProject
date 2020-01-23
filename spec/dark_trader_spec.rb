require_relative '../lib/dark_trader'

describe "the crypto_scrapper method" do
    it "should return an array of hash" do
        expect(crypto_scrapper).not_to be_nil
        expect(crypto_scrapper).to be_a(Array)

    end

    it "should contain at least 10 cryptos with associated values" do 
        expect(crypto_scrapper.length).to be > 10
        expect(crypto_scrapper.reduce({},:merge)).to include("ATOM")
        expect(crypto_scrapper.reduce({},:merge)).to include("BTC")
        expect(crypto_scrapper.reduce({},:merge)).to include("ETH")
    end
end