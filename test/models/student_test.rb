require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @students = Student.all
    @student = Student.first
  end

  test "sno should be present" do
    @students.each do |s|
      assert_not s.sno.blank?
    end
  end

  test "sno should be unique" do
    dup_student = @student.dup
    dup_student.sno = @student.sno
    assert_not dup_student.valid?
  end

  test "name should be present" do
    @students.each do |s|
      assert_not s.name.blank?
    end
  end

  test  "email should be unique" do
    dup_student = @student.dup
    dup_student.email = @student.email
    @student.save
    assert_not dup_student.valid?
  end

end
