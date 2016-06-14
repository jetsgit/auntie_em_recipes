require 'spec_helper'

describe RecipesController do
  render_views
  describe "index" do
    before do
      Recipe.create!(name: 'Baked Potato w/ Cheese')
      Recipe.create!(name: 'Potatoes Au Gratin')
      Recipe.create(name: 'Garlic Mashed Potatoes')
      Recipe.create!(name: 'Baked Brussel Sprouts')

      xhr :get, :index, format: :json, keywords: keywords
    end

    after do
      Recipe.delete_all
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context 'when the search finds results' do
      let(:keywords) { 'baked' }
      it 'should have a 200 status code' do
        expect(response.status).to eq(200)
      end
      it 'should return 2 results' do
        expect(results.size).to eq(2)
      end
      it "should include 'Baked Potato w/ Cheese'" do
        expect(results.map(&extract_name)).to include('Baked Potato w/ Cheese')
      end
      it "should include 'Baked Brussel Sprouts'" do
        expect(results.map(&extract_name)).to include('Baked Brussel Sprouts')
      end
    end

    context 'when search does not find results' do
      let(:keywords) {'foo'}
      it 'should not return any results' do
        expect(results.size).to eq(0)
      end
    end

  end
  describe 'show' do

    let(:recipe_id) { recipe.id }

    before do
      xhr :get, :show, format: :json, id: recipe_id
    end

    after do
      Recipe.delete_all
    end

    subject(:results) {JSON.parse(response.body)}

    context 'when the recipe exists' do
      let(:recipe) {
        Recipe.create!(name: 'Baked Potato w/ Cheese',
                      instructions: 'Nuke for 20 minutes, top with cheese')
      }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(recipe.id) }
      it { expect(results["instructions"]).to eq(recipe.instructions) }
    end

    context 'when the recipe does not exist' do
      let(:recipe_id) { -999 }
      it { expect(response.status).to eq(404) }
    end
  end
end
