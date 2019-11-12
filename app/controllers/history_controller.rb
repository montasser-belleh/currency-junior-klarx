class HistoryController < ApplicationController

    post '' do
        #fetching data from the DB			
        @Conversions = Conversion.all
        erb :history
    end
end