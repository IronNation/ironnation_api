class AddTeams

    # Sets Octokit Auth
    # octokit = Octokit::Client.new(:access_token => ENV["git_token"])

    # Adds Teams to Database
    # octokit.organization_teams(24231442).map{|a| [a.id, a.name]}.each do |team|
      # Team.first_or_create(name: team[1], uid: team[0])
    # end

    #Adds Users to those teams
    # octokit.organization_teams(24231442).map{|id| id.id}.each do |team_id|
      # octokit.team_members(team_id).map{|l| l.login}.each do |user_name|
        # user = User.find_by(github_username: user_name)
        # Team.find_by(uid: team_id).users << user if user.github_username.present?
      # end
    # end



end
