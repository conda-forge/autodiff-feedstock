// C++ includes
#include <cmath>
#include <cassert>

// autodiff includes
#include <autodiff/forward/dual.hpp>
using namespace autodiff;

dual f(dual x)
{
    return x*x;
}

int main()
{
    dual x = 2.0;
    dual u = f(x);

    double dudx = derivative(f, wrt(x), at(x));

    assert(std::abs(dudx - 4.0) < 1e-14);
}
