require 'rails_helper'

RSpec.describe "journals/index", type: :view do
  before(:each) do
    assign(:journals, [
      Journal.create!(
        :name => "Name 1"
      ),
      Journal.create!(
        :name => "Name 2"
      )
    ])
  end


end
