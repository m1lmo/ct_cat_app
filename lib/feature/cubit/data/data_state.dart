// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_cubit.dart';

class DataState extends Equatable {
  const DataState({
    this.data,
    this.cat,
    this.tier,
    this.result,
    this.creditsToNextTier,
  });
  final DataModel? data;
  final List<CatModel?>? cat;
  final List<TierModel?>? tier;
  final ResultModel? result;
  final int? creditsToNextTier;

  @override
  List<Object?> get props => [data, cat, tier, result, creditsToNextTier];

  DataState copyWith({
    DataModel? data,
    List<CatModel?>? cat,
    List<TierModel?>? tier,
    ResultModel? result,
    int? creditsToNextTier,
  }) {
    return DataState(
      data: data ?? this.data,
      cat: cat ?? this.cat,
      tier: tier ?? this.tier,
      result: result ?? this.result,
      creditsToNextTier: creditsToNextTier ?? this.creditsToNextTier,
    );
  }
}
