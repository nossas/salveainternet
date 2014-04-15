require 'spec_helper'

describe Squeeze do
  before { allow_any_instance_of(Squeeze).to receive(:locate).and_return(true) }
  before { Fabricate(:squeeze) }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
end
