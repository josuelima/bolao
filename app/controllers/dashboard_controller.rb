class DashboardController < ApplicationController

  def index
    @grouped_matches = Match.active.decorate(context: {user: current_user}).group_by(&:group)
  end

end