(*
 * Mathematica testing script converted from python .yaml file
 *
 * Required Setup:
 *   On Mac add /Applications/Mathematica.app/Contents/MacOS to your path to find MathKernel
 *   Set environment variable MU2E_ELASTIC to the Elastic density matrix directory
 *   Set environment variable MU2E_MATH to the directory containing mu2elib.wl
 *
 * Run with:   MathKernel -script examples/Fe56.wl
 *)
nbdir = Environment["MU2E_MATH"]
Get[nbdir <> "/mu2elib.wl"];
(* Capture data as Mathematica association *)
data = <|
   "basefile"    -> "Fe56", (* used to name plot files *)
   "isotope"     -> "56Fe",
   "interaction" -> "GX1A",
   "oscb"        -> 2.030860742, (* harmonic osc length scale *)
   "plots"   ->  "none",
   "mL"          -> 0.0, (* leptonic scale *)
   "muonlower"   -> 0 (* Ignore muon lower components *),
   "mcr"         -> 4411000.0 (* muon cap rate *),
   (* nonrelativistic coef *)
   "cs" -> {
      {1, 0.2, 0.2},
      {3, 2.0, 1.0},
      {7, 0.3, 0.4},
      {16, 0.1, 1.0}},
   "dummy"       -> 0 (* avoid trailing comma *)
|>;

batch[data];
Quit[];
