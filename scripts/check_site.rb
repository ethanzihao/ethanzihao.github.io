# Run after `bundle exec jekyll build`. Uses Ruby's standard library only.
require 'rexml/document'
require 'uri'

root = File.expand_path('../_site', __dir__)
abort 'Build the site first: bundle exec jekyll build' unless File.directory?(root)
errors = []
html_files = Dir.glob(File.join(root, '**', '*.html'))
html_files.each do |file|
  html = File.read(file)
  errors << "Unrendered Liquid: #{file}" if html.match?(/\{%|\{\{/)
  errors << "Missing page title: #{file}" unless html.match?(/<title>.+?<\/title>/m)
  html.scan(/(?:href|src)="([^"]*)"/).flatten.each do |value|
    next if value.empty? || value.start_with?('#', '//') || value.match?(/\A[a-z][a-z0-9+.-]*:/i)
    path = URI::DEFAULT_PARSER.unescape(value.split(/[?#]/).first)
    target = path.start_with?('/') ? File.join(root, path) : File.expand_path(path, File.dirname(file))
    target = File.join(target, 'index.html') if File.directory?(target)
    errors << "Broken link in #{file}: #{value}" unless File.file?(target)
  end
end
feed = REXML::Document.new(File.read(File.join(root, 'feed.xml')))
errors << 'Feed is missing entries' if feed.root.elements.to_a('entry').empty?
errors << 'Article missing' unless File.file?(File.join(root, 'posts/anonymous-recursion/index.html'))
errors << 'Legacy URL missing' unless File.file?(File.join(root, 'notes/anonymous-recursion.html'))
errors << 'Draft was published' if Dir.glob(File.join(root, '**', '*template*')).any?
errors << 'README was published' if File.exist?(File.join(root, 'README.md'))
abort errors.join("\n") unless errors.empty?
puts "Passed: #{html_files.size} HTML pages, internal links, rendered templates, Atom feed, article and draft exclusion."
