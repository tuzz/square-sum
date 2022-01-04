(1..).each do |n|
  puts "Generating DIMACS for N=#{n}..."

  `../HCPtoSAT/encoders/helga_multiPB/helga.out graphs/#{n}.col 'mv in.txt dimacs/#{n}.cnf'`
end
