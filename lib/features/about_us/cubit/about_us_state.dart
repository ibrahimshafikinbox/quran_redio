import 'package:splash/features/about_us/data/models/about_us_model.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUsModel data;
  AboutUsLoaded(this.data);
}

class AboutUsError extends AboutUsState {
  final String message;
  AboutUsError(this.message);
}
