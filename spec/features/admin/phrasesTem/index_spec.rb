# frozen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

feature "admin > phrasesterms > index", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }
  before do
    login_as admin, scope: :user
    visit admin_phrases_terms_path
  end

  scenario "admin visit /admin/phrasesTerms page" do
    expect(page.current_path).to eq admin_phrases_terms_path
    within ".navigation" do
      expect(page).to have_link nil, href: admin_phrases_terms_path
    end
  end

  scenario "visit content /admin/phrasesTerms page" do
    within ".main-content__header" do
      expect(page).to have_link "New phrases term", href: new_admin_phrases_term_path
    end
      expect(page).to have_css ".main-content__body table"
  end

  context "when normal user" do
    before do
      logout(:user)
      user = create :user
      login_as user, scope: :user
      visit admin_phrases_terms_path
    end

    scenario "user visit admin/phrases_terms page" do
      expect(page).to have_current_path root_path
      expect(page).to have_content /Access denied/i
    end
  end
end
