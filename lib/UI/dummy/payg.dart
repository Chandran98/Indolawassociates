// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';

// class Mpay extends StatefulWidget {
//   Mpay({Key? key}) : super(key: key);

//   @override
//   State<Mpay> createState() => _MpayState();
// }

// class _MpayState extends State<Mpay> {
//   var _paymentItems = [
//     PaymentItem(
//       label: 'Total',
//       amount: '150',
//       status: PaymentItemStatus.final_price,
//     )
//   ];
//   void onpaymentresult(payment) {
//     debugPrint(payment.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: GooglePayButton(
//           paymentConfigurationAsset: 'gpay.json',
//           paymentItems: _paymentItems,
//           width: 200,
//           height: 50,
//           style: GooglePayButtonStyle.black,
//           type: GooglePayButtonType.pay,
//           margin: const EdgeInsets.only(top: 15.0),
//           onPaymentResult: (data) {
//             print(data);
//           },
//           loadingIndicator: const Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       ),
//     );
//   }
// }
