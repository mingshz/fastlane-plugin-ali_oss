module Fastlane
  module Helper
    class AliOssHelper
      # class methods that you define here become available in your action
      # as `Helper::AliOssHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the ali_oss plugin helper!")
      end
    end
  end
end
