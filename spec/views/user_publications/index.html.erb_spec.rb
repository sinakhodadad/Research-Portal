require 'rails_helper'

RSpec.describe "user_publications/index", type: :view do
    before(:each) do
        user_one = Fabricate(:user)
        user_two = Fabricate(:user)

        publication_one = Fabricate(:publication)
        publication_two = Fabricate(:publication)
        assign(:user_publications, [
            UserPublication.create!(
                :user_id => user_one.id,
                :publication_id => publication_two.id
            ),
            UserPublication.create!(
                :user_id => user_two.id,
                :publication_id => publication_two.id
            )
        ])
    end


end
