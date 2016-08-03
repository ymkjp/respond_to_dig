module RespondToDig

  class << self
    def respond_to_dig(receiver)
      receiver.tap do |r|
        r.singleton_class.send(:include, RespondToDig) if RespondToDig.diggable? r
      end
    end

    # The reason why not purely duck typed by `[]` method is to avoid unexpected behavior,
    # for example we won't get `'o'` by `'foo'.dig(1)` by String#[].
    def diggable?(target)
      target.is_a? Enumerable and
          target.respond_to? :[] and
          not target.respond_to? :dig
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
