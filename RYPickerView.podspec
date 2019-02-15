Pod::Spec.new do |s|
  s.name             = "RYPickerView"
  s.version          = "1.0.2"
  s.summary          = "Customized date and text picker component."
  s.description      = <<-DESC
                       Customized date and text picker component, which implemented with Swift.
                       DESC
  s.homepage         = "https://github.com/sudotamm/RYPickerView.git"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "sudotamm" => "sudotamm@hotmail.com" }
  s.source           = { :git => "https://github.com/sudotamm/RYPickerView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '8.0'
  # s.ios.deployment_target = '8.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'RootDirectory/Utilities/RYCommonViews/RYPickerView/*.{swift}'
  s.resources = 'RootDirectory/Utilities/RYCommonViews/RYPickerView/*.{xcassets,xib}'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'QuartzCore', 'AssetsLibrary', 'CoreLocation','Accelerate','CoreImage'

end
