!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright 2019 National Technology & Engineering Solutions of Sandia, LLC (NTESS).
! Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains
! certain rights in this software.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! NOTICE:
! For five (5) years from 10/21/2019 the United States Government is granted for
! itself and others acting on its behalf a paid-up, nonexclusive, irrevocable worldwide
! license in this data to reproduce, prepare derivative works, and perform publicly and
! display publicly, by or on behalf of the Government. There is provision for the
! possible extension of the term of this license. Subsequent to that period or any
! extension granted, the United States Government is granted for itself and others
! acting on its behalf a paid-up, nonexclusive, irrevocable worldwide license in this
! data to reproduce, prepare derivative works, distribute copies to the public,
! perform publicly and display publicly, and to permit others to do so. The specific
! term of the license can be identified by inquiry made to National Technology and
! Engineering Solutions of Sandia, LLC or DOE. NEITHER THE UNITED STATES GOVERNMENT,
! NOR THE UNITED STATES DEPARTMENT OF ENERGY, NOR NATIONAL TECHNOLOGY AND ENGINEERING
! SOLUTIONS OF SANDIA, LLC, NOR ANY OF THEIR EMPLOYEES, MAKES ANY WARRANTY, EXPRESS OR
! IMPLIED, OR ASSUMES ANY LEGAL RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
! USEFULNESS OF ANY INFORMATION, APPARATUS, PRODUCT, OR PROCESS DISCLOSED, OR REPRESENTS
! THAT ITS USE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS. Any licensee of this software
! has the obligation and responsibility to abide by the applicable export control laws,
! regulations, and general prohibitions relating to the export of technical data.
! Failure to obtain an export control license or other authority from the Government
! may result in criminal liability under U.S. laws.
! (End of Notice)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
      SUBROUTINE SINQB (N,X,WSAVE)
      DIMENSION       X(*)       ,WSAVE(*)
      IF (N .GT. 1) GO TO 101
      X(1) = 4.*X(1)
      RETURN
  101 NS2 = N/2
      DO 102 K=2,N,2
         X(K) = -X(K)
  102 CONTINUE
      CALL COSQB (N,X,WSAVE)
      DO 103 K=1,NS2
         KC = N-K
         XHOLD = X(K)
         X(K) = X(KC+1)
         X(KC+1) = XHOLD
  103 CONTINUE
      RETURN
      END
