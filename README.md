## The Square Sum Problem

Searches for Hamiltonian paths in square sum graphs as described in [this](https://www.youtube.com/watch?v=G1m7goLCJDY) YouTube video.

## Setup

First, install [LKH](http://akira.ruc.dk/~keld/research/LKH/) then run:

```sh
ruby generate_graphs.rb
ruby search_for_paths.rb | tee results.txt
watch "cat results.txt | grep 'does not have a path'"
```

The algorithm generates Hamiltonian Cycle files for use with the LKH solver. We
reduce cycle -> path by adding an extra node connected to all others.
