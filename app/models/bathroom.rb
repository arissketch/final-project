# == Schema Information
#
# Table name: bathrooms
#
#  id             :integer          not null, primary key
#  address        :string
#  open_to_public :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comment_id     :integer
#
class Bathroom < ApplicationRecord
end
