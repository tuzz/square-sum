(1..5_000).each do |n|
  puts "Generating graph for N=#{n}..."

  max_possible_sum = n + (n - 1)
  perfect_squares = {}

  (1..).each do |i|
    break if i * i > max_possible_sum
    perfect_squares[i * i] = true
  end

  edges = []

  1.upto(n) do |i|
    1.upto(i - 1) do |j|
      if perfect_squares[i + j]
        edges.push([i, j])
        edges.push([j, i])
      end
    end

    # Reduce Hamiltonian path -> Hamiltonian cycle.
    edges.push([i, n + 1])
    edges.push([n + 1, i])
  end

  File.open("graphs/#{n}.param", "w") do |file|
    file.puts "PROBLEM_FILE = graphs/#{n}.hcp"
    file.puts "RUNS = 1"
    file.puts "BACKTRACKING = YES"
  end

  File.open("graphs/#{n}.hcp", "w") do |file|
    file.puts "TYPE : HCP"
    file.puts "DIMENSION : #{n + 1}"
    file.puts "EDGE_DATA_FORMAT : EDGE_LIST"
    file.puts "EDGE_DATA_SECTION"

    edges.each do |a, b|
      file.puts "#{a} #{b}"
    end
  end
end
