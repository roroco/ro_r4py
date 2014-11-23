require 'pj_helper'

module RoR4py
	extend PjHelper
	class << self

		attr_accessor :root

		def root(*args, &blk)
			File.join(File.expand_path("../..", __FILE__), *args, &blk)
    end
	end

	require_parts
end

$LOAD_PATH.unshift ::RoR4py.lib
$LOAD_PATH.unshift ::RoR4py.root

