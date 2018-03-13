class RepositoriesController < ApplicationController
  def github
    render json: Github.repositories(params[:user])
  end

  def github_gists
    render json: Github.gists(params[:user])
  end
end
