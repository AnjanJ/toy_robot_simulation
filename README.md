# This is a toy robot simulator implementation

## SETUP: 
#### gem install rspec
#### to run test, goto the toy_robot folder and execute `rspec toy_robot_spec.rb`

## To play the game.
#### Initialize the robot `robo = ToyRobot.new`
#### To place the robot on the table `robo.place(0,0,'west')`
#### To move the robot ahead `robo.move`
#### To get robot's current position `robo.report`

### Valid x and y posiiotns are from 0 to 5
### Valid robots face orientation is either 'north' , 'south' , 'east' , or 'west'