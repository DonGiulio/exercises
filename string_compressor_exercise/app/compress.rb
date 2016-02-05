class Compressor

  def compress(uncompressed)
    return "" if uncompressed.nil? || uncompressed.empty?
    last = uncompressed[0]
    count = 0
    result = uncompressed.split("").inject("") do |result, char|
      if char == last
        count += 1
      else
        result << do_compress(last, count)
        last = char and count = 1
      end
      result
    end
    result << do_compress(last, count)
  end

  def decompress(compressed)
    return "" unless compressed
    
    compressed.split(/(\d+)/).inject("") do |memo, char|
      if numeric? char
        memo << do_uncompress(memo[-1], (Integer(char)-1)) unless memo.empty?
      else
        memo << char
      end
      memo
    end
  end

  private

  def do_uncompress(char, count)
    char * count
  end

  def do_compress(char, count)
    return "#{char}#{count}" if count > 2
    return char * count
  end

  # Your solution may or may not need this - feel free to delete it if you do not need it
  def numeric?(character)
    0 == (character =~ /[0-9]/)
  end

end