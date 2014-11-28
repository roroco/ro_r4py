require File.expand_path('../../../conf/ro_r4py', __FILE__)
require 'ro_cmds/rbs'
module ::RoCmds
  class Pys < ::RoCmds::Rbs
    usg :dir

    def dir(*args, &blk)
      RoR4py.pys(*args, &blk)
    end

    def aliases(*args, &blk)
      {
          rol: 'ro_cmds_light',
          rp: 'ro_plan'
      }
    end
  end
end
