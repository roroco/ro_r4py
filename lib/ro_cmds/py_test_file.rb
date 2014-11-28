require File.expand_path('../../../conf/ro_r4py', __FILE__)
require 'ro_cmds/py_test_file'
require 'ro_helper/py/helper'
require 'ro_cell/py/test_file_attrs'

module RoCmds
  class PyTestFile < ::RoCmds::TestFile
    include ::RoHelper::Py::Helper

    def format_file(*args, &blk)
      Out.status("format", args.join(" "))
      format_py(*args, &blk)
    end

    def test_file
  @test_file ||= lambda do
        @parent_basename_sc, @basename_sc = parent_basename_and_basename(path_scs)

        r = match_file.gsub(py_pj, "").prefix(py_pj("tests")).gsub(%r{\/([^\/]+)$}) do
          "/test_#{$~[1]}"
        end
        r
      end.call
    end

    def append_ctn_if_matches_conditions(*args, &blk)
      "pass"
    end

    def test_file_attrs
  @test_file_attrs ||= ::RoCell::Py::TestFileAttrs.new(match_file: match_file)
    end

    def test_tt_path(*args, &blk)
      RoR4py.tt("py/test")
    end

    def match_file
      is_py = lambda do |file|
        file.match(%r{\.py$})
      end

      in_pkg = lambda do |file|
        file.match(py_pj_name)
      end

      ff(py_pj, is_py, in_pkg).each do |f|
        parent_basename, basename = parent_basename_and_basename(f)
        if parent_basename.implicit_match(parent_basename_sc) and basename.implicit_match(basename_sc)
          return f
        end
      end

      raise ::RoErr::NotFound, "not find match file with path_sc: #{path_scs} in #{py_pj}"
    end

attr_accessor :parent_basename_sc

attr_accessor :basename_sc

  end
end
