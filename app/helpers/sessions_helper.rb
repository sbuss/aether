module SessionsHelper
  def sign_in(fb_id, name)
    begin
      u = User.where("facebook_id = ? AND facebook_id NOT NULL", fb_id)[0]
    rescue
      u = User.create(:name => name, :facebook_id => fb_id)
    end
    session[:current_user] = u.id
    #session[:remember_token] = [user.id, user.salt]
    self.current_user = u
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    logger.info "Current user is #{@current_user}"
    @current_user ||= user_from_session
    logger.info "Current user is now #{@current_user}"
    @current_user
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:current_user] = nil
    #session.delete(:remember_token)
    self.current_user = nil
  end

  private
    def user_from_session
      # this * is for multiple element params, is sum(1,2) = sum(*[1,2])
      logger.info("Getting from session")
      begin
        u = User.where(:id => session[:current_user])[0]
      rescue
        u = nil
      end
      logger.info("Got user #{u}")
      u
    end
end
