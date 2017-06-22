#
# Be sure to run `pod lib lint MinuteAnimations.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MinuteAnimations'
  s.version          = '0.0.1'
  s.summary          = 'Simple Animation sugar'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Simplfy animations with some sugar. This is a small library i personally use for my projets at my work.
                       DESC

  s.homepage         = 'https://github.com/LucaGobbo/MinuteAnimations'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luca Gobbo' => 'luca@me.com' }
  s.source           = { :git => 'https://github.com/LucaGobbo/MinuteAnimations.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lucagobbo'

  s.ios.deployment_target = '9.0'
  s.source_files = 'MinuteAnimations/Classes/**/*'
  s.frameworks = 'UIKit'

end
