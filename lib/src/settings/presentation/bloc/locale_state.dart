
class LocalState {
  final String language;
  final bool isLogin;
  final bool isFirstTime;
  final bool isLoading;

  LocalState({
    this.language = 'en',
    this.isLogin = false,
    this.isFirstTime = true,
    this.isLoading = true,
  });
}

class LoadingState{
  LoadingState();
}