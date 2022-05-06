// ignore_for_file: must_be_immutable

import 'package:meta/meta.dart';

@immutable
abstract class MoviesEvent {}

class MovieDetailsEvent extends MoviesEvent {
  int id;
  MovieDetailsEvent({
    required this.id,
  });
}
