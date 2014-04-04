require 'spec_helper'

describe Building do
  context 'validations' do
    it { should have_valid(:street_address).when('234 Aardvaark Lane') }
    it { should_not have_valid(:street_address).when('', nil) }

    it { should have_valid(:city).when('Kookaburra') }
    it { should_not have_valid(:city).when('', nil) }

    it { should have_valid(:state).when('WA') }
    it { should_not have_valid(:state).when('', nil, 'XX') }

    it { should have_valid(:postal_code).when('04576') }
    it { should_not have_valid(:postal_code).when('', nil, 'abc') }

    # it { should have_valid(:building_owner).when(Owner.new) }
    # it { should_not have_valid(:building_owner).when(nil, '') }
  end

  # context 'associations' do
  #   it { should belong_to(:owner).dependent(:destroy) }
  # end
end
