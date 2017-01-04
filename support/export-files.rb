#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

begin
  DOTFILES_PATH = ENV.fetch('DOTFILES_PATH')
rescue
  raise "Can't find DOTFILES_PATH"
end

preserve_conflicted_files = ENV.fetch('PRESERVE_CONFLICTED_FILES', false)

invalid_paths = %w(.git ./support).freeze
paths = Dir["#{DOTFILES_PATH}/*"]
  .select! { |path| File.directory?(path) && !invalid_paths.include?(path) }

def handle_conflicts(path)
  conflicts = Dir.glob("#{File.expand_path(path)}/*", File::FNM_DOTMATCH)
    .reject { |file| file =~ /\.{1,2}$/ }
    .select { |file| File.file?(file) }
    .select { |file| File.exists?("#{ENV["HOME"]}/#{File.basename(file)}") }

  conflicts.each do |file|
    FileUtils.cp_r(file, "#{file}.backup",
      preserve: true,
      verbose: true)
  end
end

paths.each do |path|
  handle_conflicts(path) if preserve_conflicted_files

  FileUtils.cp_r("#{path}/.", ENV["HOME"],
    preserve: true,
    verbose: true)
end
