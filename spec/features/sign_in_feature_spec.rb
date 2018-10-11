require "rails_helper"

describe "the signin process", type: :feature do
  before :each do
    User.create(name: 'test', email: 'user@example.com', password: 'test123', password_confirmation: 'test123')
  end

  it "signs me in" do
    visit '/login'
    fill_in 'session[email]', with: 'user@example.com'
    fill_in 'session[password]', with: 'test123'
    
    click_button 'Log in'
    expect(page).to have_content 'Question'
  end
end