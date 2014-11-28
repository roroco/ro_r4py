require File.expand_path('../../../conf/ro_r4py', __FILE__)
require 'ro_cell/py/pl/sv'
module ::RoCmds
  class R4py < ::RoCmds::RoR4pyBase
    usg :rst_pl_sv

    def rst_pl_sv(*args, &blk)
      ::RoCell::Py::Pl::Sv.new.rst
    end
  end
end
