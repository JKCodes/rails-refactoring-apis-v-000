class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    resp = GithubService.new
    session[:token] = resp.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    session[:username] = resp.get_username

    redirect_to '/'
  end
end
