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
git clone git@github.com:alinbanica/toy_robot_simulator.git
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
---

## Tests
Run the test suite to verify the implementation:
```bash
rspec
```
To install `rspec` (if not installed):
```bash
 gem install rspec
```

The functionality was tested using the test cases provided in the test.txt file. This same file was utilized in the rspec tests when writing specifications for the ./bin/toy_robot_simulator executable.

---

## Implementation
For the implementation, I initially adopted a brute-force approach to ensure all requirements were fulfilled and all specifications were implemented and passing their tests. Once the functionality was verified, I refactored the solution to leverage the Command Pattern for improved design and maintainability. The resulting file and folder structure is detailed below.

`/bin` Folder
Contains the executable file toy_robot_simulator, which is responsible for invoking the Parser with the provided file containing user commands for the robot.
`/lib` Folder
 - `parser.rb`:
Reads the command file line by line and forwards each command to the Processor for interpretation.

- `processor.rb`:
Interprets the input commands and delegates them to the corresponding command classes for execution.

- `/commands` Folder:
Groups all command classes (e.g., PLACE, MOVE, LEFT, RIGHT, REPORT). Each command is implemented as a separate class following a common interface to ensure consistency and extensibility.

- `toy_robot.rb`:
Represents the toy robot, encapsulating its position, direction, and movement logic.

- `table.rb`:
Represents the 5x5 grid tabletop and ensures that all robot movements and placements remain within valid boundaries.

Some of the advantages of this approach are:
 - Adding new commands is straightforward by creating new classes
 - Each class has a clear, focused purpose.
 - Commands and the core logic can be tested independently.
 - The toy robot, table, and commands are decoupled =>  improving maintainability.