# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mh_extensions"
  s.version = "0.1.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maciej Mensfeld"]
  s.date = "2012-03-02"
  s.description = "Package of usefull ruby basic classes (and not only) extensions"
  s.email = "maciej@mensfeld.pl"
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.md", "lib/activerecord_ext.rb", "lib/acts_as_tree_ext.rb", "lib/array.rb", "lib/browser_detector.rb", "lib/date_ext.rb", "lib/hash.rb", "lib/mh_extensions.rb", "lib/rand.rb", "lib/range.rb", "lib/string.rb", "lib/txt_file_handler.rb"]
  s.files = ["CHANGELOG.rdoc", "Gemfile", "MIT-LICENSE", "Manifest", "README.md", "Rakefile", "init.rb", "lib/activerecord_ext.rb", "lib/acts_as_tree_ext.rb", "lib/array.rb", "lib/browser_detector.rb", "lib/date_ext.rb", "lib/hash.rb", "lib/mh_extensions.rb", "lib/rand.rb", "lib/range.rb", "lib/string.rb", "lib/txt_file_handler.rb", "mh_extensions.gemspec"]
  s.homepage = "https://github.com/mensfeld/MH-Extensions"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Mh_extensions", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "mh_extensions"
  s.rubygems_version = "1.8.15"
  s.summary = "Package of usefull ruby basic classes (and not only) extensions"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<babosa>, [">= 0"])
    else
      s.add_dependency(%q<babosa>, [">= 0"])
    end
  else
    s.add_dependency(%q<babosa>, [">= 0"])
  end
end
