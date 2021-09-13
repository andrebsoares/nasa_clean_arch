// app_module.dart
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/features/data/repositories/space_media_repository_implementation.dart';
import 'package:nasa_clean_arch/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_clean_arch/features/presenter/controllers/home_controller.dart';
import 'package:nasa_clean_arch/features/presenter/pages/home_page.dart';

import 'package:http/http.dart' as http;
import 'core/http_client/http_client_implementation.dart';
import 'features/data/datasources/space_media_datasource_implementation.dart';
import 'features/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i.get())),
    Bind((i) => GetSpaceMediaFromDateUsecase(i.get())),
    Bind((i) => SpaceMediaRepositoryImplementation(i.get())),
    Bind((i) => SpaceMediaDatasourceImplementation(i.get())),
    Bind((i) => http.Client()),
    Bind((i) => HttpClientImplementation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/picture', child: (_, __) => PicturePage()),
  ];
}
