require File.expand_path("../../../conf/ro_r4py", __FILE__)
require 'ro_cell/py/rb'
require_relative 'py_test_file'
require 'ro_cmds/gen'
require 'ro_helper/py/helper'

module RoCmds
  class PyGen < Gen
    include ::RoHelper::Py::Helper

    usg :test_file

    def test_file(*args, &blk)
      test_helper
      ::RoCmds::PyTestFile.new.create(*args, &blk)
    end

    usg :test_helper

    def test_helper(*args, &blk)
      tt('py/test_helper', py_pj(py_pj_name, 'test_helper.py'))
    end

    def rb(*args, &blk)
      old_wd = ro_path RoR4py.cur_rt
      ::RoCell::Py::Rb.new.st('rb')
    end

    usg :setup

    def setup(to=nil, *args, &blk)
      to ||= py_pj("setup.py")
      tt_force('setup', to)
      format_py(to)
    end

    def tt_dirs
      [RoR4py.lib("tts")]
    end
  end
end
