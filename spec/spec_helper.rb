require 'rubygems'
require 'spork'

Spork.prefork do
	require File.expand_path("../../conf/ro_r4py", __FILE__)
	require 'pj'
  Pj.set_test

	require 'ro_rspec_helpers_plus'

	RoRspec.spec = __dir__
	require "lib/ro_r4py"
end

