class SplashState {
  final bool isLoading;
  final String? errorMessage;

  SplashState({this.isLoading = false, this.errorMessage});

  SplashState copyWith({bool? isLoading, String? errorMessage}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
