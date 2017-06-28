module SearchHelper
  def convert_millisecond_to_second(value)
    value = value/1000.to_f
    "#{value}s"
  end
end
