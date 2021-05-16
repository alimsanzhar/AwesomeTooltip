Pod::Spec.new do |s|
  s.name             = 'AwesomeTooltip'
  s.version          = '0.1.2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'Animated popover view controller tooltip, nice feature for tips and onboarding purposes.'
  s.homepage         = 'https://github.com/alimsanzhar/AwesomeTooltip'
  s.author           = { 'Sanzhar Alim' => 'sanzhar.alim19@gmail.com' }
  s.source           = { :git => 'https://github.com/alimsanzhar/AwesomeTooltip.git', :tag => 'v0.1.2' }
  s.source_files = 'AwesomeTooltip/Classes/**/*'
  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  s.dependency 'AMPopTip', '3.3.0'
  
  s.resource_bundles = {
    'AwesomeTooltip' => ['AwesomeTooltip/**/*.xib']
  }
end
