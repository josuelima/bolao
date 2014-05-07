require 'spec_helper'

describe UserDecorator do

  let!(:user_decorated) { create(:user).decorate }
  subject { user_decorated }

  it 'should not respond to methods not delegated' do
    ['encrypted_password','remember_created_at','created_at','updated_at','uid','provider'].each do |m|
      user_decorated.should_not respond_to(m.to_sym)
    end
  end

  it 'should decorate guesses association' do
    user_decorated.guesses.should be_kind_of(Draper::CollectionDecorator)
  end

  it 'should decorate public guesses association' do
    user_decorated.public_guesses.should be_kind_of(Draper::CollectionDecorator)
  end

end