#####################################################################################
# Copyright 2019 National Technology & Engineering Solutions of Sandia, LLC (NTESS).
# Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains
# certain rights in this software.
#####################################################################################
# NOTICE:
# For five (5) years from 10/21/2019 the United States Government is granted for
# itself and others acting on its behalf a paid-up, nonexclusive, irrevocable worldwide
# license in this data to reproduce, prepare derivative works, and perform publicly and
# display publicly, by or on behalf of the Government. There is provision for the
# possible extension of the term of this license. Subsequent to that period or any
# extension granted, the United States Government is granted for itself and others
# acting on its behalf a paid-up, nonexclusive, irrevocable worldwide license in this
# data to reproduce, prepare derivative works, distribute copies to the public,
# perform publicly and display publicly, and to permit others to do so. The specific
# term of the license can be identified by inquiry made to National Technology and
# Engineering Solutions of Sandia, LLC or DOE. NEITHER THE UNITED STATES GOVERNMENT,
# NOR THE UNITED STATES DEPARTMENT OF ENERGY, NOR NATIONAL TECHNOLOGY AND ENGINEERING
# SOLUTIONS OF SANDIA, LLC, NOR ANY OF THEIR EMPLOYEES, MAKES ANY WARRANTY, EXPRESS OR
# IMPLIED, OR ASSUMES ANY LEGAL RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
# USEFULNESS OF ANY INFORMATION, APPARATUS, PRODUCT, OR PROCESS DISCLOSED, OR REPRESENTS
# THAT ITS USE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS. Any licensee of this software
# has the obligation and responsibility to abide by the applicable export control laws,
# regulations, and general prohibitions relating to the export of technical data.
# Failure to obtain an export control license or other authority from the Government
# may result in criminal liability under U.S. laws.
# (End of Notice)
####################################################################################

from obspy.core.utcdatetime import UTCDateTime
import pytest

from pycheron.sigpro.STALTA import STALTA
from pycheron.sigpro.triggerOnset import triggerOnset


@pytest.fixture(scope="module")
def default_STALTA(file_assets):
    test_trace = file_assets["test_trace"]
    STALTA_first_break_picking_results = STALTA(test_trace)
    return STALTA_first_break_picking_results


def test_trigger_onset_detects_event_start_time(file_assets, default_STALTA):
    test_trace = file_assets["test_trace"]
    result = triggerOnset(test_trace, default_STALTA)
    assert isinstance(result, UTCDateTime)

    expected_start_of_earthquake = UTCDateTime("2010-02-27T07:22:26.169538Z")
    assert expected_start_of_earthquake == result


def test_trigger_onset_detects_event_start_index(file_assets, default_STALTA):
    test_trace = file_assets["test_trace"]
    result = triggerOnset(test_trace, default_STALTA, index=True)
    assert isinstance(result, int)

    expected_start_of_earthquake_index = 98923
    assert expected_start_of_earthquake_index == result
