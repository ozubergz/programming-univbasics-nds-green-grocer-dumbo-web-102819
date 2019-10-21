def find_item_by_name_in_collection(name, collection)
  result = nil
  collection.map do |elem|
    if elem[:item] == name
      result = elem
    end
  end
  result
end

def consolidate_cart(cart)
  new_hash = {}
  cart.map do |elem|
    if !new_hash[elem[:item]]
      new_hash[elem[:item]] = {
        :price => elem[:price],
        :clearance => elem[:clearance],
        :count => 1
      }
    elsif new_hash[elem[:item]]
      new_hash[elem[:item]][:count] += 1
    end
  end
  
  arr = []
  new_hash.each do |k, v|
    arr.push({
      :item => k,
      :price => v[:price],
      :clearance => v[:clearance],
      :count => v[:count]
    })
  end
  arr
end

def apply_coupons(cart, coupons)
  new_hash = {}
  cart.each do |cart_item|
    coupons.each do |coupon|
      if cart_item[:item] == coupon[:item]
        if cart_item[:count] >= coupon[:num] && cart_item[:item] != "#{cart_item[:item]} W/COUPON"
          cart.push({
            :item => "#{cart_item[:item]} W/COUPON",
            :price => coupon[:cost] / coupon[:num],
            :clearance => cart_item[:clearance],
            :count => coupon[:num]
          })
          cart_item[:count] -= coupon[:num]
        end
      end
    end
  end
  cart
end

def apply_clearance(cart)
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
