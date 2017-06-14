

Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

s.name         = "FPProgressHUD"
s.version      = "0.0.2"
s.summary      = "A short description of FPProgressHUD."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description  = <<-DESC
A simple loading animation Support multiple dot animation
DESC

s.homepage     = "https://github.com/Friendpeng/FPProgressHUD"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author             = { "杨朋" => "yangpeng_ios@163.com" }


s.platform     = :ios, "8.0"


s.ios.deployment_target = "8.0"


s.source       = { :git => "https://github.com/Friendpeng/FPProgressHUD.git", :tag => "0.0.2" }

s.source_files  = "FPProgressHUDDemo/FPProgressHUD/Classes/*"

#s.public_header_files = "FPProgressHUDDemo/FPProgressHUD/*.h"

s.requires_arc = true


end
