# frozen_string_literal: true

# fronzen_string_literal: true
include Warden::Test::Helpers
Warden.test_mode!

feature "admin > users > edit", :devise do

  after(:each) do
    Warden.test_reset!
  end

  let(:admin) { create :user, :admin }

 before do
   login_as admin, scope: :user
   visit edit_admin_user_path(admin)
 end

  scenario "user visit admin/user/edit page" do
    expect(page).to have_button("Update User")
    expect(page).to have_link href: admin_user_path(admin)
  end

  scenario "User edit fill" do
    fill_in "user_email", with: "user@example.com"
    fill_in "user_name", with: "elliots"
    fill_in "user_password", with: "Ab@123456"
    fill_in "user_password_confirmation", with: "Ab@123456 "
    click_button("Update User")
    expect(page).to have_css(".form-actions input")
  end
end
