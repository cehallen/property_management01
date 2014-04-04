require 'spec_helper'

describe Owner do
  context 'validations' do
    it { should have_valid(:first_name).when('Jon') }
    it { should_not have_valid(:first_name).when('', nil) }

    it { should have_valid(:last_name).when('Krakauer') }
    it { should_not have_valid(:last_name).when('', nil) }

    it { should have_valid(:email).when('jk@gmail.com') }
    it { should_not have_valid(:email).when('', nil, 'mail.com', 
      'jon@', 'jon@mail') }
  end 

  context 'associations' do
    it { should have_many(:buildings).dependent(:destroy) }
  end
end