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
