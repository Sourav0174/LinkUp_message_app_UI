import 'package:bloc/bloc.dart';
import 'package:linkup/domain/constants/cubits/theme_state.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(LightThemeStates());

  void toggletheme() {
    if (state is LightThemeStates) {
      emit(DarkThemeStates());
    } else {
      emit(LightThemeStates());
    }
  }
}
