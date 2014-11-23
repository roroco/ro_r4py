require File.expand_path('../../conf/ro_r4py.rb', __FILE__)

module RoR4py
  autoload_or_require_all_ro_dirs
  require_all 'ro_cell/py'
end
