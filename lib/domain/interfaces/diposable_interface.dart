/// A class which implements [Disposable] can be disposed automatically
/// once user leaves a Module
//ignore:one_member_abstracts
abstract class IDisposable {
  /// Disposes controllers, streams, etc.
  void dispose();
}
