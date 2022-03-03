require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do
     it "has params" do
       post '/api/robot/0/orders', params: {"commands": ["PLACE 0,0,NORTH", "MOVE", "MOVE", "MOVE", "MOVE", "MOVE","REPORT"]}
       expect(response.body).to include("[0,5,\"NORTH\"]")
     end

     it "has params" do
      post '/api/robot/0/orders', params: {"commands": ["PLACE 1,2, EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"]}
      expect(response.body).to include("[3,3,\"NORTH\"]")
    end

    it "has params" do
      post '/api/robot/0/orders', params: {"commands": ["PLACE 0,0, NORTH", "MOVE", "REPORT"]}
      expect(response.body).to include("[0,1,\"NORTH\"]")
    end

    it "has params" do
      post '/api/robot/0/orders', params:  {"commands": ["PLACE 0,0, NORTH", "LEFT", "REPORT"]}
      expect(response.body).to include("[0,0,\"WEST\"]")
    end
     
  end
end
               