require_relative '../lib/cher_depute'

describe "the get_email method" do
    it "should return a string not empty" do
        expect(get_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA588884")).not_to be_nil
        expect(get_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719100")).to be_a(String)
    end
    
    it "should return the correct email" do
        expect(get_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA606675")).to match("francois.andre@assemblee-nationale.fr")
    end
end

describe "the deputy_list method" do
    it "should return an array of hash" do
        expect(deputy_list).not_to be_nil
        expect(deputy_list).to be_a(Array)
        expect(deputy_list.length).to be >= 8
        expect(deputy_list[rand(0..deputy_list.length)].count).to be == 3
    end

    it "should contain deputynmail with their mail" do 
        expect(deputy_list).to include({"first_name"=>"Damien", "last_name"=>"Adam", "email"=>"damien.adam@assemblee-nationale.fr"})
        expect(deputy_list).to include({"first_name"=>"Bérangère", "last_name"=>"Abba", "email"=>"berangere.abba@assemblee-nationale.fr"})
    end
end


