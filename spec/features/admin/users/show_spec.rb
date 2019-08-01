# frozen_string_literal: true

# fronzen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

feature "admin > users > show", :devise do

  after(:each) do
    Warden.test_reset!
  end

 let(:admin) { create :user, :admin }
 before do
   login_as admin, scope: :user
   visit admin_users_path
 end
  scenario "user visit admin/user/show page" do
    visit admin_users_path
    expect(page).to have_current_path admin_users_path
  end

  scenario "show" do
    expect(page).to have_css(".button")
    expect(page).to have_link href: edit_admin_user_path(admin)
  end
end
