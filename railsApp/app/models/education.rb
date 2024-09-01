# == Schema Information
#
# Table name: educations
#
#  id            :bigint           not null, primary key
#  title         :string
#  description   :text
#  user_id       :bigint           not null
#  average_grade :float
#  learned       :string           default([]), is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Education < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
end
