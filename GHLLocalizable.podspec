Pod::Spec.new do |s|
s.name         = "GHLLocalizable"
s.summary      = "For international control."
s.version      = "0.0.1"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "gonghonglou" => "gonghonglou@gmail.com" }
s.social_media_url = 'http://gonghonglou.com'
s.homepage     = "https://github.com/gonghonglou/GHLLocalizable"
s.platform     = :ios, '8.0'
s.ios.deployment_target = '8.0'
s.source       = { :git => "https://github.com/gonghonglou/GHLLocalizable.git", :tag => s.version.to_s }

s.requires_arc = true
s.source_files = 'GHLLocalizable/*.{h,m}'
s.public_header_files = 'GHLLocalizable/*.{h}'

end
