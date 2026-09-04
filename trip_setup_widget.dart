import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'trip_setup_model.dart';
export 'trip_setup_model.dart';

class TripSetupWidget extends StatefulWidget {
  const TripSetupWidget({super.key});

  static String routeName = 'TripSetup';
  static String routePath = '/tripSetup';

  @override
  State<TripSetupWidget> createState() => _TripSetupWidgetState();
}

class _TripSetupWidgetState extends State<TripSetupWidget> {
  late TripSetupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final cities = const ['New York', 'San Diego', 'Istanbul', 'Almaty'];
  final interestOptions = const ['Food', 'Culture', 'Shopping', 'Nature', 'Local Gems'];
  final languageOptions = const ['English', 'Russian', 'Turkish', 'Simplified Chinese'];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripSetupModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          text,
          style: FlutterFlowTheme.of(context).titleSmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      );

  Widget _choiceChip(String label, bool selected, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }

  Future<void> _createTrip() async {
    if (_model.isLoading == true) return;
    if ((_model.city ?? '').isEmpty ||
        (_model.language ?? '').isEmpty ||
        _model.interests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a city, interests and language.')),
      );
      return;
    }

    setState(() => _model.isLoading = true);
    try {
      final response = await GenerateTripCall.call(
        city: _model.city,
        days: (_model.days ?? 2).toString(),
        interests: _model.interests.join(', '),
        language: _model.language,
      );

      if (!mounted) return;
      if (!response.succeeded) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Trip generation failed (${response.statusCode}).')),
        );
        return;
      }

      final itinerary = GenerateTripCall.itinerary(response.jsonBody)?.trim() ?? '';
      if (itinerary.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('The AI returned an empty itinerary. Please try again.')),
        );
        return;
      }

      context.goNamed(
        MyTripWidget.routeName,
        queryParameters: {
          'itineraryId': serializeParam(itinerary, ParamType.String),
        }.withoutNulls,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not create trip: $e')),
      );
    } finally {
      if (mounted) setState(() => _model.isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.safePop(),
        ),
        title: const Text('Plan Your Trip'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tell us your preferences and let AI craft your city guide.',
                    style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                  const SizedBox(height: 28),
                  _sectionTitle('Where are you going?'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: cities
                        .map((c) => _choiceChip(c, _model.city == c, () {
                              setState(() => _model.city = c);
                            }))
                        .toList(),
                  ),
                  const SizedBox(height: 28),
                  _sectionTitle('How many days?'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(5, (index) {
                      final day = index + 1;
                      return _choiceChip(
                        '$day ${day == 1 ? 'Day' : 'Days'}',
                        _model.days == day,
                        () => setState(() => _model.days = day),
                      );
                    }),
                  ),
                  const SizedBox(height: 28),
                  _sectionTitle("What's your vibe?"),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: interestOptions.map((interest) {
                      final selected = _model.interests.contains(interest);
                      return FilterChip(
                        label: Text(interest),
                        selected: selected,
                        onSelected: (value) {
                          setState(() {
                            if (value) {
                              if (!_model.interests.contains(interest)) {
                                _model.interests.add(interest);
                              }
                            } else {
                              _model.interests.remove(interest);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 28),
                  _sectionTitle('Preferred Language'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: languageOptions
                        .map((language) => _choiceChip(
                              language,
                              _model.language == language,
                              () => setState(() => _model.language = language),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: _model.isLoading == true ? null : _createTrip,
                      icon: _model.isLoading == true
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.auto_awesome_rounded),
                      label: Text(_model.isLoading == true
                          ? 'Creating your trip...'
                          : 'Create My Trip'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
