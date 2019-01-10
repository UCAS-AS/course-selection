require 'test_helper'

class TeacherTest < ActiveSupport::TestCase

  def setup
    @teachers = Teacher.all
    @teacher = Teacher.first
  end

  test "tno should be present" do
    @teachers.each do |t|
      assert_not t.tno.blank?
    end
  end

  test "tno should be unique" do
    dup_teacher = @teacher.dup
    dup_teacher.tno = @teacher.tno
    assert_not dup_teacher.valid?
  end

  test "name should be present" do
    @teachers.each do |t|
      assert_not t.name.blank?
    end
  end

  test  "email should be unique" do
    dup_teacher = @teacher.dup
    dup_teacher.email = @teacher.email
    @teacher.save
    assert_not dup_teacher.valid?
  end

end
