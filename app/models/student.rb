# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  # def search(feed)
  #   results = Student.all.select{|s| s.name.include?(feed)}
  #   results.empty? ? Student.all : results
  # end

  def self.search(feed)
    if feed.present?
      Student.where("name LIKE ?", "%#{feed}%")
    else
      self.all
    end
  end



end
