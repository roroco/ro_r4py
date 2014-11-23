require 'faraday'
require 'json'

module RoCell
  module Py
    class C
      def ivk(*args, &blk)
        if args.empty?
          args = ARGV.clone
        end

        cnn = Faraday.new

        params = {
            args: args.join(" "),
            load_paths: File.expand_path("../../..", __FILE__),
            cwd: Dir.pwd
        }

        rsp = cnn.get("http://localhost:#{port}/ro", params)
        r = JSON.load(rsp.body)
        if r['err']
          puts r['err']
          puts r['backtrace']
        else
          puts r['result']
          r['result']
        end
      end

      def port(*args, &blk)
        if ENV['RO_STAGE'] == 'test'
          23333
        else
          23300
        end
      end
    end
  end
end
