require 'spec_helper'

describe Gist do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @gist = Gist.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @gist }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @gist.user_id = nil }
    it { should_not be_valid }
  end
end
