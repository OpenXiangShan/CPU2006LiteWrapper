import argparse
import os

verbose = False

def get_spec_int():
  return [
    "400.perlbench",
    "401.bzip2",
    "403.gcc",
    "429.mcf",
    "445.gobmk",
    "456.hmmer",
    "458.sjeng",
    "462.libquantum",
    "464.h264ref",
    "471.omnetpp",
    "473.astar",
    "483.xalancbmk"
  ]

def get_spec_fp():
  return [
    "410.bwaves",
    "416.gamess",
    "433.milc",
    "434.zeusmp",
    "435.gromacs",
    "436.cactusADM",
    "437.leslie3d",
    "444.namd",
    "447.dealII",
    "450.soplex",
    "453.povray",
    "454.calculix",
    "459.GemsFDTD",
    "465.tonto",
    "470.lbm",
    "481.wrf",
    "482.sphinx3",
  ]

def get_ref_time(benchspec, input):
  spec_dir = os.getenv('SPEC')
  if spec_dir is None:
    print("Please set SPEC environment variable.")
    exit()
  bench_dir = os.path.join(spec_dir, "benchspec", "CPU2006", benchspec)
  reftime_path = os.path.join(bench_dir, "data", input, "reftime")
  f = open(reftime_path)
  reftime = float(f.readlines()[-1].rstrip('\n'))
  f.close()
  return reftime

def get_run_time(benchspec, input):
  elapsed_time = 0
  log_path = os.path.join(benchspec, "run", f"run-{input}.sh.timelog")
  if not os.path.exists(log_path):
    if verbose:
      print(f"Does not find {log_path} for {benchspec}. Use REFTIME instead.")
    return get_ref_time(benchspec, input)
  with open(log_path, "r") as f:
    for line in f:
      if "elapsed in second" in line:
        elapsed_time += float(line.split("#")[0].strip())
  return elapsed_time

def report(input, fp_case, int_case):
  def bold(s, replace_slash=True):
    if not replace_slash:
        return '\033[1m' + s + '\033[0m'
    else:
        return "|".join(map(lambda x: bold(x, False), s.split("|")))

  def report_partial(name, benchspecs):
    spec_score = 1
    for benchspec in benchspecs:
      ref_time = get_ref_time(benchspec, input)
      run_time = get_run_time(benchspec, input)
      score = ref_time / run_time
      spec_score *= score
      print(f"| {benchspec:15}| {ref_time:8.2f} | {run_time:8.2f} | {score:5.2f} |")
    geomean_spec_score = spec_score ** (1 / len(benchspecs))
    print(bold(f"| {name:11}                            {geomean_spec_score:5.2f} |"))

  print(bold("************************************************"))
  print(bold("|  SPEC CPU2006  | REFTIME  | RUNTIME  | SCORE |"))
  print(bold("************************************************"))
  if int_case:
    report_partial("SPECint2006", get_spec_int())
    print("------------------------------------------------")
  if fp_case:
    report_partial("SPECfp2006", get_spec_fp())
    print(bold("************************************************"))

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description="report marks for SPEC CPU2006")
  parser.add_argument('--spec', default="all", type=str, help="Testcase FP/INT/ALL for SPEC2006 (fp, int, all)")
  parser.add_argument('--input', default="ref", type=str, help='input of SPEC CPU2006 (ref, train, test)')
  parser.add_argument('--verbose', '-v', default=False, action='store_true', help='verbose level')
  args = parser.parse_args()

  verbose = args.verbose

  if args.spec == "all":
    fp_case = True
    int_case = True
  elif args.spec == "fp":
    fp_case = True
    int_case = False
  else:
    int_case = True
    fp_case = False

  report(args.input, fp_case, int_case)
