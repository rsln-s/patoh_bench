import os
import shlex
import sys
from subprocess import Popen, PIPE
from joblib import Parallel, delayed
import statistics
import argparse
import operator
import csv
from itertools import product
import re

# runs PaToH on a given set of parameters

def get_first_int_after_substring(output, str_to_look_for):
	outsplit = output.split(str_to_look_for)
	if len(outsplit) < 2:
		return None
	outclean = []
	for s in outsplit:
		outclean.append(s.strip())

	return int(float((re.match(b'\d+', outclean[-1])).group(0)))

def get_first_word_after_substring(output, str_to_look_for):
	outsplit = output.split(str_to_look_for, 1)
	if len(outsplit) < 2:
		return None
	return re.match("[\w\=\-\_]+", outsplit[1].decode('ascii')).group(0)

def run_patoh(hgraph_filepath, executable_filepath="/home/rshaydu/patoh_bench/build/Linux-x86_64/patoh", num_parts=2, imbal=0.03, num_runs=1, processes=1):
		cmd = " ".join([executable_filepath, hgraph_filepath, str(num_parts), "PQ=Q", "NR="+str(num_runs),"UM=U", "A1="+str(num_parts*10),  "IB="+str(imbal)])
		print("Running", cmd)
		process = Popen(shlex.split(cmd), stdout=PIPE)
		(output, err) = process.communicate()
		exit_code = process.wait()
		if exit_code != 0:
				print("Encountered nonzero exit code {}. Exiting.".format(exit_code))
				print(output)
				sys.exit(1)
		graph = get_first_word_after_substring(output, b'PaToH:')
		cutn_min = get_first_int_after_substring(output, b'Cut Cost: ')

		imbal = 1.0 + imbal
		unique_id = str(graph)+str(num_parts)+str(imbal)
		return [unique_id, graph, "N/A", "N/A", num_parts, imbal, cutn_min]
		

parser = argparse.ArgumentParser()
parser.add_argument("-r", "--num-runs", default=10, help="number of time PaToH is run with different seeds", type=int)
parser.add_argument("-p", "--processes", default=16, help="number of processes / cores to use", type=int)
args = parser.parse_args()

outfilename = 'output.csv'

inp_files_all = os.listdir(".")
inp_files = list(filter(lambda x: ".patoh" in x and ".part." not in x, inp_files_all))

results = []
parts = [2,4,8,16,32,64,128,512,1024] 
imbals = [0.03, 0.05, 0.10]

for f in inp_files:
	results += Parallel(n_jobs=args.processes)(delayed(run_patoh)(f, num_runs=args.num_runs, num_parts=p[0], imbal=p[1]) for p in product(parts,imbals))

results = sorted(results, key=operator.itemgetter(1, 4, 5))
with open(outfilename, 'w') as csvfile:
	out = csv.writer(csvfile, delimiter=';')
	for r in results:
		out.writerow(r)

