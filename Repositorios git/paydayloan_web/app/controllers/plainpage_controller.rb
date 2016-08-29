class PlainpageController < ApplicationController
	before_action :authenticate_user!

  def index
    #flash[:success ] = "Bienvenido a PayDayLoan"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
  end

end
