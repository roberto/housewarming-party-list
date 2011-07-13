class ItemsController < ApplicationController
  def index
    @available_items = Item.where(:giver_id => nil).all
    @reserved_items = Item.where("giver_id IS NOT NULL").all
  end

  def update
    @item = Item.find params[:id]
    if @item.giver.present?
      render "index", :alert => "Item já reservado."
    else
      @item.giver = current_user
      @item.save
      render "index", :notice => "Reservado com sucesso."
    end
  end

  def destroy
    @item = Item.find params[:id]
    if @item.giver == current_user
      @item.giver = nil
    end
    render "index", :notice => "Reserva cancelada com sucesso."
  end
end
