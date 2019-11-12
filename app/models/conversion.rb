require 'dm-core'
require 'dm-migrations'
=begin
define a conversion as an operation that includes
an original sum of an initial currency and a converted
sum of a target currency to convert to in that date
=end
class Conversion
    include DataMapper::Resource

    property :id, Serial, :key => true
    property :original_sum, String
    property :converted_sum, String
    property :initial_currency, String
    property :target_currency, String
    property :date, DateTime

    def inspect
        "<#{self.class}:#{self.id},#{self.original_sum},#{self.converted_sum},#{self.initial_currency},#{self.target_currency},#{self.date}>"
    end
    DataMapper.finalize
    DataMapper.auto_upgrade!
end
