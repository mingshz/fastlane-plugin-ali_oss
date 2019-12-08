require 'aliyun/oss'

module Fastlane
  module Actions
    class AliOssAction < Action
      def self.run(params)
        client = Aliyun::OSS::Client.new(
          endpoint: params[:endpoint],
          access_key_id: params[:accessKey], access_key_secret: params[:accessSecret])
        
        bucket = client.get_bucket(params[:bucket])
        UI.message("uploadding file into OSS(as #{params[:path]})...")
        bucket.put_object(params[:path], :file => params[:localFile])
      
        # print(params)
        UI.success("putted into OSS successful.")
      end

      def self.description
        "plugin to update files to OSS(aliyun)."
      end

      def self.authors
        ["Cai Jiang"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Enjoy it!"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :endpoint,
            env_name: "ALIYUN_OSS_ENDPOINT",
            description: "endPoint of OSS",
            optional: false,
            type: String),
          FastlaneCore::ConfigItem.new(key: :accessKey,
            env_name: "ALIYUN_ACCESS_KEY",
            description: "accessKey of aliyun",
            optional: false,
            type: String),
          FastlaneCore::ConfigItem.new(key: :accessSecret,
            env_name: "ALIYUN_ACCESS_SECRET",
            description: "accessSecret of aliyun",
            optional: false,
            type: String),
          FastlaneCore::ConfigItem.new(key: :bucket,
            env_name: "ALIYUN_OSS_BUCKET",
            description: "bucket of OSS",
            optional: false,
            type: String),
          FastlaneCore::ConfigItem.new(key: :path,
            env_name: "ALIYUN_OSS_PATH",
            description: "object path of OSS",
            optional: false,
            type: String),
          FastlaneCore::ConfigItem.new(key: :localFile,
            env_name: "ALIYUN_OSS_LOCALFILE",
            description: "local file that wanna be upload",
            optional: false,
            type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
