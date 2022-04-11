import 'package:meta/meta.dart';

@immutable
abstract class ApiEvent {}

// ignore: must_be_immutable
class UserEvent extends ApiEvent {}
