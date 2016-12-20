class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @cities = School.order(:city).joins(:users).distinct.all
    @users = User.all
  end

  def success
    @gif = ["http://i.giphy.com/TEFplLVRDMWBi.gif",
            "http://i.giphy.com/WKhKazqZxORq0.gif",
            "http://i.giphy.com/1HPzxMBCTvjMs.gif",
            "http://i.giphy.com/9o67upvAnOqRy.gif",
            "http://i.giphy.com/JQNM4AgN7lFUA.gif",
            "http://i.giphy.com/vQ9JbgIWATcTS.gif",
            "http://i.giphy.com/gdNlcJ1tAtiSI.gif",
            "http://i.giphy.com/rgS5azacQACw8.gif"]
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    octokit = Octokit::Client.new(:access_token => ENV["git_token"])

    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        github_user = octokit.user "#{@user.github_username}"
        @user.update_attributes(avatar_url: github_user.avatar_url)
        octokit.add_team_membership(2217734, @user.github_username)
        format.html { redirect_to slack_path, notice: 'Hizaugh!' }
        format.json { render :show, status: :created, location: @user }
        format.js
      else
        format.html { render :new, notice: 'You have Failed!' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render 'form' }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :github_username, :avatar_url, :team_id, :school_id)
    end
end
