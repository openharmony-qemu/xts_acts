'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
 function processInTaskPool(resource: NativeResource): NativeResource {
  resource.value *= 2;
  return resource;
}

console.log("TC_LOADLIB_002 before loadLibrary");
loadLibrary("entry");
console.log("TC_LOADLIB_002 after loadLibrary");
native function add(a: int, b: int): int;
native function getLoadLibNativeCallCount(): int;
native function test_ErrorAdd(a: int, b: int): int;
native function test_SimulateFindClassFailure(): string;
export enum COLOR {
  RED = 1,
  GREEN = 2
}
export interface TypeIntObject {
  value: int;
}
export namespace Convert {
  export native function toUpper(str: string): string;
}
native function test_ProcessColorNative(color: COLOR): int;
export class Person {
  name: string = '';
  age: int = 0;
  constructor(name: string = '', age: int = 0) {
    this.name = name;
    this.age = age;
  }
}
export interface CanRun {
  run(): boolean;
}
export class Runner implements CanRun {
  run(): boolean {
    return true;
  }
}
export class A {
  value: int = 0;
  constructor(value: int = 0) {
    this.value = value;
  }
}
export interface I1 {
  tag1(): string;
}
export interface I2 {
  tag2(): string;
}
export class I1Impl implements I1 {
  tag1(): string {
    return 'I1';
  }
}
export class I2Impl implements I2 {
  tag2(): string {
    return 'I2';
  }
}
export class MyClass {
  value: int = 0;
  constructor(value: int = 0) {
    this.value = value;
  }
}
export interface User {
  name?: string;
  age?: int;
}
export enum TypeColor {
  RED = 0,
  GREEN = 1,
  BLUE = 2
}
export interface ParamI {
  getName(): string;
}
export class ParamC implements ParamI {
  name: string = 'ParamC';
  constructor(name: string = 'ParamC') {
    this.name = name;
  }
  getName(): string {
    return this.name;
  }
}
export class ParamOtherI implements ParamI {
  name: string = 'ParamOtherI';
  constructor(name: string = 'ParamOtherI') {
    this.name = name;
  }
  getName(): string {
    return this.name;
  }
}
export interface CreateInterface {
  foo(): void;
}
export abstract class CreateAbstractBase {
  abstract bar(): void;
}
export enum CreateColor {
  RED = 0,
  GREEN = 1,
  BLUE = 2
}
export enum CreateStatus {
  OK = 200,
  NOT_FOUND = 404
}
export interface PointI {
  x: int;
  y: int;
}
export class PointIImpl implements PointI {
  x: int = 0;
  y: int = 0;
  constructor(x: int = 0, y: int = 0) {
    this.x = x;
    this.y = y;
  }
}
export interface IfacePropI {
  prop: int;
}
export class IfacePropC implements IfacePropI {
  prop: int = 0;
  constructor(prop: int = 0) {
    this.prop = prop;
  }
}
export class IfacePoint {
  x: int = 0;
  y: int = 0;
  constructor(x: int = 0, y: int = 0) {
    this.x = x;
    this.y = y;
  }
}
export class IfacePerson {
  private _age: int = 0;
  constructor(age: int = 0) {
    this._age = age;
  }
  get age(): int {
    return this._age;
  }
  set age(v: int) {
    this._age = v;
  }
}
export class IfacePersonName {
  name: string = '';
  constructor(name: string = '') {
    this.name = name;
  }
}
export class IfaceCounter {
  static count: int = 0;
}
export class IfaceManagedFoo {
  called: boolean = false;
  managedFunc(): void {
    this.called = true;
    console.log('called');
  }
  add(a: int, b: int): int {
    return a + b;
  }
  static square(x: int): int {
    return x * x;
  }
}
export class OptionalClass {
  fn?: (a: double, b: double) => double = (a: double, b: double): double => {
    return a + b;
  };
}
export class IfaceGetterNamePerson {
  get name(): string {
    return 'John';
  }
}
export interface IfaceBase {
  id: int;
}
export interface IfaceDerived extends IfaceBase {
  name: string;
}
export class IfaceDerivedImpl implements IfaceDerived {
  id: int = 0;
  name: string = '';
  constructor(id: int = 0, name: string = '') {
    this.id = id;
    this.name = name;
  }
}
export interface Animal {
  speak(): string;
}
export class Dog implements Animal {
  speak(): string {
    return 'Woof';
  }
}
export class FuncPerson {
  name: string = '';
  constructor(name: string = '') {
    this.name = name;
  }
}
export class ArrayPoint {
  x: int = 0;
  constructor(x: int = 0) {
    this.x = x;
  }
}
export enum COLORINT {
  REDINT = 5,
  GREENINT = 77,
  BLUEINT = 9999
}
export enum COLORSTRING {
  REDSTR = 'str_red',
  GREENSTR = 'str_green',
  BLUESTR = 'str_blue',
  CHNSTR = '中文测试😀'
}
export namespace EnumNamespace {
  export enum NsColorInt {
    REDINT = 11,
    GREENINT = 22,
    BLUEINT = 33
  }
}
export class ErrorCodeOverload {
  native foo(i: int): void;
  native foo(d: number): void;
}
export class FaqMismatch {
  foo(): void {
    console.log('FaqMismatch.foo called');
  }
}
export class PersonInfo {
  name: string = '';
  age: number = 0;
  constructor(name: string = '', age: number = 0) {
    this.name = name;
    this.age = age;
  }
}
export class MyError extends Error {
  constructor(msg: string) {
    super(msg);
  }
}
export namespace OptNamespace {
  @ani.unsafe.Quick
  export native function test_OptNamespaceQuickAdd(a: int, b: int): int;
}
export class Foo {
  native test_InstanceAdd(value: int): int;
  static native test_StaticSquare(value: int): int;
  native test_Overload(): int;
  native test_Overload(value: string): int;
  test_CallInstanceAdd(value: int): int {
    return this.test_InstanceAdd(value);
  }
  test_CallStaticSquare(value: int): int {
    return Foo.test_StaticSquare(value);
  }
  test_CallOverloadVoid(): int {
    return this.test_Overload();
  }
  test_CallOverloadString(value: string): int {
    return this.test_Overload(value);
  }
  test_Add(a: int, b: int): int {
    return add(a, b);
  }
  test_GetLoadLibNativeCallCount(): int {
    return getLoadLibNativeCallCount();
  }
  test_ErrorAdd(a: int, b: int): int {
    return test_ErrorAdd(a, b);
  }
  test_SimulateFindClassFailure(): string {
    return test_SimulateFindClassFailure();
  }
  factor: int = 2;
  native test_Multiply(a: int): int;
  static native test_Square(x: int): int;
  test_ToUpper(str: string): string {
    return Convert.toUpper(str);
  }
  test_ProcessColor(color: COLOR): int {
    return test_ProcessColorNative(color);
  }
  native test_FooOverload(): void;
  native test_FooOverload(str: string): void;
  native test_CheckFooOverload(): boolean;
  native test_Log(level: int, msg: string = 'info'): void;
  native test_CheckLog(): boolean;
  native test_SumDouble(a: double, b: double): double;
  native test_ManglingConcat(a: string, b: string): string;
  native test_IsEqual(a: boolean, b: boolean): boolean;
  native test_FuncPrimitive(
    a: boolean,
    b: byte,
    c: char,
    d: short,
    e: int,
    f: long,
    g: float,
    h: double
  ): double;
  native test_UseNumber(num: number): number;
  native test_UseDouble(num: double): double;
  native test_RequiredInt(a: int): void;
  native test_OptionalInt(a?: int): void;
  native test_CheckOptionalInt(): boolean;
  native test_ProcessPerson(p: Person): string;
  native test_CheckRun(c: CanRun): boolean;
  native test_ManglingConcatString(a: string, b: string): string;
  native test_AddBigInt(a: bigint, b: bigint): bigint;
  native test_SumArray(arr: number[]): number;
  native test_SumArray2(arr: Array<number>): number;
  native test_SumIntValueArray(arr: ValueArray<int>): int;
  native test_ProcessNested(arr: FixedArray<ValueArray<int>>): int;
  native test_ProcessUnion(u: string | number | undefined): string;
  native test_ComplexOptional(a: int, b?: int, c?: string, d?: A): void;
  native test_CheckComplexOptional(): boolean;
  native test_OptionalBasicAndRef(a?: int, b?: string, c?: A): void;
  native test_CheckOptionalBasicAndRef(): boolean;
  native test_RestLog(prefix: string, ...args: int[]): void;
  native test_CheckRestLog(): boolean;
  native test_ExecFunction(
    f: () => void,
    g: () => string,
    h: (x: int, ...y: int[]) => string
  ): void;
  native test_CheckExecFunction(): boolean;
  native test_GenericFunc<T extends I1 | I2>(arg: T): T;
  native test_DoNothing(): void;
  native test_CheckDoNothing(): boolean;
  native test_DoNothingAgain(): void;
  native test_CheckDoNothingAgain(): boolean;
  native test_UseMyClass(c: MyClass): void;
  native test_CheckUseMyClass(): boolean;
  native test_ProcessMatrix(mat: FixedArray<ValueArray<int>>): int;
  native test_UpdateUser(partial: Partial<User>): void;
  native test_CheckUpdateUser(): boolean;
  native test_IsPositive(num: int): boolean;
  native test_GetCharCode(c: char): int;
  native test_EchoByte(value: byte): byte;
  native test_EchoShort(value: short): short;
  native test_EchoInt(value: int): int;
  native test_EchoLong(value: long): long;
  native test_EchoFloat(value: float): float;
  native test_EchoDouble(value: double): double;
  native test_ProcessNumber(value: number): number;
  native test_CreateGreeting(name: string): string;
  native test_WriteToBuffer(buffer: ArrayBuffer, offset: int, value: int): void;
  native test_TypeSumArray(array: number[]): number;
  native test_CastStringToArray(str: string): void;
  native test_IdentifyString(data: string | ArrayBuffer): string;
  native test_IdentifyArrayBuffer(data: string | ArrayBuffer): string;
  native test_CallWithCallback(cb: () => string): string;
  native test_GetEnumValue(color: TypeColor): int;
  native test_ParamBoxInt(value: int): object;
  native test_ParamBoxDouble(value: double): object;
  native test_ParamBoxBoolean(value: boolean): object;
  native test_ParamCreateDoubleBoxed(value: double): object;
  native test_ParamUnboxDouble(boxed: object): double;
  native test_ParamUnboxWithMethod(boxed: object): double;
  native test_ParamWrongUnbox(boxed: object): int;
  native test_ParamIdentify(arg: number | string): string;
  native test_ParamHandleCI(arg: ParamC | ParamI): string;
  native test_ParamGreet(name?: string, age?: int): string;
  native test_ParamCheckOptional(arg?: int): boolean;
  native test_ParamProcessOrUndefined(arg?: number): string;
  native test_ParamProcessComplexUnion(arg?: string | number): string;
  native test_ParamFastBoxPerf(count: int): long;
  native test_ParamTraditionalBoxPerf(count: int): long;
  native test_ParamFastUnboxPerf(count: int): long;
  native test_ParamMethodUnboxPerf(count: int): long;
  native test_CreateArrayBufferIsView(value: object): boolean;
  native test_CreateArrayBufferByLength(length: int): int;
  native test_CreateDoubleObject(value: double): double;
  native test_CreateInterfaceFail(): void;
  native test_CreateAbstractFail(): void;
  native test_CreateStringByObjectNew(): void;
  native test_CreateStringByUtf8(value: string): string;
  native test_CreateValueArrayByObjectNew(): void;
  native test_CreateValueArrayBySpecialApi(): int;
  native test_CreateEnumItemByName(): string;
  native test_CreateEnumItemIntValue(): int;
  native test_CreateGetByteLength(length: int): int;
  native test_CreateFindMissing(): void;
  native test_CreateFindStaticMethod(value: object): boolean;
  native test_CreateFindInstanceMethod(length: int): int;
  native test_IfaceObjectNewInterfaceFail(): boolean;
  native test_IfaceReadPointLiteral(p: PointI): int;
  native test_IfacePropertyAccess(obj: IfacePropC): boolean;
  native test_IfaceFieldAccess(point: IfacePoint): int;
  native test_IfaceGetterSetterAccess(person: IfacePerson): int;
  native test_IfaceRefPropertyAccess(person: IfacePersonName): string;
  native test_IfaceStaticFieldAccess(): int;
  native test_IfaceCallManagedFunc(obj: IfaceManagedFoo): boolean;
  native test_IfaceCallAdd(obj: IfaceManagedFoo, a: int, b: int): int;
  native test_IfaceCallStaticSquare(x: int): int;
  native test_IfaceCallOptionalFn(obj: OptionalClass): double;
  native test_IfaceModifyPoint(p: PointI): int;
  native test_IfaceCreateWrapper(): object;
  native test_IfaceUseWrapper(obj: object): int;
  native test_IfaceDeleteWrapper(obj: object): boolean;
  native test_IfaceWrapperWithoutFinalizer(): boolean;
  native test_IfaceCleanupNativeData(): boolean;
  native test_IfaceWrongPropertyAccess(data: IfacePoint): boolean;
  native test_IfaceWrongFieldAccess(person: IfaceGetterNamePerson): boolean;
  native test_IfaceReadDerived(obj: IfaceDerived): string;
  native test_IfaceCallAnimalSpeak(animal: Animal): string;
  native test_FuncCallCallback(cb: () => void): boolean;
  native test_FuncCallAdd(cb: (a: int, b: int) => int, a: int, b: int): int;
  native test_FuncCallMultiplyDouble(cb: (x: double, y: double) => double): double;
  native test_FuncCallGreeting(cb: (name: string) => string): string;
  native test_FuncCallPersonName(cb: (p: FuncPerson) => string, p: FuncPerson): string;
  native test_FuncCallArgMismatch(cb: (a: int, b: int) => int): boolean;
  native test_FuncCallClosure(cb: (x: int) => int): int;
  native test_FuncReuseCallback(cb: (value: int) => int): int;
  native test_FuncCatchThrown(cb: () => void): boolean;
  native test_FuncPersistentCallback(cb: () => string): string;
  native test_FuncRestCallback(cb: (...args: int[]) => int): int;
  native test_AsyncHeavyTask(input: int): int;
  native test_AsyncHeavyTaskStatus(input: int): boolean;
  native test_AsyncCompute(input: int): int;
  native test_AsyncSaveData(data: string): void;
  native test_AsyncCheckSaveData(data: string): boolean;
  native test_AsyncStringTask(param: string): boolean;
  native test_AsyncLongRunningTask(input: int): int;
  native test_AsyncWorkLegacy(input: int): Promise<int>;
  native test_AsyncWorkThrowWithoutCatch(): Promise<int>;
  native test_AsyncRaceIncrement(): int;
  native test_AsyncGetRaceCounter(): int;
  native test_AsyncResetRaceCounter(): void;
  native test_AsyncDoubleTask(input: double): double;
  native test_AsyncShortTask(input: int): int;
  native test_AsyncGetUniqueId(): int;
  native test_AsyncStoreCallback(callback: (value: int) => void): boolean;
  native test_AsyncTriggerStoredCallback(value: int): boolean;
  native test_AsyncThrowInCompleteNoCatch(): Promise<int>;
  native test_AsyncThrowInCompleteWithCatch(): Promise<int>;
  native test_AsyncHeavyTaskSync(input: int): int;
  native test_AsyncCancelableLongTask(input: int): int;
  native test_AsyncFibonacci(n: int): int;
  native test_AsyncSerialFibonacci(n: int, count: int): int;
  native test_AsyncWorkLegacyLoop(input: int): Promise<int>;
  native test_AsyncTaskpoolCompare(input: int): int;
  native test_AsyncWorkExecuteThrow(): Promise<int>;
  native test_AsyncLockedTask(input: int): int;
  native test_MtCreateAndResolvePromise(): Promise<int>;
  native test_MtCreateAndRejectPromise(): Promise<int>;
  native test_MtAsyncWorkInThread(): Promise<int>;
  native test_MtCompute(input: int): int;
  native test_MtUseVmAttachThread(): boolean;
  native test_MtAttachGetEnvSame(): boolean;
  native test_MtAttachWithoutDetach(count: int): boolean;
  native test_MtLocalRefWithoutScope(count: int): boolean;
  native test_MtLocalRefWithScope(count: int): boolean;
  native test_MtConcurrentAttachCounter(threadCount: int, increment: int): int;
  native test_MtResolvePromiseOnOtherThread(): Promise<int>;
  native test_MtTaskpoolSafeAdd(value: int): int;
  native test_MtFindClassInNativeThread(): int;
  native test_ArrayCreateEmpty(): Array<object>;
  native test_ArrayGetLength(array: Array<object>): int;
  native test_ArrayCreateAndSetGet(): Array<object>;
  native test_ArrayCheckIntElements(array: Array<object>): boolean;
  native test_ArrayPushDouble(): Array<object>;
  native test_ArrayPop(): int;
  native test_ArrayPopEmptyIsUndefined(): boolean;
  native test_ArrayMixedTypes(): Array<object>;
  native test_ArrayNewWithUndefined(): boolean;
  native test_ArrayDoublePrecisionSum(): double;
  native test_ArrayModifyIndexOne(array: Array<object>): boolean;
  native test_ArrayPushPopMixed(): boolean;
  native test_ArrayPushMany(count: int): int;
  native test_ArrayNewInvalidLength(): boolean;
  native test_ArrayNullAndUndefined(): boolean;
  native test_ArrayTraverseSum(): int;
  native test_ArrayCreateMatrix(): Array<object>;
  native test_ArrayCheckMatrix(matrix: Array<object>): boolean;
  native test_FixedArrayString(): FixedArray<string>;
  native test_CheckFixedArrayString(array: FixedArray<string>): boolean;
  native test_FixedArrayObjectRefs(): FixedArray<object>;
  native test_CheckFixedArrayObjectRefs(array: FixedArray<object>): boolean;
  native test_ValueArrayDifferentTypes(): boolean;
  native test_ValueArrayTypeMismatch(): boolean;
  native test_ValueArrayGetPartialRegion(): boolean;
  native test_ValueArraySetPartialRegion(): boolean;
  native test_ValueArrayRegionOutOfRange(): boolean;
  native test_ValueArrayGetSize(): int;
  native test_ValueArrayElementAccess(): boolean;
  native test_ValueArrayLargeArray(length: int): boolean;
  native test_ValueArrayGetRegionNullBuffer(): boolean;
  native test_ValueArraySetRegionNullBuffer(): boolean;
  native test_ValueArrayWrongRegionApi(): boolean;
  native test_ValueArraySaveLocalRef(): boolean;
  native test_ValueArrayUseSavedLocalRef(): boolean;
  native test_ValueArraySaveGlobalRef(): boolean;
  native test_ValueArrayUseGlobalRef(): boolean;
  native test_ValueArrayDeleteGlobalRef(): boolean;
  native test_ArrayBufferReadUint32(buffer: ArrayBuffer): int;
  native test_ArrayBufferModifyUint32(buffer: ArrayBuffer): void;
  native test_ArrayBufferGetSize(buffer: ArrayBuffer): int;
  native test_ArrayBufferExpectBuffer(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferDetached(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferReadRawBytes(buffer: ArrayBuffer): int;
  native test_ArrayBufferModifyByte(buffer: ArrayBuffer, offset: int, value: int): boolean;
  native test_ArrayBufferWriteWithBoundsCheck(buffer: ArrayBuffer, offset: int, value: int): boolean;
  native test_ArrayBufferZeroSize(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferTypedSignature(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferSaveDataPointer(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferUseSavedPointer(): int;
  native test_ArrayBufferCreateNative(size: int): ArrayBuffer;
  native test_ArrayBufferLargeBuffer(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferMultiThreadWrite(buffer: ArrayBuffer, threadCount: int, increment: int): int;
  native test_ArrayBufferFillBytes(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferModifyTypedArrayBuffer(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferEmptyNoCrash(buffer: ArrayBuffer): boolean;
  native test_ArrayBufferReadUnalignedUint32(buffer: ArrayBuffer): int;
  native test_EnumGetGreenIntByName(): int;
  native test_EnumGetGreenIntByIndexCompare(): boolean;
  native test_EnumGetBlueIntIndex(): int;
  native test_EnumGetGreenIntName(): string;
  native test_EnumGetEnumFromItem(): boolean;
  native test_EnumGetColorStringValue(): string;
  native test_EnumFindModuleEnum(): int;
  native test_EnumFindNamespaceEnum(): int;
  native test_EnumProcessIntNext(color: COLORINT): COLORINT;
  native test_EnumReturnBlueInt(): COLORINT;
  native test_EnumFindMissingEnum(): boolean;
  native test_EnumFindMissingItem(): boolean;
  native test_EnumGetItemByOutOfRangeIndex(): boolean;
  native test_EnumGetLargeIntValue(): int;
  native test_EnumGetUnicodeStringValue(): string;
  native test_EnumGetOtherItemFromInput(color: COLORINT): COLORINT;
  native test_EnumFindAfterLoadLibrary(): boolean;
  native test_EnumComputeValue(color: COLORINT): int;
  native test_EnumFindByDescriptorFormats(): boolean;
  native test_ErrorCodeNullEnv(): boolean;
  native test_ErrorCodePendingErrorInfo(): boolean;
  native test_ErrorCodePendingErrorPropagation(): boolean;
  native test_ErrorCodeNormalAfterCatch(): int;
  native test_ErrorCodeNotFound(): boolean;
  native test_ErrorCodeDescriptorMismatch(): boolean;
  native test_ErrorCodeAmbiguousFindMethod(): boolean;
  native test_ErrorCodeArrayOutOfRange(): boolean;
  native test_ErrorCodeBufferTooSmall(): boolean;
  native test_ErrorCodeInvalidVersion(): boolean;
  native test_ErrorCodeInvalidDescriptor(): boolean;
  native test_ErrorCodeAlreadyBinded(): boolean;
  native test_FaqBusinessErrorConflict(): boolean;
  native test_FaqDeclarationMismatch(): boolean;
  native test_FaqBooleanPrint(): boolean;
  native test_FaqBoxPrimitiveToRef(value: int): boolean;
  native test_FaqNativeFunctionAddressReuse(): boolean;
  native test_FaqCompareFunctions(a: () => void, b: () => void): boolean;
  native test_FaqReferenceStrictEquals(): boolean;
  native test_FaqUtf8SubStringTruncate(): boolean;
  native test_FaqPromiseVoidResolve(): Promise<boolean>;
  native test_FaqNamespaceOptionalParam(bar?: int): boolean;
  native test_FaqNamespaceUnionParam(arg: string | number): boolean;
  native test_FaqUnboundNative(): void;
  native test_FaqRecordKeysAmbiguous(): boolean;
  test_ErrorCodeThrowManaged(): void {
    throw new Error('Managed error for ANI_PENDING_ERROR test');
  }
  native test_LifecycleCreateGlobalObject(): boolean;
  native test_LifecycleUseGlobalObject(): int;
  native test_LifecycleDeleteGlobalObject(): boolean;
  native test_LifecycleCreateLeakedGlobalRefs(count: int): int;
  native test_LifecycleNativeThreadLocalRefsWithScope(count: int): boolean;
  native test_LifecycleArkCallLocalRefsAutoManaged(count: int): boolean;
  native test_LifecycleGetVmAndGetEnv(): boolean;
  native test_LifecycleAttachThenGetEnvSame(): boolean;
  native test_LifecycleGetEnvWithoutAttach(): boolean;
  native test_LifecycleFindAppClassInAttachedThread(): boolean;
  native test_LifecycleUseCachedClassInAttachedThread(): boolean;
  native test_LifecycleAttachWithInteropOption(): boolean;
  native test_LifecycleCreateVmWithLoggerOption(): boolean;
  native test_LifecycleCreateVmWithVerifyAniNoCrashOption(): boolean;
  native test_LifecycleCreateVmWithBootPandaFiles(): boolean;
  native test_LifecycleAttachWithBootPandaFilesOption(): boolean;
  native test_LifecycleNestedLocalScopes(): boolean;
  native test_ExceptionThrowMyError(): void;
  native test_ExceptionClearPendingAndReturn(): int;
  native test_ExceptionPromiseRejectWithCatch(): Promise<int>;
  native test_ExceptionPromiseRejectWithoutCatch(): Promise<int>;
  native test_ExceptionBusinessErrorConflict(): boolean;
  native test_ExceptionClearThenCreateString(): boolean;
  native test_ExceptionNativeCatchAndAnalyze(): string;
  native test_StringAsciiRoundTrip(): boolean;
  native test_StringEmptyRoundTrip(): boolean;
  native test_StringUtf8RoundTrip(): boolean;
  native test_StringUtf8Size(): int;
  native test_StringInvalidUtf8NoCrash(): boolean;
  native test_StringLongStringRoundTrip(size: int): boolean;
  native test_StringReadTwice(value: string): boolean;
  native test_StringSmallBuffer(): boolean;
  native test_StringLocalScopeRecycle(count: int): boolean;
  native test_StringSaveGlobalRef(): boolean;
  native test_StringUseGlobalRef(): string;
  native test_StringDeleteGlobalRef(): boolean;
  native test_OptDefaultCreateString(msg: string): string;
  @ani.unsafe.Quick
  native test_OptQuickSleep(value: int): int;
  @ani.unsafe.Quick
  native test_OptQuickWithString(str: string): int;
  @ani.unsafe.Quick
  native test_OptQuickStartThread(): boolean;
  native test_OptDefaultAdd(a: int, b: int): int;
  @ani.unsafe.Quick
  native test_OptQuickCreateTempString(str: string): int;
  native testAniArrayDouble(arr: number[]): number[];
  native testAniMatrixTranspose(buf: ArrayBuffer, rows: int, cols: int): ArrayBuffer;
  native testAniXorEncrypt(buf: ArrayBuffer): boolean;
  native testAniFileCopy(srcPath: string, dstPath: string, size: long): boolean;
  native testAniSysInfo(): Object;
  native testAniCreatePhysics(gravity: number): long;
  native testAniStepPhysics(handle: long, dt: number): number;
  native testAniDestroyPhysics(handle: long): void;
  native testAniFeatureExtract(data: number[]): Object;
  native testAniErrorTrigger(): boolean;
  native testAniParallelSum(taskCount: int): Object;
  native testAniAsyncCompute(callback: Function): boolean;
  native testAniCachedLookup(): boolean;
}

// SDK 26 已移除的旧版并发容器/同步原语类型占位 shim，基于内置容器模拟等价语义。
export class ConcurrentHashMap<K, V> {
  private data: Map<K, V> = new Map<K, V>();
  constructor() {}
  size(): int {
    return this.data.size;
  }
  get(key: K): V | null {
    let value = this.data.get(key);
    if (value === undefined) {
      return null;
    }
    return value;
  }
  put(key: K, value: V): void {
    this.data.set(key, value);
  }
  remove(key: K): boolean {
    return this.data.delete(key);
  }
  containsKey(key: K): boolean {
    return this.data.has(key);
  }
}
export class ConcurrentSet<T> {
  private data: Set<T> = new Set<T>();
  constructor() {}
  size(): int {
    return this.data.size;
  }
  add(value: T): void {
    this.data.add(value);
  }
  contains(value: T): boolean {
    return this.data.has(value);
  }
  remove(value: T): boolean {
    return this.data.delete(value);
  }
}
export class ConcurrentQueue<T> {
  private data: Array<T> = [];
  constructor() {}
  size(): int {
    return this.data.length;
  }
  poll(): T | null {
    if (this.data.length == 0) {
      return null;
    }
    let value = this.data.shift();
    if (value === undefined) {
      return null;
    }
    return value;
  }
  offer(value: T): void {
    this.data.push(value);
  }
}


export class NativeResource {
  value: int = 0;
  name: string = "";

  hashCode(): int {
    return this.value;
  }

  equals(other: Object | null): boolean {
    if (other === null || other === undefined) {
      return false;
    }
    if (!(other instanceof NativeResource)) {
      return false;
    }
    let otherRes = other as NativeResource;
    return this.value === otherRes.value && this.name === otherRes.name;
  }
}

export class NativeData {
  value: int = 0;
  timestamp: long = 0;
}

export class NativeObjectHolder {
  nativeObj: NativeResource | null = null;

  native createAndStoreNativeObject(): NativeResource;
  native getNativeObjectValue(): int;
  native setNativeObjectValue(value: int): void;

  constructor() {
  }
}

export interface IResource {
  resource: NativeResource | null;
}

export class ResourceContainer implements IResource {
  resource: NativeResource | null = null;
  private _internalData: int = 0;

  native createResource(): NativeResource;
  native getResourceData(): int;

  constructor() {
  }
}

export class GlobalResourceManager {
  static sharedResource: NativeResource | null = null;

  native initSharedResource(): void;
  native getSharedResourceValue(): int;
  native updateSharedResourceValue(value: int): void;

  constructor() {
  }
}

export interface IDataHolder {
  data: NativeData | null;
}

export class DataHolderImpl implements IDataHolder {
  data: NativeData | null = null;
  extraField: int = 0;

  native createNativeData(): NativeData;
  native getDataValue(): int;

  constructor() {
  }
}

export interface IResourceCollection {
  resources: NativeResource[];
}

export class ResourceCollectionImpl implements IResourceCollection {
  resources: NativeResource[] = [];

  native addResource(resource: NativeResource): void;
  native getResourceCount(): int;
  native getResourceAtIndex(index: int): NativeResource | null;

  constructor() {
  }
}

export class ResourceMapManager {
  private resourceMap: Map<string, NativeResource> = new Map<string, NativeResource>();

  native createResourceWithKey(key: string): NativeResource;
  native addResourceToMap(key: string, resource: NativeResource): void;
  native getResourceFromMap(key: string): NativeResource | null;
  native getMapSize(): int;
  native removeResourceFromMap(key: string): boolean;

  constructor() {
  }
}

export class ResourceSetManager {
  private resourceSet: Set<NativeResource> = new Set<NativeResource>();

  native createUniqueResource(id: int): NativeResource;
  native addResourceToSet(resource: NativeResource): boolean;
  native hasResourceInSet(resource: NativeResource): boolean;
  native getSetSize(): int;
  native deleteResourceFromSet(resource: NativeResource): boolean;

  constructor() {
  }
}

export class DynamicArrayManager {
  private resourceArray: Array<NativeResource> = [];

  native createNativeResource(): NativeResource;
  native pushResourceToArray(resource: NativeResource): int;
  native popResourceFromArray(): NativeResource | null;
  native getResourceFromArray(index: int): NativeResource | null;
  native setResourceInArray(index: int, resource: NativeResource): void;
  native getArrayLength(): int;

  constructor() {
  }
}

export class FixedArrayManager {
  fixedResourceArray: FixedArray<NativeResource> | null = null;

  native createFixedArray(size: int): FixedArray<NativeResource>;
  native setResourceInFixedArray(index: int, resource: NativeResource): void;
  native getResourceFromFixedArray(index: int): NativeResource | null;
  native getFixedArrayLength(): int;

  constructor() {
  }
}

export class MixedArrayManager {
  intFixedArray: FixedArray<int> | null = null;
  refFixedArray: FixedArray<NativeResource> | null = null;

  native createIntFixedArray(size: int): FixedArray<int>;
  native createRefFixedArray(size: int): FixedArray<NativeResource>;
  native setIntValue(index: int, value: int): void;
  native getIntValue(index: int): int;
  native setNativeResource(index: int, resource: NativeResource): void;
  native getNativeResource(index: int): NativeResource | null;

  constructor() {
  }
}

export class ThreadSafeResourceManager {
  native createNativeResourceInMainThread(): NativeResource;
  native useNativeResourceInWorkerThread(resource: NativeResource): int;
  native cleanupGlobalReference(): void;

  constructor() {
  }
}

export class ConcurrentResourceManager {
  static sharedNativeResource: NativeResource | null = null;

  native initSharedNativeResource(): void;
  native incrementResourceValueInWorker(): int;
  native getResourceValue(): int;

  constructor() {
  }
}

export class TaskPoolResourceManager {
  native initTaskPoolResource(): void;
  native processResourceInTaskPool(): int;
  native getTaskPoolResult(): int;

  constructor() {
  }
}

export class LocalRefManager {
  native createManyLocalRefs(count: int): void;
  native verifyNoRefLeak(): boolean;

  constructor() {
  }
}

export class GlobalRefLifecycleManager {
  native createAndCacheGlobalRef(): NativeResource;
  native useCachedGlobalRef(): int;
  native deleteCachedGlobalRef(): void;
  native verifyGlobalRefDeleted(): boolean;

  constructor() {
  }
}

export class LocalScopeManager {
  native startBackgroundThread(): void;
  native stopBackgroundThread(): void;
  native getProcessedCount(): int;

  constructor() {
  }
}

export class PrimitiveTypeManager {
  boxedBoolean: Boolean | null = null;
  boxedChar: Int | null = null;
  boxedByte: Int | null = null;
  boxedShort: Int | null = null;
  boxedInt: Int | null = null;
  boxedLong: Long | null = null;
  boxedFloat: Float | null = null;
  boxedDouble: Double | null = null;

  native createBoxedBoolean(value: boolean): Boolean;
  native createBoxedChar(value: int): Int;
  native createBoxedByte(value: int): Int;
  native createBoxedShort(value: int): Int;
  native createBoxedInt(value: int): Int;
  native createBoxedLong(value: long): Long;
  native createBoxedFloat(value: float): Float;
  native createBoxedDouble(value: double): Double;
  native verifyBoxedBoolean(): boolean;
  native verifyBoxedChar(): int;
  native verifyBoxedByte(): int;
  native verifyBoxedShort(): int;
  native verifyBoxedInt(): int;
  native verifyBoxedLong(): long;
  native verifyBoxedFloat(): float;
  native verifyBoxedDouble(): double;

  constructor() {
  }
}

export class StringObjectManager {
  strField: string = "";

  native createUtf8String(content: string): string;
  native getStringLength(): int;
  native getSubstring(start: int, length: int): string;

  constructor() {
  }
}

export class DynamicArrayObjectManager {
  objArray: Object[] = [];

  native createObjectArray(size: int): Object[];
  native setArrayElement(index: int, value: Object): void;
  native getArrayElement(index: int): Object | null;
  native getArrayLength(): int;

  constructor() {
  }
}

export class FixedArrayTypeManager {
  intFixedArray: FixedArray<int> | null = null;
  boolFixedArray: FixedArray<boolean> | null = null;
  charFixedArray: FixedArray<int> | null = null;
  byteFixedArray: FixedArray<int> | null = null;
  shortFixedArray: FixedArray<int> | null = null;
  longFixedArray: FixedArray<long> | null = null;
  floatFixedArray: FixedArray<float> | null = null;
  doubleFixedArray: FixedArray<double> | null = null;
  refFixedArray: FixedArray<Object> | null = null;

  native createIntFixedArray(size: int): FixedArray<int>;
  native setIntRegion(start: int, count: int, values: int[]): void;
  native getIntElement(index: int): int;
  native createBooleanFixedArray(size: int): FixedArray<boolean>;
  native setBooleanElement(index: int, value: boolean): void;
  native getBooleanElement(index: int): boolean;
  native createCharFixedArray(size: int): FixedArray<int>;
  native setCharElement(index: int, value: int): void;
  native getCharElement(index: int): int;
  native createByteFixedArray(size: int): FixedArray<int>;
  native setByteElement(index: int, value: int): void;
  native getByteElement(index: int): int;
  native createShortFixedArray(size: int): FixedArray<int>;
  native setShortElement(index: int, value: int): void;
  native getShortElement(index: int): int;
  native createLongFixedArray(size: int): FixedArray<long>;
  native setLongElement(index: int, value: long): void;
  native getLongElement(index: int): long;
  native createFloatFixedArray(size: int): FixedArray<float>;
  native setFloatElement(index: int, value: float): void;
  native getFloatElement(index: int): float;
  native createDoubleFixedArray(size: int): FixedArray<double>;
  native setDoubleElement(index: int, value: double): void;
  native getDoubleElement(index: int): double;
  native createRefFixedArray(size: int): FixedArray<Object>;
  native getRefElement(index: int): Object | null;

  constructor() {
  }
}

export class ArrayBufferObjectManager {
  bufferField: ArrayBuffer | null = null;

  native createArrayBuffer(size: int): ArrayBuffer;
  native getByteLength(): int;

  constructor() {
  }
}

export class FunctionObjectManager {
  native createAndCallFunction(): double;
  native callWithCallback(callback: (x: int) => int, value: int): int;
  native storeCallback(callback: () => void): void;
  native executeStoredCallback(): void;

  constructor() {
  }
}

export class ErrorObjectManager {
  native throwCustomError(message: string): void;
  native catchAndHandleError(): string | null;

  constructor() {
  }
}

export class EnumObjectManager {
  native getEnumValueByName(enumName: string, itemName: string): int;
  native getEnumItemCount(enumName: string): int;

  constructor() {
  }
}

export class ClassObjectManager {
  native findClassByName(className: string): Object | null;

  constructor() {
  }
}

export class ModuleObjectManager {
  native getModuleFunction(moduleName: string, funcName: string): int;

  constructor() {
  }
}

export class NamespaceObjectManager {
  native getNamespaceFunction(namespaceName: string, funcName: string, args: Array<int>): int;

  constructor() {
  }
}

export enum Color {
  RED = 1,
  GREEN = 2,
  BLUE = 3
}

export namespace TestModule {
  export function moduleFunc(): int {
    return 42;
  }
  export function makeFifteen(): number {
    return 15.0;
  }
}

export namespace TestNamespace {
  export function namespaceFunc(a: int, b: int): int {
    return a + b;
  }
}

export class ConcurrentMapManager {
  concurrentMap: ConcurrentHashMap<int, NativeResource> = new ConcurrentHashMap<int, NativeResource>();

  native testNativeObjectInConcurrentHashMapNative(): boolean;

  constructor() {
  }
}

export class ConcurrentSetManager {
  concurrentSet: ConcurrentSet<NativeResource> = new ConcurrentSet<NativeResource>();

  native testNativeObjectInConcurrentSetNative(): boolean;

  constructor() {
  }
}

export class ConcurrentQueueManager {
  concurrentQueue: ConcurrentQueue<NativeResource> = new ConcurrentQueue<NativeResource>();

  native testNativeObjectInConcurrentQueueNative(): boolean;

  constructor() {
  }
}

export class MutexManager {
  mutex: Object = new Mutex();

  native testNativeObjectWithMutexNative(): boolean;

  constructor() {
  }
}

export class RWLockManager {
  rwlock: Object = new RWLock();

  native testNativeObjectWithRWLockNative(): boolean;

  constructor() {
  }
}

export class WorkerLocalManager {
  workerLocal: Object = new WorkerLocal<NativeResource>();

  native testNativeObjectInWorkerLocalNative(): boolean;

  constructor() {
  }
}

export class EAWorkerMessageManager {
  eaMessageResource: NativeResource | null = null;

  native testNativeObjectCrossEAWorkerMessageNative(): boolean;

  constructor() {
  }
}

export class MultiThreadManager {
  native testMultiThreadConcurrentAccessNative(): boolean;

  constructor() {
  }
}

export class AsyncPromiseManager {
  asyncPromise: NativeResource | null = null;

  native testNativeObjectAsyncPromiseCreateNative(): boolean;
  native testNativeObjectAsyncPromiseResolveNative(): boolean;

  constructor() {
  }
}

export class MultiInteractionManager {
  native testNativeETSMultiInteractionNative(): boolean;

  etsCreateResource(): NativeResource {
    return new NativeResource();
  }

  etsModifyResource(input: NativeResource): NativeResource {
    input.value *= 2;
    return input;
  }

  etsValidateResource(resource: NativeResource): boolean {
    return resource.value > 0;
  }

  constructor() {
  }
}

export class NativeKeyMapManager {
  nativeKeyMap: ConcurrentHashMap<NativeResource, NativeResource> =
    new ConcurrentHashMap<NativeResource, NativeResource>();

  native testNativeObjectAsMapKeyNative(): boolean;
  native testNativeKeyMapGetNative(): boolean;
  native testNativeKeyMapRemoveNative(): boolean;

  constructor() {
  }
}

export class NativeKeyBasicMapManager {
  nativeKeyMapBasic: Map<NativeResource, NativeResource> = new Map<NativeResource, NativeResource>();

  native testNativeKeyBasicMapNative(): boolean;

  constructor() {
  }
}

export class ExceptionTestManager {
  emptyMap: Map<NativeResource, NativeResource> = new Map<NativeResource, NativeResource>();
  emptyConcurrentMap: ConcurrentHashMap<NativeResource, NativeResource> =
    new ConcurrentHashMap<NativeResource, NativeResource>();
  emptyQueue: ConcurrentQueue<NativeResource> = new ConcurrentQueue<NativeResource>();
  emptyConcurrentSet: ConcurrentSet<NativeResource> = new ConcurrentSet<NativeResource>();
  outOfBoundsArray: NativeResource[] = [new NativeResource(), new NativeResource()];
  outOfBoundsFixedArray: FixedArray<NativeResource> | null = null;
  mutex: Object = new Mutex();
  rwlock: Object = new RWLock();
  workerLocal: Object = new WorkerLocal<NativeResource>();

  native testEmptyMapGetExceptionNative(): boolean;
  native testMapPutNullKeyNative(): boolean;
  native testMapPutNullValueNative(): boolean;
  native testEmptyQueuePollExceptionNative(): boolean;
  native testSetContainsNullNative(): boolean;
  native testArrayIndexOutOfBoundsNative(): boolean;
  native testFixedArrayIndexOutOfBoundsNative(): boolean;
  native testMutexDoubleLockExceptionNative(): boolean;
  native testRWLockConflictNative(): boolean;
  native testWorkerLocalNotSetNative(): boolean;
  native testGlobalRefDeleteNullExceptionNative(): boolean;
  native testNullObjectPropertyNative(): boolean;
  native testNullArrayOperationNative(): boolean;
  native testNullStringOperationNative(): boolean;
  native testUnboxTypeMismatchNative(): boolean;

  constructor() {
  }
}

export class RecursiveInteractionManager {
  native testNativeETSRecursiveInteractionNative(): boolean;

  etsStartChain(depth: int): NativeResource {
    let resource = new NativeResource();
    resource.value = depth * 100;

    if (depth > 1) {
      let next = this.etsStartChain(depth - 1);
      resource.value += next.value;
    }

    return resource;
  }

  constructor() {
  }
}

export class AsyncCallbackChainManager {
  native testNativeObjectAsyncCallbackChainNative(): boolean;

  chainResource: NativeResource | null = null;

  async etsAsyncStep1(input: NativeResource): Promise<NativeResource> {
    input.value += 10;
    return input;
  }

  async etsAsyncStep2(input: NativeResource): Promise<NativeResource> {
    input.value += 10;
    return input;
  }

  async etsAsyncStep3(input: NativeResource): Promise<NativeResource> {
    input.value += 10;
    return input;
  }

  constructor() {
  }
}

// NOTE: SDK 26 (@ohos.worker.d.ets) 在 arkTS 1.2 'use static' 严格模式下，
// ThreadWorker.postMessage 存在重复声明（overload 冲突），无法直接使用 Worker。
// 此处以 taskpool 实现「native 对象跨线程异步往返」语义（对应设计 8.13 的
// 异步往返意图）。待 SDK 修复后可新增带 'use static' 的 Worker 脚本切换回
// 真正的 Worker 实现。
export class WorkerAsyncRoundtripManager {
  native testNativeObjectWorkerAsyncRoundtripNative(): boolean;

  workerResource: NativeResource | null = null;

  workerResponse: NativeResource | null = null;

  etsSendToWorker(resource: NativeResource): void {
    this.workerResource = resource;
  }

  async etsGetFromWorker(): Promise<NativeResource | null> {
    if (this.workerResource === null) {
      return null;
    }
    let task: taskpool.Task = new taskpool.Task(roundtripInTaskPool, this.workerResource);
    return await taskpool.execute(task) as NativeResource;
  }
}

function roundtripInTaskPool(resource: NativeResource): NativeResource {
  resource.value += 1;
  return resource;
}

export class TaskPoolAsyncExecuteManager {
  native testNativeObjectTaskPoolAsyncExecuteNative(): boolean;

  taskResource: NativeResource | null = null;

  etsCreateTaskPoolTask(inputResource: NativeResource): taskpool.Task {
    return new taskpool.Task(processInTaskPool, inputResource);
  }

  async etsExecuteTaskPoolTask(task: taskpool.Task): Promise<NativeResource> {
    return await taskpool.execute(task) as NativeResource;
  }

  constructor() {
  }
}
