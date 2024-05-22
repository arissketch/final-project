# == Schema Information
#
# Table name: photos
#
#  id            :integer          not null, primary key
#  image_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bathroom_id   :integer
#  user_id       :integer
#
class Photo < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :restaurants, required: true, class_name: "Bathroom", foreign_key: "bathroom_id"
end
