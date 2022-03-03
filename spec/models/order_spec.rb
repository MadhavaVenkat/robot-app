require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:valid_attributes) do {
    x: 0,
    y: 0,
    face: "NORTH"
  }
  end

  let(:invalid_attributes) do {
    x: 6,
    y: 6,
    face: "NORTH"
  }
  end

  it "has chnage order count by 1" do
    expect{ 
      order = Order.new valid_attributes
      order.save
    }.to change(Order, :count).by(1)
  end

  it "has chnage order count by 0" do
    expect{ 
      order = Order.new invalid_attributes
      order.save
    }.to change(Order, :count).by(0)
  end
end
 