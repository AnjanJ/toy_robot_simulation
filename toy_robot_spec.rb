# frozen_string_literal: true

require './toy_robot'

RSpec.describe ToyRobot do
  before do
    @robo = ToyRobot.new
  end

  it 'asks to place the robot incase robot not on table' do
    expect(@robo.report).to eq('Please place the robot first')
  end

  it 'can move forward' do
    @robo.place(0, 0, 'east')
    expect(@robo.move).to eq(1)
  end

  it 'can report its current position' do
    @robo.place(0, 0, 'east')
    expect(@robo.report).to eq('Robot is at (0,0 and facing east)')
  end

  it 'can be placed on table' do
    @robo.place 0, 0, 'east'
    expect(@robo.x_pos).to eq(0)
    expect(@robo.y_pos).to eq(0)
    expect(@robo.facing).to eq('east')
  end

  it 'only accepts valid values for placing' do
    @robo.place(0, 0, 'west')
    expect(@robo.place(10, 0, 'south west')).to eq([0, 0, 'west'])
    expect(@robo.report).to eq('Robot is at (0,0 and facing west)')
  end

  it 'saves robot from falling of table' do
    @robo.place(0, 0, 'west')
    expect(@robo.move).to eq('Robot will fall off the table, hence not moved')
  end
end
