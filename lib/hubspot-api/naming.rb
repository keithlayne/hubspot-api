# Simple string extensions to avoid reliance on ActiveSupport
module Hubspot::Naming
  def demodulize
    split(/::/).last
  end

  def human
    underscore.gsub(/_/, ' ').capitalize
  end

  def plural
    underscore.sub(/y$/, 'ie') + 's'
  end

  def singular
    underscore.sub(/s$/, '').sub(/ie$/, 'y')
  end

  def underscore
    demodulize.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
  end

  def camelize
    demodulize.split(/_/).map(&:capitalize).join
  end

  instance_methods(false).each do |method|
    original = "#{method}_undecorated"
    alias_method original, method
    private original
    define_method(method) { send(original).extend(Hubspot::Naming) }
  end
end
