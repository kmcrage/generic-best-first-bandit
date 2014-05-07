# Runs the eval states proceudre 
#    -g number of games 
#    -t ci minimal threshold 
#    -i number of iterations 
#    -s seed 
#    -h heuristic 
#    -gs gold standard level

#!/bin/bash

./evalstates -i 1000   -t 1  -h 3 -g 1  >> states.csv
./evalstates -i 10000  -t 1  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 100000 -t 1  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 500000 -t 1  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv

./evalstates -i 1000   -t 10  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 10000  -t 10  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 100000 -t 10  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 500000 -t 10  -h 3 -g 1 | awk '{if(NR>1)print}' >> states.csv

./evalstates -i 1000   -t 30  -h 3 -g 1  | awk '{if(NR>1)print}'>> states.csv
./evalstates -i 10000  -t 30  -h 3 -g 1  | awk '{if(NR>1)print}'>> states.csv
./evalstates -i 100000 -t 30  -h 3 -g 1  | awk '{if(NR>1)print}'>> states.csv
./evalstates -i 500000 -t 30  -h 3 -g 1  | awk '{if(NR>1)print}'>> states.csv

./evalstates -i 1000   -t 1  -h 6 -g 1  | awk '{if(NR>1)print}'>> states.csv
./evalstates -i 10000  -t 1  -h 6 -g 1  | awk '{if(NR>1)print}'>> states.csv
./evalstates -i 100000 -t 1  -h 6 -g 1  | awk '{if(NR>1)print}'>> states.csv
./evalstates -i 500000 -t 1  -h 6 -g 1  | awk '{if(NR>1)print}'>> states.csv

./evalstates -i 1000   -t 10  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 10000  -t 10  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 100000 -t 10  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 500000 -t 10  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv

./evalstates -i 1000   -t 30  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 10000  -t 30  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 100000 -t 30  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv
./evalstates -i 500000 -t 30  -h 6 -g 1 | awk '{if(NR>1)print}' >> states.csv

# ./evalstates -i 1000   -t 10  -h 3 -g 50 >> states.csv
# ./evalstates -i 10000  -t 10  -h 3 -g 50 >> states.csv
# ./evalstates -i 100000 -t 10  -h 3 -g 50 >> states.csv
# ./evalstates -i 500000 -t 10  -h 3 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 30  -h 3 -g 50 >> states.csv
# ./evalstates -i 10000  -t 30  -h 3 -g 50 >> states.csv
# ./evalstates -i 100000 -t 30  -h 3 -g 50 >> states.csv
# ./evalstates -i 500000 -t 30  -h 3 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 50  -h 3 -g 50 >> states.csv
# ./evalstates -i 10000  -t 50  -h 3 -g 50 >> states.csv
# ./evalstates -i 100000 -t 50  -h 3 -g 50 >> states.csv
# ./evalstates -i 500000 -t 50  -h 3 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 100 -h 3 -g 50 >> states.csv
# ./evalstates -i 10000  -t 100 -h 3 -g 50 >> states.csv
# ./evalstates -i 100000 -t 100 -h 3 -g 50 >> states.csv
# ./evalstates -i 500000 -t 100 -h 3 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 10  -h 6 -g 50 >> states.csv
# ./evalstates -i 10000  -t 10  -h 6 -g 50 >> states.csv
# ./evalstates -i 100000 -t 10  -h 6 -g 50 >> states.csv
# ./evalstates -i 500000 -t 10  -h 6 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 30  -h 6 -g 50 >> states.csv
# ./evalstates -i 10000  -t 30  -h 6 -g 50 >> states.csv
# ./evalstates -i 100000 -t 30  -h 6 -g 50 >> states.csv
# ./evalstates -i 500000 -t 30  -h 6 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 50  -h 6 -g 50 >> states.csv
# ./evalstates -i 10000  -t 50  -h 6 -g 50 >> states.csv
# ./evalstates -i 100000 -t 50  -h 6 -g 50 >> states.csv
# ./evalstates -i 500000 -t 50  -h 6 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 100 -h 6 -g 50 >> states.csv
# ./evalstates -i 10000  -t 100 -h 6 -g 50 >> states.csv
# ./evalstates -i 100000 -t 100 -h 6 -g 50 >> states.csv
# ./evalstates -i 500000 -t 100 -h 6 -g 50 >> states.csv
# 
# ./evalstates -i 1000   -t 1000 -h 6 -g 50 >> states.csv
# ./evalstates -i 10000  -t 10000 -h 6 -g 50 >> states.csv
# ./evalstates -i 100000 -t 100000 -h 6 -g 50 >> states.csv
# ./evalstates -i 500000 -t 500000 -h 6 -g 50 >> states.csv
