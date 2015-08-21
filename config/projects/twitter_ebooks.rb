#
# Copyright 2015 YOUR NAME
#
# All Rights Reserved.
#

name "twitter_ebooks"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/twitter_ebooks on Windows
# and /opt/twitter_ebooks on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# twitter_ebooks dependencies/components
# dependency "somedep"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
