require File.expand_path('../../../../conf/ro_r4py', __FILE__)
require 'ro_helper/py/helper'

module RoCell
  module Py
    class TestFileAttrs
      include ::RoHelper::Py::Helper
      include ::RoHelper::Misc

      def initialize(*args, &blk)
        set_opts(*args, &blk)
      end

      def test_helper(*args, &blk)
        "#{py_pj_name}.test_helper"
      end

      def ii
        ctn = RoFile.read match_file
        if py_kls?
          ii_ins
        else
          full_mod
        end
      end

      def py_kls?
        ctn = RoFile.read match_file
        ctn.match(%r{^class.*\:$})
      end


      def match_file
  @match_file ||= nil
      end

      def kls
        fn = RoFile.filename(match_file)
        fn.camelize
      end

      def mod(*args, &blk)
        fn = RoFile.filename(match_file)
      end

      def full_mod
        r = match_file.gsub("#{py_pj}/", "").gsub(%r{\.py$}, "").split("\/").hits.join(".")
        r
      end

      def kls(*args, &blk)
        mod.camelize
      end

      def ii_ins(*args, &blk)
        "#{kls}()"
      end
    end
  end
end
