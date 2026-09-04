import '/backend/api_requests/api_calls.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'trip_setup_widget.dart' show TripSetupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TripSetupModel extends FlutterFlowModel<TripSetupWidget> {
  ///  Local state fields for this page.

  String? city = 'New York';

  int? days = 2;

  List<String> interests = ['Food', 'Culture'];
  void addToInterests(String item) => interests.add(item);
  void removeFromInterests(String item) => interests.remove(item);
  void removeAtIndexFromInterests(int index) => interests.removeAt(index);
  void insertAtIndexInInterests(int index, String item) =>
      interests.insert(index, item);
  void updateInterestsAtIndex(int index, Function(String) updateFn) =>
      interests[index] = updateFn(interests[index]);

  String? language = 'English';

  bool? isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel;
  // Stores action output result for [Backend Call - API (GenerateTrip)] action in Button widget.
  ApiCallResponse? generatedTrip;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
