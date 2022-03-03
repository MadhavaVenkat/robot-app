require 'rails_helper'

RSpec.describe "routing", type: :routing do
  it "has route to command action" do
    expect(post: 'api/robot/0/orders').to route_to("api/robot/orders#command", robot_id: "0")
  end
end 