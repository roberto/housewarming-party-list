# encoding: utf-8

class ItemsController < ApplicationController
  def index
    @available_items = Item.where(:giver_id => nil).all
    if user_signed_in?
      @reserved_items = Item.where("giver_id IS NOT NULL").where("giver_id <> ?", current_user).all
    else
      @reserved_items = Item.where("giver_id IS NOT NULL").all
    end
  end

  def show
    redirect_to items_url
  end

  def update
    @item = Item.find params[:id]
    if @item.giver.present?
      redirect_to items_url, :alert => "Item já reservado."
    else
      @item.giver = current_user
      @item.save
      redirect_to items_url, :notice => "Reservado com sucesso."
    end
  end

  def destroy
    @item = Item.find params[:id]
    if @item.giver == current_user
      @item.giver = nil
      @item.save
    end
    redirect_to items_url, :notice => "Reserva cancelada com sucesso."
  end
end
