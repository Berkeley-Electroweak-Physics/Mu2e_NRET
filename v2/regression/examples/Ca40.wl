(*
 * Mathematica testing script converted from python .yaml file
 *
 * Required Setup:
 *   On Mac add /Applications/Mathematica.app/Contents/MacOS to your path to find MathKernel
 *   Set environment variable MU2E_ELASTIC to the Elastic density matrix directory
 *   Set environment variable MU2E_MATH to the directory containing mu2elib.wl
 *
 * Run with:   MathKernel -script examples/Ca40.wl
 *)
nbdir = Environment["MU2E_MATH"]
Get[nbdir <> "/mu2elib.wl"];
(* Capture data as Mathematica association *)
data = <|
   "basefile"    -> "Ca40", (* used to name plot files *)
   "isotope"     -> "40Ca",
   "interaction" -> "kbp",
   "oscb"        -> 1.9397622075, (* harmonic osc length scale *)
   "plots"   -> {"vcrm"},
   "mL"          -> 0.0, (* leptonic scale *)
   "muonlower"   -> 0 (* Ignore muon lower components *),
   "mcr"         -> 2525000.0 (* muon cap rate *),
   (* nonrelativistic coef *)
   "cs" -> {
      {1, 0.2, 0.2},
      {2, 0.0, 1.0},
      {5, 0.3, 0.0},
      {16, 0.0, 1.0}},
   "dummy"       -> 0 (* avoid trailing comma *)
|>;

batch[data];
Quit[];
