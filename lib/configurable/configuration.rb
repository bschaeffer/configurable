require 'confstruct'

module Configurable
  class Configuration < Confstruct::Configuration
    def []=(key, val)
      if !@default_values.has_key?(key)
        raise ConfigurationError, "Invalid configuration key: #{key}"
      elsif block_given?
        super(key, &block)
      else
        super
      end
    end

    def method_missing(sym, *args, &block)
      name = sym.to_s.chomp("=").to_sym
      result = nil

      if args.length == 0 && !self[name].nil? && block_given?
        result = self[name] = block
      else
        result = super
      end
      result
    end
  end

  class ConfigurationError < StandardError; end
end
