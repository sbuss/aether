module SessionsHelper
  def sign_in(fb_id, name)
    begin
      u = User.where("facebook_id = ? AND facebook_id NOT NULL", fb_id)[0]
    rescue
      u = User.create(:name => name, :facebook_id => fb_id)
    end
    set_current_user(u)
  end

  def auto_user
    if current_user.nil?
      lu = User.last
      if lu.nil?
        id = 1
      else
        id = lu.id + 1
      end
      u = User.create!(:name => "random user ##{id}")
      set_current_user(u)
    end
  end

  def set_current_user(user)
    session[:current_user] = user.id
    @current_user = user
  end

  def current_user
    if @current_user.nil?
      logger.info "Current user is nil"
    else
      logger.info "Current user is #{@current_user.name}"
    end
    @current_user ||= user_from_session
    if @current_user.nil?
      logger.info "Current user is nil"
    else
      logger.info "Current user is #{@current_user.name}"
    end
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
      logger.info("session user id is #{session[:current_user]}")
      begin
        u = User.find(session[:current_user])
      rescue
        u = nil
      end
      logger.info("Got user #{u}")
      u
    end
end
