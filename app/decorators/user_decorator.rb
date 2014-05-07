class UserDecorator < Draper::Decorator
  decorates_association :guesses, with: GuessDecorator
  decorates_association :public_guesses, with: GuessDecorator
  
  delegate :id, :name, :image, :score, :admin, :position
end