# spec/tests/mercado_libre_test.rb
require 'test/unit'
require_relative '../helpers/driver_setup'
require_relative '../helpers/base_page'
require_relative '../pages/home_page'
require_relative '../pages/result_page'


class MercadoLibreTest < Test::Unit::TestCase
  def setup
    @driver = create_driver
    @home = HomePage.new(@driver)
    @results =ResultsPage.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_full_flow
    @home.country_selection
    @home.select_guest_option
    @home.search_for('playstation 5')
    @home.filter_click
    @home.open_sort_menu
    @results.list_top_results(5)
  end

end
