require "pry"
def consolidate_cart(cart)
  consolidated = {}
  grocery = []
  cart.each{|hash|
      hash.each {|item, hash2|
        next if grocery.include?(item)
        grocery << item
        hash2[:count] = cart.count(hash)
        consolidated[item] = hash2
        }
  }
  consolidated
end

def apply_coupons(cart, coupons)
 cart_with_coupons = {}
  consolidate_cart(cart).each{|item, hash|
    modified_hash = {}
    hash.each{|k,v|
      modified_hash[k] = v
    }
    coupons.each {|hash_coup|
      if item != hash_coup[:item] || hash[:count] < hash_coup[:num]
        cart_with_coupons[item] = hash 
      else
        cart_with_coupons["#{item} W/COUPON"] = modified_hash
      if hash_coup[:num] = modified_hash[:count]
        modified_hash[:count] = 1
        modified_hash[:price] = hash_coup[:cost]
        cart.delete(item)
      else hash_coup[:num] < modified_hash[:count]
        modified_hash[:count] = (modified_hash[:count] - hash_coup[:num])
        modified_hash[:price] = hash_coup[:cost]
      end
    end
    }
  }
  cart_with_coupons
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
