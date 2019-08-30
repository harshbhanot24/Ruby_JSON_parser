require 'json'
require 'ruby_dig'
require 'pp'
require 'colorize'
local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require "color.rb"
require "helperFunctions.rb"
class String
  def is_integer?
    self.to_i.to_s == self
  end
end

#start of main program
hash_data = JSON.parse(File.open($stdin.read.strip).read)
keys =ARGV[0].split(".")
extra= ARGV[1]
x=hash_data
for key in keys do
  x=hashBreaker(x,key);
  if(x ==nil) 
    puts "Key not found".bg_gray.red.underline
    exit(1)
  break
  end
end 

if(x.class == Array && extra==nil)
  for item in x 
    puts 'hy'
    puts item
  end
elsif (extra =='keys' )
  if(x.class == Hash)
    for key in x.keys
      puts key.reverse_color.bold
    end
  else
    puts 'Cannot find keys in Array'.bg_cyan.red.underline
    exit(1)
  end
elsif (extra =='values')
  if(x.class == Hash)
    val =x.values
    puts "__________------------_______________"
    puts colorPrint(val)
    
    puts "__________------------_______________"
  else
    puts 'Cannot find Values in Array'.red.underline
    exit(1)
  end
elsif (extra && extra.is_integer?) 
  puts x[extra.to_i]
else
  colorPrint(x)
end





