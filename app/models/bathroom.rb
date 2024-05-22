# == Schema Information
#
# Table name: bathrooms
#
#  id             :integer          not null, primary key
#  address        :string
#  name           :string
#  open_to_public :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comment_id     :integer
#
class Bathroom < ApplicationRecord
  has_many  :photos, class_name: "Photo", foreign_key: "bathroom_id", dependent: :destroy
  has_many  :comments, class_name: "Comment", foreign_key: "bathroom_id", dependent: :destroy
  has_many  :ratings, class_name: "Rating", foreign_key: "bathroom_id", dependent: :destroy
end
