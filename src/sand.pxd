# -*- coding: utf-8 -*-
# cython: profile=True

from __future__ import division

cimport numpy as np


cdef class Sand:

  cdef int w
  cdef int h
  cdef int stride
  cdef double one
  cdef double rA
  cdef double gA
  cdef double bA
  cdef double aA
  cdef size_t size

  cdef unsigned char[:] pixels
  cdef double[:] raw_pixels

  cdef readonly sur
  cdef ctx

  cdef void _operator_over(self, int) nogil
  cdef void _operator_over_mix(self, int, int) nogil
  cdef void _operator_swap(self, int, int) nogil

  cpdef void set_bg(self, list)
  cpdef void set_bg_from_image(self, str)
  cpdef void set_rgba(self, list)

  cpdef void paint_dots(self, double[:,:])
  cpdef void distort_dots(self, double[:,:] xya)
  cpdef void paint_strokes(self, double[:,:], double[:,:], int)

  cpdef write_to_png(self, str)

