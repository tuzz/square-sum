## The Square Sum Problem

Searches for Hamiltonian paths in square sum graphs as described in this YouTube video:
https://www.youtube.com/watch?v=G1m7goLCJDY

```sh
ruby generate_graphs.rb
ruby generate_dimacs.rb
ruby search_for_paths
watch "cat results.txt | grep 'does not have a path'"
```

The algorithm works by generating a graph/ file for each N. It then encodes the
Hamiltonian Path problem to SAT via [HCPtoSAT](https://github.com/7HAL32/HCPtoSAT).
It then runs [kissat](https://github.com/arminbiere/kissat) on each SAT problem
using multiple threads. Results are written to `results.txt`.

The HCP tool searches for Hamiltonian Cycles (not Paths) so we reduce
cycle -> path by adding an extra node with an edge to all other nodes.
