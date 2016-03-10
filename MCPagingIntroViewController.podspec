#
# Be sure to run `pod lib lint MCPagingIntroViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MCPagingIntroViewController"
  s.version          = "0.1.0"
  s.summary          = "Animated paging intro view controller for app intro screens"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "Animated paging intro viewcontroller for iOS app intro screens built on Swift"

  s.homepage         = "https://github.com/mohonish/MCPagingIntroViewController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mohonish Chakraborty" => "mohonish.c@gmail.com" }
  s.source           = { :git => "https://github.com/mohonish/MCPagingIntroViewController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/mohonishc'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MCPagingIntroViewController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
