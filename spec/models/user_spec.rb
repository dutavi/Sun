# frozen_string_literal: true

describe User do

  before(:each) { @user = User.new(email: "user@example.com") }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match "user@example.com"
  end

  describe "enum `role'" do
    it { should define_enum_for(:role).with_values([:user, :vip, :admin]) }
  end
end
