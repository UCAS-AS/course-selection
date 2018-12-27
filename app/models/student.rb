class Student < ApplicationRecord
  include User

  # Relationships
  belongs_to :department
  has_many :select_relationships, foreign_key: 'student_id', dependent: :destroy
  has_many :courses, through: :select_relationships

  # Attribute accessor
  attr_accessor :remember_token, :email_activation_token, :reset_token

  # Validations
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password,
            presence: true,
            length: {minimum: 8, maximum: 16}
  has_secure_password

  def select(course)
    courses << course
  end

  def un_select(course)
    courses.delete course
  end

  def set_degree_course(course)
    @select = SelectRelationship.find_by(student_id: self.id, course_id: course.id)
    p @select
    @select.update_attribute(:is_degree_course, true)
  end

  def un_set_degree_course(course)
    @select = SelectRelationship.find_by(student_id: self.id, course_id: course.id)
    @select.update_attribute(:is_degree_course, false)
  end

  def get_time_tree
    tt = Hash.new
    self.courses.each do |c|
      tt = tt.deep_merge! time_tree c.week_time_classroom, c.title
    end
    tt
  end

  private

  def time_tree(week_time_classroom, title)
    cn_to_i = Hash["一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6, "日" => 7]
    time_tree = Hash.new

    times = week_time_classroom.split(";")
    times.each do |time|
      params = time.split(",")
      start_end_week = params[0].split('周')[0].split('-').map {|i| i.to_i}
      start_end_seq = params[2].split('节')[0].split('-').map {|i| i.to_i}
      p_time = Hash.new
      p_time.store("p1", title)
      p_time.store("p2", title)
      p_time.store("p3", title)
      d_time = Hash.new
      d_time.store("d1", p_time)

      if params[0].include? '-'
        for i in start_end_week[0]..start_end_week[1] do
          p_time = Hash.new
          for d in start_end_seq[0]..start_end_seq[1] do
            p_time.store("p#{d}", title)
          end
          d_time = Hash.new
          d_time.store("d#{cn_to_i[params[1][-1]]}", p_time)
          time_tree.store("w#{i}", d_time)
        end
      else
        p_time = Hash.new
        for d in start_end_seq[0]..start_end_seq[1] do
          p_time.store("p#{d}", title)
        end
        d_time = Hash.new
        d_time.store("d#{cn_to_i[params[1][-1]]}", p_time)
        time_tree.store("w#{params[0][0..(params[0].length - 2)]}", d_time)
      end
    end

    time_tree
  end



end

