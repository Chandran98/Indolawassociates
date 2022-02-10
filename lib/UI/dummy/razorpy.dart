// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:provider/provider.dart';

// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:roi_test/providers/cart_provider.dart';
// import 'package:roi_test/screens/cart_screen.dart';

// //void main() => runApp(MyApp());

// class RazorPaymentScreen extends StatefulWidget {
//   static const String id = 'razor-pay';
//   @override
//   _RazorPaymentScreenState createState() => _RazorPaymentScreenState();
// }

// class _RazorPaymentScreenState extends State<RazorPaymentScreen> {
//   static const platform = const MethodChannel("razorpay_flutter");

//   late Razorpay _razorpay;
//   bool? success;
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   Future<void> openCheckout(CartProvider cartProvider) async {
//     User user = FirebaseAuth.instance.currentUser!;
//     PaymentSuccessResponse? response;
//     var options = {
//       'key': 'rzp_test_ukn1nTUK4zwu3A',
//       'amount': '${cartProvider.subTotal.toStringAsFixed(0)}00',
//       'name': 'Rent O Integrated',
//       'description': 'Services that matter',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': user.phoneNumber, 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//       // if (response!.paymentId != null) {}
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     setState(() {
//       success = true;
//     });
//     EasyLoading.showSuccess("SUCCESS PAYMENT: " + response.paymentId!);
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     EasyLoading.showError("ERROR: Try Again Later"
//         // response.code.toString() +
//         // " - " +
//         // response.message!,
//         );
//     EasyLoading.dismiss();
//     Navigator.pushNamed(context, CartScreen.id);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     EasyLoading.show(
//       status: "EXTERNAL_WALLET: " + response.walletName!,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _cartProvider = Provider.of<CartProvider>(context);
//     var _payable = _cartProvider.subTotal;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF3c5784),
//         iconTheme: IconThemeData(color: Colors.white),
//         title: const Text('Payment using Razorpay',
//             style: TextStyle(color: Colors.white)),
//       ),
//       body: Center(
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Total Amount to pay: ${_payable.toStringAsFixed(0)}',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     openCheckout(_cartProvider).whenComplete(() {
//                       if (success == true) {
//                         Navigator.pop(context);
//                         Navigator.pop(context);
//                       }
//                     });
//                   },
//                   child: Text('Continue'),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Theme.of(context).primaryColor)),
//                 ),
//               ],
//             )
//           ])),
//     );
//   }
// }