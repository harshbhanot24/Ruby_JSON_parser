def colorPrint(hash) 
    hash.each do |key, value|
      puts key.to_s.bg_red.italic + ' : ' + value.to_s.black.bg_green.bold
    end
end

def hashBreaker(hash,key)
    if !hash.nil?
      return hash[key]
    else
      puts "error in hashbreaker".bg_green.black.underline
      exit(1)
    end
end
  
