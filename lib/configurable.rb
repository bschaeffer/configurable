module Configurable
  autoload :Configuration, 'configurable/configuration'

  extend ActiveSupport::Concern

  included do
    unless self.instance_variable_defined?("@_configurable")
      self.class.__send__(:attr_accessor, :_configurable)
      self.__send__("_configurable=", Hash.new)
    end

    def self.default_configuration(name, &block)
      self._configurable[name] = Configuration.new(&block)

      self.instance_eval <<-METHOD, __FILE__, __LINE__ + 1
        def #{name}
          _configurable[:#{name}]
        end
      METHOD

      self.class_eval <<-METHOD, __FILE__, __LINE__ + 1
        def #{name}
          self.class._configurable[:#{name}]
        end
      METHOD
    end
  end
end