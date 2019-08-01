
# frozen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

feature "admin > phrasesterms > new", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }
  before do
    login_as admin, scope: :user
    visit new_admin_phrases_term_path
  end

  scenario "user visit admin/phraseTerm/new page" do
    expect(page).to have_button("Create Phrases term")
  end

  context "when normal user" do
    before do
      logout(:user)
      user = create :user
      login_as user, scope: :user
      visit new_admin_phrases_term_path(admin)
    end
  end

  scenario "user visit admin/phraseTerm/new page" do
    visit new_admin_phrases_term_path
    expect(page).to have_current_path new_admin_phrases_term_path
  end

  scenario "fill " do
    fill_in "phrases_term_phrase_id", with: "1"
    fill_in "phrases_term_term_id", with: "2"
    expect(page).to have_button("Create Phrases term")
  end

  scenario "fill fail" do
    fill_in "phrases_term_phrase_id", with: "long time no see"
    fill_in "phrases_term_term_id", with: "long time"
    expect(page).to have_button("Create Phrases term")
    click_button("Create Phrases term")
  end
end
