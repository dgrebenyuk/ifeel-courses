# Dependency Inversion Principle
#
# High-level modules shouldn’t depend on low-level modules.
# Both modules should depend on abstractions.
# In addition, abstractions shouldn’t depend on details. Details depend on abstractions.
#
# Интересно, что сам Robert C. Martin не считает принцип самостоятельным,
# а результатом строгого выполнения двух предыдущих: принцип открытости/закрытости и подстановки Барбары Лисков.
# Код, который следует принципам OCP и LSP, должен быть читаемым и содержать четко разделенные абстракции.
# Он также должен быть расширяемым, а дочерние классы легко заменяемыми другими экземплярами базового класса.


# Bad
class Printer
  def initialize(data)
    @data = data
  end

  def print_pdf
    PdfFormatter.new.format(@data)
  end

  def print_html
    HtmlFormatter.new.format(@data)
  end
end

class PdfFormatter
  def format(data)
    # format data to Pdf logic
  end
end

class HtmlFormatter
  def format(data)
    # format data to Html logic
  end
end



# Good
class Printer
  def initialize(data)
    @data = data
  end

  def print(formatter: PdfFormatter.new)
    formatter.format(@data)
  end
end

class PdfFormatter
  def format(data)
    # format data to Pdf logic
  end
end

class HtmlFormatter
  def format(data)
    # format data to Html logic
  end
end

# Anti-DIP — Принцип инверсии сознания или DI-головного мозга.
# Интерфейсы выделяются для каждого класса и пачками передаются через конструкторы.
# Понять, где находится логика становится практически невозможно.
