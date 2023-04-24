module Fastlane
  module Actions
    module SharedValues
      AUTO_POD_BIN_CUSTOM_VALUE = :AUTO_POD_BIN_CUSTOM_VALUE
    end

    class AutoPodBinAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        UI.message "Parameter API Token: #{params[:pod_name]}"

        # sh "shellcommand ./path"

        # Actions.lane_context[SharedValues::AUTO_POD_BIN_CUSTOM_VALUE] = "my_val"
        command = []
        command << 'xcodebuild'
        command << 'clean build'
        command << "-target #{params[:pod_name]}"
        command << "-project Pods/Pods.xcodeproj"
        result = Actions.sh(command.join(' '))
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "自动处理pod二进制化"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :pod_name,
                                       env_name: "AUTO_POD_NAME", # The name of the environment variable
                                       description: "二进制化pod名称", # a short description of this parameter
                                       verify_block: proc do |value|
                                          UI.user_error!("pod 名称 `pod_name: 'name'`") unless (value and not value.empty?)
                                          # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end)
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['AUTO_POD_BIN_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?(platform)
        # you can do things like
        #
        #  true
        #
        #  platform == :ios
        #
        #  [:ios, :mac].include?(platform)
        #

        platform == :ios
      end
    end
  end
end
