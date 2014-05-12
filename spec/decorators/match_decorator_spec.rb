require 'spec_helper'

describe MatchDecorator do

  context 'associations' do

    let!(:match_decorated) { create(:match).decorate }
    subject { match_decorated }

    it 'should decorate guess association' do
      match_decorated.guesses.should be_kind_of(Draper::CollectionDecorator)
    end

  end

  context 'methods' do

    it 'should format the date' do
      now = Time.now
      match_decorated = create(:match, datetime: now).decorate
      match_decorated.data_hora.should == now.strftime('%d/%m/%Y %Hh')
    end

    it 'should return open/close to guesses according to the match time' do
      future_match = create(:future_match).decorate
      past_match   = create(:past_match).decorate
      future_match.open_to_guesses.should == "Aberto"
      past_match.open_to_guesses.should == "Fechado"
    end

    it 'should generate classes according to open / close to guesses' do
      match_decorated = create(:future_match).decorate
      match_decorated.status_classes.should == ['label', 'label-success'] # open to guesses

      match_decorated = create(:past_match).decorate
      match_decorated.status_classes.should == ['label', 'label-danger']
    end

    it 'should attach the user guess to the match' do
      user_1 = create(:user) 
      user_2 = create(:user) 
      match  = create(:future_match)

      # creates guesses from differents users to the match
      guess_user_1 = create(:guess, match: match, user: user_1)
      guess_user_2 = create(:guess, match: match, user: user_2)

      match_decorated = match.decorate(context: {user: user_1})
      match_decorated.my_guess.should == guess_user_1
    end

  end
end