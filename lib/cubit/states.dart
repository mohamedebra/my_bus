abstract class AppStates {}

class Appintionlstates extends AppStates{}

class AppChangeBottonSheet extends AppStates {}

class AppInsertDataBaseStates extends AppStates{}

class AppGetDataBaseLodingStates extends AppStates{}

class AppGetDataBaseStates extends AppStates{}

class AppCreateDataBaseStates extends AppStates{}

class AppLoction extends AppStates{}

class gettext extends AppStates{}

class gettexterror extends AppStates{}

class Getbus extends AppStates{}

class AppRegister extends AppStates{}

class AppRegesterScussesState extends AppStates{}

class AppRegesterErrorState extends AppStates{
  final String error;
  AppRegesterErrorState(this.error);
}

class AppCreateRegisterError extends AppStates{
  final String error;
  AppCreateRegisterError(this.error);
}
class AppLoginErrorState extends AppStates{
  final String error;
  AppLoginErrorState(this.error);
}

class AppLoginLodingState extends AppStates{}
class AppLoginScussesState extends AppStates{

}

class AppImageSucsessState extends AppStates{}

class AppCreateRegisterSuccessstate extends AppStates{}

class AppImageErorrState extends AppStates{}

class ChangeIcon extends AppStates{}
