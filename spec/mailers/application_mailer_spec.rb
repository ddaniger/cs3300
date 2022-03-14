require "rails_helper"

RSpec.describe ApplicationMailer, :type => :mailer do
  it "should be defined" do
    expect { ApplicationMailer.new }.not_to raise_error
  end
end
