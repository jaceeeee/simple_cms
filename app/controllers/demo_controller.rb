class DemoController < ApplicationController
  layout 'application'

  def index
  	# render(:template => 'demo/index')  	
    @id = params[:id].to_i + 1
    @name = params[:name]
    render('index')
  end

  def hello
  	# render(:template => 'demo/hello')
  	render('hello')
  end

  def other_hello
  	redirect_to(:action => 'index')
  end

  def sais
  	redirect_to('http://sais.up.edu.ph')
  end

  def escape_output
  end
  
end
