# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  gusto_id   :integer          not null
#  gusto_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
    validates :gusto_id, presence: true
    validates_uniqueness_of :gusto_id, scope: :gusto_type

    belongs_to :gusto, polymorphic: true
end
