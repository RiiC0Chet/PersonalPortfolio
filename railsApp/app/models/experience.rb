# == Schema Information
#
# Table name: experiences
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Experience < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  has_many :projects

  accepts_nested_attributes_for :projects
end
