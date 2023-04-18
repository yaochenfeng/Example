platform :ios, '11.0'
ensure_bundler!
use_frameworks! :linkage => :static
inhibit_all_warnings! # 过滤忽略Pods依赖警告

def debug_pod #开发使用库
  pod 'DoraemonKit/WithLogger', :configurations => ['Debug'] #可选
  pod 'DoraemonKit/WithMLeaksFinder', :configurations => ['Debug'] #可选
end

target 'Example' do
  debug_pod
  pod 'RxCocoa'
end

post_install do |installer|
  # https://github.com/facebook/FBRetainCycleDetector/issues/96
  ## Fix for XCode 12.5
  find_and_replace("Pods/FBRetainCycleDetector/FBRetainCycleDetector/Layout/Classes/FBClassStrongLayout.mm",
      "layoutCache[currentClass] = ivars;", "layoutCache[(id<NSCopying>)currentClass] = ivars;")
   ## Fix for XCode 13.0
  find_and_replace("Pods/FBRetainCycleDetector/fishhook/fishhook.c",
        "indirect_symbol_bindings[i] = cur->rebindings[j].replacement;", "if (i < (sizeof(indirect_symbol_bindings) / sizeof(indirect_symbol_bindings[0]))) { \n indirect_symbol_bindings[i]=cur->rebindings[j].replacement; \n }")
  installer.pods_project.targets.each do |target|
      # Xcode14适配 https://juejin.cn/post/7143162564837376037
      if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
         target.build_configurations.each do |config|
             config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
         end
      end
  end
end

def find_and_replace(dir, findstr, replacestr)
  Dir[dir].each do |name|
      FileUtils.chmod("+w", name) #add
      text = File.read(name)
      replace = text.gsub(findstr,replacestr)
      if text != replace
          puts "Fix: " + name
          File.open(name, "w") { |file| file.puts replace }
          STDOUT.flush
      end
  end
  Dir[dir + '*/'].each(&method(:find_and_replace))
end
