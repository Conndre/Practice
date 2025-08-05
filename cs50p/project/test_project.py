import pytest
from project import calc_vldl
from project import calc_ldl
from project import calc_non_hdl
from project import calc_cholesterol_hdl_ratio
from project import calc_ldl_hdl_ratio
from project import calc_triglycerides_hdl_ratio


def test_calc_vldl():
    assert calc_vldl(150) == 30


def test_calc_vldl():
    assert calc_vldl(150) == 30
    assert calc_vldl(100) == 20


def test_calc_ldl():
    assert calc_ldl(200, 50, 150) == 120
    assert calc_ldl(250, 40, 100) == 190


def test_calc_non_hdl():
    assert calc_non_hdl(250, 50) == 200
    assert calc_non_hdl(200, 60) == 140


def test_calc_cholesterol_hdl_ratio():
    assert calc_cholesterol_hdl_ratio(250, 60) == 4.2
    assert calc_cholesterol_hdl_ratio(200, 52) == 3.8


def test_calc_ldl_hdl_ratio():
    assert calc_ldl_hdl_ratio(200, 60) == 3.3
    assert calc_ldl_hdl_ratio(128, 52) == 2.5


def test_calc_triglycerides_hdl_ratio():
    assert calc_triglycerides_hdl_ratio(150, 60) == 2.5
    assert calc_triglycerides_hdl_ratio(100, 52) == 1.9
