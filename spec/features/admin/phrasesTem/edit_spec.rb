# frozen_string_literal: true

# fronzen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

feature "admin > phrasesterms > edit", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }
  let(:phrases_term) { create :phrases_term }

  before do
    login_as admin, scope: :user
    visit edit_admin_phrases_term_path(phrases_term)
  end

  scenario "user visit admin/phrasesterm/edit page" do
    expect(page).to have_button("Update Phrases term")
    expect(page).to have_link href: admin_phrases_term_path(phrases_term)
  end

  scenario "fill_in update " do
    fill_in "phrases_term_phrase_id", with: "1"
    fill_in "phrases_term_term_id", with: "2"
    expect(page).to have_button("Update Phrases term")
    click_button("Update Phrases term")
  end

  context "when normal user" do
    before do
      logout(:user)
      user = create :user
      login_as user, scope: :user
      visit admin_phrases_terms_path
    end


    scenario "user visit admin/phrasesterm page" do
      expect(page).to have_current_path root_path
      expect(page).to have_content /Access denied/i
    end
  end
end
