// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesEvent()';
}


}

/// @nodoc
class $ExpensesEventCopyWith<$Res>  {
$ExpensesEventCopyWith(ExpensesEvent _, $Res Function(ExpensesEvent) __);
}


/// @nodoc


class _Started implements ExpensesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesEvent.started()';
}


}




/// @nodoc


class _GetByDay implements ExpensesEvent {
  const _GetByDay(this.date);
  

 final  DateTime date;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetByDayCopyWith<_GetByDay> get copyWith => __$GetByDayCopyWithImpl<_GetByDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetByDay&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'ExpensesEvent.getByDay(date: $date)';
}


}

/// @nodoc
abstract mixin class _$GetByDayCopyWith<$Res> implements $ExpensesEventCopyWith<$Res> {
  factory _$GetByDayCopyWith(_GetByDay value, $Res Function(_GetByDay) _then) = __$GetByDayCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class __$GetByDayCopyWithImpl<$Res>
    implements _$GetByDayCopyWith<$Res> {
  __$GetByDayCopyWithImpl(this._self, this._then);

  final _GetByDay _self;
  final $Res Function(_GetByDay) _then;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_GetByDay(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _Insert implements ExpensesEvent {
  const _Insert(this.expense);
  

 final  ExpensesCompanion expense;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsertCopyWith<_Insert> get copyWith => __$InsertCopyWithImpl<_Insert>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Insert&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,expense);

@override
String toString() {
  return 'ExpensesEvent.insert(expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$InsertCopyWith<$Res> implements $ExpensesEventCopyWith<$Res> {
  factory _$InsertCopyWith(_Insert value, $Res Function(_Insert) _then) = __$InsertCopyWithImpl;
@useResult
$Res call({
 ExpensesCompanion expense
});




}
/// @nodoc
class __$InsertCopyWithImpl<$Res>
    implements _$InsertCopyWith<$Res> {
  __$InsertCopyWithImpl(this._self, this._then);

  final _Insert _self;
  final $Res Function(_Insert) _then;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expense = null,}) {
  return _then(_Insert(
null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as ExpensesCompanion,
  ));
}


}

/// @nodoc


class _Update implements ExpensesEvent {
  const _Update({required this.id, required this.updated});
  

 final  int id;
 final  ExpensesCompanion updated;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.id, id) || other.id == id)&&(identical(other.updated, updated) || other.updated == updated));
}


@override
int get hashCode => Object.hash(runtimeType,id,updated);

@override
String toString() {
  return 'ExpensesEvent.update(id: $id, updated: $updated)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $ExpensesEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 int id, ExpensesCompanion updated
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? updated = null,}) {
  return _then(_Update(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as ExpensesCompanion,
  ));
}


}

/// @nodoc


class _Delete implements ExpensesEvent {
  const _Delete(this.id);
  

 final  int id;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ExpensesEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $ExpensesEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Delete(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteAll implements ExpensesEvent {
  const _DeleteAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesEvent.deleteAll()';
}


}




/// @nodoc


class _DeleteByDay implements ExpensesEvent {
  const _DeleteByDay(this.date);
  

 final  DateTime date;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteByDayCopyWith<_DeleteByDay> get copyWith => __$DeleteByDayCopyWithImpl<_DeleteByDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteByDay&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'ExpensesEvent.deleteByDay(date: $date)';
}


}

/// @nodoc
abstract mixin class _$DeleteByDayCopyWith<$Res> implements $ExpensesEventCopyWith<$Res> {
  factory _$DeleteByDayCopyWith(_DeleteByDay value, $Res Function(_DeleteByDay) _then) = __$DeleteByDayCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class __$DeleteByDayCopyWithImpl<$Res>
    implements _$DeleteByDayCopyWith<$Res> {
  __$DeleteByDayCopyWithImpl(this._self, this._then);

  final _DeleteByDay _self;
  final $Res Function(_DeleteByDay) _then;

/// Create a copy of ExpensesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_DeleteByDay(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ExpensesState {

 ExpensesStatus get status; List<Expense> get expenses; String get error;
/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesStateCopyWith<ExpensesState> get copyWith => _$ExpensesStateCopyWithImpl<ExpensesState>(this as ExpensesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.expenses, expenses)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(expenses),error);

@override
String toString() {
  return 'ExpensesState(status: $status, expenses: $expenses, error: $error)';
}


}

/// @nodoc
abstract mixin class $ExpensesStateCopyWith<$Res>  {
  factory $ExpensesStateCopyWith(ExpensesState value, $Res Function(ExpensesState) _then) = _$ExpensesStateCopyWithImpl;
@useResult
$Res call({
 ExpensesStatus status, List<Expense> expenses, String error
});




}
/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._self, this._then);

  final ExpensesState _self;
  final $Res Function(ExpensesState) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? expenses = null,Object? error = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExpensesStatus,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _ExpensesState implements ExpensesState {
  const _ExpensesState({this.status = ExpensesStatus.fetching, final  List<Expense> expenses = const [], this.error = ""}): _expenses = expenses;
  

@override@JsonKey() final  ExpensesStatus status;
 final  List<Expense> _expenses;
@override@JsonKey() List<Expense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

@override@JsonKey() final  String error;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensesStateCopyWith<_ExpensesState> get copyWith => __$ExpensesStateCopyWithImpl<_ExpensesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_expenses),error);

@override
String toString() {
  return 'ExpensesState(status: $status, expenses: $expenses, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ExpensesStateCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
  factory _$ExpensesStateCopyWith(_ExpensesState value, $Res Function(_ExpensesState) _then) = __$ExpensesStateCopyWithImpl;
@override @useResult
$Res call({
 ExpensesStatus status, List<Expense> expenses, String error
});




}
/// @nodoc
class __$ExpensesStateCopyWithImpl<$Res>
    implements _$ExpensesStateCopyWith<$Res> {
  __$ExpensesStateCopyWithImpl(this._self, this._then);

  final _ExpensesState _self;
  final $Res Function(_ExpensesState) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? expenses = null,Object? error = null,}) {
  return _then(_ExpensesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExpensesStatus,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
