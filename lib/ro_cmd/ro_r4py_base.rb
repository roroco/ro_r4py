require 'ro_cmd/cmds_plus_base'

require File.expand_path('../../../conf/ro_r4py', __FILE__)

module ::RoCmd
	class RoR4pyBase < CmdsPlusBase

		protected

		def tt(from, to=nil)
			tt_path = File.join(::RoR4py.lib, 'tts')
			ctn = ::RoFile.read(File.join(tt_path, "#{from}.erb"))
			result = ERB.new(ctn).result(binding)
			if to.nil?
				return result
			else
				if opts[:force]
					::RoFile.write(to, result)
				else
					unless File.exist?(to)
						::RoFile.write(to, result)
					end
				end
				RoFile.prefix(to, Dir.pwd)
			end
		end
	end
end
