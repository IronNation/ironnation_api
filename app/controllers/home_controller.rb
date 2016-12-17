class HomeController < ApplicationController
  layout 'splash'

  def index
    @user = User.new
  end
end
