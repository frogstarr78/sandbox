module SelfTest
  module TrueClass
    def true?
      true
    end

    def false?
      false
    end
  end

  module FalseClass
    def true?
      false
    end

    def false?
      true
    end
  end
end
