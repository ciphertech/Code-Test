class PagesController < ApplicationController

	
  def new
  	@page = Page.new
 end

  def create
  	 @page = Page.create(page_params)
     page_data = Nokogiri::HTML(RestClient.get(@page.page_location))
     data_h1 = page_data.css('h1').children.collect{|e| e.text}.join(",")
     data_h2 = page_data.css('h2').children.collect{|e| e.text}.join(",")
     data_h3 = page_data.css('h3').children.collect{|e| e.text}.join(",")
     data_links = data_links = page_data.css('a').collect{|e| e["href"]}.join(",")
     @page.update_attributes(h1_data: data_h1, h2_data: data_h2, h3_data: data_h3, links_data: data_links)
     redirect_to new_page_path
  end

  def index
  	@pages = Page.all
  end

  def page_params
    params.require(:page).permit(:page_location, :h1_data, :h2_data, :h3_data, :links_data)
  end
end
