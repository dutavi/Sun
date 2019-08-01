# frozen_string_literal: true

# fronzen_string_literal: true
include Warden::Test::Helpers
Warden.test_mode!

feature "admin > terms > edit", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }
  let(:term) { create :term }

  before do
    login_as admin, scope: :user
    visit edit_admin_term_path(term)
  end

  scenario "user visit admin/term/edit page" do
    expect(page).to have_button("Update Term")
    expect(page).to have_link href: admin_term_path(term)
  end

  context "when normal user" do
    before do
      logout(:user)
      user = create :user
      login_as user, scope: :user
      visit admin_terms_path
    end

    scenario "user visit admin/terms page" do
      expect(page).to have_current_path root_path
      expect(page).to have_content /Access denied/i
    end
  end
end
