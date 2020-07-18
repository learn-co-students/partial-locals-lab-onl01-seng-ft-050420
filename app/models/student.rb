class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  def self.search(feed)
    if feed.present?
      Student.where("NAME LIKE ?", "%#{feed}%")
    else
      self.all
    end
  end



end
