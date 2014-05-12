class UserDecorator < Draper::Decorator
  decorates_association :guesses, with: GuessDecorator
  decorates_association :public_guesses, with: GuessDecorator
  
  delegate :id, :name, :score, :admin, :position, :image

  def profile_image
    image.nil? ? h.asset_path("default-user.jpg") : image
  end

end