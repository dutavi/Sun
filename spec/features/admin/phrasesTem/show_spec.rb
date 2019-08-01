# frozen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

feature "admin > phrasesterms > show", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }
  let(:phrases_term) { create :phrases_term }

  before do
    login_as admin, scope: :user
    visit admin_phrases_terms_path
  end

  scenario "user visit /admin/phrasesTerms page" do
    visit admin_phrases_terms_path
      expect(page).to have_current_path admin_phrases_terms_path
  end
end
