#!/usr/bin/ruby

require "observer"

class Ticker          ### Periodically fetch a stock price.
  include Observable

  def initialize(symbol)
    @symbol = symbol
  end

  def run
    lastPrice = nil
    loop do
      price = Price.fetch(@symbol)
      print "Current price: #{price}\n"
      changed if price != lastPrice                # notify observers
      lastPrice = price
      notify_observers(Time.now, price)
      sleep 1
    end
  end
end

class Price           ### A mock class to fetch a stock price (60 - 140).
  def Price.fetch(symbol)
    60 + rand(80)
  end
end

class Warner          ### An abstract observer of Ticker objects.
  def initialize(ticker, limit)
    @limit = limit
    ticker.add_observer(self)
  end
end

class WarnLow < Warner
  def update(time, price)       # callback for observer
    if price < @limit
      print "--- #{time.to_s}: Price below #@limit: #{price}\n"
    end
  end
end

class WarnHigh < Warner
  def update(time, price)       # callback for observer
    if price > @limit
      print "+++ #{time.to_s}: Price above #@limit: #{price}\n"
    end
  end
end

ticker = Ticker.new("MSFT")
WarnLow.new(ticker, 80)
WarnHigh.new(ticker, 120)
ticker.run


