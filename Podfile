
platform :ios, '10.0'
use_frameworks!

 workspace 'TemplateProject.xcworkspace'

# ignore all warnings from all pods
inhibit_all_warnings!

def common_pods
  pod 'Alamofire', '~> 4.8'
  pod 'netfox'
  pod 'Kingfisher', '~> 4.10'
end

target 'MVVM-Training' do
  common_pods
  project 'MVVM-Training/MVVM-Training.xcodeproj'
end

target 'NewFeature' do
  common_pods
  project 'NewFeature/NewFeature.xcodeproj'
end

target 'CoreProject' do
  common_pods
  project 'CoreProject/CoreProject.xcodeproj'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    # Workaround for CocoaPods issue: https://github.com/CocoaPods/CocoaPods/issues/7606
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
    
    # Do not need debug information for pods
    config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
    
    # Disable Code Coverage for Pods projects - only exclude ObjC pods
    config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
    config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = ['$(FRAMEWORK_SEARCH_PATHS)']
    
    config.build_settings['SWIFT_VERSION'] = '4.0'
  end
end
