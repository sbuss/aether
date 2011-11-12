class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :detect_browser
  before_filter :auto_user # from SessionsHelper
  include SessionsHelper
  
  layout :detect_browser
  
  

  
  private
  MOBILE_BROWSERS = ["__mozilla","android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    @browser = "normal"
    MOBILE_BROWSERS.each do |m|
      if agent.match(m)
        @browser = "mobile"
        return "mobile" 
      end
    end
    return "application"
  end

  
end
