# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mh_extensions}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maciej Mensfeld"]
  s.date = %q{2011-04-10}
  s.description = %q{Package of usefull ruby basic classes (and not only) extensions}
  s.email = %q{maciej@mensfeld.pl}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.md", "lib/acts_as_tree_ext.rb", "lib/array.rb", "lib/browser_detector.rb", "lib/date.rb", "lib/hash.rb", "lib/mh_extensions.rb", "lib/rand.rb", "lib/range.rb", "lib/string.rb", "lib/string_ext.rb", "lib/txt_file_handler.rb"]
  s.files = ["CHANGELOG.rdoc", "Gemfile", "MIT-LICENSE", "README.md", "Rakefile", "init.rb", "lib/acts_as_tree_ext.rb", "lib/array.rb", "lib/browser_detector.rb", "lib/date.rb", "lib/hash.rb", "lib/mh_extensions.rb", "lib/rand.rb", "lib/range.rb", "lib/string.rb", "lib/string_ext.rb", "lib/txt_file_handler.rb", "Manifest", "mh_extensions.gemspec"]
  s.homepage = %q{https://github.com/mensfeld/mh_extensions}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Mh_extensions", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{mh_extensions}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Package of usefull ruby basic classes (and not only) extensions}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
