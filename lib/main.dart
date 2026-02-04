import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

// Repositories
import 'data/repositories/hero_repository.dart';

// Logic
import 'logic/cubits/pinned_hero_cubit.dart';
import 'logic/cubits/main_hero_pool_cubit.dart';
import 'logic/cubits/hero_library_cubit.dart';
import 'logic/cubits/counter_picker_cubit.dart';

// Presentation
import 'core/theme/app_theme.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  // ۱. حیاتی برای جلوگیری از ارور Could not prepare isolate
  WidgetsFlutterBinding.ensureInitialized();
  
  // ۲. تنظیم حافظه دائمی برای HydratedBloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ۳. حل ارور ProviderNotFound با قرار دادن ریپازیتوری در ریشه
    return RepositoryProvider(
      create: (context) => HeroRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PinnedHeroesCubit()),
          BlocProvider(create: (context) => MainHeroPoolCubit()),
          // ۴. تزریق ریپازیتوری به Cubitهایی که به دیتابیس نیاز دارند
          BlocProvider(
            create: (context) => HeroLibraryCubit(context.read<HeroRepository>())..loadHeroes(),
          ),
          BlocProvider(
            create: (context) => CounterPickerCubit(context.read<HeroRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'MLBB Draft',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}