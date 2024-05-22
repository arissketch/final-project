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
end
