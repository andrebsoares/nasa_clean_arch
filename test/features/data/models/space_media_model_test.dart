import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';

import '../../mock/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
    description: 'Meteors can be colorful. While the human eye usually',
    mediaType: 'image',
    title: 'Colorful Quadrantid Meteor',
    mediaUrl:
        'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg',
  );

  test('Should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('Should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    // Act
    final result = SpaceMediaModel.fromJson(jsonMap);
    // Assert
    expect(result, tSpaceMediaModel);
  });

  test('Should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "explanation": "Meteors can be colorful. While the human eye usually",
      "media_type": "image",
      "title": "Colorful Quadrantid Meteor",
      "url":
          "https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg"
    };
    // Act
    final result = tSpaceMediaModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}
