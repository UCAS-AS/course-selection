module User
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :remember_token, :email_activation_token, :reset_token

  def authenticated?(attr, token)
    digest = send("#{attr}_digest")
    if digest.nil?
      false
    else
      BCrypt::Password.new(digest).is_password?(token)
    end
  end

  def send_email_activation_email(new_email, option)
    UserMailer.email_activation(self, new_email, option).deliver_now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def already_send_password_reset?
    self.reset_sent_at >= 30.minutes
  end

  def create_email_activation
    self.email_activation_token = User.new_token
    update_attribute(:email_activation_digest, User.digest(self.email_activation_token))
    update_attribute(:email_activated_sent_at, Time.zone.now)
  end

  def create_password_reset
    self.reset_token = User.new_token
    update_attribute :reset_digest, User.digest(self.reset_token)
    update_attribute :reset_sent_at, Time.zone.now
  end

  def password_reset(password, password_confirmation)
    update_password password, password_confirmation
    update_attribute :reset_digest, nil
    update_attribute :reset_sent_at, 20.years.ago
  end

  def email_activation(new_email)
    update_attribute(:email, new_email)
    update_attribute(:email_activated, true)
    update_attribute(:email_activation_digest, nil)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def update_password(password, password_conf)
    update_attributes password: password, password_confirmation: password_conf
  end

  def password_reset_expired?
    self.reset_sent_at.nil? || self.reset_sent_at < 30.minutes.ago
  end

  def email_activated?
    self.email_activated
  end

  def email_activation_expired?
    self.email_activation_digest.nil? || self.email_activated_sent_at < 30.minutes.ago
  end

  protected

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def email_downcase
    self.email = self.email.downcase
  end

end