# frozen_string_literal: true

include Warden::Test::Helpers
Warden.test_mode!

 feature "admin > phrases > new", :devise do

   after(:each) do
    Warden.test_reset!
   end

   let(:admin) { create :user, :admin }
  before do
    login_as admin, scope: :user
    visit new_admin_phrase_path(admin)
  end

   scenario "Create Admin/phrase/new page" do
    expect(page).to have_button("Create Phrase")
   end

   context "when normal user" do
    before do
      logout(:user)
      user = create :user
      login_as user, scope: :user
      visit new_admin_phrase_path(admin)
    end
   end

   scenario "user visit admin/phrase/new page" do
    visit new_admin_phrase_path
    expect(page).to have_current_path new_admin_phrase_path
   end

   scenario "fill fail" do
    fill_in "phrase_sentence", with: "12308812038"
    expect(page).to have_button("Create Phrase")
   end

   scenario "fill" do
    fill_in "phrase_sentence", with: "Elliots"
    expect(page).to have_button("Create Phrase")
   end
 end
