module Rip
  class GitPackage
    def self.handle?(source)
      source =~ /file:\/\// ||
        source =~ /git:\/\// ||
        source =~ /\.git/
    end

    attr_reader :path, :source

    def initialize(source, path = "/", version = nil)
      @source  = source
      @path    = path
      @version = version
    end

    def name
      source.split('/').last.chomp('.git')
    end

    def version
      @version
    end

    def package_name
      "#{name}-#{Rip.md5("#{source}#{path}#{version}")}"
    end

    def package_path
      "#{Rip.packages}/#{package_name}"
    end

    def cache_name
      "#{name}-#{Rip.md5(source)}"
    end

    def cache_path
      "#{Rip.cache}/#{cache_name}"
    end
  end
end
