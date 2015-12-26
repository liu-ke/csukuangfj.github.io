---
layout: post
title: Matlab References
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- Matlab
---


## Tutorials
 - [Session 2: Data types and structures][1], a pdf document
 - [Session 3: Data exploration][2], a pdf, **nominal** and **ordinal** data type in Matlab
 - [Introduction to the New MATLAB Data Types in R2013b][4], table and categorical data type
 - [writing Fast Matlab Code, profiling, vectorization, and more.][10] or [local copy][11]

## Tools
 - [export_fig][3], export figures to be used in LaTeX

## Matlab external interface
### C Interface (mex)
 - Help->Matlab->User Guide->External Interfaces
 - tutorial [Matlab – External interfaces][6] or [local copy][7] (It has an example for **Makefile**)
 - tutorial [Writing MATLAB C/MEX Code][8] or [local copy][9]
 - There are some examples under *matlabroot/extern/examples/mex*
 - Pass user defined class object to mex, refer to [here][12] and one function **mxGetProperty**.

### Java Interface
 - Help->Matlab->User Guide->External Interfaces->Using Sun Java Classes in MATLAB Software
 - *version -java* to see the current jdk used by Matlab
 - *javaclasspath* to see the static class path and dynamic class path; static class path is used at matlab startup and cannot be changed after startup; dynamic class path can be changed when matlab is running. Static class path has higher priority.
 - **static class path**: matlabroot\toolbox\local\classpath.txt


## Tips

1. Matlab image toolbox demo images location refer to [here][5]
  - for version above 2014a(inclusive) fullfile(matlabroot, '\toolbox\images\imdata')
  - for version below 2014a fullfile(matlabroot, '\toolbox\images\imdemos');







[12]: http://www.mathworks.com/matlabcentral/answers/79242-how-can-i-pass-a-user-defined-class-to-a-mex-file
[11]: /pdf/matlab/matopt.pdf
[10]: https://classes.soe.ucsc.edu/ee264/Fall11/matopt.pdf
[9]: /pdf/matlab/cmex.pdf
[8]: https://classes.soe.ucsc.edu/ee264/Fall11/cmex.pdf
[7]: /pdf/matlab/mex_handouts.pdf
[6]: http://www.tp.umu.se/modsim/files/mex/mex_handouts.pdf
[5]: http://www.mathworks.com/matlabcentral/answers/54439-list-of-builtin-demo-images
[4]: http://blogs.mathworks.com/loren/2013/09/10/introduction-to-the-new-matlab-data-types-in-r2013b/#view_comments
[3]: http://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig
[2]: http://www.scs2.net/next/files/courses/stats/session3.pdf
[1]: http://www.scs2.net/next/files/courses/matlab/session2.pdf