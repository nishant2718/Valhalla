Pod::Spec.new do |spec|
  spec.name         = "Valhalla"
  spec.version      = "0.1"
  spec.summary      = "A simple dependency injection framework, for learning purposes."
  spec.homepage     = "https://github.com/nishant2718/Valhalla"
  spec.license      = "MIT"
  spec.author       = { "Nishant Patel" }
  spec.ios.deployment_target = "12.0"
  spec.tvos.deployment_target = "12.0"
  spec.source       = { :git => "https://github.com/nishant2718/Valhalla.git", :tag => "#{spec.version}" }
  spec.source_files = 'Classes/**/*.swift'
end
