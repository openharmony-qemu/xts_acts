'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

class StaticTypes024 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class MixedTypes020 {
  public intField: int = 0;
  public stringField: string = '';
  public boolField: boolean = false;
  public floatField: float = 0.0f;
  public doubleField: double = 0.0;
}

class TestClass023 {
  public value: int = 0;
}

class ArrayTypeClass024 {
  public items: Array<int> = [];
}

class NullableTypeClass025 {
  public optValue: string | null = null;
}

class MapTypeClass026 {
  public mapping: Map<string, int> = new Map<string, int>();
}

class ParentType027 {
  public parentValue: int = 0;
}

class ChildType027 extends ParentType027 {
  public childValue: string = '';
}

interface IType028 {
  ifaceData: string;
}

class ImplType028 implements IType028 {
  public ifaceData: string = '';
}

class SameIntType029 {
  public count: int = 0;
}

class FixedArrayType030 {
  public fixedArr: FixedArray<int> = new FixedArray<int>(3, 0);
}

class MultiUnionType031 {
  public multiUnion: int | string | boolean = 0;
}

class AllPrimitiveTypes032 {
  public byteField: byte = 0;
  public shortField: short = 0;
  public intField: int = 0;
  public longField: long = 0;
  public floatField: float = 0.0f;
  public doubleField: double = 0.0;
  public charField: char = c'A';
  public boolField: boolean = false;
  public stringField: string = '';
}

class FinalClass033 {
  public data: string = '';
}

abstract class AbstractClass034 {
  public abstractField: string = '';
}

class ConcreteClass034 extends AbstractClass034 {
  public concreteField: int = 0;
}

class SetValueTypeTest036 {
  public value: int = 0;
}

class SuperTypeParent {
}

class SuperTypeChild extends SuperTypeParent {
}

class ClassWithSuperTypedField {
  public childObj: SuperTypeChild = new SuperTypeChild();
}

class ObjectFieldClass037 {
  public objField: Object = {};
}

class NumberFieldClass038 {
  public numField: number = 0.0;
}

class SetFieldClass039 {
  public setField: Set<int> = new Set<int>();
}

class SingleByteField040 {
  public byteField: byte = 0;
}

class SingleShortField041 {
  public shortField: short = 0;
}

class SingleLongField042 {
  public longField: long = 0;
}

class SingleCharField043 {
  public charField: char = c'X';
}

class SingleBooleanField044 {
  public boolField: boolean = false;
}

class SingleFloatField045 {
  public floatField: float = 0.0f;
}

class SingleDoubleField046 {
  public doubleField: double = 0.0;
}

class TypeDeepA_060 {
  public a: int = 0
}

class TypeDeepB_060 extends TypeDeepA_060 {
  public b: string = ''
}

class TypeDeepC_060 extends TypeDeepB_060 {
  public c: boolean = false
}

class TypeDeepD_060 extends TypeDeepC_060 {
  public d: double = 0.0
}

class TypeDeepE_060 extends TypeDeepD_060 {
  public e: char = c'X'
}

class TypeShadowBase_061 {
  public shared: string = 'baseShared';
  public baseTag: string = 'btag'
}

class TypeShadowDerived_061 extends TypeShadowBase_061 {
  public shared: string = 'childShared';
  public childTag: string = 'ctag'
}

class TypeOfFrom_062 {
  public val: int = 0
}

class TypeOfAny_063 {
  public key: string = 'k'
}

class TypeMultiDim_064 {
  public matrix: Array<Array<int>> = []
}

interface TypeIX_065 { xf: string }

interface TypeIY_065 { yf: int }

class TypeMultiIface_065 implements TypeIX_065, TypeIY_065 {
  public xf: string = 'x';
  public yf: int = 0
}

class TypeUnion4_066 {
  public uv: int | string | boolean | double = 0
}

class TypeNullable_067 {
  public nv: string | null = null
}

class TypeFixedArr_068 {
  public fa: FixedArray<int> = new FixedArray<int>(3, 0)
}


class NonPrimitiveFields_069 {
  public strField: string = '';
  public objField: Object = {};
  public arrField: Array<int> = []
}


class CurrentType_070 {
  public val: int = 0;

  public getClass(): Class {
    return Class.current();
  }
}

class DoubleInitType_071 {
  public val: int = 0
}

enum StatusEnum_072 { ACTIVE, INACTIVE, PENDING }

class EnumField_072 {
  public status: StatusEnum_072 = StatusEnum_072.ACTIVE;
  public count: int = 0
}

class FullChain_073 {
  public data: string = 'chainTest'
}

class NumberTypeField_074 {
  public numVal: number = 0.0
}

class NestedGenericType_075 {
  public mapOfArr: Map<string, Array<int>> = new Map<string, Array<int>>()
}

class AltNestedType_076 {
  public arrOfMap: Array<Map<string, int>> = []
}

class TypeChainBase_077 {
  public bv: int = 0
}

class TypeChainMid_077 extends TypeChainBase_077 {
  public mv: string = ''
}

class TypeChainLeaf_077 extends TypeChainMid_077 {
  public lv: boolean = false
}

interface TypeAbsIface_078 { ifx: string }

abstract class TypeAbsBase_078 implements TypeAbsIface_078 {
  public absVal: int = 0;
  public ifx: string = 'absIface'
}

class TypeAbsConcrete_078 extends TypeAbsBase_078 {
  public concVal: string = 'concrete'
}

class TypeSubParent_079 {
  public pv: string = 'p'
}

class TypeSubChild_079 extends TypeSubParent_079 {
  public cv: string = 'c'
}

interface TypeIFA_080 { sharedField: string }

interface TypeIFB_080 {
  sharedField: string;
  otherField: int
}

class TypeMultiShared_080 implements TypeIFA_080, TypeIFB_080 {
  public sharedField: string = 's';
  public otherField: int = 0;
  public uniqueField: string = 'u'
}

class SelfRef_081 {
  public value: int = 0;
  public next: SelfRef_081 | null = null
}

interface TIFBase_082 { baseVal: string }

interface TIFDerived_082 extends TIFBase_082 { derivedVal: int }

class TImplChain_082 implements TIFDerived_082 {
  public baseVal: string = 'b';
  public derivedVal: int = 0
}

abstract class TAbsBase_083 {
  public abVal: int = 0
}

abstract class TAbsDerived_083 extends TAbsBase_083 {
  public adVal: string = ''
}

class TConcAbs_083 extends TAbsDerived_083 {
  public cVal: boolean = false
}

class TBigint_084 {
  public bv: bigint = 0n
}

interface TIX_085 { x: int }

interface TIY_085 { y: string }

interface TIZ_085 { z: boolean }

class TTriple_085 implements TIX_085, TIY_085, TIZ_085 {
  public x: int = 0;
  public y: string = '';
  public z: boolean = false
}

class TUnion2_086 {
  public uv2: int | string = 0
}

class TUnion3_086 {
  public uv3: int | string | boolean = 0
}

class TUnion4_086 {
  public uv4: int | string | boolean | double = 0
}

class TypeReadonly_087 {
  public readonly roVal: int = 0
}

class TypeFinal_088 {
  public finalVal: string = 'f'
}

class TypeCustomType_089 {
  public v: int = 0
}

class TypeHasCustom_089 {
  public obj: TypeCustomType_089 = new TypeCustomType_089()
}

class TypeMapIS_090 {
  public mis: Map<int, string> = new Map<int, string>()
}

class TStaticField_091 {
  public static sVal: int = 0;
  public iVal: int = 0
}

class TStrCheck_092 {
  public strField: string = ''
}

class TPlain_093 {
  public val: int = 0
}

class TStaticInst_094 {
  public static sNum: int = 0;
  public iNum: int = 0
}

class TParentStatic_095 {
  public static psVal: int = 0
}

class TChildStatic_095 extends TParentStatic_095 {
  public cVal: string = ''
}

enum TypeEnum_096 { RED, GREEN, BLUE }

class TEnumField_096 {
  public color: TypeEnum_096 = TypeEnum_096.RED
}

class TInner_097 {
  public x: int = 0
}

class TOuter_097 {
  public inner: TInner_097 = new TInner_097()
}

class TMultiStatic_098 {
  public static a: int = 0;
  public static b: string = ''
}

export default function InstanceFieldGetTypeTest2(): void {
  describe('InstanceFieldGetTypeTest2', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0010
     * @tc.name testGetType0010
     * @tc.desc Verify boolean and float type name strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let boolField = cls.getInstanceField('boolField')!;
      let floatField = cls.getInstanceField('floatField')!;
      expect(boolField.getType().getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
      expect(floatField.getType().getName()).assertEqual(Class.PRIMITIVE_FLOAT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0020
     * @tc.name testGetType0020
     * @tc.desc Verify double type name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let doubleField = cls.getInstanceField('doubleField')!;
      expect(doubleField.getType().getName()).assertEqual(Class.PRIMITIVE_DOUBLE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0030
     * @tc.name testGetType0030
     * @tc.desc Verify Array type field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayTypeClass024>();
      let field = cls.getInstanceField('items')!;
      let typeName = field.getType().getName();
      expect(typeName.endsWith('Array')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0040
     * @tc.name testGetType0040
     * @tc.desc Verify nullable union type field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullableTypeClass025>();
      let field = cls.getInstanceField('optValue')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual("{Ustd.core.Null,std.core.String}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0050
     * @tc.name testGetType0050
     * @tc.desc Verify Map type field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MapTypeClass026>();
      let field = cls.getInstanceField('mapping')!;
      let typeName = field.getType().getName();
      expect(typeName.endsWith('Map')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0060
     * @tc.name testGetType0060
     * @tc.desc Verify getType on parent class field via getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildType027>();
      let childField = childCls.getInstanceField('childValue')!;
      expect(childField.getType().getName().endsWith('String')).assertTrue();
      let parentCls = childCls.getSuper()!;
      let parentField = parentCls.getInstanceField('parentValue')!;
      expect(parentField.getType().getName()).assertEqual(Class.PRIMITIVE_INT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0070
     * @tc.name testGetType0070
     * @tc.desc Verify getType().isEnum() returns false for primitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let intField = cls.getInstanceField('intField')!;
      let fieldType = intField.getType();
      expect(fieldType.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0080
     * @tc.name testGetType0080
     * @tc.desc Verify getType().isEnum() returns false for string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let strField = cls.getInstanceField('stringField')!;
      let fieldType = strField.getType();
      expect(fieldType.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0090
     * @tc.name testGetType0090
     * @tc.desc Verify getType().getDescriptor() for Array field equals "Lstd/core/Array;"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayTypeClass024>();
      let field = cls.getInstanceField('items')!;
      let desc: string = field.getType().getDescriptor();
      expect(desc).assertEqual("Lstd/core/Array;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0100
     * @tc.name testGetType0100
     * @tc.desc Verify getType().isEnum() for Array type returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayTypeClass024>();
      let field = cls.getInstanceField('items')!;
      expect(field.getType().isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0110
     * @tc.name testGetType0110
     * @tc.desc Verify same type fields in different classes have identical type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<TestClass023>();
      let cls2 = Class.from<MixedTypes020>();
      let intType1 = cls1.getInstanceField('value')!.getType().getName();
      let intType2 = cls2.getInstanceField('intField')!.getType().getName();
      expect(intType1).assertEqual(intType2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0120
     * @tc.name testGetType0120
     * @tc.desc Verify getType on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplType028>();
      let field = cls.getInstanceField('ifaceData')!;
      expect(field.getType().getName().endsWith('String')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0130
     * @tc.name testGetType0130
     * @tc.desc Verify same int type across different classes has identical name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<TestClass023>();
      let cls2 = Class.from<SameIntType029>();
      let name1 = cls1.getInstanceField('value')!.getType().getName();
      let name2 = cls2.getInstanceField('count')!.getType().getName();
      expect(name1).assertEqual(name2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0140
     * @tc.name testGetType0140
     * @tc.desc Verify getType().isUnion() for nullable union field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullableTypeClass025>();
      let field = cls.getInstanceField('optValue')!;
      let fieldType = field.getType();
      expect(fieldType.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0150
     * @tc.name testGetType0150
     * @tc.desc Verify getType().isFixedArray() for FixedArray field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayType030>();
      let field = cls.getInstanceField('fixedArr')!;
      let fieldType = field.getType();
      expect(fieldType.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0160
     * @tc.name testGetType0160
     * @tc.desc Verify StaticField and InstanceField return same type for same-typed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTypes024>();
      let staticField = cls.getStaticField('STATIC_VALUE')!;
      let instanceField = cls.getInstanceField('instanceValue')!;
      expect(staticField.getType().getName()).assertEqual(instanceField.getType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0170
     * @tc.name testGetType0170
     * @tc.desc Verify getType().getUnionConstituentTypes() for union type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiUnionType031>();
      let field = cls.getInstanceField('multiUnion')!;
      let fieldType = field.getType();
      let types = fieldType.getUnionConstituentTypes()!;
      expect(types.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0180
     * @tc.name testGetType0180
     * @tc.desc Verify getType().getFixedArrayComponentType() for FixedArray field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayType030>();
      let field = cls.getInstanceField('fixedArr')!;
      let fieldType = field.getType();
      let componentType = fieldType.getFixedArrayComponentType()!;
      expect(componentType.getName().endsWith('Int')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0190
     * @tc.name testGetType0190
     * @tc.desc Verify byte field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('byteField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_BYTE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0200
     * @tc.name testGetType0200
     * @tc.desc Verify short field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('shortField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_SHORT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0210
     * @tc.name testGetType0210
     * @tc.desc Verify long field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('longField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_LONG.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0220
     * @tc.name testGetType0220
     * @tc.desc Verify float field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('floatField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_FLOAT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0230
     * @tc.name testGetType0230
     * @tc.desc Verify double field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('doubleField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_DOUBLE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0240
     * @tc.name testGetType0240
     * @tc.desc Verify boolean field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('boolField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0250
     * @tc.name testGetType0250
     * @tc.desc Verify char field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('charField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_CHAR.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0260
     * @tc.name testGetType0260
     * @tc.desc Verify each field's type name matches its expected primitive type constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(9);
      let expectedTypeNames = [
        Class.PRIMITIVE_BYTE.getName(),
        Class.PRIMITIVE_SHORT.getName(),
        Class.PRIMITIVE_INT.getName(),
        Class.PRIMITIVE_LONG.getName(),
        Class.PRIMITIVE_FLOAT.getName(),
        Class.PRIMITIVE_DOUBLE.getName(),
        Class.PRIMITIVE_CHAR.getName(),
        Class.PRIMITIVE_BOOLEAN.getName(),
        'std.core.String'
      ];
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getType().getName()).assertEqual(expectedTypeNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0270
     * @tc.name testGetType0270
     * @tc.desc Verify getType().isPrimitive() returns boolean type for int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('intField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0280
     * @tc.name testGetType0280
     * @tc.desc Verify getType().isPrimitive() returns boolean type for string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0290
     * @tc.name testGetType0290
     * @tc.desc Verify getType().isInterface() returns boolean type for class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let fieldType = field.getType();
      expect(fieldType.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0300
     * @tc.name testGetType0300
     * @tc.desc Verify getType().isFinal() returns boolean type for final class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass033>();
      let field = cls.getInstanceField('data')!;
      let fieldType = field.getType();
      expect(fieldType.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0310
     * @tc.name testGetType0310
     * @tc.desc Verify getType().isFinal() on string field type evaluates to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let fieldType = field.getType();
      expect(fieldType.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0320
     * @tc.name testGetType0320
     * @tc.desc Verify getType().isAbstract() on string field from abstract class evaluates to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass034>();
      let field = cls.getInstanceField('abstractField')!;
      let fieldType = field.getType();
      expect(fieldType.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0330
     * @tc.name testGetType0330
     * @tc.desc Verify getType().isAbstract() returns true for primitive int field type (per ArkTS reflection spec, primitive types are abstract as they cannot be directly instantiated via Class.createInstance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteClass034>();
      let field = cls.getInstanceField('concreteField')!;
      let fieldType = field.getType();
      expect(fieldType.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0340
     * @tc.name testGetType0340
     * @tc.desc Verify getType().getSuper() returns non-undefined for class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassWithSuperTypedField>();
      let field = cls.getInstanceField('childObj')!;
      let fieldType = field.getType();
      let superType = fieldType.getSuper();
      expect(superType !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0350
     * @tc.name testGetType0350
     * @tc.desc Verify getType returns same value after setValue on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueTypeTest036>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      let typeBeforeSet: string = field.getType().getName();
      field.setValue(instance, 999);
      let typeAfterSet: string = field.getType().getName();
      expect(typeAfterSet).assertEqual(typeBeforeSet);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0360
     * @tc.name testGetType0360
     * @tc.desc Verify getType() on Object type field getName exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ObjectFieldClass037>();
      let field = cls.getInstanceField('objField')!;
      let typeName = field.getType().getName();
      expect(typeName.endsWith('Object')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0370
     * @tc.name testGetType0370
     * @tc.desc Verify getType().isUnion() returns boolean for true union type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiUnionType031>();
      let field = cls.getInstanceField('multiUnion')!;
      let fieldType = field.getType();
      expect(fieldType.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0380
     * @tc.name testGetType0380
     * @tc.desc Verify getType().isFixedArray() returns boolean for Array type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayTypeClass024>();
      let field = cls.getInstanceField('items')!;
      let fieldType = field.getType();
      expect(fieldType.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0390
     * @tc.name testGetType0390
     * @tc.desc Verify byte field getType().getName() and type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleByteField040>();
      let field = cls.getInstanceField('byteField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_BYTE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0400
     * @tc.name testGetType0400
     * @tc.desc Verify short field getType().getName() and type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleShortField041>();
      let field = cls.getInstanceField('shortField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_SHORT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0410
     * @tc.name testGetType0410
     * @tc.desc Verify long field getType().getName() and type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleLongField042>();
      let field = cls.getInstanceField('longField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_LONG.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0420
     * @tc.name testGetType0420
     * @tc.desc Verify char field getType().getName() and type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleCharField043>();
      let field = cls.getInstanceField('charField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_CHAR.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0430
     * @tc.name testGetType0430
     * @tc.desc Verify boolean field getType().getName() and type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleBooleanField044>();
      let field = cls.getInstanceField('boolField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0440
     * @tc.name testGetType0440
     * @tc.desc Verify float field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleFloatField045>();
      let field = cls.getInstanceField('floatField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_FLOAT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0450
     * @tc.name testGetType0450
     * @tc.desc Verify double field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleDoubleField046>();
      let field = cls.getInstanceField('doubleField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual(Class.PRIMITIVE_DOUBLE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0460
     * @tc.name testGetType0460
     * @tc.desc Verify number field getType().getName() and type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberFieldClass038>();
      let field = cls.getInstanceField('numField')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0470
     * @tc.name testGetType0470
     * @tc.desc Verify Set<int> field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetFieldClass039>();
      let field = cls.getInstanceField('setField')!;
      let typeName = field.getType().getName();
      expect(typeName.endsWith('Set')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0480
     * @tc.name testGetType0480
     * @tc.desc Verify FixedArray<int> field getType().getName() exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayType030>();
      let field = cls.getInstanceField('fixedArr')!;
      let typeName = field.getType().getName();
      expect(typeName).assertEqual("std.core.Int[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0490
     * @tc.name testGetType0490
     * @tc.desc Verify byte field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleByteField040>();
      let field = cls.getInstanceField('byteField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0500
     * @tc.name testGetType0500
     * @tc.desc Verify short field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleShortField041>();
      let field = cls.getInstanceField('shortField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0510
     * @tc.name testGetType0510
     * @tc.desc Verify long field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleLongField042>();
      let field = cls.getInstanceField('longField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0520
     * @tc.name testGetType0520
     * @tc.desc Verify float field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleFloatField045>();
      let field = cls.getInstanceField('floatField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0530
     * @tc.name testGetType0530
     * @tc.desc Verify double field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleDoubleField046>();
      let field = cls.getInstanceField('doubleField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0540
     * @tc.name testGetType0540
     * @tc.desc Verify char field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleCharField043>();
      let field = cls.getInstanceField('charField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0550
     * @tc.name testGetType0550
     * @tc.desc Verify boolean field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleBooleanField044>();
      let field = cls.getInstanceField('boolField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0560
     * @tc.name testGetType0560
     * @tc.desc Verify Object field type isPrimitive() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ObjectFieldClass037>();
      let field = cls.getInstanceField('objField')!;
      let fieldType = field.getType();
      expect(fieldType.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0570
     * @tc.name testGetType0570
     * @tc.desc Verify byte field type isEnum() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleByteField040>();
      let field = cls.getInstanceField('byteField')!;
      let fieldType = field.getType();
      expect(fieldType.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0580
     * @tc.name testGetType0580
     * @tc.desc Verify string field type isEnum() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let fieldType = field.getType();
      expect(fieldType.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0590
     * @tc.name testGetType0590
     * @tc.desc Verify getType().getDescriptor() for int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('intField')!;
      let desc: string = field.getType().getDescriptor();
      expect(desc).assertEqual("I");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0600
     * @tc.name testGetType0600
     * @tc.desc Verify getType().getDescriptor() for string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let desc: string = field.getType().getDescriptor();
      expect(desc).assertEqual("Lstd/core/String;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0610
     * @tc.name testGetType0610
     * @tc.desc Verify getType().getDescriptor() for Map field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MapTypeClass026>();
      let field = cls.getInstanceField('mapping')!;
      let desc: string = field.getType().getDescriptor();
      expect(desc).assertEqual("Lstd/core/Map;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0620
     * @tc.name testGetType0620
     * @tc.desc Verify getType().getSuper() for primitive int returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('intField')!;
      let superType = field.getType().getSuper();
      expect(superType).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0630
     * @tc.name testGetType0630
     * @tc.desc Verify getType().getSuper() for string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let superType = field.getType().getSuper();
      expect(superType !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0640
     * @tc.name testGetType0640
     * @tc.desc Verify getType consistency after getValue call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueTypeTest036>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      let before: string = field.getType().getName();
      field.getValue(instance);
      let after: string = field.getType().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0650
     * @tc.name testGetType0650
     * @tc.desc Verify getType consistency after getOwner call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueTypeTest036>();
      let field = cls.getInstanceField('value')!;
      let before: string = field.getType().getName();
      field.getOwner().getName();
      let after: string = field.getType().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0660
     * @tc.name testGetType0660
     * @tc.desc Verify getType consistency after equals call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueTypeTest036>();
      let f1 = cls.getInstanceField('value')!;
      let f2 = cls.getInstanceField('value')!;
      let before: string = f1.getType().getName();
      f1.equals(f2);
      let after: string = f1.getType().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0670
     * @tc.name testGetType0670
     * @tc.desc Verify getType().getName() on string field yields "std.core.String"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let fieldType = field.getType();
      expect(fieldType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0680
     * @tc.name testGetType0680
     * @tc.desc Verify getType on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplType028>();
      let field = cls.getInstanceField('ifaceData')!;
      let fieldType = field.getType();
      expect(fieldType.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0690
     * @tc.name testGetType0690
     * @tc.desc Verify getType on final class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass033>();
      let field = cls.getInstanceField('data')!;
      let fieldType = field.getType();
      expect(fieldType.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0700
     * @tc.name testGetType0700
     * @tc.desc Verify getType on abstract class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass034>();
      let field = cls.getInstanceField('abstractField')!;
      let fieldType = field.getType();
      expect(fieldType.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0710
     * @tc.name testGetType0710
     * @tc.desc Verify getType on custom class type field type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassWithSuperTypedField>();
      let field = cls.getInstanceField('childObj')!;
      let fieldType = field.getType();
      expect(fieldType.getName().endsWith('SuperTypeChild')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0720
     * @tc.name testGetType0720
     * @tc.desc Verify all fields of all primitive types returned by getInstanceFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let fields = cls.getInstanceFields();
      let expectedTypeNames = [
        Class.PRIMITIVE_BYTE.getName(),
        Class.PRIMITIVE_SHORT.getName(),
        Class.PRIMITIVE_INT.getName(),
        Class.PRIMITIVE_LONG.getName(),
        Class.PRIMITIVE_FLOAT.getName(),
        Class.PRIMITIVE_DOUBLE.getName(),
        Class.PRIMITIVE_CHAR.getName(),
        Class.PRIMITIVE_BOOLEAN.getName(),
        'std.core.String'
      ];
      for (let i = 0; i < fields.length; i++) {
        let ft = fields[i].getType();
        expect(ft.getName()).assertEqual(expectedTypeNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0730
     * @tc.name testGetType0730
     * @tc.desc Verify getUnionConstituentTypes member names are non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiUnionType031>();
      let field = cls.getInstanceField('multiUnion')!;
      let fieldType = field.getType();
      let types = fieldType.getUnionConstituentTypes()!;
      let expectedNames = ['std.core.Boolean', 'std.core.Int', 'std.core.String'];
      for (let i = 0; i < types.length; i++) {
        expect(types[i].getName()).assertEqual(expectedNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0740
     * @tc.name testGetType0740
     * @tc.desc Verify getType().getConstructors() returns non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassWithSuperTypedField>();
      let field = cls.getInstanceField('childObj')!;
      let fieldType = field.getType();
      let constructors = fieldType.getConstructors();
      expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0750
     * @tc.name testGetType0750
     * @tc.desc Verify getType().getInstanceMethods() returns FixedArray (not JS Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassWithSuperTypedField>();
      let field = cls.getInstanceField('childObj')!;
      let fieldType = field.getType();
      let methods = fieldType.getInstanceMethods();
      expect(Array.isArray(methods)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0760
     * @tc.name testGetType0760
     * @tc.desc Verify getType via Class.of matches Class.from type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<TypeOfFrom_062>();
      let obj = new TypeOfFrom_062();
      let clsOf = Class.of(obj);
      let tFrom = clsFrom.getInstanceField('val')!.getType().getName();
      let tOf = clsOf.getInstanceField('val')!.getType().getName();
      expect(tFrom).assertEqual(tOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0770
     * @tc.name testGetType0770
     * @tc.desc Verify getType via Class.ofAny returns valid type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new TypeOfAny_063();
      let cls = Class.ofAny(obj)!;
      let field = cls.getInstanceField('key')!;
      expect(field.getType().getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0780
     * @tc.name testGetType0780
     * @tc.desc Verify getType on 5-level deep inheritance chain fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = Class.from<TypeDeepE_060>();
      let d = e.getSuper()!;
      let c = d.getSuper()!;
      let b = c.getSuper()!;
      let a = b.getSuper()!;
      expect(e.getInstanceField('e')!.getType().getName()).assertEqual("u16");
      expect(d.getInstanceField('d')!.getType().getName()).assertEqual('f64');
      expect(c.getInstanceField('c')!.getType().getName()).assertEqual('u1');
      expect(b.getInstanceField('b')!.getType().getName()).assertEqual('std.core.String');
      expect(a.getInstanceField('a')!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0790
     * @tc.name testGetType0790
     * @tc.desc Verify getType on shadowed override fields with compatible types match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<TypeShadowDerived_061>();
      let parent = child.getSuper()!;
      let ct = child.getInstanceField('childTag')!.getType().getName();
      let pt = parent.getInstanceField('baseTag')!.getType().getName();
      expect(ct).assertEqual("std.core.String");
      expect(pt).assertEqual('std.core.String');
      expect(ct).assertEqual(pt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0800
     * @tc.name testGetType0800
     * @tc.desc Verify getType on multi-dimensional array field type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeMultiDim_064>();
      let field = cls.getInstanceField('matrix')!;
      expect(field.getType().getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0810
     * @tc.name testGetType0810
     * @tc.desc Verify getType on multi-interface class fields have valid types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeMultiIface_065>();
      let t1 = cls.getInstanceField('xf')!.getType().getName();
      let t2 = cls.getInstanceField('yf')!.getType().getName();
      expect(t1).assertEqual("std.core.String");
      expect(t2).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0820
     * @tc.name testGetType0820
     * @tc.desc Verify getType on union field with 4 constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeUnion4_066>();
      let field = cls.getInstanceField('uv')!;
      let ft = field.getType();
      expect(ft.isUnion()).assertTrue();
      let types = ft.getUnionConstituentTypes()!;
      expect(types.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0830
     * @tc.name testGetType0830
     * @tc.desc Verify getType on nullable union field isUnion result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeNullable_067>();
      let field = cls.getInstanceField('nv')!;
      let ft = field.getType();
      expect(ft.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0840
     * @tc.name testGetType0840
     * @tc.desc Verify getType consistency before and after Class.initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeOfFrom_062>();
      let field = cls.getInstanceField('val')!;
      let before = field.getType().getName();
      cls.initialize();
      let after = field.getType().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0850
     * @tc.name testGetType0850
     * @tc.desc Verify getType consistency across Class.from, Class.of and Class.ofAny
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<TypeOfAny_063>();
      let obj: Any = new TypeOfAny_063();
      let clsOf = Class.of(obj);
      let clsOfAny = Class.ofAny(obj)!;
      let tn1 = clsFrom.getInstanceField('key')!.getType().getName();
      let tn2 = clsOf.getInstanceField('key')!.getType().getName();
      let tn3 = clsOfAny.getInstanceField('key')!.getType().getName();
      expect(tn1).assertEqual(tn2);
      expect(tn2).assertEqual(tn3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0860
     * @tc.name testGetType0860
     * @tc.desc Verify getType on FixedArray field isFixedArray check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeFixedArr_068>();
      let field = cls.getInstanceField('fa')!;
      let ft = field.getType();
      expect(ft.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0870
     * @tc.name testGetType0870
     * @tc.desc Verify getType on shadowed inheriting field types are the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<TypeShadowDerived_061>();
      let parent = child.getSuper()!;
      let ct = child.getInstanceField('childTag')!.getType();
      let pt = parent.getInstanceField('baseTag')!.getType();
      expect(ct.getName()).assertEqual(pt.getName());
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0880
     * @tc.name testGetType0880
     * @tc.desc Verify boolean field getType matches Class.PRIMITIVE_BOOLEAN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('boolField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0890
     * @tc.name testGetType0890
     * @tc.desc Verify byte field getType matches Class.PRIMITIVE_BYTE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('byteField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_BYTE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0900
     * @tc.name testGetType0900
     * @tc.desc Verify char field getType matches Class.PRIMITIVE_CHAR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('charField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_CHAR.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0910
     * @tc.name testGetType0910
     * @tc.desc Verify short field getType matches Class.PRIMITIVE_SHORT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('shortField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_SHORT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0920
     * @tc.name testGetType0920
     * @tc.desc Verify int field getType matches Class.PRIMITIVE_INT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('intField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_INT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0930
     * @tc.name testGetType0930
     * @tc.desc Verify long field getType matches Class.PRIMITIVE_LONG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('longField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_LONG.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0940
     * @tc.name testGetType0940
     * @tc.desc Verify float field getType matches Class.PRIMITIVE_FLOAT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('floatField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_FLOAT.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0950
     * @tc.name testGetType0950
     * @tc.desc Verify double field getType matches Class.PRIMITIVE_DOUBLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPrimitiveTypes032>();
      let field = cls.getInstanceField('doubleField')!;
      expect(field.getType().getName()).assertEqual(Class.PRIMITIVE_DOUBLE.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0960
     * @tc.name testGetType0960
     * @tc.desc Verify string field getType does not match any PRIMITIVE_* name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonPrimitiveFields_069>();
      let field = cls.getInstanceField('strField')!;
      let name = field.getType().getName();
      expect(name === Class.PRIMITIVE_INT.getName()).assertFalse();
      expect(name === Class.PRIMITIVE_BOOLEAN.getName()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0970
     * @tc.name testGetType0970
     * @tc.desc Verify Object field getType does not match any PRIMITIVE_* name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonPrimitiveFields_069>();
      let field = cls.getInstanceField('objField')!;
      let name = field.getType().getName();
      expect(name === Class.PRIMITIVE_DOUBLE.getName()).assertFalse();
      expect(name === Class.PRIMITIVE_CHAR.getName()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0980
     * @tc.name testGetType0980
     * @tc.desc Verify getType via Class.current matches Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new CurrentType_070();
      let clsCur = obj.getClass();
      let clsFrom = Class.from<CurrentType_070>();
      let tCur = clsCur.getInstanceField('val')!.getType().getName();
      let tFrom = clsFrom.getInstanceField('val')!.getType().getName();
      expect(tCur).assertEqual(tFrom);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0990
     * @tc.name testGetType0990
     * @tc.desc Verify getType consistency after double Class.initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleInitType_071>();
      let field = cls.getInstanceField('val')!;
      let before = field.getType().getName();
      cls.initialize();
      cls.initialize();
      let after = field.getType().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1000
     * @tc.name testGetType1000
     * @tc.desc Verify enum typed field getType().isEnum() returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumField_072>();
      let field = cls.getInstanceField('status')!;
      let ft = field.getType();
      expect(ft.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1010
     * @tc.name testGetType1010
     * @tc.desc Verify non-enum field getType().isEnum() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumField_072>();
      let field = cls.getInstanceField('count')!;
      let ft = field.getType();
      expect(ft.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1020
     * @tc.name testGetType1020
     * @tc.desc Verify full chain getName-getOwner-getType-getValue on same field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FullChain_073>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let n1 = field.getName();
      let o = field.getOwner().getName();
      let t = field.getType().getName();
      let v: string = field.getValue(instance) as string;
      let n2 = field.getName();
      expect(n1).assertEqual('data');
      expect(o.endsWith('FullChain_073')).assertTrue();
      expect(t).assertEqual('std.core.String');
      expect(v).assertEqual('chainTest');
      expect(n2).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1030
     * @tc.name testGetType1030
     * @tc.desc Verify number type (double alias) field getType returns valid name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberTypeField_074>();
      let field = cls.getInstanceField('numVal')!;
      expect(field.getType().getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1040
     * @tc.name testGetType1040
     * @tc.desc Verify getType on Map<string, Array<int>> deep nested generic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedGenericType_075>();
      let field = cls.getInstanceField('mapOfArr')!;
      let ft = field.getType();
      expect(ft.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1050
     * @tc.name testGetType1050
     * @tc.desc Verify getType on Array<Map<string, int>> alternative deep generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AltNestedType_076>();
      let field = cls.getInstanceField('arrOfMap')!;
      expect(field.getType().getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1060
     * @tc.name testGetType1060
     * @tc.desc Verify getType across multi-level getSuper chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf = Class.from<TypeChainLeaf_077>();
      let mid = leaf.getSuper()!;
      let base = mid.getSuper()!;
      expect(leaf.getInstanceField('lv')!.getType().getName()).assertEqual("u1");
      expect(mid.getInstanceField('mv')!.getType().getName()).assertEqual('std.core.String');
      expect(base.getInstanceField('bv')!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1070
     * @tc.name testGetType1070
     * @tc.desc Verify getType on abstract+interface hierarchy concrete class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeAbsConcrete_078>();
      let field = cls.getInstanceField('concVal')!;
      expect(field.getType().getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1080
     * @tc.name testGetType1080
     * @tc.desc Verify getType on abstract class field via concrete getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let concrete = Class.from<TypeAbsConcrete_078>();
      let abs = concrete.getSuper()!;
      let field = abs.getInstanceField('absVal')!;
      expect(field.getType().getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1090
     * @tc.name testGetType1090
     * @tc.desc Verify owner.isSubtypeOf chain using getOwner result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<TypeSubChild_079>();
      let parent = Class.from<TypeSubParent_079>();
      let co = child.getInstanceField('cv')!.getOwner();
      let po = parent.getInstanceField('pv')!.getOwner();
      expect(co.isSubtypeOf(po)).assertTrue();
      expect(po.isSubtypeOf(co)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1100
     * @tc.name testGetType1100
     * @tc.desc Verify getType on multi-interface shared field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeMultiShared_080>();
      let f1 = cls.getInstanceField('sharedField')!;
      let f2 = cls.getInstanceField('otherField')!;
      expect(f1.getType().getName()).assertEqual("std.core.String");
      expect(f2.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1110
     * @tc.name testGetType1110
     * @tc.desc Verify getType on self-referential class field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SelfRef_081>();
      let field = cls.getInstanceField('next')!;
      let ft = field.getType();
      expect(ft.getName().includes('.SelfRef_081')).assertTrue();
      expect(ft.getName().includes('Null')).assertTrue();
      expect(ft.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1120
     * @tc.name testGetType1120
     * @tc.desc Verify union constituent types names are all valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeUnion4_066>();
      let field = cls.getInstanceField('uv')!;
      let ft = field.getType();
      let types = ft.getUnionConstituentTypes()!;
      let expectedNames = ['std.core.Boolean', 'std.core.Double', 'std.core.Int', 'std.core.String'];
      for (let i = 0; i < types.length; i++) {
        expect(types[i].getName()).assertEqual(expectedNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1130
     * @tc.name testGetType1130
     * @tc.desc Verify getType on interface-extends-interface hierarchy field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TImplChain_082>();
      let f1 = cls.getInstanceField('baseVal')!;
      let f2 = cls.getInstanceField('derivedVal')!;
      expect(f1.getType().getName()).assertEqual("std.core.String");
      expect(f2.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1140
     * @tc.name testGetType1140
     * @tc.desc Verify getType on abstract-extends-abstract hierarchy field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let conc = Class.from<TConcAbs_083>();
      let ad = conc.getSuper()!;
      let ab = ad.getSuper()!;
      expect(conc.getInstanceField('cVal')!.getType().getName()).assertEqual("u1");
      expect(ad.getInstanceField('adVal')!.getType().getName()).assertEqual('std.core.String');
      expect(ab.getInstanceField('abVal')!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1150
     * @tc.name testGetType1150
     * @tc.desc Verify getType on bigint typed field returns valid name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TBigint_084>();
      let field = cls.getInstanceField('bv')!;
      expect(field.getType().getName()).assertEqual("std.core.BigInt");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1160
     * @tc.name testGetType1160
     * @tc.desc Verify getType on triple interface class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TTriple_085>();
      expect(cls.getInstanceField('x')!.getType().getName()).assertEqual("i32");
      expect(cls.getInstanceField('y')!.getType().getName()).assertEqual('std.core.String');
      expect(cls.getInstanceField('z')!.getType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1170
     * @tc.name testGetType1170
     * @tc.desc Verify union constituent types count for 2, 3, 4 member unions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = Class.from<TUnion2_086>();
      let c3 = Class.from<TUnion3_086>();
      let c4 = Class.from<TUnion4_086>();
      let t2 = c2.getInstanceField('uv2')!.getType().getUnionConstituentTypes()!;
      let t3 = c3.getInstanceField('uv3')!.getType().getUnionConstituentTypes()!;
      let t4 = c4.getInstanceField('uv4')!.getType().getUnionConstituentTypes()!;
      expect(t2.length).assertEqual(2);
      expect(t3.length).assertEqual(3);
      expect(t4.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1180
     * @tc.name testGetType1180
     * @tc.desc Verify field type from getInstanceFields matches getInstanceField type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField(fields[i].getName())!;
        expect(byName.getType().getName()).assertEqual(fields[i].getType().getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1190
     * @tc.name testGetType1190
     * @tc.desc Verify getType on readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeReadonly_087>();
      let field = cls.getInstanceField('roVal')!;
      expect(field.getType().getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1200
     * @tc.name testGetType1200
     * @tc.desc Verify getType on final class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeFinal_088>();
      let field = cls.getInstanceField('finalVal')!;
      expect(field.getType().getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1210
     * @tc.name testGetType1210
     * @tc.desc Verify getType on custom class typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeHasCustom_089>();
      let field = cls.getInstanceField('obj')!;
      expect(field.getType().getName().endsWith('TypeCustomType_089')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1220
     * @tc.name testGetType1220
     * @tc.desc Verify getType on Map<int,string> typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeMapIS_090>();
      let field = cls.getInstanceField('mis')!;
      expect(field.getType().getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1230
     * @tc.name testGetType1230
     * @tc.desc Verify isUnion type check on plain string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let field = cls.getInstanceField('stringField')!;
      let ft = field.getType();
      expect(ft.isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1240
     * @tc.name testGetType1240
     * @tc.desc Verify isFixedArray type check on Array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayTypeClass024>();
      let field = cls.getInstanceField('items')!;
      let ft = field.getType();
      expect(ft.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1250
     * @tc.name testGetType1250
     * @tc.desc Verify getType on static field via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TStaticField_091>();
      let sf = cls.getStaticField('sVal')!;
      expect(sf.getType().getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1260
     * @tc.name testGetType1260
     * @tc.desc Verify isInterface type check on string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TStrCheck_092>();
      let field = cls.getInstanceField('strField')!;
      let ft = field.getType();
      expect(ft.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1270
     * @tc.name testGetType1270
     * @tc.desc Verify isFinal type check on non-final class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TPlain_093>();
      let field = cls.getInstanceField('val')!;
      let ft = field.getType();
      expect(ft.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1280
     * @tc.name testGetType1280
     * @tc.desc Verify isAbstract type check on concrete class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TPlain_093>();
      let field = cls.getInstanceField('val')!;
      let ft = field.getType();
      expect(ft.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1290
     * @tc.name testGetType1290
     * @tc.desc Verify static and instance same-typed fields have same getType name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TStaticInst_094>();
      let st = cls.getStaticField('sNum')!.getType().getName();
      let it = cls.getInstanceField('iNum')!.getType().getName();
      expect(st).assertEqual(it);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1300
     * @tc.name testGetType1300
     * @tc.desc Verify getInstanceFields single element type valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TStaticInst_094>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(1);
      expect(fields[0].getType().getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1310
     * @tc.name testGetType1310
     * @tc.desc Verify getType on parent static field via getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<TChildStatic_095>();
      let parent = child.getSuper()!;
      let sf = parent.getStaticField('psVal')!;
      expect(sf.getType().getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1320
     * @tc.name testGetType1320
     * @tc.desc Verify enum typed field getType().isEnum() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TEnumField_096>();
      let field = cls.getInstanceField('color')!;
      let ft = field.getType();
      expect(ft.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1330
     * @tc.name testGetType1330
     * @tc.desc Verify getType().getSuper() on custom class typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TOuter_097>();
      let field = cls.getInstanceField('inner')!;
      let ft = field.getType();
      let sup = ft.getSuper();
      expect(sup !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1340
     * @tc.name testGetType1340
     * @tc.desc Verify getType on all getStaticFields valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TMultiStatic_098>();
      let fields = cls.getStaticFields();
      let expectedTypeNames = [
        Class.PRIMITIVE_INT.getName(),
        'std.core.String'
      ];
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getType().getName()).assertEqual(expectedTypeNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1350
     * @tc.name testGetType1350
     * @tc.desc Verify getType parent static vs child instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<TChildStatic_095>();
      let parent = child.getSuper()!;
      let sf = parent.getStaticField('psVal')!;
      let inf = child.getInstanceField('cVal')!;
      expect(sf.getType().getName()).assertEqual("i32");
      expect(inf.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1360
     * @tc.name testGetType1360
     * @tc.desc Verify getType two static fields have different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TMultiStatic_098>();
      let sfa = cls.getStaticField('a')!.getType().getName();
      let sfb = cls.getStaticField('b')!.getType().getName();
      expect(sfa).assertEqual("i32");
      expect(sfb).assertEqual('std.core.String');
      expect(sfa !== sfb).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1370
     * @tc.name testGetType1370
     * @tc.desc Verify getInstanceFields all have non-null getType with valid name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let fields = cls.getInstanceFields();
      let expectedTypeNames = [
        Class.PRIMITIVE_INT.getName(),
        'std.core.String',
        Class.PRIMITIVE_BOOLEAN.getName(),
        Class.PRIMITIVE_FLOAT.getName(),
        Class.PRIMITIVE_DOUBLE.getName()
      ];
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getType().getName()).assertEqual(expectedTypeNames[i]);
      }
    });

  });
}
