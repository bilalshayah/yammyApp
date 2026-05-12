class Createordermodel {
  final String restaurantId;
  final String addressId;
  final String paymentMethod;
  final String? notes;
  final String? couponCode;
  Createordermodel({
   required this.addressId,
   required this.paymentMethod,
   required this.restaurantId,
    this.couponCode,
    this.notes,
    }
  );
  Map<String,dynamic> toJson()=>{
    'restaurant_id':restaurantId,
    'address_id':addressId,
    'payment_method':paymentMethod,
    'notes':notes,
    'coupon_code':couponCode,

  };
}
