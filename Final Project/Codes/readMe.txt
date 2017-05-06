Source Code:

compute_matricesb.m, computes finite element matrices for the heat equation.

heat_oned.m, controls the solution of the time-dependent 1D heat equation.

heat_oned_setup.m, sets up the time-dependent 1D heat equation.

oned_bilinear.m integrates kernel(x) * basis function(x) * test function(x).

oned_f_int.m computes the integral of f(x) times a test function.

oned_gauss.m sets Gauss integration points on (-1,1).

oned_mesh.m generates a mesh with a prescribed density. This routine returns elements of the same type as xb, e_connb (linear or quadratic).

oned_shape.m computes test functions and derivatives for a Lagrange C0 element given element coordinates and Gauss points. (assumes all nodes are uniformly distributed in the element.)

timestamp.m, prints the YMDHMS date as a timestamp;

u_function.m, evaluates the time dependent boundary conditions.

Examples and Tests:

heat_oned_test.m, runs all the tests.
heat_oned_test01.m, runs a test case;
heat_oned_test01.png, an image of the computed solution.
heat_oned_test_output.txt, the output file.