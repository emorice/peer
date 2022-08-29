%module peer

%{
#define SWIG_FILE_WITH_INIT
#define SWIG
#include "vbfa.h"
#include "sparsefa.h"
using namespace PEER;
%}


/* typemaps and typemap generators from the numpy project */
%include "numpy.i"

/* define typemaps for custom float64_t array item type and int32_t dimension
 * type, as numpy.i uses double with int and swig does not know that these are
 * actually the same types at this point
 */
%numpy_typemaps(float64_t, NPY_DOUBLE, int32_t)

%init %{
  import_array();
%}

// typemap for matrix arguments
%apply (float64_t* IN_ARRAY2, int32_t DIM1, int32_t DIM2) {(float64_t* matrix, int32_t rows, int32_t cols)};


// typemap for return matrix arguments
%apply (float64_t** ARGOUTVIEWM_ARRAY2, int32_t* DIM1, int32_t* DIM2) {(float64_t** matrix, int32_t* rows, int32_t* cols)};


/* Remove C Prefix */
%rename(VBFA) cVBFA;
%rename(PEER) cSPARSEFA;

/* Include the header file to be wrapped */
%include "sparsefa.i"



 
