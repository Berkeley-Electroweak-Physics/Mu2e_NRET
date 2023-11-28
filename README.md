# Mu2e_NRET
Muon to electron conversion -  non-relativistic effective theory (NRET).

This repository contains two versions of the code in directories *v1* and *v2*.  In the article where this code is described these directories coorespond to **Mu2e_NRET_v1** and **Mu2e_NRET_v2**.   The *v1* version is the original code described in <sup>[Mu2e]</sup> and <sup>[Mu2eFA]</sup>.  The *v2* version of the code is described in a more recent article connecting standard model effective theory (SMEFT) to the nucleus level NRET.
$\space\color{red} \text{Put in link to arxiv when posted}$.

# Contents
This repository contains Python and Mathematica implementations of a nonrelativistic effective theory
(NRET) appropriate for analyzing nuclear experiments.   There are two versions.   The first version,
described in <sup>[Mu2e]</sup> and <sup>[Mu2eFA]</sup>, describes the conversion process begining with the
replacement of the 1s electron with a muon and the subsequent interaction with the nucleus.   The first version
was carried out to first order in the nucleon and muon velocities.   A second version, developed in support of
connecting to higher level theories was extended to include tensor operators, and relativisic corrections associated
with the lower components of the muon wavefunction.   

This repository depends on a collection of one-body density matrices for nuclear targets.    [The Elastic repository](https://github.com/Berkeley-Electroweak-Physics/Elastic) 
contains the required files.

Two additional repositories [MuonBridge](git@github.com:Berkeley-Electroweak-Physics/MuonBridge) and [MuonConverter](), found in this github organization,
implement reduction from Standard Model Effective Theories (SMEFT).    MuonBridge is an overview repository with scripts to
clone a set of consistant versions of the other required repositories.    MuonConverter implements the reduction from SMEFT LECs to
the Muon_NRET LECs.

Version 1 of Mu2e_NRET can be found in directory **v1**.   See the README.md file there for more details.

Version 2 of Mu2e_NRET can be found in directory **v2**.   See the README.md file there for more details.

# References  

[Mu2e]: https://doi.org/10.1103/PhysRevLett.130.131901 "Nuclear-Level Effective Theory of Muon -> Electron Conversion, Evan Rule, W.C. Haxton and Kenneth McElvain (2023)" 
Mu2e: [Nuclear-Level Effective Theory of Muon -> Electron Conversion, Evan Rule, W.C. Haxton and Kenneth McElvain](https://doi.org/10.1103/PhysRevLett.130.131901)

[Mu2eFA]: https://doi.org/10.1103/PhysRevC.107.035504 "Nuclear-level effective theory of Muon -> Electron Conversion: Formalism and Applications, Evan Rule, W.C. Haxton, Kenneth McElvain, and Michael J. Ramsey-Musolf (2023)" 
Mu2eFA: [Nuclear-level effective theory of Muon -> Electron Conversion: Formalism and Applications, Evan Rule, W.C. Haxton, Kenneth McElvain, and Michael J. Ramsey-Musolf (2023)](https://doi.org/10.1103/PhysRevC.107.035504)
