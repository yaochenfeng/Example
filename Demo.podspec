#
# Be sure to run `pod lib lint WBTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Demo'
    s.version = "0.1.0"
    s.summary = "#{s.name}"
  
    s.description = <<-DESC
    Demo
  DESC
  
    s.homepage = "https://github.com/yaochenfeng/#{s.name}"
    s.source           = { :git => "https://github.com/yaochenfeng/#{s.name}.git", :tag => s.version.to_s }
    s.license = {
      :type => "MIT",
      :text => <<-LICENSE,
  copyright MIT
  LICENSE
    }
    s.author = { "yaochenfeng" => "chenfengyao@foxmail.com" }
    s.platform = :ios, "11.0"
    s.swift_version = "5.4"
    s.source_files = "Sources/#{s.name}/**/*.swift"
    s.dependency "RXKit"
  end  