module RespondToDig
  RESPONDERS = [Array, Hash]

  class << self
    def respond_to_dig(receiver)
      receiver.tap do |r|
        r.singleton_class.send(:include, RespondToDig) if RespondToDig.target? r
      end
    end

    def target?(target)
      not respond_to? :dig and RESPONDERS.any? {|klass| target.is_a? klass}
    end
  end

  def dig(key, *rest)
    value = RespondToDig::respond_to_dig(self[key])
    if value.nil? || rest.empty?
      value
    elsif value.respond_to?(:dig)
      value.dig(*rest)
    else
      fail TypeError, "#{value.class} does not have #dig method"
    end
  end

end
