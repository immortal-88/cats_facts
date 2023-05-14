import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_fact_response.g.dart';

@JsonSerializable()
class CatFactResponse extends Equatable {
  const CatFactResponse({required this.fact, required this.length});

  final String fact;
  final int length;

  @override
  List<Object> get props => [fact, length];

  factory CatFactResponse.fromJson(Map<String, dynamic> json) =>
      _$CatFactResponseFromJson(json);
}
