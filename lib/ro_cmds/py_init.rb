module ::RoCmds
  class PyInit < ::RoCmds::RoR4pyBase
    usg :py2

    def py2(*args, &blk)

    end

    usg :p4a

    def p4a(*args, &blk)
      adsdk = "/home/roroco/Downloads/android-sdk-linux/"
      envs = {
          ANDROIDSDK: adsdk,
          ANDROIDNDK: "/home/roroco/Downloads/android-ndk-r10c",
          ANDROIDNDKVER: "r10c",
          ANDROIDAPI: "23",
          PATH: "#{ENV["PATH"]}:#{adsdk}/platform-tools:#{adsdk}/tools"
      }

      envs_str = envs.map do |k, v|
        "#{k}=#{v}"
      end.join(" ")

      Dir.chdir("/home/roroco/Dropbox/pys/compass")
      bash "#{envs_str} /home/roroco/Dropbox/pys/python-for-android/distribute.sh -m kivy"
    end
  end
end
