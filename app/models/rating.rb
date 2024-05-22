# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  cleaniness  :integer
#  environment :integer
#  safety      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bathroom_id :integer
#  comment_id  :integer
#  user_id     :integer
#
class Rating < ApplicationRecord
end
