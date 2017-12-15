module DayFifteen
  class Generators
    FACTOR_A = 16807
    FACTOR_B = 48271
    DIVISOR = 2147483647

    def initialize(initial_a, initial_b)
      @val_a = initial_a
      @val_b = initial_b
    end

    def part_one
      count = 0
      40_000_000.times do
        a = generate_a.to_s(2).chars.last(16).join
        b = generate_b.to_s(2).chars.last(16).join
        if a == b
          # puts a
          count += 1
        end

      end
      count
    end

    def part_two
      a_vals = []
      b_vals = []
      pairs = []
      while pairs.length <= 5_000_000 do
        a = generate_a
        b = generate_b

        if a % 4 == 0
          a_vals << a.to_s(2).chars.last(16).join
          if b_vals.any?
            pairs << [a_vals.delete_at(0), b_vals.delete_at(0)]
          end
        end

        if b % 8 == 0
          b_vals << b.to_s(2).chars.last(16).join
          if a_vals.any?
            pairs << [a_vals.delete_at(0), b_vals.delete_at(0)]
          end
        end
      end

      pairs.select{ |x, y| x == y }.length
    end

    def generate_a
      rem = (@val_a * FACTOR_A) % DIVISOR
      @val_a = rem
      rem
    end

    def generate_b
      rem = (@val_b * FACTOR_B) % DIVISOR
      @val_b = rem
      rem
    end
  end
end
