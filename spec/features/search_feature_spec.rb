require "rails_helper"

describe "searching questions", type: :feature do
  before :each do
    User.create(name: 'test', email: 'user@example.com', password: 'test123', password_confirmation: 'test123')
    Question.create(title: 'test', text: 'what is a test?', user_id: 1)
    Question.create(title: 'random', text: 'what is a random?', user_id: 1)
  end

  context "search with valid query" do
  	it 'display questions containing search query' do 
      visit '/questions'
      fill_in 'search', with: 'test'
    
      click_button 'Search'
      expect(page).to have_content 'what is a test?'
    end
  end

  context "search with invalid query" do
  	it 'display questions containing search query' do 
      visit '/questions'
      fill_in 'search', with: 'egg'
    
      click_button 'Search'
      expect(page).to have_content('Sorry, no questions')
    end
  end
end