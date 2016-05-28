require 'spec_helper'

describe RecipesController do

  describe "index" do
    before do
      Recipe.create!('name: Baked Potato w/ Cheese')
      Recipe.create!('name: Potatoes Au Gratin')
      Recipe.create!('name: Garlic Mashed Potatoes')
      Recipe.create!('name: Baked Brussel Sprouts')

      xhr :get, :index, format: :json, keywords: :keywords
    end

    subject(:results) { Json.parse(response.body) }
    def extract_name
      ->(object) {object["name"]}
    end

    context 'when the search finds results' do
      let(:keywords) { 'baked' }
      it 'should have a 200 status code' do
        expect(response.status).to eq(200)
      end
      it 'should return 2 results' do
        expect(response.size).to eq(2)
      end
      it "should include 'Baked Potato w/ Cheese'" do
        expect(results.map(&extract_name)).to include('Baked Potato w/ Cheese')
      end
      it "should include 'Baked Brussel Sprouts'" do
        expect(results.map(&extract_name)).to include('Baked Brussel Sprouts')
      end
    end
    
    # it "returns http success" do
    #   get 'index'
    #   response.should be_success
    # end
  end

end
