require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/*_test.rb'
  t.verbose = false
end

desc "Build rip manual"
task :build_man do
  sh "ron -br5 --organization=DEFUNKT --manual='Rip Manual' man/*.ron"
end

desc "Show rip manual"
task :man => :build_man do
  exec "man man/*.{1,5}"
end

desc "Installs Rip"
task :install do
  prefix = ENV['PREFIX'] || ENV['prefix'] || '/usr/local'
  bindir = ENV['BINDIR'] || ENV['bindir'] || "#{prefix}/bin"
  libdir = ENV['LIBDIR'] || ENV['libdir'] || "#{prefix}/lib/rip"

  mkdir_p bindir
  Dir["bin/*"].each do |f|
    cp f, bindir, :preserve => true, :verbose => true
  end

  mkdir_p libdir
  Dir["lib/**/*.rb"].each do |f|
    cp f, libdir
  end
end
