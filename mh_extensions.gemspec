# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mh_extensions}
  s.version = "0.1.5.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Maciej Mensfeld}]
  s.date = %q{2011-08-14}
  s.description = %q{Package of usefull ruby basic classes (and not only) extensions}
  s.email = %q{maciej@mensfeld.pl}
  s.extra_rdoc_files = [%q{CHANGELOG.rdoc}, %q{README.md}, %q{lib/activerecord_ext.rb}, %q{lib/acts_as_tree_ext.rb}, %q{lib/array.rb}, %q{lib/browser_detector.rb}, %q{lib/date_ext.rb}, %q{lib/hash.rb}, %q{lib/mh_extensions.rb}, %q{lib/rand.rb}, %q{lib/range.rb}, %q{lib/string.rb}, %q{lib/txt_file_handler.rb}]
  s.files = [%q{CHANGELOG.rdoc}, %q{Gemfile}, %q{MIT-LICENSE}, %q{Manifest}, %q{README.md}, %q{Rakefile}, %q{init.rb}, %q{lib/activerecord_ext.rb}, %q{lib/acts_as_tree_ext.rb}, %q{lib/array.rb}, %q{lib/browser_detector.rb}, %q{lib/date_ext.rb}, %q{lib/hash.rb}, %q{lib/mh_extensions.rb}, %q{lib/rand.rb}, %q{lib/range.rb}, %q{lib/string.rb}, %q{lib/txt_file_handler.rb}, %q{mh_extensions.gemspec}]
  s.homepage = %q{https://github.com/mensfeld/MH-Extensions}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Mh_extensions}, %q{--main}, %q{README.md}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{mh_extensions}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Package of usefull ruby basic classes (and not only) extensions}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
