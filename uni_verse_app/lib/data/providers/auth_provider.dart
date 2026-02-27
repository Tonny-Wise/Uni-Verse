import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile.dart';

/// Supabase client provider
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// Auth state provider - watches Supabase auth state
final authStateProvider = StreamProvider<User?>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client.auth.onAuthStateChange.map((event) => event.session?.user);
});

/// Current user provider
final currentUserProvider = FutureProvider<UserProfile?>((ref) async {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return null;

  final client = ref.watch(supabaseClientProvider);
  final response = await client
      .from('profiles')
      .select('*, university:universities(*)')
      .eq('id', user.id)
      .single();

  return UserProfile.fromJson(response);
});

/// Auth repository for auth operations
class AuthRepository {
  final SupabaseClient _client;

  AuthRepository(this._client);

  /// Sign up with email and password
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String username,
    required String universityId,
    required String course,
    required int year,
  }) async {
    // Create auth user
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user != null) {
      // Create profile
      await _client.from('profiles').insert({
        'id': response.user!.id,
        'email': email,
        'name': name,
        'username': username,
        'university_id': universityId,
        'course': course,
        'year': year,
      });
    }

    return response;
  }

  /// Sign in with email and password
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Get current session
  Session? get currentSession => _client.auth.currentSession;

  /// Get current user
  User? get currentUser => _client.auth.currentUser;
}

/// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthRepository(client);
});

/// Sign in state notifier for handling sign in UI state
class SignInNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _repository;

  SignInNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.signIn(email: email, password: password);
    });
  }
}

final signInProvider =
    StateNotifierProvider<SignInNotifier, AsyncValue<void>>((ref) {
  return SignInNotifier(ref.watch(authRepositoryProvider));
});

/// Sign up state notifier
class SignUpNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _repository;

  SignUpNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String username,
    required String universityId,
    required String course,
    required int year,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.signUp(
        email: email,
        password: password,
        name: name,
        username: username,
        universityId: universityId,
        course: course,
        year: year,
      );
    });
  }
}

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, AsyncValue<void>>((ref) {
  return SignUpNotifier(ref.watch(authRepositoryProvider));
});
