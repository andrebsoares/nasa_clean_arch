import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/usecase/errors/failure.dart';
import 'package:nasa_clean_arch/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_clean_arch/features/presenter/controllers/home_controller.dart';

import '../../mock/date_mock.dart';
import '../../mock/space_media_entity_mock.dart';

class GetSpaceMediaFromDateUsecaseMock extends Mock
    implements GetSpaceMediaFromDateUsecase {}

void main() {
  late HomeStore store;
  late GetSpaceMediaFromDateUsecase usecase;

  setUp(() {
    usecase = GetSpaceMediaFromDateUsecaseMock();
    store = HomeStore(usecase);
    registerFallbackValue<DateTime>(DateTime(0, 0, 0));
  });

  test('Should return a SpaceMedia from the usecase', () async {
    // Arrange
    when(() => usecase(any())).thenAnswer((__) async => Right(tSpaceMedia));
    // Act
    await store.getSpaceMediaFromDate(tDate);
    // Assert
    store.observer(
      onState: (state) {
        expect(state, tSpaceMedia);
        verify(() => usecase(tDate)).called(1);
      },
    );
  });

  final tFailure = ServerFailure();
  test('Should return a Failure from the usecase when there is an error',
      () async {
    // Arrange
    when(() => usecase(any())).thenAnswer((__) async => Left(tFailure));
    // Act
    await store.getSpaceMediaFromDate(tDate);
    // Assert
    store.observer(
      onError: (error) {
        expect(error, tFailure);
        verify(() => usecase(tDate)).called(1);
      },
    );
  });
}
