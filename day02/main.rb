#!/usr/bin/env ruby
# frozen_string_literal: true

class Day02
  def initialize
    @input_file = File.join(Dir.pwd, 'input_part1.txt')
    @input = []
    @output = []
  end

  def solve_part1
    parse_input
    set_parameters(12, 2)
    do_ops
    puts @output[0]
  end

  def solve_part2
    parse_input

    (0..99).step(1) do |noun|
      (0..99).step(1) do |verb|
        set_parameters(noun, verb)
        do_ops
        if @output[0] == 19_690_720
          result = 100 * noun + verb
          puts result
          exit
        end
        @output = @input.dup
      end
    end
  end

  def parse_input
    # use `chomp` to remove newlines
    line = File.readlines(@input_file).map(&:chomp).first
    @input = line.split(',').map(&:to_i)
    @output = @input.dup
  end

  def set_parameters(noun, verb)
    @output[1] = noun
    @output[2] = verb
  end

  def do_ops
    i = 0

    while i <= @output.length - 3
      case @output[i]
      when 1
        @output[@output[i + 3]] = @output[@output[i + 1]] + @output[@output[i + 2]]
      when 2
        @output[@output[i + 3]] = @output[@output[i + 1]] * @output[@output[i + 2]]
      when 99
        return
      else
        puts 'Unknown opcode encountered'
        exit(1)
      end

      i += 4
    end
  end
end

puts 'Solving part 1 ...'
Day02.new.solve_part1

puts 'Solving part 2 ...'
Day02.new.solve_part2
