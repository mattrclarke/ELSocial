describe ProfileSearcher do 
  
  subject { described_class.new(query: query) }
    
  let!(:user_1)   { create(:user) }
  let!(:user_2)   { create(:user) }
  let!(:user_3)   { create(:user) }
  let!(:user_4)   { create(:user) }
  
  let!(:profile_1) { create(:profile, user: user_1, first_name: "ben") }  
  let!(:profile_2) { create(:profile, user: user_2, first_name: "ben") }
  let!(:profile_3) { create(:profile, user: user_3) }
  let!(:profile_4) { create(:profile, user: user_4) }

  context "when given a query" do
    
    context "and there is only one name given" do
      let!(:query) { profile_1.first_name }
      it "searches by first name" do 
        results = subject.run
        expect(results.length).to eq 2
        expect(results[0].first_name).to eq profile_1.first_name
      end
    end
    
    context "and there two names given" do
      let!(:query) { [ profile_3.first_name, profile_3.last_name] }
      it "matches on first and last names" do 
        results = subject.run
        expect(results.length).to eq 1
        expect(results[0].id).to eq profile_3.id
      end
    end
    
    context "and there more than two names given" do
      let!(:query) { [ profile_4.first_name, "Bilbo", profile_4.last_name] }
      it "attempts to match on first and last names" do 
        results = subject.run
        expect(results.length).to eq 1
        expect(results[0].id).to eq profile_4.id
      end
    end
    
  end  
end