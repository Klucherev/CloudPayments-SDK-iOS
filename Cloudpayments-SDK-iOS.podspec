#
#  Be sure to run `pod spec lint SDK-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "Cloudpayments"
  spec.version      = "1.3.3"
  spec.summary      = "Core library that allows you to use internet acquiring from CloudPayments in your app"
  spec.description  = "Core library that allows you to use internet acquiring from CloudPayments in your app!"

  spec.homepage     = "https://cp.ru/"

  spec.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }

  spec.author       = { "Anton Ignatov" => "a.ignatov@cp.ru" }
	
  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/Klucherev/CloudPayments-SDK-iOS.git", :tag => "#{spec.version}" }
  spec.source_files  = 'sdk/Sources/**/*.swift'

  spec.resource_bundles = { 'CloudpaymentsSDK' => ['sdk/Resources/**/*.{txt,json,png,jpeg,jpg,storyboard,xib,xcassets}']} 
  
  spec.requires_arc = true

  spec.dependency 'CloudpaymentsNetworking'  
  spec.dependency 'YandexLoginSDK'
  spec.dependency 'YandexPaySDK/Dynamic', '~>1.3.9'

  spec.swift_version = '5.0'

end
