class CardsController < ApplicationController
	before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @card = Card.paginate(:page => params[:page], :per_page => 15)
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  def verificar
    if Card.where(cardNumber: @tar).take 
    return true
    else
    return false
    end  
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    @tar = card_params[:cardNumber]
    if verificar == true
      redirect_to cards_url, notice: "Tarjeta Duplicada Ingresa Otra"   
    else
    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: "'Tarjeta Creada Satisfactoriamente.' #{@tar}" }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Tarjeta Actualizada Satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Tarjeta Creada Satisfactoriamente' }
      format.json { render :show, status: :ok, location: @card }
    end
  end

  def import
    nueva= params[:file]
  #  @tar_import = nueva[:cardNumber]
   if verificar_import == true
      redirect_to cards_url, notice: "En el Archivo se encuentra una tarjeta Duplicada"
    else
    Card.import(params[:file])
    if params.include?(".csv") or params.include?(".xls") or params.include?(".xlsx") 
      redirect_to cards_url, notice: "Tarjeta(s) importada(s)."      
    else        
      redirect_to cards_url, notice: "Elije un Archivo para Cargar o Verifica si el Archivo es el Correcto \n #{params}"
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:cardNumber, :expDate, :emisor, :statuss)
    end
end
