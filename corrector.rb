class Corrector
  def corrector(name)
    if name.length <= 10
      name.capitalize
    else
      name[0..9].gsub(/\s\w+\s*$/, '...').capitalize
    end
  end
end
