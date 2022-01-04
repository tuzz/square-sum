NUM_THREADS = 6

(2..).each_slice(NUM_THREADS) do |slice|
  threads = slice.map.with_index do |n, i|
    Thread.new do
      system("lkh graphs/#{n}.param > thread-#{i}-output.txt")
      output = File.read("thread-#{i}-output.txt")

      if output.include?("Error")
        raise "Unexpected output for N=#{n}:\n#{output}"
      elsif output.include?("Cost.min = 0")
        puts "N=#{n} has a path"
      else
        puts "N=#{n} does not have a path <<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      end
    end
  end

  threads.each(&:join)
end

