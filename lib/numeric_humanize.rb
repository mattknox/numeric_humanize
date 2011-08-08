class Numeric
  SCALE_TO_WORD = Hash.new do |h, i|
    " * 10^#{i * 3}"
  end.merge({ 1  => " thousand",
              2  => " million",
              3  => " billion",
              4  => " trillion"
            })
  # in my unscientific test, no one really found names beyond trillion
  # useful.  Default to sci notation seems useful.


  def humanize(figures = 3)
    scale = (Math.log10(self) / 3).floor
    base = 1000 ** scale
    suffix = SCALE_TO_WORD[scale.abs]
    suffix = "#{suffix}ths" if scale < 1 && suffix
    sprintf("%.#{ figures }G", self.to_f / base) + suffix.to_s
  end

  def to_sci(figures = 3)
    sprintf("%.#{ figures }G", self)
  end
end
