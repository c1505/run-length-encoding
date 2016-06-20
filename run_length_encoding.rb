
module BookKeeping
    VERSION = 2 
end
class RunLengthEncoding
    def self.encode(input)
        input_array = input.split("")
        output = []
        count = 1
        while !input_array.empty?
            if input_array[0] == input_array[1]
                count += 1
                unless output.empty?
                    if output[-1].class == Fixnum
                        output.pop
                    end
                end
                output << count
                input_array.shift
            else
                # output.pop
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
