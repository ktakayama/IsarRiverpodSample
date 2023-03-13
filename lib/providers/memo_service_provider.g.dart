// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memoServiceHash() => r'752b09475d6cd85496932dc579f214d97d0bdddd';

/// See also [memoService].
@ProviderFor(memoService)
final memoServiceProvider = FutureProvider<MemoService>.internal(
  memoService,
  name: r'memoServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$memoServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemoServiceRef = FutureProviderRef<MemoService>;
String _$memoDetailHash() => r'32b6b832d2b6ca4a24933ca9f031c99bda5ae100';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef MemoDetailRef = AutoDisposeStreamProviderRef<Memo>;

/// See also [memoDetail].
@ProviderFor(memoDetail)
const memoDetailProvider = MemoDetailFamily();

/// See also [memoDetail].
class MemoDetailFamily extends Family<AsyncValue<Memo>> {
  /// See also [memoDetail].
  const MemoDetailFamily();

  /// See also [memoDetail].
  MemoDetailProvider call(
    int id,
  ) {
    return MemoDetailProvider(
      id,
    );
  }

  @override
  MemoDetailProvider getProviderOverride(
    covariant MemoDetailProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'memoDetailProvider';
}

/// See also [memoDetail].
class MemoDetailProvider extends AutoDisposeStreamProvider<Memo> {
  /// See also [memoDetail].
  MemoDetailProvider(
    this.id,
  ) : super.internal(
          (ref) => memoDetail(
            ref,
            id,
          ),
          from: memoDetailProvider,
          name: r'memoDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memoDetailHash,
          dependencies: MemoDetailFamily._dependencies,
          allTransitiveDependencies:
              MemoDetailFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is MemoDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$memoListHash() => r'14b7343683089a1e86b305a916de6c699aa7fb51';

/// See also [memoList].
@ProviderFor(memoList)
final memoListProvider = AutoDisposeStreamProvider<List<Memo>>.internal(
  memoList,
  name: r'memoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$memoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemoListRef = AutoDisposeStreamProviderRef<List<Memo>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
