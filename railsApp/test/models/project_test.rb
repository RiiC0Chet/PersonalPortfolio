# == Schema Information
#
# Table name: projects
#
#  id            :bigint           not null, primary key
#  title         :string
#  description   :text
#  features      :string           default([]), is an Array
#  technologies  :string           default([]), is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#  experience_id :bigint
#  github        :string
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
