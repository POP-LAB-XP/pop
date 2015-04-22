require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "deve ter um email" do
  	user.email.should == "pop@pop.com"
  end

  it "deve ter email" do
        user = build(:user, :email => "").should_not be_valid
  end

  it "deve ter senha" do
        user = build(:user, :password => "").should_not be_valid
  end

  it "deve ter senha" do
        user = build(:user, :password => "1234567").should_not be_valid
        user = build(:user, :password => "12345678").should be_valid
  end

  it "deve ter código" do
        user = build(:user, :sub_prefeitura => nil).should_not be_valid
  end

end
