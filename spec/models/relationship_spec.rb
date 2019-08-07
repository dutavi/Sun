# frozen_string_literal: true

require "rails_helper"

RSpec.describe Relationship, type: :model do
  it { should belong_to(:follower) }
  it { should belong_to(:followed) }
  it { should have_db_column(:follower_id).with_options null: true }
  it { should have_db_column(:followed_id).with_options null: true }
end
