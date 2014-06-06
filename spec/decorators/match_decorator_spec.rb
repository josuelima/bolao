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

    it 'should formt the time' do
      now = Time.now
      match_decorated = create(:match, datetime: now).decorate
      match_decorated.hora.should == now.strftime('%Hh')
    end

    it 'should return open/close to guesses according to the match time' do
      future_match = create(:future_match).decorate
      past_match   = create(:past_match).decorate
      future_match.open_to_guesses_label.should == "Aberto"
      past_match.open_to_guesses_label.should == "Fechado"
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

    it 'should list only guesses which has scores > 0' do
      match = create(:match, goals_a: 3, goals_b: 1).decorate
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 2, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 3)
      create(:guess, match: match, goals_a: 1, goals_b: 3)

      match.should have(4).guesses
      match.should have(2).scorers
    end

    it 'should have only 6 scorers' do
      match = create(:match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)

      match_decorated = match.decorate

      match_decorated.should have(8).guesses
      match_decorated.should have(6).scorers_limited
    end

  end
end