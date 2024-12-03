# Toy Robot Simulator
A Ruby application that simulates a toy robot moving on a tabletop based on specific commands.

---
## Description
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units
x 5 units
- There are no other obstructions on the table surface
- The robot is free to roam around the surface of the table, but must be prevented from falling to
destruction. Any movement that would result in the robot falling from the table must be
prevented, however further valid movement commands must still be allowed
---
## Objectives
- Create an application that can read in commands of the following form:
    -  PLACE X,Y,F
    -  MOVE
    -  LEFT
    -  RIGHT
    -  REPORT
- PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or
WEST
- The origin (0,0) can be considered to be the SOUTH WEST most corner
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command
- The application should discard all commands in the sequence until a valid PLACE command has
been executed
- MOVE will move the toy robot one unit forward in the direction it is currently facing
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot
- REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient
---
# Constraints:
- The toy robot must not fall off the table during movement. This also includes the initial
placement of the toy robot
- Any move that would cause the robot to fall must be ignored
---
## Examples
Input (test case 1):
```
PLACE 0,0,NORTH
MOVE
REPORT
```
Output (test case 1):
```
Output: 0,1,NORTH
```
Input (test case 2):
```
PLACE 0,0,NORTH
LEFT
REPORT
```
Output (test case 2):
```
Output: 0,0,WEST
```
Input (test case 3):
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
Output (test case 3)
```
Output: 3,3,NORTH
```
---
## Requirements
- Ruby: Version 2.7.5 or higher (I used 3.3.0)
- Bundler: For managing dependencies
---
## Installation
Clone the repository:
``` bash
git clone https://github.comy/alinbanica/toy_robot_simulator
cd toy_robot_simulator
```
Install dependencies:
``` bash
bundle install
```
---
## Usage
Run the application from the terminal:
```
./bin/toy_robot_simulator test.txt
```
There is a test file `test.txt` which has 10 testing scenarios but you can provide your own file for testing the implementation.

## Tests
Run the test suite to verify the implementation:
```bash
rspec
```
To install `rspec` (if not installed):
```bash
 gem install rspec
```

## Implementation
`/bin` folder
- contains the executable file `toy_robot_simulator` which is calling the `Parser` with the provide file containing the user commands for the robot

`/lib` folder
- contains two files:
    - `parser.rb` used to read the commands line by line and send them to the `ToyRobot` to execute them
    - `toy_robot.rb` is the main class which is implementing the commands requested by the user
