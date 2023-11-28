
The file mathematica/mu2e.nb is the interactive notebook.   
It will load mu2elib.wl for function definitions.  mu2elib.wl should remain in the same directory as mu2e.nb so it can be found.

This mathematica notebook also requires the Elastic directory containing
ground state to ground state one-body density matrices.
Clone the repository in a directory parallel to the Mu2E clone.
```bash
git clone git@github.com:Berkeley-Electroweak-Physics/Elastic.git
```
and and set an environment variable so the Mathematica code can find it.
```bash
export MU2E_ELASTIC=<path-to-elastic-dir>
```
Running this notebook is an interactive process.   Use the "Evaluate Notebook" command.   Prompts will ask for the element and isotope choice.   The isotope choice can be an average over abundances or a specific isotope.   Then an interaction is requested.
