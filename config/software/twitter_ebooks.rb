name "twitter_ebooks"
default_version "master"

source git: "git://github.com/mispy/twitter_ebooks.git"

if windows?
  dependency "ruby-windows"
  dependency "ruby-windows-devkit"
else
  dependency "ruby"
  dependency "rubygems"
end

dependency "bundler"
dependency "appbundler"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle "install --without development", env: env

  gem "build twitter_ebooks.gemspec", env: env
  gem "install twitter_ebooks*.gem" \
      " --bindir '#{install_dir}/bin'" \
      " --no-ri" \
      " --no-rdoc", env: env

  appbundle 'twitter_ebooks'
end

