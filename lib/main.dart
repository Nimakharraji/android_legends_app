import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

// --- Imports: Logic ---
import 'logic/cubits/pinned_hero_cubit.dart';
import 'logic/cubits/main_hero_pool_cubit.dart';
import 'logic/cubits/hero_library_cubit.dart';

// --- Imports: Presentation ---
import 'core/theme/app_theme.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // تنظیم حافظه دائمی (حل ارور Setter در تصاویر قبلی)
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // حل ارور ProviderNotFound (تصویر 5): قرار دادن Cubitها در ریشه
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PinnedHeroesCubit()),
        BlocProvider(create: (_) => MainHeroPoolCubit()),
        BlocProvider(create: (_) => HeroLibraryCubit()..loadHeroes()),
      ],
      child: MaterialApp(
        title: 'Free Iran MLBB',
        debugShowCheckedModeBanner: false, // حذف بنر دیباگ
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}