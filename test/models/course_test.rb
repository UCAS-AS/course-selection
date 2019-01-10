require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @courses = Course.all
  end

  test "courses' title should be present" do
    @courses.each do |c|
      assert_not c.title.blank?
    end
  end

  test "courses' cno should be present" do
    @courses.each do |c|
      assert_not c.cno.blank?
    end
  end

end
