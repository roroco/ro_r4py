require 'ro_file'
module ::RoHelper
  module Py
    module Helper
      attr_writer :py_pj

      def py_pj(*args, &blk)
        @py_pj ||= RoR4py.cur_parent
        RoFile.join @py_pj, *args, &blk
      end

      def format_py(py_file, *args, &blk)
        RoFile.gsub(py_file, %r{^[\n\s]+$}, "")
        r = bash "autopep8 #{py_file}"
        RoFile.write(py_file, r)
      end

      def py_pj_name(*args, &blk)
        fn = RoFile.filename(py_pj)
      end
    end
  end
end
