require 'spec_helper'
describe 'itmagent' do

  context 'with defaults for all parameters' do
    it { should contain_class('itmagent') }
  end
end
