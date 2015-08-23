#
# Copyright 2015 YOUR NAME
#
# All Rights Reserved.
#

name "twitter_ebooks"
maintainer "Josh Brand"
homepage "https://CHANGE-ME.com"

# Defaults to C:/twitter_ebooks on Windows
# and /opt/twitter_ebooks on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

if windows?
  # NOTE: Ruby DevKit fundamentally CANNOT be installed into "Program Files"
  #       Native gems will use gcc which will barf on files with spaces,
  #       which is only fixable if everyone in the world fixes their Makefiles
  install_dir  "#{default_root}/opscode/#{name}"
  package_name "chef-client"
else
  install_dir "#{default_root}/#{name}"
end

# Creates required build directories
dependency "preparation"

# twitter_ebooks dependencies/components
dependency "twitter_ebooks"
override :bundler,        version: "1.7.2"
override :ruby,           version: "2.1.6"
override :ncurses,        version: "5.9"

override :'ruby-windows', version: "2.0.0-p645"
override :rubygems,       version: "2.4.4"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

package :msi do
  upgrade_code "e494e359-d447-440f-800e-86d28d27d0bc"
end
