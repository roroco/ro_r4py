source 'https://rubygems.org'

%w(ro_cmds ro_cmds_plus ro_rmt ro_rmt_plus ro_pl ro_pl2 ro_listen spork ro_crawler ro_sinatra).each do |a_gem|
  if Dir.exist?("/home/roroco")
    gem a_gem, path: File.join("/home/roroco", 'Dropbox/rbs', a_gem), require: false
  else
    gem a_gem, git: "http://github.com/roroco/#{a_gem}.git", require: false, branch: :master
  end
end
