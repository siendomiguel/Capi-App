import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'payment_component_stripe_model.dart';
export 'payment_component_stripe_model.dart';

class PaymentComponentStripeWidget extends StatefulWidget {
  const PaymentComponentStripeWidget({
    super.key,
    required this.secretKeyStripe,
    required this.skStripe,
  });

  final String? secretKeyStripe;
  final String? skStripe;

  @override
  State<PaymentComponentStripeWidget> createState() =>
      _PaymentComponentStripeWidgetState();
}

class _PaymentComponentStripeWidgetState
    extends State<PaymentComponentStripeWidget> {
  late PaymentComponentStripeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentComponentStripeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              FlutterFlowWebView(
                content:
                    '<!DOCTYPE html><html>  <head>    <script src=\"https://js.stripe.com/v3/\"></script>  </head>  <body>    <h1>Stripe Checkout</h1>    <div id=\"checkout-container\"></div>    <script>      const stripe = Stripe(\'${widget.skStripe}\');      const clientSecret = \'${widget.secretKeyStripe}\';      stripe.initEmbeddedCheckout({        clientSecret: clientSecret      }).then(function(checkout) {               checkout.mount(\'#checkout-container\');      }).catch(function(error) {        console.error(\'Error initializing Checkout:\', error);      });    </script>  </body></html>',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.68,
                verticalScroll: false,
                horizontalScroll: false,
                html: true,
              ),
            FlutterFlowWebView(
              content: functions.replaceText(
                  widget.skStripe!, widget.secretKeyStripe!),
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.68,
              verticalScroll: false,
              horizontalScroll: false,
              html: true,
            ),
          ],
        ),
      ),
    );
  }
}
