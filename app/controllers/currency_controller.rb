class CurrencyController < ApplicationController
  def forex
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    @parsed_data = JSON.parse(raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_keys = @symbols_hash.keys

    #@array_of_symbols

    render({:template => "exchange_templates/forex.html.erb"}) 
  end

  def first_currency
    @base_currency = params.fetch("first_currency").upcase
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    @parsed_data = JSON.parse(raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_keys = @symbols_hash.keys

    render({:template => "exchange_templates/first_currency.html.erb"})
  end

  def second_currency
    @base_currency = params.fetch("first_currency").upcase
    @conversion_currency = params.fetch("second_currency").upcase

    url = "https://api.exchangerate.host/convert?from=" + @base_currency + "&to=" + @conversion_currency
    raw_data = open(url).read
    @parsed_data = JSON.parse(raw_data)
    @result = @parsed_data.fetch("result")

    render({:template => "exchange_templates/second_currency.html.erb"})
  end
end
