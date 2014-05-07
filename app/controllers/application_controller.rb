class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!, :load_ranking
  protect_from_forgery with: :exception

  def load_ranking
    @users = User.rank.decorate
  end
end
