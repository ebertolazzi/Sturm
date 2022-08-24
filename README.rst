.. |View Sturm on File Exchange| image:: https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg
   :target: https://www.mathworks.com/matlabcentral/fileexchange/106290-sturm

Sturm
=====
|View Sturm on File Exchange|

``Sturm`` is a MATLAB toolbox implementing two classes

- Poly, which implements a polynomial object
- Sturm, which implements the Sturm algorithm for real roots computations.

Features
--------

Poly class store and manipulate a polynomial:

- easy initialization
- +,-,* operations implemented on the objects
- division of polynomial with remainder
- derivative and integral of a polynomial

Sturm class store and manipilate Sturm sequence for
real roots separation and computation:

- build Sturm sequence
- build intervals separating roots
- compute all the real roots in an interval

Class Poly
----------

Build a polynomial
~~~~~~~~~~~~~~~~~~

build empy polynomial

  .. code-block:: matlab

    p = Poly();
    p.print();


build a polynomial

  .. code-block:: matlab

    q = Poly([1,2,3,4,5]);
    q.print();

build a monomial x+3

  .. code-block:: matlab

    q.set_monomial(3);
    q.print();


setup a polynomial

  .. code-block:: matlab

    q.set_by_coeffs([5,4,3,2,1]);
    q.print();

scale a polynomial in such a way max
absolute value of polynomial coefficients
is 1

  .. code-block:: matlab

    q.normalize();
    q.print();


Evaluate polynomial
~~~~~~~~~~~~~~~~~~~

evaluate polynomial on sampled values

  .. code-block:: matlab

    y = q.eval([1,2,3,4,5]);
    disp(y);

evaluate polynomial derivative

  .. code-block:: matlab

    y = q.eval_D([1,2,3,4,5]);
    disp(y);

Perform some basic operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Build

  .. code-block:: matlab

    p = Poly([1,2,3]);     % build a polynomial
    q = Poly([1,2,3,4,5]); % build a polynomial
    fprintf('p(x) = %s\n',p.to_string);
    fprintf('q(x) = %s\n',q.to_string);

addition

  .. code-block:: matlab

    res = p+q;
    fprintf('p(x)+q(x) = %s\n',res.to_string);

scalar addition

  .. code-block:: matlab

    res = 1+p;
    fprintf('p(x)   = %s\n1+p(x) = %s\n',p.to_string,res.to_string);

scalar addition and subtraction

  .. code-block:: matlab
    fprintf('p(x)   = %s',p.to_string);

    res = p+1;
    fprintf('1+p(x) = %s\n',res.to_string);

    res = p-1;
    fprintf('p(x)-1 = %s\n',res.to_string);

    res = 1-p;
    fprintf('1-p(x) = %s\n',res.to_string);

polynomial multiplications

  .. code-block:: matlab

    res = p*q;
    fprintf('p(x)*q(x) = %s\n',res.to_string);

    % multiplications by a scalar
    res = p*10;
    fprintf('p(x)*10 = %s\n',res.to_string);

    % multiplications by a scalar
    res = 3*p;
    fprintf('p(x)*10 = %s\n',res.to_string);


Integral and derivative
~~~~~~~~~~~~~~~~~~~~~~~

Integral

  .. code-block:: matlab

    Iq = q.integral;
    fprintf('q(x)        = %s\nint(q(x),x) = %s\n',q.to_string,Iq.to_string);

Derivative

  .. code-block:: matlab

    Dq = q.derivative;
    fprintf('q(x)  = %s\nq''(x) = %s\n',q.to_string,Dq.to_string);

Division with remainder
~~~~~~~~~~~~~~~~~~~~~~~

  .. code-block:: matlab

    p.set_by_coeffs([1,0,-3,5,0,3,0,2]);
    [s,r] = p.divide(q);
    fprintf('p(x)  = %s\n',p.to_string);
    fprintf('q(x)  = %s\n',q.to_string);
    fprintf('p(x)/q(x) = %s\n',s.to_string);
    fprintf('remainder = %s\n',r.to_string);

    % check operation
    res = q*s+r;
    fprintf('q(x)*s(x)+r(x) = %s\n',res.to_string);
    res = res - p;
    fprintf('q(x)*s(x)+r(x)-p(x) = %s\n',res.to_string);

set to 0 coefficients less than epsi

  .. code-block:: matlab

    epsi = 100*eps;
    res.purge(epsi);
    fprintf('q(x)*s(x)+r(x)-p(x) = %s\n',res.to_string);

Greater Common Divisor
~~~~~~~~~~~~~~~~~~~~~~

set GCD a multiple of polynomial g = 1+2x+3x^2

  .. code-block:: matlab

    % GCD
    g   = Poly([1,2,3]);
    q   = q*g;
    p   = p*g;
    res = p.GCD(q);
    fprintf('p(x) = %s\n',p.to_string);
    fprintf('q(x) = %s\n',q.to_string);
    fprintf('GCD(p(x),q(x)) = %s\n',res.to_string);

Class Sturm
-----------

build a Sturm sequence from a polynomial

  .. code-block:: matlab

    S = Sturm();
    S.build(p);
    S.print();

separate roots

  .. code-block:: matlab

    S.separate_roots(-10,10);
    S.print();

  .. code-block:: matlab

    x = -2:0.01:2;
    y = p.eval(x);
    plot(x,y);

refine roots

  .. code-block:: matlab

    S.refine_roots();
    S.print();
    p.eval(S.roots())

Reference
---------

- `en.wikipedia.org/wiki/Sturm%27s_theorem <https://en.wikipedia.org/wiki/Sturm%27s_theorem>`__
- `en.wikipedia.org/wiki/Jacques_Charles_François_Sturm <https://en.wikipedia.org/wiki/Jacques_Charles_François_Sturm>`__
- `lara.epfl.ch/w/_media/sar10/sturms_proof.pdf <https://lara.epfl.ch/w/_media/sar10/sturms_proof.pdf>`__
