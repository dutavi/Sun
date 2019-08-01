# frozen_string_literal: true

require "rails_helper"

RSpec.describe Phrase, type: :model do
  it { should validate_presence_of(:sentence) }
  it { should have_db_column(:sentence).with_options null: false }
  it { should have_and_belong_to_many(:terms) }
end
