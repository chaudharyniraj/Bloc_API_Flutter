import 'package:meta/meta.dart';

@immutable
abstract class MoviesListEvent {}

class MoviesListLoadedEvent extends MoviesListEvent {}
