import 'package:meta/meta.dart';

@immutable
abstract class SuggestedMoviesEvent {}

class SuggestedMoviesLoadedEvent extends SuggestedMoviesEvent {}
