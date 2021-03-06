from path import path

from clld.tests.util import TestWithApp

import dogonlanguages


class Tests(TestWithApp):
    __cfg__ = path(dogonlanguages.__file__).dirname().joinpath('..', 'development.ini').abspath()
    __setup_db__ = False

    def test_home(self):
        self.app.get('/')
        self.app.get_dt('/contributors')
        self.app.get_dt('/parameters')
        self.app.get_dt('/values')
        self.app.get_dt('/languages')
        self.app.get_dt('/sources')
        self.app.get('/contributors')
        self.app.get('/parameters')
        self.app.get('/values')
        self.app.get('/languages')
        self.app.get('/sources')
        self.app.get_html('/parameters/201-10-15')
        self.app.get_html('/parameters/201-10-10')
        self.app.get_html('/parameters/10-10-2')
        self.app.get_json('/parameters/10-10-2.geojson')
