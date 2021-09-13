import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/usecase/errors/exceptions.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

import '../../mock/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late SpaceMediaDatasourceImplementation datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = SpaceMediaDatasourceImplementation(client);
  });

  final tDateTime = DateTime(2021, 02, 02);
  final urlExpected =
      'https://api.nasa.gov/planetary/apod?hd=true&api_key=DEMO_KEY&date=2021-02-02';
  test('Should call the get method with correct url', () async {
    // Arrange
    when(() => client.get(any())).thenAnswer(
        (__) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
    // Act
    await datasource.getSpaceMediaFromDate(tDateTime);
    // Assert
    verify(() => client.get(urlExpected)).called(1);
  });

  test('Should return a SpaceMediaModel when is successfull', () async {
    // Arrange
    when(() => client.get(any())).thenAnswer(
        (__) async => HttpResponse(data: spaceMediaMock, statusCode: 200));

    final tSpaceMediaModelExpected = SpaceMediaModel(
      description: 'Meteors can be colorful. While the human eye usually',
      mediaType: 'image',
      title: 'Colorful Quadrantid Meteor',
      mediaUrl:
          'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg',
    );
    // Act
    final result = await datasource.getSpaceMediaFromDate(tDateTime);
    // Assert
    expect(result, tSpaceMediaModelExpected);
  });

  test('Should throw a ServerException when the call is unccssful', () async {
    // Arrange
    when(() => client.get(any()))
        .thenAnswer((__) async => HttpResponse(data: '', statusCode: 400));
    // Act
    final result = datasource.getSpaceMediaFromDate(tDateTime);
    // Assert
    expect(() => result, throwsA(ServerException()));
  });
}
