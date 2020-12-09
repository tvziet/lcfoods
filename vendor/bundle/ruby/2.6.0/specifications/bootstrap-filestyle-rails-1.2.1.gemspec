# -*- encoding: utf-8 -*-
# stub: bootstrap-filestyle-rails 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-filestyle-rails".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mauricio Pasquier Juan".freeze]
  s.date = "2016-05-30"
  s.description = "Bootstrap Filestyle (gem version reflects assets\n                          version) packaged for rails".freeze
  s.email = ["mauricio@pasquierjuan.com.ar".freeze]
  s.homepage = "https://github.com/mauriciopasquier/bootstrap-filestyle-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Bootstrap Filestyle for the asset pipeline".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
