require 'rspec'
require_relative '../helpers/base_page'
require_relative '../pages/home_page'
require_relative '../pages/result_page'

RSpec.describe 'Búsqueda en la app de Mercado Libre' do
  before(:all) do
    @home_page = HomePage.new(@driver)
    @result_page = ResultsPage.new(@driver)
  end

  it 'El usuario selecciona su region' do
    @home_page.country_selection
  end

  it 'El usuario da click en la opcion de invitado' do
    @home_page.select_guest_option
  end

  it 'El usuario da click en la barra de busqueda' do
    @home_page.search_for('playstation 5')
  end

  it 'El usuario da click en el boton de filtros' do
    @home_page.filter_click
  end
  
  it 'El usuario aplica filtros' do
    @home_page.open_sort_menu
  end

  it 'El usuario recibe una lista de los 5 primeros prodcutos' do
    @result_page.list_top_results(5)
  end    

end

