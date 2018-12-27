module AdminSessionsHelper

  def log_in(admin)
    session[:ano] = admin.ano
  end

  def log_out
    session.delete :ano
  end

  def current_admin
    if (admin_ano = session[:ano])
      @current_admin ||= Admin.find_by(ano: admin_ano)
    end
  end

  def logged_in?
    !current_admin.nil?
  end
end
