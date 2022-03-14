require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  it "should be defined" do
    expect { ApplicationJob.new }.not_to raise_error
  end
end
