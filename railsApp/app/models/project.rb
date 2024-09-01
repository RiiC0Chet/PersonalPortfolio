# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  title        :string
#  description  :text
#  features     :string           default([]), is an Array
#  technologies :string           default([]), is an Array
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
class Project < ApplicationRecord
  has_one_attached :avatar

  belongs_to :user
  belongs_to :experience, optional: true
end
