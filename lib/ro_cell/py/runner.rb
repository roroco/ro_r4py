ENV['BUNDLE_GEMFILE'] = File.expand_path("../../../../Gemfile", __FILE__)
require 'bundler'
Bundler.setup
require File.expand_path('../../../../conf/ro_r4py', __FILE__)
require "ro_cmds_runner"

module ::RoCell
  module Py
    class Runner < ::RoCmdsRunner
      def load_ro_cmds(ins_name, *args, &blk)
        begin
          super
        rescue LoadError => e
          load ::RoR4py.lib("ro_cmds/#{ins_name}.rb")
        end
      end
    end
  end
end

