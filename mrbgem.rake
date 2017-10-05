MRuby::Gem::Specification.new('mruby-plato-sensor-ADT7410') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Plato developers'
  spec.description = 'PlatoDevice::ADT7410 class (ADT7410 - temperature digital sensor)'

  spec.add_dependency('mruby-plato-i2c')
  spec.add_dependency('mruby-plato-sensor')
end
