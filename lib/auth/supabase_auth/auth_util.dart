import '/backend/supabase/supabase.dart';
import 'supabase_auth_manager.dart';
import 'supabase_user_provider.dart';

export 'supabase_auth_manager.dart';

final _authManager = SupabaseAuthManager();
SupabaseAuthManager get authManager => _authManager;

String get currentUserEmail => currentUser?.email ?? '';

String get currentUserUid => currentUser?.uid ?? '';

String get currentUserDisplayName => currentUser?.displayName ?? '';

String get currentUserPhoto => currentUser?.photoUrl ?? '';

String get currentPhoneNumber => currentUser?.phoneNumber ?? '';

String get currentJwtToken => _currentJwtToken ?? '';

bool get currentUserEmailVerified => currentUser?.emailVerified ?? false;

/// Create a Stream that listens to the current user's JWT Token.
String? _currentJwtToken;
final jwtTokenStream = SupaFlow.client.auth.onAuthStateChange
    .map(
      (authState) {
        _currentJwtToken = authState.session?.accessToken;
        print('JWT Token updated: ${_currentJwtToken != null ? "Present" : "Null"}');
        return _currentJwtToken;
      },
    )
    .asBroadcastStream();

/// Initialize JWT token on app start
void initializeJwtToken() {
  final session = SupaFlow.client.auth.currentSession;
  _currentJwtToken = session?.accessToken;
  print('JWT Token initialized: ${_currentJwtToken != null ? "Present" : "Null"}');
}
