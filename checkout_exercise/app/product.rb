class Product
  @@attributes= [:product_code, :name, :price]
  
  @@attributes.each { |a| attr_accessor a }
  
  def initialize(hash)
    raise "missing parameters" unless @@attributes.all? {|a| hash.key? a}
    @@attributes.each { |a| self.send( "#{a.to_s}=", hash[a] ) }
  end
end
