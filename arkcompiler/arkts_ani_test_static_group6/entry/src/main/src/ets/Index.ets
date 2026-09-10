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

enum COLOR {
  Red,
  Green,
  Blue
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

// These members are declared through an interface intentionally: ANI exposes
// them through Object_Get/SetPropertyByName, unlike the plain fields above.
interface ClassDefCompletePropertyTypes {
  byteField: byte
  shortField: short
  intField: int
  longField: long
  floatField: float
  doubleField: double
  booleanField: boolean
  charField: char
  stringField: string
}

class ClassDefCompletePropertyTypesImpl implements ClassDefCompletePropertyTypes {
  byteField: byte = 1
  shortField: short = 2
  intField: int = 3
  longField: long = 4
  floatField: float = 1.5f
  doubleField: double = 2.5
  booleanField: boolean = true
  charField: char = c'a'
  stringField: string = 'text'
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

export class ClassDefCompleteMethodForms {
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
  // --- 查找 ---
  native test_FindClass_RegularClass(): int;
  native test_FindClass_ExportedClass(): int;
  native test_FindClass_FinalClass(): int;
  native test_FindClass_AbstractClass(): int;
  native test_FindClass_Interface(): int;
  native test_FindClass_Enum(): int;
  native test_FindClass_NotExist(): int;
  // --- 对象操作 ---
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
  // --- 查找 ---
  native test_FindClass_Generic(): int;
  // --- 对象操作 ---
  native test_ObjectNew_GenericString(): int;
  native test_GetField_Generic(): int;
  native test_CallMethod_GenericReturn(): int;
  native test_GenericDerived(): int;
  native test_StringBox_Inheritance(): int;
  native test_GenericPair_TwoParams(): int;

  // --- VM Management ---
  // --- VM管理 ---
  native test_VmCreateVM_Normal(): int;
  native test_VmCreateVM_Abnormal(): int;
  native test_VmGetCreatedVMs_Normal(): int;
  native test_VmGetCreatedVMs_Abnormal(): int;
  native test_Vm_Constructor_Normal(): int;
  native test_Vm_Destructor_Normal(): int;
  native test_VmDestroyVM_Normal(): int;
  native test_VmDestroyVM_Abnormal(): int;
  native test_VmGetEnv_Normal(): int;
  native test_VmGetEnv_Abnormal(): int;
  native test_VmAttachCurrentThread_Normal(): int;
  native test_VmAttachCurrentThread_Abnormal(): int;
  native test_VmDetachCurrentThread_Normal(): int;
  native test_VmDetachCurrentThread_Abnormal(): int;
  native test_VmGetEnv_VersionZero(): int;
  native test_VmGetEnv_VersionMax(): int;
  native test_VmAttach_VersionZero(): int;
  native test_VmAttach_VersionMax(): int;
  native test_VmGetCreatedVMs_BufferZero(): int;
  native test_VmGetCreatedVMs_BufferSmall(): int;
  native test_VmDetachWithoutAttach_BV(): int;
  native test_VmRepeatDetach_BV(): int;
  native test_VmRepeatAttach_BV(): int;
  native test_VmDestroyVM_WithAttachedThread(): int;
  
  // --- 字符串操作 ---
  native test_Str_NewUTF16_MultiThread(): int;
  native test_Str_GetUTF16Size_MultiThread(): int;
  native test_Str_GetUTF16_MultiThread(): int;
  native test_Str_GetUTF16SubString_MultiThread(): int;
  native test_Str_GetUTF8Size_MultiThread(): int;
  native test_Str_GetUTF8_MultiThread(): int;
  native test_Str_GetUTF8SubString_MultiThread(): int;
  native test_Str_NewUTF8_SizeZero(): int;
  native test_Str_NewUTF16_SizeZero(): int;
  native test_Str_GetUTF8_BufferZero(): int;
  native test_Str_GetUTF8_BufferSmall(): int;
  native test_Str_GetUTF16_BufferZero(): int;
  native test_Str_GetUTF16_BufferSmall(): int;
  native test_Str_GetUTF8SubString_OffsetAtEnd(): int;
  native test_Str_GetUTF8SubString_OffsetSizeOverflow(): int;
  native test_Str_GetUTF8SubString_SizeZero(): int;
  native test_Str_GetUTF16SubString_OffsetAtEnd(): int;
  native test_Str_GetUTF16SubString_OffsetSizeOverflow(): int;
  native test_Str_GetUTF16SubString_SizeZero(): int;
  // --- 函数调用 ---
  native test_FuncCall_ObjCall_Boolean_MultiThread(): int;
  native test_FuncCall_ObjCall_Boolean_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Boolean_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Byte_MultiThread(): int;
  native test_FuncCall_ObjCall_Byte_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Byte_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Char_MultiThread(): int;
  native test_FuncCall_ObjCall_Char_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Char_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Short_MultiThread(): int;
  native test_FuncCall_ObjCall_Short_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Short_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Int_MultiThread(): int;
  native test_FuncCall_ObjCall_Int_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Int_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Long_MultiThread(): int;
  native test_FuncCall_ObjCall_Long_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Long_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Float_MultiThread(): int;
  native test_FuncCall_ObjCall_Float_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Float_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Double_MultiThread(): int;
  native test_FuncCall_ObjCall_Double_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Double_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Ref_MultiThread(): int;
  native test_FuncCall_ObjCall_Ref_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Ref_V_MultiThread(): int;
  native test_FuncCall_ObjCall_Void_MultiThread(): int;
  native test_FuncCall_ObjCall_Void_A_MultiThread(): int;
  native test_FuncCall_ObjCall_Void_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Boolean_MultiThread(): int;
  native test_FuncCall_StaticCall_Boolean_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Boolean_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Byte_MultiThread(): int;
  native test_FuncCall_StaticCall_Byte_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Byte_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Char_MultiThread(): int;
  native test_FuncCall_StaticCall_Char_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Char_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Short_MultiThread(): int;
  native test_FuncCall_StaticCall_Short_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Short_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Int_MultiThread(): int;
  native test_FuncCall_StaticCall_Int_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Int_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Long_MultiThread(): int;
  native test_FuncCall_StaticCall_Long_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Long_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Float_MultiThread(): int;
  native test_FuncCall_StaticCall_Float_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Float_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Double_MultiThread(): int;
  native test_FuncCall_StaticCall_Double_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Double_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Ref_MultiThread(): int;
  native test_FuncCall_StaticCall_Ref_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Ref_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Void_MultiThread(): int;
  native test_FuncCall_StaticCall_Void_A_MultiThread(): int;
  native test_FuncCall_StaticCall_Void_V_MultiThread(): int;
  native test_FuncCall_StaticCall_Combo(): int;
  // --- 元组操作 ---
  native test_Tuple_GetNumberOfItems_MultiThread(): int;
  native test_Tuple_GetNumberOfItems_Abnormal(): int;
  native test_Tuple_GetItem_Boolean_MultiThread(): int;
  native test_Tuple_GetItem_Boolean_Abnormal(): int;
  native test_Tuple_GetItem_Boolean_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Boolean_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Char_MultiThread(): int;
  native test_Tuple_GetItem_Char_Abnormal(): int;
  native test_Tuple_GetItem_Char_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Char_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Byte_MultiThread(): int;
  native test_Tuple_GetItem_Byte_Abnormal(): int;
  native test_Tuple_GetItem_Byte_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Byte_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Short_MultiThread(): int;
  native test_Tuple_GetItem_Short_Abnormal(): int;
  native test_Tuple_GetItem_Short_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Short_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Int_MultiThread(): int;
  native test_Tuple_GetItem_Int_Abnormal(): int;
  native test_Tuple_GetItem_Int_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Int_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Long_MultiThread(): int;
  native test_Tuple_GetItem_Long_Abnormal(): int;
  native test_Tuple_GetItem_Long_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Long_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Float_MultiThread(): int;
  native test_Tuple_GetItem_Float_Abnormal(): int;
  native test_Tuple_GetItem_Float_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Float_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Double_MultiThread(): int;
  native test_Tuple_GetItem_Double_Abnormal(): int;
  native test_Tuple_GetItem_Double_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Double_Boundary_OutOfRange(): int;
  native test_Tuple_GetItem_Ref_MultiThread(): int;
  native test_Tuple_GetItem_Ref_Abnormal(): int;
  native test_Tuple_GetItem_Ref_Boundary_IndexZero(): int;
  native test_Tuple_GetItem_Ref_Boundary_OutOfRange(): int;
  native test_Tuple_SetItem_Boolean_MultiThread(): int;
  native test_Tuple_SetItem_Boolean_Abnormal(): int;
  native test_Tuple_SetItem_Char_MultiThread(): int;
  native test_Tuple_SetItem_Char_Abnormal(): int;
  native test_Tuple_SetItem_Byte_MultiThread(): int;
  native test_Tuple_SetItem_Byte_Abnormal(): int;
  native test_Tuple_SetItem_Short_MultiThread(): int;
  native test_Tuple_SetItem_Short_Abnormal(): int;
  native test_Tuple_SetItem_Int_MultiThread(): int;
  native test_Tuple_SetItem_Int_Abnormal(): int;
  native test_Tuple_SetItem_Long_MultiThread(): int;
  native test_Tuple_SetItem_Long_Abnormal(): int;
  native test_Tuple_SetItem_Float_MultiThread(): int;
  native test_Tuple_SetItem_Float_Abnormal(): int;
  native test_Tuple_SetItem_Double_MultiThread(): int;
  native test_Tuple_SetItem_Double_Abnormal(): int;
  native test_Tuple_SetItem_Ref_MultiThread(): int;
  native test_Tuple_SetItem_Ref_Abnormal(): int;
  native test_Tuple_Combo(): int;
  native test_Tuple_Boundary_NegativeIndex(): int;
  native test_Tuple_Boundary_AllGetTypePointers(): int;
  native test_Tuple_Boundary_AllSetTypePointers(): int;
  native test_Tuple_GetNumberOfItems_Boundary_ZeroItems(): int;
  native test_Tuple_GetItem_Boundary_AllTypesRoundTrip(): int;
  // --- 类操作 ---
  native test_Class_FindField_Normal(): int;
  native test_Class_FindField_Abnormal(): int;
  native test_Class_FindField_EmptyName(): int;
  native test_Class_FindField_MultiThread(): int;
  native test_Class_FindStaticField_Normal(): int;
  native test_Class_FindStaticField_Abnormal(): int;
  native test_Class_FindStaticField_EmptyName(): int;
  native test_Class_FindStaticField_MultiThread(): int;
  native test_Class_FindField_NotExist(): int;
  native test_Class_FindField_LongName(): int;
  native test_Class_FindStaticField_NotExist(): int;
  native test_Class_FindStaticField_LongName(): int;
  native test_Class_FindMethod_Normal(): int;
  native test_Class_FindMethod_Abnormal(): int;
  native test_Class_FindMethod_EmptyName(): int;
  native test_Class_FindMethod_MultiThread(): int;
  native test_Class_FindStaticMethod_Normal(): int;
  native test_Class_FindStaticMethod_Abnormal(): int;
  native test_Class_FindStaticMethod_EmptyName(): int;
  native test_Class_FindStaticMethod_MultiThread(): int;
  native test_Class_FindMethod_NotExist(): int;
  native test_Class_FindMethod_NullSig(): int;
  native test_Class_FindStaticMethod_NotExist(): int;
  native test_Class_FindStaticMethod_NullSig(): int;
  native test_Class_GetStaticField_Boolean_Normal(): int;
  native test_Class_GetStaticField_Boolean_MultiThread(): int;
  native test_Class_GetStaticField_Char_Normal(): int;
  native test_Class_GetStaticField_Char_MultiThread(): int;
  native test_Class_GetStaticField_Byte_Normal(): int;
  native test_Class_GetStaticField_Byte_MultiThread(): int;
  native test_Class_GetStaticField_Short_Normal(): int;
  native test_Class_GetStaticField_Short_MultiThread(): int;
  native test_Class_GetStaticField_Int_Normal(): int;
  native test_Class_GetStaticField_Int_MultiThread(): int;
  native test_Class_GetStaticField_Long_Normal(): int;
  native test_Class_GetStaticField_Long_MultiThread(): int;
  native test_Class_GetStaticField_Float_Normal(): int;
  native test_Class_GetStaticField_Float_MultiThread(): int;
  native test_Class_GetStaticField_Double_Normal(): int;
  native test_Class_GetStaticField_Double_MultiThread(): int;
  native test_Class_GetStaticField_Ref_Normal(): int;
  native test_Class_GetStaticField_Ref_MultiThread(): int;
  native test_Class_SetStaticField_Boolean_Normal(): int;
  native test_Class_SetStaticField_Boolean_MultiThread(): int;
  native test_Class_SetStaticField_Char_Normal(): int;
  native test_Class_SetStaticField_Char_MultiThread(): int;
  native test_Class_SetStaticField_Byte_Normal(): int;
  native test_Class_SetStaticField_Byte_MultiThread(): int;
  native test_Class_SetStaticField_Short_Normal(): int;
  native test_Class_SetStaticField_Short_MultiThread(): int;
  native test_Class_SetStaticField_Int_Normal(): int;
  native test_Class_SetStaticField_Int_MultiThread(): int;
  native test_Class_SetStaticField_Long_Normal(): int;
  native test_Class_SetStaticField_Long_MultiThread(): int;
  native test_Class_SetStaticField_Float_Normal(): int;
  native test_Class_SetStaticField_Float_MultiThread(): int;
  native test_Class_SetStaticField_Double_Normal(): int;
  native test_Class_SetStaticField_Double_MultiThread(): int;
  native test_Class_SetStaticField_Ref_Normal(): int;
  native test_Class_SetStaticField_Ref_MultiThread(): int;
  native test_Class_BindNativeMethods_Normal(): int;
  native test_Class_BindNativeMethods_Abnormal(): int;
  native test_Class_BindNativeMethods_EmptyName(): int;
  native test_Class_BindNativeMethods_MultiThread(): int;
  native test_Class_BindStaticNativeMethods_Normal(): int;
  native test_Class_BindStaticNativeMethods_Abnormal(): int;
  native test_Class_BindStaticNativeMethods_EmptyName(): int;
  native test_Class_BindStaticNativeMethods_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Boolean_Normal(): int;
  native test_Class_CallStaticMethodByName_Boolean_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Boolean_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Boolean_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Boolean_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Boolean_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Char_Normal(): int;
  native test_Class_CallStaticMethodByName_Char_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Char_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Char_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Char_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Char_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Byte_Normal(): int;
  native test_Class_CallStaticMethodByName_Byte_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Byte_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Byte_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Byte_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Byte_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Short_Normal(): int;
  native test_Class_CallStaticMethodByName_Short_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Short_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Short_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Short_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Short_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Int_Normal(): int;
  native test_Class_CallStaticMethodByName_Int_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Int_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Int_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Int_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Int_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Long_Normal(): int;
  native test_Class_CallStaticMethodByName_Long_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Long_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Long_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Long_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Long_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Float_Normal(): int;
  native test_Class_CallStaticMethodByName_Float_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Float_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Float_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Float_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Float_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Double_Normal(): int;
  native test_Class_CallStaticMethodByName_Double_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Double_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Double_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Double_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Double_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Ref_Normal(): int;
  native test_Class_CallStaticMethodByName_Ref_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Ref_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Ref_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Ref_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Ref_V_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Void_Normal(): int;
  native test_Class_CallStaticMethodByName_Void_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Void_A_Normal(): int;
  native test_Class_CallStaticMethodByName_Void_A_MultiThread(): int;
  native test_Class_CallStaticMethodByName_Void_V_Normal(): int;
  native test_Class_CallStaticMethodByName_Void_V_MultiThread(): int;
  native test_Class_GetStaticField_Boolean_Boundary_DefaultValue(): int;
  native test_Class_GetStaticField_Int_Boundary_Min(): int;
  native test_Class_GetStaticField_Int_Boundary_Max(): int;
  native test_Class_GetStaticField_Long_Boundary_Min(): int;
  native test_Class_GetStaticField_Long_Boundary_Max(): int;
  native test_Class_GetStaticField_Float_Boundary_NaN(): int;
  native test_Class_GetStaticField_Float_Boundary_Infinity(): int;
  native test_Class_GetStaticField_Double_Boundary_NaN(): int;
  native test_Class_GetStaticField_Double_Boundary_Infinity(): int;
  native test_Class_GetStaticField_Boolean_Boundary_False(): int;
  native test_Class_SetStaticField_Int_Boundary_Min(): int;
  native test_Class_SetStaticField_Int_Boundary_Max(): int;
  native test_Class_SetStaticField_Long_Boundary_Min(): int;
  native test_Class_SetStaticField_Long_Boundary_Max(): int;
  native test_Class_SetStaticField_Float_Boundary_NaN(): int;
  native test_Class_SetStaticField_Double_Boundary_NaN(): int;
  native test_Class_FindField_Boundary_EmptyName(): int;
  native test_Class_FindField_Boundary_LongName(): int;
  native test_Class_FindField_Boundary_NullName(): int;
  native test_Class_FindMethod_Boundary_EmptyName(): int;
  native test_Class_FindMethod_Boundary_NullSig(): int;
  native test_Class_FindMethod_Boundary_EmptySig(): int;
  native test_Class_FindStaticField_Boundary_EmptyName(): int;
  native test_Class_FindStaticField_Boundary_NullName(): int;
  native test_Class_FindStaticMethod_Boundary_EmptyName(): int;
  native test_Class_FindStaticMethod_Boundary_NullSig(): int;
  native test_Class_BindNativeMethods_Boundary_CountZero(): int;
  native test_Class_BindNativeMethods_Boundary_NullMethods(): int;
  native test_Class_BindStaticNativeMethods_Boundary_CountZero(): int;
  native test_Class_BindStaticNativeMethods_Boundary_NullMethods(): int;
  native test_Class_GetStaticField_Boolean_Abnormal_NullCls(): int;
  native test_Class_SetStaticField_Boolean_Abnormal_NullCls(): int;
  native test_Class_FindField_Abnormal_NullCls(): int;
  native test_Class_FindMethod_Abnormal_NullCls(): int;
  native test_Class_FindStaticField_Abnormal_NullCls(): int;
  native test_Class_FindStaticMethod_Abnormal_NullCls(): int;
  native test_Class_BindNativeMethods_Abnormal_NullCls(): int;
  native test_Class_BindStaticNativeMethods_Abnormal_NullCls(): int;
  native test_Class_GetStaticField_Int_Abnormal_NullField(): int;
  native test_Class_SetStaticField_Int_Abnormal_NullField(): int;
  // --- 对象操作 ---
  native test_ObjNew_Normal(): int;
  native test_ObjNew_Abnormal_NullCls(): int;
  native test_ObjNew_Abnormal_NullCtor(): int;
  native test_ObjNew_MultiThread(): int;
  native test_ObjNew_V_Normal(): int;
  native test_ObjNew_V_Abnormal(): int;
  native test_ObjNew_A_Normal(): int;
  native test_ObjNew_A_Abnormal(): int;
  native test_ObjGetType_Normal(): int;
  native test_ObjGetType_Abnormal(): int;
  native test_ObjGetType_MultiThread(): int;
  native test_ObjGetType_Combo(): int;
  native test_ObjInstanceOf_Normal(): int;
  native test_ObjInstanceOf_Abnormal(): int;
  native test_ObjInstanceOf_MultiThread(): int;
  native test_ObjInstanceOf_SelfType(): int;
  native test_ObjInstanceOf_UnrelatedType(): int;
  native test_ObjInstanceOf_NullType(): int;
  native test_ObjGetField_Boolean_Normal(): int;
  native test_ObjGetField_Boolean_MultiThread(): int;
  native test_ObjGetField_Char_Normal(): int;
  native test_ObjGetField_Char_MultiThread(): int;
  native test_ObjGetField_Byte_Normal(): int;
  native test_ObjGetField_Byte_MultiThread(): int;
  native test_ObjGetField_Short_Normal(): int;
  native test_ObjGetField_Short_MultiThread(): int;
  native test_ObjGetField_Int_Normal(): int;
  native test_ObjGetField_Int_MultiThread(): int;
  native test_ObjGetField_Long_Normal(): int;
  native test_ObjGetField_Long_MultiThread(): int;
  native test_ObjGetField_Float_Normal(): int;
  native test_ObjGetField_Float_MultiThread(): int;
  native test_ObjGetField_Double_Normal(): int;
  native test_ObjGetField_Double_MultiThread(): int;
  native test_ObjGetField_Ref_Normal(): int;
  native test_ObjGetField_Ref_MultiThread(): int;
  native test_ObjSetField_Boolean_Normal(): int;
  native test_ObjSetField_Boolean_MultiThread(): int;
  native test_ObjSetField_Char_Normal(): int;
  native test_ObjSetField_Char_MultiThread(): int;
  native test_ObjSetField_Byte_Normal(): int;
  native test_ObjSetField_Byte_MultiThread(): int;
  native test_ObjSetField_Short_Normal(): int;
  native test_ObjSetField_Short_MultiThread(): int;
  native test_ObjSetField_Int_Normal(): int;
  native test_ObjSetField_Int_MultiThread(): int;
  native test_ObjSetField_Long_Normal(): int;
  native test_ObjSetField_Long_MultiThread(): int;
  native test_ObjSetField_Float_Normal(): int;
  native test_ObjSetField_Float_MultiThread(): int;
  native test_ObjSetField_Double_Normal(): int;
  native test_ObjSetField_Double_MultiThread(): int;
  native test_ObjSetField_Ref_Normal(): int;
  native test_ObjSetField_Ref_MultiThread(): int;
  native test_ObjGetFieldByName_Boolean_Normal(): int;
  native test_ObjGetFieldByName_Boolean_MultiThread(): int;
  native test_ObjGetFieldByName_Char_Normal(): int;
  native test_ObjGetFieldByName_Char_MultiThread(): int;
  native test_ObjGetFieldByName_Byte_Normal(): int;
  native test_ObjGetFieldByName_Byte_MultiThread(): int;
  native test_ObjGetFieldByName_Short_Normal(): int;
  native test_ObjGetFieldByName_Short_MultiThread(): int;
  native test_ObjGetFieldByName_Int_Normal(): int;
  native test_ObjGetFieldByName_Int_MultiThread(): int;
  native test_ObjGetFieldByName_Long_Normal(): int;
  native test_ObjGetFieldByName_Long_MultiThread(): int;
  native test_ObjGetFieldByName_Float_Normal(): int;
  native test_ObjGetFieldByName_Float_MultiThread(): int;
  native test_ObjGetFieldByName_Double_Normal(): int;
  native test_ObjGetFieldByName_Double_MultiThread(): int;
  native test_ObjGetFieldByName_Ref_Normal(): int;
  native test_ObjGetFieldByName_Ref_MultiThread(): int;
  native test_ObjSetFieldByName_Boolean_Normal(): int;
  native test_ObjSetFieldByName_Boolean_MultiThread(): int;
  native test_ObjSetFieldByName_Char_Normal(): int;
  native test_ObjSetFieldByName_Char_MultiThread(): int;
  native test_ObjSetFieldByName_Byte_Normal(): int;
  native test_ObjSetFieldByName_Byte_MultiThread(): int;
  native test_ObjSetFieldByName_Short_Normal(): int;
  native test_ObjSetFieldByName_Short_MultiThread(): int;
  native test_ObjSetFieldByName_Int_Normal(): int;
  native test_ObjSetFieldByName_Int_MultiThread(): int;
  native test_ObjSetFieldByName_Long_Normal(): int;
  native test_ObjSetFieldByName_Long_MultiThread(): int;
  native test_ObjSetFieldByName_Float_Normal(): int;
  native test_ObjSetFieldByName_Float_MultiThread(): int;
  native test_ObjSetFieldByName_Double_Normal(): int;
  native test_ObjSetFieldByName_Double_MultiThread(): int;
  native test_ObjSetFieldByName_Ref_Normal(): int;
  native test_ObjSetFieldByName_Ref_MultiThread(): int;
  native test_ObjGetPropertyByName_Boolean_Normal(): int;
  native test_ObjGetPropertyByName_Boolean_MultiThread(): int;
  native test_ObjGetPropertyByName_Char_Normal(): int;
  native test_ObjGetPropertyByName_Char_MultiThread(): int;
  native test_ObjGetPropertyByName_Byte_Normal(): int;
  native test_ObjGetPropertyByName_Byte_MultiThread(): int;
  native test_ObjGetPropertyByName_Short_Normal(): int;
  native test_ObjGetPropertyByName_Short_MultiThread(): int;
  native test_ObjGetPropertyByName_Int_Normal(): int;
  native test_ObjGetPropertyByName_Int_MultiThread(): int;
  native test_ObjGetPropertyByName_Long_Normal(): int;
  native test_ObjGetPropertyByName_Long_MultiThread(): int;
  native test_ObjGetPropertyByName_Float_Normal(): int;
  native test_ObjGetPropertyByName_Float_MultiThread(): int;
  native test_ObjGetPropertyByName_Double_Normal(): int;
  native test_ObjGetPropertyByName_Double_MultiThread(): int;
  native test_ObjGetPropertyByName_Ref_Normal(): int;
  native test_ObjGetPropertyByName_Ref_MultiThread(): int;
  native test_ObjSetPropertyByName_Boolean_Normal(): int;
  native test_ObjSetPropertyByName_Boolean_MultiThread(): int;
  native test_ObjSetPropertyByName_Char_Normal(): int;
  native test_ObjSetPropertyByName_Char_MultiThread(): int;
  native test_ObjSetPropertyByName_Byte_Normal(): int;
  native test_ObjSetPropertyByName_Byte_MultiThread(): int;
  native test_ObjSetPropertyByName_Short_Normal(): int;
  native test_ObjSetPropertyByName_Short_MultiThread(): int;
  native test_ObjSetPropertyByName_Int_Normal(): int;
  native test_ObjSetPropertyByName_Int_MultiThread(): int;
  native test_ObjSetPropertyByName_Long_Normal(): int;
  native test_ObjSetPropertyByName_Long_MultiThread(): int;
  native test_ObjSetPropertyByName_Float_Normal(): int;
  native test_ObjSetPropertyByName_Float_MultiThread(): int;
  native test_ObjSetPropertyByName_Double_Normal(): int;
  native test_ObjSetPropertyByName_Double_MultiThread(): int;
  native test_ObjSetPropertyByName_Ref_Normal(): int;
  native test_ObjSetPropertyByName_Ref_MultiThread(): int;
  native test_ObjCallByName_Boolean_Normal(): int;
  native test_ObjCallByName_Boolean_Abnormal(): int;
  native test_ObjCallByName_Boolean_MultiThread(): int;
  native test_ObjCallByName_Byte_Normal(): int;
  native test_ObjCallByName_Byte_Abnormal(): int;
  native test_ObjCallByName_Byte_MultiThread(): int;
  native test_ObjCallByName_Char_Normal(): int;
  native test_ObjCallByName_Char_Abnormal(): int;
  native test_ObjCallByName_Char_MultiThread(): int;
  native test_ObjCallByName_Short_Normal(): int;
  native test_ObjCallByName_Short_Abnormal(): int;
  native test_ObjCallByName_Short_MultiThread(): int;
  native test_ObjCallByName_Long_Normal(): int;
  native test_ObjCallByName_Long_Abnormal(): int;
  native test_ObjCallByName_Long_MultiThread(): int;
  native test_ObjCallByName_Float_Normal(): int;
  native test_ObjCallByName_Float_Abnormal(): int;
  native test_ObjCallByName_Float_MultiThread(): int;
  native test_ObjCallByName_Double_Normal(): int;
  native test_ObjCallByName_Double_Abnormal(): int;
  native test_ObjCallByName_Double_MultiThread(): int;
  native test_ObjCallByName_Int_Normal(): int;
  native test_ObjCallByName_Int_Abnormal(): int;
  native test_ObjCallByName_Int_MultiThread(): int;
  native test_ObjCallByName_Ref_Normal(): int;
  native test_ObjCallByName_Ref_Abnormal(): int;
  native test_ObjCallByName_Ref_MultiThread(): int;
  native test_ObjCallByName_Void_Normal(): int;
  native test_ObjCallByName_Void_Abnormal(): int;
  native test_ObjCallByName_Void_MultiThread(): int;
  native test_ObjGetField_Int_Boundary_Min(): int;
  native test_ObjGetField_Int_Boundary_Max(): int;
  native test_ObjGetField_Long_Boundary_Min(): int;
  native test_ObjGetField_Long_Boundary_Max(): int;
  native test_ObjGetField_Float_Boundary_NaN(): int;
  native test_ObjGetField_Float_Boundary_Infinity(): int;
  native test_ObjGetField_Double_Boundary_NaN(): int;
  native test_ObjGetField_Double_Boundary_Infinity(): int;
  native test_ObjSetField_Int_Boundary_Min(): int;
  native test_ObjSetField_Int_Boundary_Max(): int;
  native test_ObjSetField_Float_Boundary_NaN(): int;
  native test_ObjSetField_Double_Boundary_NaN(): int;
  native test_ObjGetField_Boolean_Boundary_False(): int;
  native test_ObjGetField_Ref_Boundary_Null(): int;
  native test_ObjGetFieldByName_Int_Boundary_Min(): int;
  native test_ObjGetFieldByName_Int_Boundary_Max(): int;
  native test_ObjSetFieldByName_Int_Boundary_Min(): int;
  native test_ObjSetFieldByName_Int_Boundary_Max(): int;
  native test_ObjCallByName_Int_Boundary_Min(): int;
  native test_ObjCallByName_Int_Boundary_Max(): int;
  native test_ObjCallByName_Int_Boundary_Zero(): int;
  native test_ObjGetType_Boundary_NullObject(): int;
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

  // --- 函数对象 ---
  native test_FuncObj_Call_MultiThread(): int;
  native test_FuncObj_Call_ArgcZero(): int;
  // --- Promise ---
  native test_Promise_Resolve_MultiThread(): int;
  native test_Promise_Reject_MultiThread(): int;
  native test_Promise_Resolve_Twice(): int;
  native test_Promise_Reject_After_Resolve(): int;
  native test_Promise_Reject_Twice(): int;
  // --- 全局引用 ---
  native test_GlobalRef_Delete_MultiThread(): int;
  native test_GlobalRef_Delete_Combo(): int;
  native test_GlobalRef_Create_Limit(): int;
  native test_GlobalRef_Create_Duplicate(): int;
  native test_GlobalRef_Delete_Twice(): int;
  // --- ArrayBuffer ---
  native test_ArrayBuffer_Abnormal(): int;
  native test_ArrayBuffer_MultiThread(): int;
  native test_ArrayBuffer_GetInfo_Abnormal(): int;
  native test_ArrayBuffer_SizeZero(): int;
  native test_ArrayBuffer_GetInfo_ZeroLength(): int;
  // --- 命名空间操作 ---
  native test_Namespace_FindFunction_Abnormal(): int;
  native test_Namespace_FindFunction_MultiThread(): int;
  native test_Namespace_FindVariable_MultiThread(): int;
  native test_Namespace_BindNativeFunctions_MultiThread(): int;
  native test_Namespace_Bind_CountZero(): int;
  native test_Namespace_FindFunction_EmptyName(): int;
  // --- 类型操作 ---
  native test_Type_GetSuperClass_MultiThread(): int;
  native test_Type_IsAssignableFrom_Normal(): int;
  native test_Type_IsAssignableFrom_Abnormal(): int;
  native test_Type_IsAssignableFrom_MultiThread(): int;
  native test_Type_IsAssignableFrom_Self(): int;
  native test_Type_IsAssignableFrom_Unrelated(): int;
  native test_Type_GetSuperClass_TopLevel(): int;
  // --- 枚举操作 ---
  native test_Enum_GetItemByName_MultiThread(): int;
  native test_Enum_GetItemByIndex_MultiThread(): int;
  native test_Enum_GetItemByIndex_OutOfRange(): int;
  // --- 枚举项操作 ---
  native test_EnumItem_GetIndex_Boundary(): int;
  native test_EnumItem_GetValue_Int_Min(): int;
  native test_EnumItem_GetValue_Int_Max(): int;
  native test_EnumItem_GetValue_String_Empty(): int;
  // --- 环境与版本 ---
  native test_GetVersion_MultiThread(): int;
  native test_GetVM_Normal(): int;
  native test_GetVM_Abnormal(): int;
  native test_GetVM_MultiThread(): int;
  native test_GetNull_Normal(): int;
  native test_GetNull_MultiThread(): int;
  native test_GetUndefined_Abnormal(): int;
  native test_GetUndefined_MultiThread(): int;
  // --- 模块操作 ---
  native test_Module_FindFunction_MultiThread(): int;
  native test_Module_FindVariable_MultiThread(): int;
  native test_Module_BindNativeFunctions_Abnormal(): int;
  native test_Module_BindNativeFunctions_MultiThread(): int;
  native test_Module_Bind_CountZero(): int;
  native test_Module_FindFunction_EmptyName(): int;
  native test_Module_FindFunction_EmptySig(): int;
  native test_Module_FindVariable_EmptyName(): int;
  // --- 枚举项操作 ---
  native test_EnumItem_GetEnum_MultiThread(): int;
  native test_EnumItem_GetValue_Int_Abnormal(): int;
  native test_EnumItem_GetValue_Int_MultiThread(): int;
  native test_EnumItem_GetValue_String_Abnormal(): int;
  native test_EnumItem_GetValue_String_MultiThread(): int;
  native test_EnumItem_GetName_Abnormal(): int;
  native test_EnumItem_GetName_MultiThread(): int;
  native test_EnumItem_GetIndex_Abnormal(): int;
  native test_EnumItem_GetIndex_MultiThread(): int;
  // --- 弱引用 ---
  native test_WeakRef_Create_MultiThread(): int;
  native test_WeakRef_Create_Combo(): int;
  native test_WeakRef_Delete_Normal(): int;
  native test_WeakRef_Delete_Abnormal(): int;
  native test_WeakRef_Delete_MultiThread(): int;
  native test_WeakRef_Delete_Combo(): int;
  native test_WeakRef_GetReference_MultiThread(): int;
  native test_WeakRef_GetReference_Combo(): int;
  native test_WeakRef_Create_NullRef(): int;
  native test_WeakRef_Delete_Twice(): int;
  native test_WeakRef_GetReference_AfterGC(): int;
  // --- 查找 ---
  native test_FindModule_Normal(): int;
  native test_FindModule_Abnormal(): int;
  native test_FindModule_MultiThread(): int;
  native test_FindNamespace_Abnormal(): int;
  native test_FindNamespace_MultiThread(): int;
  native test_FindClass_MultiThread(): int;
  native test_FindEnum_MultiThread(): int;
  native test_FindClass_EmptyDesc(): int;
  native test_FindModule_EmptyDesc(): int;
  native test_FindNamespace_EmptyDesc(): int;
  native test_FindEnum_EmptyDesc(): int;
  native test_FindClass_LongDesc(): int;
  native test_FindModule_LongDesc(): int;
  // --- 数组操作 ---
  native test_Array_GetLength_Abnormal(): int;
  native test_Array_GetLength_MultiThread(): int;
  native test_Array_New_MultiThread(): int;
  native test_Array_Set_Normal(): int;
  native test_Array_Set_Abnormal(): int;
  native test_Array_Set_MultiThread(): int;
  native test_Array_Get_MultiThread(): int;
  native test_Array_Push_Abnormal(): int;
  native test_Array_Push_MultiThread(): int;
  native test_Array_Pop_Abnormal(): int;
  native test_Array_Pop_MultiThread(): int;
  native test_Array_New_LengthZero(): int;
  native test_Array_Get_OutOfRange(): int;
  native test_Array_Get_FirstElement(): int;
  native test_Array_Set_OutOfRange(): int;
  native test_Array_Pop_Empty(): int;
  // --- 引用与特殊值 ---
  native test_Reference_Delete_MultiThread(): int;
  native test_Reference_Delete_Combo(): int;
  native test_Reference_IsNull_Normal(): int;
  native test_Reference_IsNull_MultiThread(): int;
  native test_Reference_IsUndefined_Abnormal(): int;
  native test_Reference_IsUndefined_MultiThread(): int;
  native test_Reference_IsNullishValue_Normal(): int;
  native test_Reference_IsNullishValue_MultiThread(): int;
  native test_Reference_Equals_Abnormal(): int;
  native test_Reference_Equals_MultiThread(): int;
  native test_Reference_StrictEquals_MultiThread(): int;
  native test_Reference_Delete_Twice(): int;
  native test_Reference_Delete_AfterScopeDestroy(): int;
  native test_Reference_Equals_BothNull(): int;
  native test_Reference_Equals_NullVsUndefined(): int;
  native test_Reference_StrictEquals_BothNull(): int;
  native test_Reference_StrictEquals_NullVsUndefined(): int;
  // --- 作用域 ---
  native test_EnsureEnoughRefs_MultiThread(): int;
  native test_EnsureEnoughRefs_Combo(): int;
  native test_CreateLocalScope_MultiThread(): int;
  native test_CreateLocalScope_Combo(): int;
  native test_DestroyLocalScope_Normal(): int;
  native test_DestroyLocalScope_MultiThread(): int;
  native test_DestroyLocalScope_Combo(): int;
  native test_CreateEscapeLocalScope_MultiThread(): int;
  native test_DestroyEscapeLocalScope_Normal(): int;
  native test_DestroyEscapeLocalScope_Abnormal(): int;
  native test_DestroyEscapeLocalScope_MultiThread(): int;
  native test_DestroyEscapeLocalScope_Combo(): int;
  native test_CreateLocalScope_RefZero(): int;
  native test_EnsureEnoughRefs_RefZero(): int;
  native test_EnsureEnoughRefs_RefMax(): int;
  native test_EnsureEnoughRefs_ExceedCapacity(): int;
  native test_CreateLocalScope_NestedDeep(): int;
  native test_DestroyLocalScope_NoScope(): int;
  native test_DestroyEscapeLocalScope_NoScope(): int;
  // --- 异常错误 ---
  native test_ThrowError_Normal(): int;
  native test_ThrowError_Abnormal(): int;
  native test_ThrowError_MultiThread(): int;
  native test_ExistUnhandledError_Normal(): int;
  native test_ExistUnhandledError_Abnormal(): int;
  native test_ExistUnhandledError_MultiThread(): int;
  native test_GetUnhandledError_Normal(): int;
  native test_GetUnhandledError_Abnormal(): int;
  native test_GetUnhandledError_MultiThread(): int;
  native test_ResetError_Normal(): int;
  native test_ResetError_Abnormal(): int;
  native test_ResetError_MultiThread(): int;
  native test_DescribeError_Normal(): int;
  native test_DescribeError_NoError(): int;
  native test_DescribeError_MultiThread(): int;
  native test_ThrowGetReset_Combo(): int;
  native test_ThrowError_ThrowTwice(): int;
  native test_ResetError_Twice(): int;
  native test_GetUnhandledError_NoError(): int;
  native test_ThrowError_Boundary_EmptyMsg(): int;
  native test_ThrowError_Boundary_LongMsg(): int;
  native test_ExistUnhandledError_AfterReset(): int;
  native test_DescribeError_AfterReset(): int;
  // --- 装箱拆箱 ---
  native test_BoxBoolean_MultiThread(): int;
  native test_BoxByte_MultiThread(): int;
  native test_BoxChar_MultiThread(): int;
  native test_BoxDouble_MultiThread(): int;
  native test_BoxFloat_MultiThread(): int;
  native test_BoxInt_MultiThread(): int;
  native test_BoxLong_MultiThread(): int;
  native test_BoxShort_MultiThread(): int;
  native test_UnboxBoolean_MultiThread(): int;
  native test_UnboxByte_MultiThread(): int;
  native test_UnboxChar_MultiThread(): int;
  native test_UnboxDouble_MultiThread(): int;
  native test_UnboxFloat_MultiThread(): int;
  native test_UnboxInt_MultiThread(): int;
  native test_UnboxLong_MultiThread(): int;
  native test_UnboxShort_MultiThread(): int;
  native test_BoxInt_Boundary_Min(): int;
  native test_BoxInt_Boundary_Max(): int;
  native test_BoxDouble_Boundary_NaN(): int;
  native test_BoxDouble_Boundary_Infinity(): int;
  native test_BoxBoolean_Boundary_False(): int;
  native test_UnboxInt_Boundary_Min(): int;
  native test_UnboxDouble_Boundary_NaN(): int;
  native test_BoxUnbox_RoundTrip(): int;
  // --- 变量操作 ---
  native test_Var_SetValue_Boolean_Normal(): int;
  native test_Var_SetValue_Int_Normal(): int;
  native test_Var_SetValue_Double_Normal(): int;
  native test_Var_SetValue_Ref_Normal(): int;
  native test_Var_SetValue_Boolean_MultiThread(): int;
  native test_Var_SetValue_Int_MultiThread(): int;
  native test_Var_SetValue_Double_MultiThread(): int;
  native test_Var_GetValue_Boolean_Normal(): int;
  native test_Var_GetValue_Int_Normal(): int;
  native test_Var_GetValue_Double_Normal(): int;
  native test_Var_GetValue_Ref_Normal(): int;
  native test_Var_GetValue_Boolean_MultiThread(): int;
  native test_Var_GetValue_Int_MultiThread(): int;
  native test_Var_GetValue_Double_MultiThread(): int;
  native test_Var_SetValue_Int_Abnormal(): int;
  native test_Var_GetValue_Int_Abnormal(): int;
  native test_Var_SetValue_Boolean_Abnormal(): int;
  native test_Var_GetValue_Boolean_Abnormal(): int;
  native test_Var_SetValue_Double_Abnormal(): int;
  native test_Var_GetValue_Double_Abnormal(): int;
  native test_Var_SetValue_Int_Boundary_Min(): int;
  native test_Var_SetValue_Int_Boundary_Max(): int;
  native test_Var_GetValue_Int_Boundary_Min(): int;
  native test_Var_GetValue_Int_Boundary_Max(): int;
}
