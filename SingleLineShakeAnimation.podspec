#
# Be sure to run `pod lib lint SingleLineKeyboardResize.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SingleLineShakeAnimation"
  s.version          = "0.0.1"
  s.summary          = "Shake a view with a single line of code with a non-intrusive extension for UIView, written in Swift."
  s.description      = <<-DESC
                      With this non-intrusive UIView extension, your UIView subclasses can get shaking with very little code.
                      Shaking can be useful to indicate an important action your user needs to perform, for example filling out a form before submitting.
                      Show the user it by gently shaking the needed view to get their attention.
                       DESC
  s.homepage         = "https://github.com/haaakon/SingleLineShakeAnimation"
  s.license          = 'MIT'
  s.author           = { "Hakon Bogen" => "hakon.bogen@gmail.com" }
  s.source           = { :git => "https://github.com/haaakon/SingleLineShakeAnimation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/_haaakon'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'UIView+Shake.swift'
  s.frameworks = 'UIKit'
end
