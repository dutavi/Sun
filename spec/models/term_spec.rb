# frozen_string_literal: true

require "rails_helper"

RSpec.describe Term, type: :model do
  #Test_Word :
  it { should have_db_index :word }
  it { should validate_presence_of(:word) }
  it { should validate_length_of(:word).is_at_most(255) }
  it { should have_db_column(:word).with_options null: false }

  #Test_Meaning :
  it { should validate_presence_of(:meaning) }
  it { should validate_length_of(:meaning).is_at_most(255) }
  it { should have_db_column(:meaning).with_options null: true }

  #Test_Reading :
  it { should validate_presence_of(:reading) }
  it { should validate_length_of(:reading).is_at_most(255) }
  it { should have_db_column(:reading).with_options null: true }
  #end.

  it { should have_and_belong_to_many(:phrases) }
end
