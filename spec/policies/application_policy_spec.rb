# frozen_string_literal: true

describe ApplicationPolicy do
  let(:model) { create :user }

  subject { described_class.new(user, model) }

  context "as a visitor" do
    let(:user) { nil }
    it { is_expected.to forbid_actions([:index, :new, :create, :edit, :update, :destroy]) }
  end

  context "as an admin" do
    let(:user) { create :user, :admin }
    it { is_expected.to permit_actions([:index, :new, :create, :edit, :update, :destroy]) }
  end

  context "as a user" do
    let(:user) { create :user }
    it { is_expected.to forbid_actions([:index, :new, :create, :edit, :update, :destroy]) }
  end
end
