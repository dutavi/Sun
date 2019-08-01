
# frozen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

feature "admin > users > index", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }
  before do
    login_as admin, scope: :user
    visit admin_users_path
  end

  scenario "admin visit /admin/users page" do
    expect(page.current_path).to eq admin_users_path
    within ".navigation" do
      expect(page).to have_link nil, href: admin_users_path
    end
    expect(page).to have_link "New user", href: new_admin_user_path
    expect(page).to have_content admin.email
    expect(page).to have_link "Edit", href: edit_admin_user_path(admin)
  end

  context "when normal user" do
    before do
      logout(:user)
      user = create :user
      login_as user, scope: :user
      visit admin_users_path
    end

    scenario "user visit admin/users page" do
      expect(page).to have_current_path root_path
      expect(page).to have_content /Access denied/i
    end
  end
end
