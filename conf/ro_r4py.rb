require 'pj_helper'

module RoR4py
	extend PjHelper
	class << self
		def rt(*args, &blk)
			File.join(File.expand_path("../..", __FILE__), *args, &blk)
    end
	end
end

$LOAD_PATH.unshift ::RoR4py.lib
$LOAD_PATH.unshift ::RoR4py.rt

