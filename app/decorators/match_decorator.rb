class MatchDecorator < Draper::Decorator
  decorates_association :guesses
  delegate_all

  def data_hora
    object.datetime.to_time.strftime('%d/%m/%Y %Hh')
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

  def open_to_guesses
    is_open_to_guesses? ? "Aberto" : "Fechado"
  end
end