require_relative '../lib/mairie_christmas'

describe "the get_townhall_email method" do
    it "should return a string not empty" do
        expect(get_townhall_email("http://annuaire-des-mairies.com/95/jagny-sous-bois.html")).not_to be_nil
        expect(get_townhall_email("http://annuaire-des-mairies.com/95/pontoise.html")).to be_a(String)
        
    end
    
    it "should return the correct email" do
        expect(get_townhall_email("http://annuaire-des-mairies.com/95/groslay.html")).to match("assistante_du_maire@mairie-groslay.fr")
    end
end

describe "the get_townhall_urls method" do
    it "should return an array of hash" do
        expect(get_townhall_urls).not_to be_nil
        expect(get_townhall_urls).to be_a(Array)
        expect(get_townhall_urls.length).to be > 10
    end

    it "should contain cryptos with associated values" do 
        expect(get_townhall_urls).to include({"Banthelu"=>"mairie.banthelu@wanadoo.fr"})
        expect(get_townhall_urls).to include({"Cherence"=>"mairie.cherence@wanadoo.fr"})
    end
end


