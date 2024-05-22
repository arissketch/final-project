# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  comments    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bathroom_id :integer
#  user_id     :integer
#
class Comment < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :restaurants, required: true, class_name: "Bathroom", foreign_key: "bathroom_id"
end
