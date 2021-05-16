#
# Be sure to run `pod lib lint AwesomeTooltip.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AwesomeTooltip'
  s.version          = '0.1.0'
  s.summary          = 'Animated popover view controller tooltip, nice feature for tips and onboarding purposes.'

  s.description      = <<-DESC
                        Animated highlightable tooltip view controller. There is an option to specify which views
                        to highlight and how tooltip should look like. Custom view can be used as a tip view.
                        Also, tooltip can be set up in various ways configuring direction, size and etc.
                       DESC

  s.homepage         = 'https://github.com/alimsanzhar/AwesomeTooltip'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sanzhar Alim' => 'sanzhar.alim19@gmail.com' }
  s.source           = { :git => 'https://github.com/alimsanzhar/AwesomeTooltip.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'AwesomeTooltip/Classes/**/*'
  s.swift_version = '4.0'
  
  s.resource_bundles = {
    'AwesomeTooltip' => ['AwesomeTooltip/**/*.xib']
  }

  s.dependency 'AMPopTip', '3.3.0'
end
