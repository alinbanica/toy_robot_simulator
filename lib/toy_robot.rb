class ToyRobot

  ACCEPTED_INSTRUCTIONS = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']
  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  MOVES = {
    'NORTH' => [0, 1],
    'EAST' => [1, 0],
    'SOUTH' => [0, -1],
    'WEST' => [0, -1]
  }
  TABLE_HEIGHT = 5
  TABLE_WIDTH = 5

  def initialize
    @placed = false
  end

  def execute(command)
    if command.match(/\APLACE (\d+),(\d+),(#{DIRECTIONS.join('|')})\z/)
      send('place', $1.to_i, $2.to_i, $3)
    elsif command.match(/\A(#{(ACCEPTED_INSTRUCTIONS - ['PLACE']).join('|')})\z/)
      send($1.downcase) if placed
    end
  end

  private

  attr_reader :x, :y, :facing, :placed

  def place(x, y, facing)
    return unless valid_position?(x, y)

    set_position(x, y)
    set_direction(facing)

    @placed = true
  end

  def move
    x = @x + MOVES[facing].first
    y = @y + MOVES[facing].last

    set_position(x, y) if valid_position?(x, y)
  end

  def left
    set_direction(DIRECTIONS.rotate(-1)[current_direction_index])
  end

  def right
    set_direction(DIRECTIONS.rotate[current_direction_index])
  end

  def report
    puts "Output: #{x},#{y},#{facing}"
  end

  def set_position(x, y)
    @x, @y = x, y
  end

  def set_direction(direction)
    @facing = direction
  end

  def valid_position?(x, y)
    (0...TABLE_WIDTH).include?(x) && (0...TABLE_HEIGHT).include?(y)
  end

  def current_direction_index
    DIRECTIONS.index(facing)
  end

end