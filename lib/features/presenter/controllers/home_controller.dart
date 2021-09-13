import 'package:flutter_triple/flutter_triple.dart';

import 'package:nasa_clean_arch/core/usecase/errors/failure.dart';
import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_arch/features/domain/usecases/get_space_media_from_date_usecase.dart';

class HomeStore extends NotifierStore<Failure, SpaceMediaEntity> {
  final GetSpaceMediaFromDateUsecase usecase;
  HomeStore(this.usecase)
      : super(SpaceMediaEntity(
          description: '',
          mediaType: '',
          title: '',
          mediaUrl: '',
        ));

  getSpaceMediaFromDate(DateTime? date) async {
    setLoading(true);
    final result = await usecase(date);
    result.fold((l) => setError(l), (r) => update(r));
    setLoading(false);
  }
}
