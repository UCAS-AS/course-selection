module SessionsHelper

  def log_in(no, option)
    session[:no] = no
    session[:option] = option
  end

  def log_out
    session.delete :option
    session.delete :no
  end

  def current_user
    option = session[:option]
    no = session[:no]
    if !option.nil? && !no.nil?
      if option == 'teacher'
        @current_user ||= Teacher.find_by(tno: no)
      elsif option == 'student'
        @current_user ||= Student.find_by(sno: no)
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def option
    session[:option]
  end

  def print(val)
    if val.blank?
      '无'
    else
      val
    end
  end

  def current_time_type
    hours = Time.zone.now.hour
    if hours >= 6 && hours < 11
      '上午'
    elsif hours >= 11 && hours < 14
      '中午'
    elsif hours >= 14 && hours < 18
      '下午'
    elsif hours >= 18 || hours < 6
      '晚上'
    end
  end

  def conflict(week_time_classroom, time_tree)
    is_conflicted = false

    cn_to_i = Hash["一" => 1, "二" => 2, "三" => 3, "四" => 4, "五" => 5, "六" => 6, "日" => 7]

    times = week_time_classroom.split(";")
    times.each do |time|
      params = time.split(",")
      start_end_seq = params[2].split('节')[0].split('-').map {|i| i.to_i}

      if params[0].include? "-"
        start_end_week = params[0].split('周')[0].split('-').map {|i| i.to_i}
        (start_end_week[0]..start_end_week[1]).each {|week|
          day = cn_to_i[params[1][-1]]
          (start_end_seq[0]..start_end_seq[1]).each {|i|
            if !time_tree["w#{week}"].nil? && !time_tree["w#{week}"]["d#{day}"].nil? &&
              !time_tree["w#{week}"]["d#{day}"]["p#{i}"].nil?
              return time_tree["w#{week}"]["d#{day}"]["p#{i}"]
            end
          }
        }
      else
        week = params[0][0..(params[0].length - 2)]
        day = cn_to_i[params[1][-1]]
        (start_end_seq[0]..start_end_seq[1]).each {|i|
          if !time_tree["w#{week}"].nil? && !time_tree["w#{week}"]["d#{day}"].nil? &&
            !time_tree["w#{week}"]["d#{day}"]["p#{i}"].nil?
            return time_tree["w#{week}"]["d#{day}"]["p#{i}"]
          end
        }
      end
    end

    is_conflicted
  end

  def is_current_user?(user_no)
    unless user_no == session[:no]
      log_out
      flash[:danger] = '您尚未登录'
      redirect_to root_url
    end
  end

  def is_logged_in?
    unless logged_in?
      log_out
      flash[:danger] = '您尚未登录'
      redirect_to root_url
    end
  end
end
