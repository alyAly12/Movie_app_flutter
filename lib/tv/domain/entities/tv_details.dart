import 'package:equatable/equatable.dart';

class TvDetails extends Equatable {
  final String title;
  final String web;
  final String key;
  final int size;
  final String id;

  const TvDetails(
      {required this.title,
      required this.web,
      required this.key,
      required this.size,
      required this.id});

  @override

  List<Object?> get props => [title, web, key, size, id];
}
