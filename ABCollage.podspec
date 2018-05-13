#
# Be sure to run `pod lib lint ABCollage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ABCollage'
  s.version          = '0.1.0'
  s.summary          = 'Custom view with 2 dimensional array of image views'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A custom view which helps users to create a view with multiple image views that are positioned as in a two dimensional array.
                       DESC

  s.homepage         = 'https://github.com/andreasbagias/ABCollage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andreas Bagias' => 'andreasbagias@gmail.com' }
  s.source           = { :git => 'https://github.com/andreasbagias/ABCollage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.1' }
  
  s.source_files = 'ABCollage/Classes/**/*'
  # s.source_files = 'ABCollage/*.swift'
  
  # s.resource_bundles = {
  #   'ABCollage' => ['ABCollage/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SKPhotoBrowser'
  
end
