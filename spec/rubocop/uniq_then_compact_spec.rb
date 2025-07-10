# frozen_string_literal: true

RSpec.describe RuboCop::UniqThenCompact do
  it "has a version number" do
    expect(RuboCop::UniqThenCompact::VERSION).not_to be nil
  end

  it "loads the plugin successfully" do
    expect(described_class).to be_truthy
  end
end
