# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it { should belong_to(:phrase) }
  it { should belong_to(:user) }
  it { should have_db_column(:body) }
end
