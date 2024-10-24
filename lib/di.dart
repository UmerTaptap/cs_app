import 'package:cs_app/config/stt/stt_provider.dart';
import 'package:cs_app/config/tts/tts_provider.dart';
import 'package:cs_app/core/globals/blocs/theme/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'config/network/api.dart';
import 'core/managers/sf_manager.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/repository/home_repository.dart';

final GetIt sl = GetIt.instance;

Future<void> initDI() async {

  // Singletons
  //TtsProvider ttsProvider = TtsProvider();
  //SttProvider sttProvider = SttProvider();
  SfManager sfManager = SfManager();
  //await ttsProvider.init();
  //await sttProvider.init();
  await sfManager.init();

  // Configs
  sl.registerSingleton<Api>(Api());



  // Repositories
  sl.registerFactory<HomeRepository>(() => HomeRepository(sl<Api>()));



  // Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl<HomeRepository>()));





  // Global Blocs
  sl.registerFactory<ThemeBloc>(() => ThemeBloc());
}