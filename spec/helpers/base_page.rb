# spec/helpers/base_page.rb
class BasePage

  #Crear instancia del objeto driver
  def initialize(driver)
    @driver = driver
  end

  #Encontrar un elemento
  def click(locator)
    @driver.find_element(locator).click
  end

  #Encontrar un elemento de texto
  def text_of(locator)
    @driver.find_element(locator).text
  end

  #Esperar por un elemento
  def wait_for(locator, timeout: 10)
    @driver.wait(timeout: timeout) { @driver.find_element(locator) }
  end

  #Hacer scroll hasta un texto dentro de un contenedor
  def scroll_to_text(text)
    @driver.find_element(
      :uiautomator,
      'new UiScrollable(new UiSelector().className("androidx.recyclerview.widget.RecyclerView")).scrollIntoView(new UiSelector().textContains("' + text + '"));'
    )
  end

end
