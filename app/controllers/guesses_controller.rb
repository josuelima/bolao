class GuessesController < ApplicationController

  def my_guesses
    # get all open matches including and associates the current user guesses to it
    @grouped_matches = Match.
                          open_to_guesses.
                          group_ordered.
                          decorate(context: {user: current_user}).
                          group_by(&:group)
  end

  def update
    Bolao::Guesses.save(params, current_user)
    flash[:success] = "Apostas Salvas"
    redirect_to my_guesses_path
  end
end