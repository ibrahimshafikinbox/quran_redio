import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/features/about_us/cubit/about_us_state.dart';
import 'package:splash/features/about_us/data/repo/about_us_repository.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final AboutUsRepository _repository;

  AboutUsCubit(this._repository) : super(AboutUsInitial());

  Future<void> fetchAboutUs() async {
    emit(AboutUsLoading());
    try {
      final data = await _repository.fetchAboutUs();
      emit(AboutUsLoaded(data));
    } catch (e) {
      emit(AboutUsError('فشل تحميل البيانات، حاول مرة أخرى'));
    }
  }
}
