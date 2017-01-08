class AddTeams

def go
  # Sets Octokit Auth
  octokit = Octokit::Client.new(:access_token => ENV["git_token"])

  # Adds Teams to Database
  octokit.organization_teams(24231442).map{|a| [a.id, a.name]}.each do |team|
    uid = team[0]
    team_name = team[1]
    if octokit.team_repos(uid).present?
      repo_id = octokit.team_repos(uid).first.id
      url = octokit.team_repos(uid).first.html_url
      readme_encoded_content = octokit.readme(repo_id).content
      plaintext_readme = Base64.decode64(readme_encoded_content)
    end
    Team.first_or_create(name: team_name, uid: uid, description: plaintext_readme, project_url: url)
  end




  # Adds Users to those teams
  # octokit.organization_teams(24231442).map{|id| id.id}.each do |team_id|
  #   octokit.team_members(team_id).map{|l| l.login if l.login.present?}.each do |user_name|
  #     user = User.find_by(github_username: user_name)
  #     Team.find_by(uid: team_id).users << user if user.github_username.present?
  #   end
  # end
end




end
