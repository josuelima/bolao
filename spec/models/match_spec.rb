require 'spec_helper'

describe Match do

  context 'model attributes validations' do
   
    let!(:match) { build(:match) }
    subject { match }

    it { should be_valid }

    it 'should have a datetime' do
      match.datetime = nil
      match.should_not be_valid
    end

    it 'should have a team a' do
      match.team_a = nil
      match.should_not be_valid
    end

    it 'should have a team b' do
      match.team_b = nil
      match.should_not be_valid
    end

    it 'should belong to a group' do
      match.group = nil
      match.should_not be_valid
    end

  end

  context 'scopes' do
    it 'should list matchs from active groups' do
      group_a = create(:group)
      group_b = create(:group, active: false)
      create(:match, group: group_a)
      match_b = create(:match, group: group_b)
      Match.active.should_not include(match_b)
    end

    it 'should list only matches open to guesses' do
      match_future = create(:future_match)
      match_past = create(:past_match)
      Match.open_to_guesses.should     include(match_future)
      Match.open_to_guesses.should_not include(match_past)
    end
  end

  context 'class methods' do
    it 'check if match is finished' do
      match = build(:match)
      match.finished?.should be_false
      match.update_attributes(goals_a: 1, goals_b: 1)
      match.finished?.should be_true
    end

    it 'check if match is open to guesses' do
      match_future = build(:future_match)
      match_past = build(:past_match)
      match_future.is_open_to_guesses?.should be_true
      match_past.is_open_to_guesses?.should be_false
    end

    it 'should list only guesses which has scores > 0' do
      match = create(:match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 1)
      create(:guess, match: match, goals_a: 2, goals_b: 1)
      create(:guess, match: match, goals_a: 3, goals_b: 3)
      create(:guess, match: match, goals_a: 1, goals_b: 3)

      match.should have(4).guesses
      match.should have(2).scorers
    end

    it 'should have a winner' do
      match = build(:match, goals_a: 2, goals_b: 1)
      match.winner.should == :team_a

      match.update_attributes(goals_a: 1, goals_b: 2)
      match.winner.should == :team_b

      match.update_attributes(goals_a: 1, goals_b: 1)
      match.winner.should == :draw
    end

  end
end