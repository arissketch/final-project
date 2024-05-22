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
end
