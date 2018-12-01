class WelcomeController < ApplicationController
  def index
  end

  def art_items
    @art_items = Item.where(category:'art')
  end

  def beauty_items
    @beauty_items = Item.where(category:'beauty')
  end

  def books_items
    @books_items = Item.where(category:'books')
  end

  def clothing_items
    @clothing_items = Item.where(category:'clothing')
  end

  def property_items
    @property_items = Item.where(category:'property')
  end

  def other_items
    @other_items = Item.where(category:'other')
  end
end
