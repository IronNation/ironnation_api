class HomeController < ApplicationController
  layout 'splash'

  def index
    if user_signed_in?
      if current_user.school_id.nil?
        redirect_to slack_path
      else
      end
    else
    end
    @user = User.new
  end

  def slack
    @user = current_user
    @gif = ["http://i.giphy.com/TEFplLVRDMWBi.gif",
            "http://i.giphy.com/WKhKazqZxORq0.gif",
            "http://i.giphy.com/1HPzxMBCTvjMs.gif",
            "http://i.giphy.com/9o67upvAnOqRy.gif",
            "http://i.giphy.com/JQNM4AgN7lFUA.gif",
            "http://i.giphy.com/vQ9JbgIWATcTS.gif",
            "http://i.giphy.com/gdNlcJ1tAtiSI.gif",
            "http://i.giphy.com/rgS5azacQACw8.gif"]
  end
end
