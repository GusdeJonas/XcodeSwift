# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'OddbitBootcamp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OddbitBootcamp
  pod 'SDWebImage', '~>3.8'
  pod 'SwiftyJSON', :git => "https://github.com/SwiftyJSON/SwiftyJson.git", :branch => 'master'
  pod 'Alamofire', '~>4.1.0'

  target 'OddbitBootcampTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OddbitBootcampUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end



post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
