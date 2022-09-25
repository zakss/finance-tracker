class StocksController < ApplicationController
  def index

  end
  def search
    #store the current_user
    @user = User.find_by(params[:id])

    if params['stock'] && params['shares']
      response = Searchstock::Search.by_stock(params['stock'])
      shares = params['shares']

      result = JSON.parse(response.body)

      stock = Stock.create(
        from: result['from'],
        symbol: result['symbol'],
        close: result['close'],
        share: shares.to_i,
      )

      if stock.save
        redirect_to user_path(@user)
      else
        flash[:error] = "unsuccessful"
        redirect_to search_stocks_path
      end
    end
  end
end
