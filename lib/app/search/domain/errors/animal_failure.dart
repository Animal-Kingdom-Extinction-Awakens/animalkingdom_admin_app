// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnimalFailure implements Exception {}

class EmptyList extends AnimalFailure {}

class NotFound extends AnimalFailure {}

class DatasourceError extends AnimalFailure {
  final String? message;
  DatasourceError({this.message});
}
