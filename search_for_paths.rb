NUM_THREADS = 4

(1..).each_slice(NUM_THREADS) do |slice|
  threads = slice.map.with_index do |n, i|
    Thread.new do
      system("kissat -n dimacs/#{n}.cnf > thread-#{i}-output.txt")
      output = File.read("thread-#{i}-output.txt")

      if output.include?("UNSATISFIABLE")
        puts "N=#{n} does not have a path <<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      elsif output.include?("SATISFIABLE")
        puts "N=#{n} has a path"
      else
        raise "Unexpected output for N=#{n}:\n#{output}"
      end
    end
  end

  threads.each(&:join)
end

