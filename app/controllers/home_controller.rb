class HomeController < ApplicationController
  layout 'splash'

  def index
    @user = User.new
  end

  def slack
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
