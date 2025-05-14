import '/flutter_flow/flutter_flow_util.dart';
import '/onboarding/config_pagos_onboarding_stripe/config_pagos_onboarding_stripe_widget.dart';
import '/onboarding/config_zoom_onboarding/config_zoom_onboarding_widget.dart';
import '/onboarding/horarios_config_onboarding/horarios_config_onboarding_widget.dart';
import 'onboarding_config_widget.dart' show OnboardingConfigWidget;
import 'package:flutter/material.dart';

class OnboardingConfigModel extends FlutterFlowModel<OnboardingConfigWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for HorariosConfigOnboarding component.
  late HorariosConfigOnboardingModel horariosConfigOnboardingModel;
  // Model for ConfigPagosOnboardingStripe component.
  late ConfigPagosOnboardingStripeModel configPagosOnboardingStripeModel;
  // Model for configZoomOnboarding component.
  late ConfigZoomOnboardingModel configZoomOnboardingModel;

  @override
  void initState(BuildContext context) {
    horariosConfigOnboardingModel =
        createModel(context, () => HorariosConfigOnboardingModel());
    configPagosOnboardingStripeModel =
        createModel(context, () => ConfigPagosOnboardingStripeModel());
    configZoomOnboardingModel =
        createModel(context, () => ConfigZoomOnboardingModel());
  }

  @override
  void dispose() {
    horariosConfigOnboardingModel.dispose();
    configPagosOnboardingStripeModel.dispose();
    configZoomOnboardingModel.dispose();
  }
}
