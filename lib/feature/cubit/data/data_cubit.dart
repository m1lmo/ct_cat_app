import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:wiet_test_app/feature/model/cat_model.dart';
import 'package:wiet_test_app/feature/model/data_model.dart';
import 'package:wiet_test_app/feature/model/result_model.dart';
import 'package:wiet_test_app/feature/model/tier_model.dart';
import 'package:wiet_test_app/feature/service/repository/data_repository.dart';

part 'data_state.dart';

/// DataCubit for DataModel
class DataCubit extends Cubit<DataState> {
  DataCubit() : super(const DataState());

  /// This is for emitting the data
  final List<CatModel?> cat = [];

  /// This is for emitting the data
  final List<TierModel?> tier = [];
  final dio = Dio();
  late final DataRepository dataRepository;

  /// This method is for initializing the DataCubit
  /// It will fetch the data from the API and set the data
  /// Don't forget to call this method in your provider
  Future<void> init() async {
    print('init');
    dataRepository = DataRepository(dio);
    dio.options = BaseOptions(
      baseUrl: dataRepository.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final data = await dataRepository.fetchData();
    setData(data);
    setCat();
    setTier();
    setResult();
    setCreditsToNextTier();
  }

  /// This method is used to set the data
  void setData(DataModel? data) {
    emit(state.copyWith(data: data));
  }

  /// This method is used to set the cat
  void setCat() {
    if (state.data?.result?.cats?.isEmpty ?? true) return;
    for (final element in state.data!.result!.cats!) {
      cat.add(element);
    }
    emit(state.copyWith(cat: List.from(cat)));
  }

  /// This method is used to set the tier
  void setTier() {
    if (state.data?.result?.tiers?.isEmpty ?? true) return;
    for (final element in state.data!.result!.tiers!) {
      tier.add(element);
    }
    emit(state.copyWith(tier: List.from(tier)));
  }

  /// This method is used to set the result
  void setResult() {
    emit(state.copyWith(result: state.data?.result));
  }

  /// This method is used to calculate the how much credits are needed to reach the next tier
  void setCreditsToNextTier() {
    if (state.result?.currentTier == null) return;
    final currentTier = state.result?.currentTier;
    final nextTier = state.tier?.indexOf(state.tier?.firstWhere((element) => element?.tierName == currentTier)) ?? 0 + 1;
    final creditsToNextTier = state.tier?[nextTier]?.minPoint ?? 0 - (state.result?.tierPoints ?? 0);
    emit(state.copyWith(creditsToNextTier: creditsToNextTier));
  }
}
