'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

// ========== Type aliases ==========
type ClassDefCompleteStringMapper = (value: string) => string
type ClassDefCompleteNumberOrString = int | string
type ClassDefCompleteTuple = [int, string]

// ========== Enum ==========
enum ClassDefCompleteStatus {
  Ready,
  Done
}

// ========== Interfaces ==========
interface ClassDefCompleteNamed {
  name: string
}

interface ClassDefCompleteIdentified {
  id: int
}

interface ClassDefCompleteReadable {
  readonly label: string
}

interface ClassDefCompleteWritable {
  value: int
}

interface ClassDefCompleteDefaultMethod {
  format(prefix: string): string {
  return prefix
}
}

interface ClassDefCompleteMultiParent extends ClassDefCompleteNamed, ClassDefCompleteIdentified {
  active: boolean
}

// ========== Spec Classes ==========
class ClassDefCompletePoint {
  x: int = 0
  y: int = 0

  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }

  move(dx: int, dy: int): void {
    this.x += dx
    this.y += dy
  }
}

export class ClassDefCompleteExported {
  value: string = 'exported'
}

final class ClassDefCompleteFinal {
  readonly value: int = 1
}

abstract class ClassDefCompleteAbstractBase {
  abstract compute(value: int): int

  baseValue: int = 10

  getBaseValue(): int {
    return this.baseValue
  }
}

abstract class ClassDefCompleteAbstractFieldBase {
  abstract abstractField: int
}

class ClassDefCompleteConcreteFromAbstract extends ClassDefCompleteAbstractBase {
  compute(value: int): int {
    return value + this.baseValue
  }
}

class ClassDefCompleteConcreteFromAbstractField extends ClassDefCompleteAbstractFieldBase {
  override abstractField: int = 20
}

class ClassDefCompleteBase {
  public publicField: string = 'public'
  protected protectedField: int = 1
  private privateField: int = 2
  static staticField: int = 3
  readonly readonlyField: string = 'readonly'

  constructor() {}

  getPrivateField(): int {
    return this.privateField
  }

  static getStaticField(): int {
    return ClassDefCompleteBase.staticField
  }

  final stableMethod(): string {
    return 'stable'
  }
}

class ClassDefCompleteSingleDerived extends ClassDefCompleteBase {
  override publicField: string = 'derived'
  childField: string = 'child'

  constructor() {
    super()
  }

  readProtected(): int {
    return this.protectedField
  }
}

class ClassDefCompleteMethodBase {
  method(value: int): int {
    return value
  }
}

class ClassDefCompleteMethodOverride extends ClassDefCompleteMethodBase {
  override method(value: int): int {
    return value + 1
  }
}

class ClassDefCompleteImplementsOne implements ClassDefCompleteNamed {
  name: string = 'one'
}

class ClassDefCompleteImplementsMany implements ClassDefCompleteNamed, ClassDefCompleteIdentified, ClassDefCompleteWritable {
  name: string = 'many'
  id: int = 100
  value: int = 200
}

class ClassDefCompleteExtendsAndImplements extends ClassDefCompleteBase implements ClassDefCompleteMultiParent, ClassDefCompleteDefaultMethod {
  name: string = 'extend-implement'
  id: int = 300
  active: boolean = true

  constructor() {
    super()
  }
}

class ClassDefCompletePropertyByField implements ClassDefCompleteReadable {
  readonly label: string = 'label'
}

class ClassDefCompletePropertyByAccessor implements ClassDefCompleteWritable {
  private innerValue: int = 0

  get value(): int {
    return this.innerValue
  }

  set value(v: int) {
    this.innerValue = v
  }
}

class ClassDefCompleteGenericBox<T> {
  item: T

  constructor(item: T) {
    this.item = item
  }

  getItem(): T {
    return this.item
  }
}

class ClassDefCompleteStringBox extends ClassDefCompleteGenericBox<string> {
  constructor(value: string) {
    super(value)
  }
}

class ClassDefCompleteGenericPair<K, V> {
  key: K
  value: V

  constructor(key: K, value: V) {
    this.key = key
    this.value = value
  }
}

class ClassDefCompleteGenericDerived<T> extends ClassDefCompleteGenericBox<T> {
  tag: string = 'generic-derived'

  constructor(item: T) {
    super(item)
  }
}

class ClassDefCompleteFieldTypes {
  byteField: byte = 1
  shortField: short = 2
  intField: int = 3
  longField: long = 4
  floatField: float = 1.5f
  doubleField: double = 2.5
  booleanField: boolean = true
  charField: char = c'a'
  stringField: string = 'text'

  nullableStringField: string | null = null
  unionField: ClassDefCompleteNumberOrString = 1

  intArrayField: int[] = [1, 2, 3]
  stringArrayField: string[] = ['a', 'b']

  classField: ClassDefCompletePoint = new ClassDefCompletePoint(1, 2)
  interfaceField: ClassDefCompleteNamed = new ClassDefCompleteImplementsOne()
  enumField: ClassDefCompleteStatus = ClassDefCompleteStatus.Ready
  genericField: ClassDefCompleteGenericBox<string> = new ClassDefCompleteGenericBox<string>('box')
  pairField: ClassDefCompleteGenericPair<string, int> = new ClassDefCompleteGenericPair<string, int>('age', 18)
}

class ClassDefCompleteConstructorForms {
  first: int
  second: string

  constructor() {
    this.first = 0
    this.second = 'default'
  }

  constructor(first: int, second: string) {
    this.first = first
    this.second = second
  }
}

class ClassDefCompleteMethodForms {
  instanceMethod(value: int): int {
    return value
  }

  static staticMethod(value: int): int {
    return value
  }

  get value(): int {
    return 1
  }

  set value(v: int) {}

  self(): this {
    return this
  }
}

class ClassDefCompleteImplicitMethodOverload {
  choose(value: int): string {
    return 'int'
  }

  choose(value: string): string {
    return value
  }
}

class ClassDefCompleteExplicitMethodOverload {
  overload choose { chooseInt, chooseString }

chooseInt(value: int): string {
  return 'int'
}

chooseString(value: string): string {
  return value
}
}

class ClassDefCompleteStaticOverload {
  static overload choose { chooseInt, chooseString }

static chooseInt(value: int): string {
  return 'int'
}

static chooseString(value: string): string {
  return value
}
}

class ClassDefCompleteStaticAccessor {
  private static innerValue: int = 1

  static get value(): int {
    return ClassDefCompleteStaticAccessor.innerValue
  }

  static set value(v: int) {
    ClassDefCompleteStaticAccessor.innerValue = v
  }
}

class ClassDefCompleteStaticBlock {
  static value: int = 1

  static {
    ClassDefCompleteStaticBlock.value = 2
  }
}

export class TestClass {
  public constructor () {}
  public sum(a: int, b: int): int {
    return a + b;
  }

  public newClass (): TestClass{
    return new TestClass();
  }

  static multiply(a: number, b: number): number {
    return a * b;
  }

}

export class Foo {
  native test_GetVersion(): int;
  native test_AttachDetach(): int;
  native test_AttachDetach_WithInterop(): int;
  native test_Attach_InvalidResult(): int;
  native test_Attach_InvalidVersion(): int;
  native test_Attach_InvalidOption(): int;
  native test_Attach_RepeatAttach(): int;
  native test_Attach_RepeatDetach(): int;
  native test_Detach_WithoutAttach(): int;
  native test_ConcurrentAttach(): int;
  native test_ConcurrentMainThreadWorker(): int;
  native test_CreateObjectInWorker(): int;
  native test_Attach_DetachThenGetEnvAndReattach(): int;
  native test_Attach_InvalidHighVersion(): int;
  native test_Attach_DisableInterop(): int;
  native test_Attach_FailedAttachStateRecovery(): int;
  native test_Attach_CurrentManagedThreadShouldFail(): int;
  native test_ConcurrentMainThreadWorkerOverlap(): int;
  native test_Attach_LocalScopeStress(): int;

  native testBoxBooleanNative(): boolean;
  native testUnboxBooleanNative(): boolean;
  native testUnboxBooleanExceptionNative(): boolean;
  native testBoxByteNative(): boolean;
  native testBoxByteExceptionNative(): boolean;
  native testUnboxByteNative(): boolean;
  native testBoxCharNative(): boolean;
  native testBoxCharExceptionNative(): boolean;
  native testUnboxCharNative(): boolean;
  native testUnboxCharExceptionNative(): boolean;
  native testBoxDoubleNative(): boolean;
  native testBoxDoubleExceptionNative(): boolean;
  native testUnboxDoubleNative(): boolean;
  native testUnboxDoubleExceptionNative(): boolean;
  native testBoxFloatNative(): boolean;
  native testBoxFloatExceptionNative(): boolean;
  native testUnboxFloatNative(): boolean;
  native testUnboxFloatExceptionNative(): boolean;
  native testBoxIntNative(): boolean;
  native testBoxIntExceptionNative(): boolean;
  native testUnboxIntNative(): boolean;
  native testUnboxIntExceptionNative(): boolean;
  native testBoxLongNative(): boolean;
  native testBoxLongExceptionNative(): boolean;
  native testUnboxLongNative(): boolean;
  native testUnboxLongExceptionNative(): boolean;
  native testBoxShortNative(): boolean;
  native testBoxShortExceptionNative(): boolean;
  native testUnboxShortNative(): boolean;
  native testUnboxShortExceptionNative(): boolean;
  native testStabilityLoop1000NormalNative(): boolean;
  native testStabilityLoop1000ExceptionNative(): boolean;
  native testStability10ThreadsNormalNative(): boolean;
  native testStability10ThreadsExceptionNative(): boolean;


  // --- Group 1: ClassOperations ---
  native test_FindClass_RegularClass(): int;
  native test_FindClass_ExportedClass(): int;
  native test_FindClass_FinalClass(): int;
  native test_FindClass_AbstractClass(): int;
  native test_FindClass_Interface(): int;
  native test_FindClass_Enum(): int;
  native test_FindClass_NotExist(): int;
  native test_ObjectNew_RegularClass(): int;
  native test_ObjectNew_DefaultConstructor(): int;
  native test_ObjectNew_AbstractClass_Fail(): int;
  native test_ObjectNew_Interface_Fail(): int;
  native test_ObjectNew_OverloadedConstructor(): int;
  native test_ObjectNew_ConcreteFromAbstract(): int;
  native test_ObjectNew_ImplementsOne(): int;
  native test_ObjectNew_ImplementsMany(): int;
  native test_ObjectInstanceOf_Class(): int;
  native test_ObjectInstanceOf_Interface(): int;
  native test_ObjectInstanceOf_NotRelated(): int;

  // --- Group 2: FieldAccess ---
  native test_GetField_Int(): int;
  native test_SetField_Int(): int;
  native test_GetField_String(): int;
  native test_SetField_String(): int;
  native test_GetField_ReadOnly(): int;
  native test_GetField_Boolean(): int;
  native test_GetField_Double(): int;
  native test_GetField_Float(): int;
  native test_GetField_Long(): int;
  native test_GetField_Byte(): int;
  native test_GetField_Short(): int;
  native test_GetField_Char(): int;
  native test_GetField_Static(): int;
  native test_SetField_Static(): int;
  native test_GetField_Private(): int;
  native test_GetField_ReferenceType(): int;
  native test_GetField_EnumType(): int;

  // --- Group 3: PropertyAccess ---
  native test_GetProperty_InterfaceField(): int;
  native test_SetProperty_InterfaceField(): int;
  native test_GetProperty_InterfaceInt(): int;
  native test_SetProperty_InterfaceInt(): int;
  native test_GetProperty_Accessor(): int;
  native test_SetProperty_Accessor(): int;
  native test_GetProperty_ReadOnly(): int;
  native test_PropertyVsField_Distinction(): int;
  native test_GetProperty_MultiInterface(): int;
  native test_GetStaticProperty_Accessor(): int;

  // --- Group 4: MethodCall ---
  native test_CallMethod_Instance(): int;
  native test_CallMethod_ReturnInt(): int;
  native test_CallMethod_Static(): int;
  native test_CallMethod_Override(): int;
  native test_CallMethod_SelfReturn(): int;
  native test_CallMethodByName_Instance(): int;
  native test_CallMethodByName_Static(): int;
  native test_CallMethod_Final(): int;
  native test_CallMethod_AbstractViaConcrete(): int;
  native test_CallMethod_VoidReturn(): int;
  native test_CallMethod_MultipleParams(): int;

  // --- Group 5: MethodOverload ---
  native test_ImplicitOverload_Int(): int;
  native test_ImplicitOverload_String(): int;
  native test_ImplicitOverload_Ambiguous(): int;
  native test_ExplicitOverload_Int(): int;
  native test_ExplicitOverload_String(): int;
  native test_StaticOverload_Int(): int;
  native test_StaticOverload_String(): int;
  native test_ConstructorOverload_Default(): int;
  native test_ConstructorOverload_WithParams(): int;

  // --- Group 6: EnumOperations ---
  native test_FindEnum(): int;
  native test_GetEnumItemByName(): int;
  native test_EnumItemGetValue(): int;
  native test_EnumItemGetName(): int;
  native test_EnumFieldAccess(): int;

  // --- Group 7: GenericClass ---
  native test_FindClass_Generic(): int;
  native test_ObjectNew_GenericString(): int;
  native test_GetField_Generic(): int;
  native test_CallMethod_GenericReturn(): int;
  native test_GenericDerived(): int;
  native test_StringBox_Inheritance(): int;
  native test_GenericPair_TwoParams(): int;
  
  constructor() {
  }

  public static new_Foo(): Foo {
    return new Foo();
  }
  static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
  static sum(a0: int, a1: int): int {
    return a0 + a1;
  }

  stringValue: string = 'test';
}