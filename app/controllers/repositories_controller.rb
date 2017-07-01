class RepositoriesController < ApplicationController
  def index
    resp = GithubService.new("access_token" => session[:token])
    @repos_array = resp.get_repos
  end

  def create
    resp = GithubService.new("access_token" => session[:token])
    resp.create_repo(params[:name])
    redirect_to '/'
  end
end
