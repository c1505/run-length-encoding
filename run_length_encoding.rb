require "pry"
class RunLengthEncoding
    def self.encode(input)
        input_array = input.split("")
        output = [1]
        count = 1
        while !input_array.empty?
            if input_array[0] == input_array[1]
                count += 1
                if output[-1].class == Fixnum
                    output.pop
                end
                output << count
                input_array.shift
            else
                output << input_array.shift
                count = 1
            end
        end
        output.join  
    end
    
    def self.decode(input)
        input_array = input.split("")
        output = []
        while !input_array.empty?
            if input_array[0].to_i != 0 #checks if integer
                if input_array[1].to_i != 0
                    num = input_array[0] + input_array[1]
                    input_array.shift
                    input_array.shift
                else
                    num = input_array[0]
                    input_array.shift
                end
                
                output << (input_array.shift * num.to_i)
            else
                output << input_array.shift
            end
        end
        output.join
    end
end

    # input = '12WB12W3B24WB'
    # output = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
    # print RunLengthEncoding.decode(input)
#   input = 'AABBBCCCC'
#   output = '2A3B4C'
#   start with first letter.  pop it off the string or array.  
#   pop off the second letter and check if equal to the first.  
#   if equal increment the account that started at one by one
#   set current letter to the one that was just popped off
#   repeat