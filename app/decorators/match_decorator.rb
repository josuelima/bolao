class MatchDecorator < Draper::Decorator
  decorates_association :guesses
  decorates_association :team_a
  decorates_association :team_b
  delegate_all

  def data_hora
    object.datetime.to_time.strftime('%d/%m/%Y %Hh')
  end

  def hora
    object.datetime.to_time.strftime('%Hh%M')
  end

  def scorers_limited
    scorers.take(6)
  end

  def my_guess
    Guess.find_by_match_id_and_user_id(self.id, context[:user].id)
  end

  def status_classes
    classes = ['label']
    classes << 'label-success' if is_open_to_guesses?
    classes << 'label-danger'  if !is_open_to_guesses?
    classes
  end

  def open_to_guesses_label
    is_open_to_guesses? ? "Aberto" : "Fechado"
  end
end