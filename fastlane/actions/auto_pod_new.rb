module Fastlane
  module Actions
    module SharedValues
      AUTO_POD_NAME = :AUTO_POD_NAME
      AUTO_POD_REPO = :AUTO_POD_REPO
    end

    class AutoPodNewAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        UI.message "pod name: #{params[:pod_name]}"
        pod_repo = params[:pod_repo]
        UI.message "pod 使用私有源仓库: #{pod_repo}"
        
        if pod_repo
          Actions.lane_context[SharedValues::AUTO_POD_REPO] = pod_repo
          
        end
        self.changePodfile()
        # command = []
        # result = Actions.sh(command.join(' '))
        UI.success("Successfully new pod ⬆️ ")
        # return result
      end
      # podfile文件替换
      def self.changePodfile()
        podfile = 'Podfile'
        #替换
        if File.exist?(podfile) == false
          UI.message "podfie 不存在"
          return
        end
        content = File.readlines podfile
      end
      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "pod 模板生成文件处理"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :pod_name,
                                       env_name: "AUTO_POD_NAME", # The name of the environment variable
                                       description: "pod名称", # a short description of this parameter
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :pod_repo,
                                       env_name: "AUTO_POD_REPO", # The name of the environment variable
                                       description: "pod私有repo仓库,不使用空", # a short description of this parameter
                                       is_string: true)
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['AUTO_POD_NAME', 'pod名称']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["yaochenfeng"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
