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

class StaticTest032 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class Person028 {
  public name: string = '';
  public age: int = 0;
  public email: string = '';
}

class Serializable030 {
  public id: int = 0;
  public name: string = '';
  public active: boolean = true;
}

class ArrayField025 {
  public data: Array<int> = [];
}

class ReadonlyField033 {
  public readonly value: int = 100;
}

class IntField034 {
  public count: int = 0;
}

class TargetClass035 {
  public data: string = 'target';
}

class BooleanField037 {
  public active: boolean = false;
}

class StateClass038 {
  public counter: int = 0;
}

class ParentValue039 {
  public parentData: string = 'parent default';
}

class ChildValue039 extends ParentValue039 {
  public childData: string = 'child default';
}

class MultiFieldInstance040 {
  public name: string = 'multi';
  public count: int = 0;
  public active: boolean = true;
}

interface IValue041 {
  ifaceVal: string;
}

class ImplValue041 implements IValue041 {
  public ifaceVal: string = 'iface default';
}

abstract class AbstractValue042 {
  public abstractField: string = 'abstract';
}

class ConcreteValue042 extends AbstractValue042 {
  public concreteField: string = 'concrete';
}

class PrimitiveTypesClass043 {
  public byteField: byte = 0;
  public shortField: short = 0;
  public longField: long = 0;
  public floatField: float = 0.0f;
  public doubleField: double = 0.0;
  public charField: char = c'A';
  public boolField: boolean = false;
}

class ObjectFieldClass044 {
  public objField: Object = {};
}

class FixedArrayFieldClass045 {
  public fixedArr: FixedArray<int> = new FixedArray<int>(3);
}

class MapFieldClass046 {
  public mapField: Map<string, int> = new Map<string, int>();
}

class NullableFieldClass047 {
  public nullableStr: string | null = 'initial';
}

class UnionFieldClass048 {
  public unionVal: int | string = 0;
}

class ByteFieldClass049 {
  public byteVal: byte = 0;
}

class ShortFieldClass050 {
  public shortVal: short = 0;
}

class LongFieldClass051 {
  public longVal: long = 0;
}

class FloatFieldClass052 {
  public floatVal: float = 0.0f;
}

class DoubleFieldClass053 {
  public doubleVal: double = 0.0;
}

class CharFieldClass054 {
  public charVal: char = c'Z';
}

class BooleanFieldClass055 {
  public boolVal: boolean = false;
}

class ValueDeepA_060 {
  public a: int = 1
}

class ValueDeepB_060 extends ValueDeepA_060 {
  public b: int = 2
}

class ValueDeepC_060 extends ValueDeepB_060 {
  public c: int = 3
}

class ValueDeepD_060 extends ValueDeepC_060 {
  public d: int = 4
}

class ValueDeepE_060 extends ValueDeepD_060 {
  public e: int = 5
}

class ValueShadowBase_061 {
  public shared: string = 'baseVal';
  public baseTag: string = 'btag'
}

class ValueShadowDerived_061 extends ValueShadowBase_061 {
  public shared: string = 'childVal';
  public childTag: string = 'ctag'
}

class ValueOfFrom_062 {
  public val: int = 42
}

class ValueOfAny_063 {
  public key: string = 'ofAnyVal'
}

class ValueFixedArr_064 {
  public fa: FixedArray<int> = new FixedArray<int>(3)
}

class ValueMultiDim_065 {
  public matrix: Array<Array<int>> = [[1, 2], [3, 4]]
}

interface ValueIX_066 { xf: string }

interface ValueIY_066 { yf: int }

class ValueMultiIface_066 implements ValueIX_066, ValueIY_066 {
  public xf: string = 'xval';
  public yf: int = 99
}

class ValueNullable_067 {
  public nv: string | null = 'initial'
}

class CurrentValue_070 {
  public data: string = 'currentVal';

  public getClass(): Class {
    return Class.current();
  }
}

class DoubleInitValue_071 {
  public val: int = 99
}

class FullChainValue_072 {
  public info: string = 'fullChain'
}

class NestedGenericValue_073 {
  public mapField: Map<string, Array<int>> = new Map<string, Array<int>>()
}

class ValueChainBase_074 {
  public bv: int = 100
}

class ValueChainMid_074 extends ValueChainBase_074 {
  public mv: int = 200
}

class ValueChainLeaf_074 extends ValueChainMid_074 {
  public lv: int = 300
}

interface ValueAbsIface_075 { ifv: string }

abstract class ValueAbsBase_075 implements ValueAbsIface_075 {
  public baseVal: int = 500;
  public ifv: string = 'iface'
}

class ValueAbsConcrete_075 extends ValueAbsBase_075 {
  public concVal: string = 'concreteVal'
}

interface ValueIFA_076 { sharedVal: string }

interface ValueIFB_076 { sharedVal: string }

class ValueMultiShared_076 implements ValueIFA_076, ValueIFB_076 {
  public sharedVal: string = 'mv';
  public uniqueVal: int = 42
}

class ObjFieldValue_077 {
  public obj: Object = new Object()
}

class LongStrValue_078 {
  public text: string = 'Lorem ipsum dolor sit amet'
}

interface VIFBase_079 { baseVal: string }

interface VIFDerived_079 extends VIFBase_079 { derivedVal: int }

class VImplChain_079 implements VIFDerived_079 {
  public baseVal: string = 'bval';
  public derivedVal: int = 99
}

abstract class VAbsBase_080 {
  public abVal: int = 10
}

abstract class VAbsDerived_080 extends VAbsBase_080 {
  public adVal: int = 20
}

class VConcAbs_080 extends VAbsDerived_080 {
  public cVal: int = 30
}

class VBigint_081 {
  public bv: bigint = 0n
}

interface VIX_082 { x: int }

interface VIY_082 { y: string }

interface VIZ_082 { z: boolean }

class VTriple_082 implements VIX_082, VIY_082, VIZ_082 {
  public x: int = 10;
  public y: string = 'yval';
  public z: boolean = true
}

class VChainBase_083 {
  public a: int = 1
}

class VChainMid_083 extends VChainBase_083 {
  public b: int = 2
}

class VChainLeaf_083 extends VChainMid_083 {
  public c: int = 3
}

class ValueFinal_084 {
  public finalVal: string = 'fv'
}

class ValueCustomType_085 {
  public v: int = 42
}

class ValueHasCustom_085 {
  public obj: ValueCustomType_085 = new ValueCustomType_085()
}

class ValueMapIS_086 {
  public mis: Map<int, string> = new Map<int, string>()
}

class ValueLoop_087 {
  public counter: int = 99
}

class VMixedBase_088 {
  public a: string = 'a'
}

class VMixedMid_088 extends VMixedBase_088 {
  public b: int = 2
}

class VMixedLeaf_088 extends VMixedMid_088 {
  public c: boolean = true
}

class VStaticField_089 {
  public static sVal: string = 'staticStr';
  public iVal: string = 'instanceStr'
}

class VStrArrInit_090 {
  public items: Array<string> = ['a', 'b', 'c']
}

interface VIFForClass_091 { ifVal: int }

class VImplIF_091 implements VIFForClass_091 {
  public ifVal: int = 99;
  public ownVal: string = 'own'
}

class VMultiStatic_092 {
  public static a: int = 1;
  public static b: int = 2
}


class VParentStatic_093 {
  public static psVal: string = 'parentStaticStr'
}

class VChildStatic_093 extends VParentStatic_093 {
  public cVal: string = 'childStr'
}

enum ValueEnum_094 { LOW, MEDIUM, HIGH }

class VEnumField_094 {
  public level: ValueEnum_094 = ValueEnum_094.MEDIUM;
  public score: int = 50
}

class VEscStr_095 {
  public text: string = 'hello\nworld\ttab'
}

class VMultiStatic_096 {
  public static a: int = 100;
  public static b: int = 200
}

class VFinalStatic_097 {
  public static fVal: string = 'finalStatic'
}

class VDoubleNonZero_098 {
  public dVal: double = 3.14
}

class TypeErrorFieldA_099 {
  public aVal: int = 1
}

class TypeErrorFieldB_099 {
  public bVal: string = 'b'
}

export default function InstanceFieldGetValueTest2(): void {
  describe('InstanceFieldGetValueTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0010
     * @tc.name testGetValue0010
     * @tc.desc Verify getValue and setValue with boolean field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BooleanField037>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('active')!;
      let initial: boolean = field.getValue(instance) as boolean;
      expect(initial).assertFalse();
      field.setValue(instance, true);
      let updated: boolean = field.getValue(instance) as boolean;
      expect(updated).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0020
     * @tc.name testGetValue0020
     * @tc.desc Verify multiple setValue calls track state progression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      for (let i = 1; i <= 10; i++) {
        field.setValue(instance, i);
        expect(field.getValue(instance) as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0030
     * @tc.name testGetValue0030
     * @tc.desc Verify two instances maintain independent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance1 = cls.createInstance();
      let instance2 = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance1, 10);
      field.setValue(instance2, 20);
      expect(field.getValue(instance1) as int).assertEqual(10);
      expect(field.getValue(instance2) as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0040
     * @tc.name testGetValue0040
     * @tc.desc Verify getValue and setValue on parent class field via child instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildValue039>();
      let childInstance = childCls.createInstance();
      let childField = childCls.getInstanceField('childData')!;
      expect(childField.getValue(childInstance) as string).assertEqual('child default');
      childField.setValue(childInstance, 'child modified');
      expect(childField.getValue(childInstance) as string).assertEqual('child modified');
      let parentCls = childCls.getSuper()!;
      let parentInstance = parentCls.createInstance();
      let parentField = parentCls.getInstanceField('parentData')!;
      expect(parentField.getValue(parentInstance) as string).assertEqual('parent default');
      parentField.setValue(parentInstance, 'parent modified');
      expect(parentField.getValue(parentInstance) as string).assertEqual('parent modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0050
     * @tc.name testGetValue0050
     * @tc.desc Verify setValue overwrites previous value repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let values: Array<string> = ['first', 'second', 'third', 'fourth', 'fifth'];
      for (let i = 0; i < values.length; i++) {
        field.setValue(instance, values[i]);
        expect(field.getValue(instance) as string).assertEqual(values[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0060
     * @tc.name testGetValue0060
     * @tc.desc Verify getInstanceField getType returns correct field type name 'std.core.String'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      expect(field.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0070
     * @tc.name testGetValue0070
     * @tc.desc Verify setValue via reflection matches direct property read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance() as TargetClass035;
      let field = cls.getInstanceField('data')!;
      field.setValue(instance, 'reflection value');
      expect(field.getValue(instance) as string).assertEqual('reflection value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0080
     * @tc.name testGetValue0080
     * @tc.desc Verify setValue with negative number and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, -999);
      expect(field.getValue(instance) as int).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0090
     * @tc.name testGetValue0090
     * @tc.desc Verify getValue on multiple fields of same instance returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildValue039>();
      let instance = cls.createInstance();
      let childField = cls.getInstanceField('childData')!;
      let childVal: string = childField.getValue(instance) as string;
      expect(childVal).assertEqual('child default');
      let parentCls = cls.getSuper()!;
      let parentInstance = parentCls.createInstance();
      let parentField = parentCls.getInstanceField('parentData')!;
      let parentVal: string = parentField.getValue(parentInstance) as string;
      expect(parentVal).assertEqual('parent default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0100
     * @tc.name testGetValue0100
     * @tc.desc Verify rapid alternating setValue and getValue sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      for (let i = 0; i < 50; i++) {
        field.setValue(instance, i);
        expect(field.getValue(instance) as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0110
     * @tc.name testGetValue0110
     * @tc.desc Verify batch set multiple fields on one instance and read all back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldInstance040>();
      let instance = cls.createInstance();
      let nameField = cls.getInstanceField('name')!;
      let countField = cls.getInstanceField('count')!;
      let activeField = cls.getInstanceField('active')!;
      nameField.setValue(instance, 'batch');
      countField.setValue(instance, 99);
      activeField.setValue(instance, false);
      expect(nameField.getValue(instance) as string).assertEqual('batch');
      expect(countField.getValue(instance) as int).assertEqual(99);
      expect(activeField.getValue(instance) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0120
     * @tc.name testGetValue0120
     * @tc.desc Verify getValue and setValue on interface-implementing class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplValue041>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ifaceVal')!;
      let initVal: string = field.getValue(instance) as string;
      expect(initVal).assertEqual('iface default');
      field.setValue(instance, 'modified');
      expect(field.getValue(instance) as string).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0130
     * @tc.name testGetValue0130
     * @tc.desc Verify setValue and getValue with max and min int boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, 2147483647);
      expect(field.getValue(instance) as int).assertEqual(2147483647);
      field.setValue(instance, -2147483648);
      expect(field.getValue(instance) as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0140
     * @tc.name testGetValue0140
     * @tc.desc Verify setValue and getValue with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      field.setValue(instance, '');
      expect(field.getValue(instance) as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0150
     * @tc.name testGetValue0150
     * @tc.desc Verify setValue and getValue with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let special: string = 'hello\nworld\t"quoted"\\backslash';
      field.setValue(instance, special);
      expect(field.getValue(instance) as string).assertEqual(special);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0160
     * @tc.name testGetValue0160
     * @tc.desc Verify boolean field toggle back and forth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BooleanField037>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('active')!;
      field.setValue(instance, true);
      expect(field.getValue(instance) as boolean).assertTrue();
      field.setValue(instance, false);
      expect(field.getValue(instance) as boolean).assertFalse();
      field.setValue(instance, true);
      expect(field.getValue(instance) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0170
     * @tc.name testGetValue0170
     * @tc.desc Verify setValue and getValue with zero on int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, 99);
      field.setValue(instance, 0);
      expect(field.getValue(instance) as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0180
     * @tc.name testGetValue0180
     * @tc.desc Verify getValue on instance from Class.of vs createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TargetClass035();
      let clsOf = Class.of(obj);
      let fieldOf = clsOf.getInstanceField('data')!;
      let val: string = fieldOf.getValue(obj) as string;
      expect(val).assertEqual('target');

      let clsFrom = Class.from<TargetClass035>();
      let instance = clsFrom.createInstance();
      let fieldFrom = clsFrom.getInstanceField('data')!;
      let val2: string = fieldFrom.getValue(instance) as string;
      expect(val2).assertEqual('target');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0190
     * @tc.name testGetValue0190
     * @tc.desc Verify array field getValue modify push then setValue back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayField025>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let arr: Array<int> = field.getValue(instance) as Array<int>;
      arr.push(10);
      arr.push(20);
      arr.push(30);
      field.setValue(instance, arr);
      let result: Array<int> = field.getValue(instance) as Array<int>;
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0200
     * @tc.name testGetValue0200
     * @tc.desc Verify array field getValue loop append and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayField025>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let values: Array<int> = field.getValue(instance) as Array<int>;
      for (let i = 0; i < 20; i++) {
        values.push(i);
      }
      field.setValue(instance, values);
      let finalArr: Array<int> = field.getValue(instance) as Array<int>;
      expect(finalArr.length).assertEqual(20);
      expect(finalArr[0]).assertEqual(0);
      expect(finalArr[19]).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0210
     * @tc.name testGetValue0210
     * @tc.desc Verify getValue on concrete subclass of abstract class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteValue042>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('concreteField')!;
      let val: string = field.getValue(instance) as string;
      expect(val).assertEqual('concrete');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0220
     * @tc.name testGetValue0220
     * @tc.desc Verify reflection setValue then direct property read matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance() as TargetClass035;
      let field = cls.getInstanceField('data')!;
      field.setValue(instance, 'from reflection');
      let directVal: string = (instance as TargetClass035).data;
      expect(directVal).assertEqual('from reflection');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0230
     * @tc.name testGetValue0230
     * @tc.desc Verify direct property write then reflection getValue matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance() as TargetClass035;
      let field = cls.getInstanceField('data')!;
      instance.data = 'direct write';
      let reflectVal: string = field.getValue(instance) as string;
      expect(reflectVal).assertEqual('direct write');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0240
     * @tc.name testGetValue0240
     * @tc.desc Verify three instances maintain fully independent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let i1 = cls.createInstance();
      let i2 = cls.createInstance();
      let i3 = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(i1, 100);
      field.setValue(i2, 200);
      field.setValue(i3, 300);
      expect(field.getValue(i1) as int).assertEqual(100);
      expect(field.getValue(i2) as int).assertEqual(200);
      expect(field.getValue(i3) as int).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0250
     * @tc.name testGetValue0250
     * @tc.desc Verify byte field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteFieldClass049>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('byteVal')!;
      expect(field.getValue(instance) as byte).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0260
     * @tc.name testGetValue0260
     * @tc.desc Verify short field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortFieldClass050>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('shortVal')!;
      expect(field.getValue(instance) as short).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0270
     * @tc.name testGetValue0270
     * @tc.desc Verify long field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongFieldClass051>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longVal')!;
      expect(field.getValue(instance) as long).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0280
     * @tc.name testGetValue0280
     * @tc.desc Verify float field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatFieldClass052>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('floatVal')!;
      expect(field.getValue(instance) as float).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0290
     * @tc.name testGetValue0290
     * @tc.desc Verify double field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      expect(field.getValue(instance) as double).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0300
     * @tc.name testGetValue0300
     * @tc.desc Verify char field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CharFieldClass054>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('charVal')!;
      expect(field.getValue(instance) as char).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0310
     * @tc.name testGetValue0310
     * @tc.desc Verify boolean field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BooleanFieldClass055>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('boolVal')!;
      expect(field.getValue(instance) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0320
     * @tc.name testGetValue0320
     * @tc.desc Verify Object field default value via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ObjectFieldClass044>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('objField')!;
      let val = field.getValue(instance);
      expect(val !== null).assertTrue();
      expect(val instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0330
     * @tc.name testGetValue0330
     * @tc.desc Verify FixedArray field setValue and getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayFieldClass045>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('fixedArr')!;
      let arr: FixedArray<int> = new FixedArray<int>(3);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      field.setValue(instance, arr);
      let result: FixedArray<int> = field.getValue(instance) as FixedArray<int>;
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0340
     * @tc.name testGetValue0340
     * @tc.desc Verify Map field getValue returns a non-null Map from created instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MapFieldClass046>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mapField')!;
      let mapVal: Map<string, int> = field.getValue(instance) as Map<string, int>;
      expect(mapVal !== null).assertTrue();
      expect(mapVal instanceof Map).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0350
     * @tc.name testGetValue0350
     * @tc.desc Verify nullable string field setValue(null) and getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullableFieldClass047>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('nullableStr')!;
      field.setValue(instance, null);
      let val: string | null = field.getValue(instance) as string | null;
      expect(val).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0360
     * @tc.name testGetValue0360
     * @tc.desc Verify union type field getValue returns default int value from created instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnionFieldClass048>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('unionVal')!;
      let initVal: int = field.getValue(instance) as int;
      expect(initVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0370
     * @tc.name testGetValue0370
     * @tc.desc Verify getValue on readonly field succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyField033>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      let val: int = field.getValue(instance) as int;
      expect(val).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0380
     * @tc.name testGetValue0380
     * @tc.desc Verify double field setValue with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      field.setValue(instance, Double.NaN);
      let result: double = field.getValue(instance) as double;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0390
     * @tc.name testGetValue0390
     * @tc.desc Verify double field setValue with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      field.setValue(instance, Double.POSITIVE_INFINITY);
      let result: double = field.getValue(instance) as double;
      expect(isFinite(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0400
     * @tc.name testGetValue0400
     * @tc.desc Verify double field setValue with Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      field.setValue(instance, Double.NEGATIVE_INFINITY);
      let result: double = field.getValue(instance) as double;
      expect(isFinite(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0410
     * @tc.name testGetValue0410
     * @tc.desc Verify byte boundary max value setValue 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteFieldClass049>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('byteVal')!;
      let byteMax: byte = 127;
      field.setValue(instance, byteMax);
      expect(field.getValue(instance) as byte).assertEqual(byteMax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0420
     * @tc.name testGetValue0420
     * @tc.desc Verify byte boundary min value setValue -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteFieldClass049>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('byteVal')!;
      let byteMin: byte = -128;
      field.setValue(instance, byteMin);
      expect(field.getValue(instance) as byte).assertEqual(byteMin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0430
     * @tc.name testGetValue0430
     * @tc.desc Verify short boundary max value setValue 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortFieldClass050>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('shortVal')!;
      let shortMax: short = 32767;
      field.setValue(instance, shortMax);
      expect(field.getValue(instance) as short).assertEqual(shortMax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0440
     * @tc.name testGetValue0440
     * @tc.desc Verify short boundary min value setValue -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortFieldClass050>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('shortVal')!;
      let shortMin: short = -32768;
      field.setValue(instance, shortMin);
      expect(field.getValue(instance) as short).assertEqual(shortMin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0450
     * @tc.name testGetValue0450
     * @tc.desc Verify float boundary max value setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatFieldClass052>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('floatVal')!;
      let floatMax: float = 3.4028235e38f;
      field.setValue(instance, floatMax);
      let result: float = field.getValue(instance) as float;
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0460
     * @tc.name testGetValue0460
     * @tc.desc Verify double boundary max value setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      field.setValue(instance, 1.7976931348623157e308);
      let result: double = field.getValue(instance) as double;
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0470
     * @tc.name testGetValue0470
     * @tc.desc Verify getValue on parent field via child class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildValue039>();
      let childInstance = childCls.createInstance();
      let parentCls = childCls.getSuper()!;
      let parentField = parentCls.getInstanceField('parentData')!;
      expect(parentField.getValue(childInstance) as string).assertEqual('parent default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0480
     * @tc.name testGetValue0480
     * @tc.desc Verify byte field setValue and getValue with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteFieldClass049>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('byteVal')!;
      let one: byte = 1;
      field.setValue(instance, one);
      expect(field.getValue(instance) as byte).assertEqual(one);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0490
     * @tc.name testGetValue0490
     * @tc.desc Verify short field setValue and getValue with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortFieldClass050>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('shortVal')!;
      let one: short = 1;
      field.setValue(instance, one);
      expect(field.getValue(instance) as short).assertEqual(one);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0500
     * @tc.name testGetValue0500
     * @tc.desc Verify int field setValue and getValue with value MAX-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, 2147483646);
      expect(field.getValue(instance) as int).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0510
     * @tc.name testGetValue0510
     * @tc.desc Verify int field setValue and getValue with value MIN+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, -2147483647);
      expect(field.getValue(instance) as int).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0520
     * @tc.name testGetValue0520
     * @tc.desc Verify long field setValue and getValue with value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongFieldClass051>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longVal')!;
      let minusOne: long = -1;
      field.setValue(instance, minusOne);
      expect(field.getValue(instance) as long).assertEqual(minusOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0530
     * @tc.name testGetValue0530
     * @tc.desc Verify double field setValue and getValue with value -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      field.setValue(instance, -1.0);
      expect(field.getValue(instance) as double).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0540
     * @tc.name testGetValue0540
     * @tc.desc Verify float field setValue and getValue with value -1.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatFieldClass052>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('floatVal')!;
      let minusOne: float = -1.0f;
      field.setValue(instance, minusOne);
      expect(field.getValue(instance) as float).assertEqual(minusOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0550
     * @tc.name testGetValue0550
     * @tc.desc Verify char field setValue and getValue with null char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CharFieldClass054>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('charVal')!;
      let nullChar: char = c' ';
      field.setValue(instance, nullChar);
      expect(field.getValue(instance) as char).assertEqual(nullChar);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0560
     * @tc.name testGetValue0560
     * @tc.desc Verify boolean field setValue and getValue toggle twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BooleanFieldClass055>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('boolVal')!;
      field.setValue(instance, true);
      expect(field.getValue(instance) as boolean).assertTrue();
      field.setValue(instance, false);
      expect(field.getValue(instance) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0570
     * @tc.name testGetValue0570
     * @tc.desc Verify 10 instances maintain independent counter values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let field = cls.getInstanceField('counter')!;
      let instances: Array<Object> = [];
      for (let i = 0; i < 10; i++) {
        instances.push(cls.createInstance());
        field.setValue(instances[i], i);
      }
      for (let i = 0; i < 10; i++) {
        expect(field.getValue(instances[i]) as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0580
     * @tc.name testGetValue0580
     * @tc.desc Verify getValue on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplValue041>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ifaceVal')!;
      let val: string = field.getValue(instance) as string;
      expect(val).assertEqual('iface default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0590
     * @tc.name testGetValue0590
     * @tc.desc Verify long field setValue and getValue large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongFieldClass051>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longVal')!;
      let largeVal: long = 9223372036854775807;
      field.setValue(instance, largeVal);
      expect(field.getValue(instance) as long).assertEqual(largeVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0600
     * @tc.name testGetValue0600
     * @tc.desc Verify batch setValue on 3 fields and getValue all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldInstance040>();
      let instance = cls.createInstance();
      let nf = cls.getInstanceField('name')!;
      let cf = cls.getInstanceField('count')!;
      let af = cls.getInstanceField('active')!;
      nf.setValue(instance, 'batch_name');
      cf.setValue(instance, 42);
      af.setValue(instance, true);
      expect(nf.getValue(instance) as string).assertEqual('batch_name');
      expect(cf.getValue(instance) as int).assertEqual(42);
      expect(af.getValue(instance) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0610
     * @tc.name testGetValue0610
     * @tc.desc Verify getValue before setValue returns field default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveTypesClass043>();
      let instance = cls.createInstance();
      let f = cls.getInstanceField('byteField')!;
      expect(f.getValue(instance) as byte).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0620
     * @tc.name testGetValue0620
     * @tc.desc Verify setValue overwrite 20 times on int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      for (let i = 0; i < 20; i++) {
        field.setValue(instance, i * 10);
        expect(field.getValue(instance) as int).assertEqual(i * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0630
     * @tc.name testGetValue0630
     * @tc.desc Verify getValue on static field returns correct static value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest032>();
      let sf = cls.getStaticField('STATIC_VALUE')!;
      let val: string = sf.getValue() as string;
      expect(val).assertEqual('static');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0640
     * @tc.name testGetValue0640
     * @tc.desc Verify getValue on array field with 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayField025>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let arr: Array<int> = field.getValue(instance) as Array<int>;
      for (let i = 0; i < 50; i++) {
        arr.push(i);
      }
      field.setValue(instance, arr);
      let result: Array<int> = field.getValue(instance) as Array<int>;
      expect(result.length).assertEqual(50);
      expect(result[0]).assertEqual(0);
      expect(result[49]).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0650
     * @tc.name testGetValue0650
     * @tc.desc Verify getValue on boolean field after toggle sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BooleanFieldClass055>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('boolVal')!;
      let sequence: Array<boolean> = [true, false, true, true, false, true, false, false, true, false];
      for (let i = 0; i < sequence.length; i++) {
        field.setValue(instance, sequence[i]);
        expect(field.getValue(instance) as boolean).assertEqual(sequence[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0660
     * @tc.name testGetValue0660
     * @tc.desc Verify long field setValue min boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongFieldClass051>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longVal')!;
      let minVal: long = -9223372036854775808;
      field.setValue(instance, minVal);
      expect(field.getValue(instance) as long).assertEqual(minVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0670
     * @tc.name testGetValue0670
     * @tc.desc Verify double field setValue min boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass053>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('doubleVal')!;
      field.setValue(instance, -1.7976931348623157e308);
      let result: double = field.getValue(instance) as double;
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0680
     * @tc.name testGetValue0680
     * @tc.desc Verify float field setValue min boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatFieldClass052>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('floatVal')!;
      let minFloat: float = -3.4028235e38f;
      field.setValue(instance, minFloat);
      let result: float = field.getValue(instance) as float;
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0690
     * @tc.name testGetValue0690
     * @tc.desc Verify getValue on all primitive fields returns correct defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveTypesClass043>();
      let instance = cls.createInstance();
      expect(cls.getInstanceField('byteField')!.getValue(instance) as byte).assertEqual(0);
      expect(cls.getInstanceField('shortField')!.getValue(instance) as short).assertEqual(0);
      expect(cls.getInstanceField('longField')!.getValue(instance) as long).assertEqual(0);
      expect(cls.getInstanceField('boolField')!.getValue(instance) as boolean).assertFalse();
      expect(cls.getInstanceField('charField')!.getValue(instance) as char).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0700
     * @tc.name testGetValue0700
     * @tc.desc Verify 5 instances maintain fully independent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let field = cls.getInstanceField('counter')!;
      let i1 = cls.createInstance();
      let i2 = cls.createInstance();
      let i3 = cls.createInstance();
      let i4 = cls.createInstance();
      let i5 = cls.createInstance();
      field.setValue(i1, 10);
      field.setValue(i2, 20);
      field.setValue(i3, 30);
      field.setValue(i4, 40);
      field.setValue(i5, 50);
      expect(field.getValue(i1) as int).assertEqual(10);
      expect(field.getValue(i2) as int).assertEqual(20);
      expect(field.getValue(i3) as int).assertEqual(30);
      expect(field.getValue(i4) as int).assertEqual(40);
      expect(field.getValue(i5) as int).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0710
     * @tc.name testGetValue0710
     * @tc.desc Verify setValue same value twice on int field no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, 42);
      field.setValue(instance, 42);
      expect(field.getValue(instance) as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0720
     * @tc.name testGetValue0720
     * @tc.desc Verify getValue returns default for String field after createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      expect(field.getValue(instance) as string).assertEqual('target');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0730
     * @tc.name testGetValue0730
     * @tc.desc Verify getValue on boolean field defaults correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Serializable030>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('active')!;
      expect(field.getValue(instance) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0740
     * @tc.name testGetValue0740
     * @tc.desc Verify getValue on int field returns correct default 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField034>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('count')!;
      expect(field.getValue(instance) as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0750
     * @tc.name testGetValue0750
     * @tc.desc Verify getValue on multi-field class returns all correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Person028>();
      let instance = cls.createInstance();
      let nameField = cls.getInstanceField('name')!;
      let ageField = cls.getInstanceField('age')!;
      let emailField = cls.getInstanceField('email')!;
      nameField.setValue(instance, 'Alice');
      ageField.setValue(instance, 30);
      emailField.setValue(instance, 'alice@test.com');
      expect(nameField.getValue(instance) as string).assertEqual('Alice');
      expect(ageField.getValue(instance) as int).assertEqual(30);
      expect(emailField.getValue(instance) as string).assertEqual('alice@test.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0760
     * @tc.name testGetValue0760
     * @tc.desc Verify setValue on union field with string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnionFieldClass048>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('unionVal')!;
      field.setValue(instance, 'hello');
      let val: string = field.getValue(instance) as string;
      expect(val).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0770
     * @tc.name testGetValue0770
     * @tc.desc Verify static field setValue and getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest032>();
      let sf = cls.getStaticField('STATIC_VALUE')!;
      sf.setValue('modified_static');
      let val: string = sf.getValue() as string;
      expect(val).assertEqual('modified_static');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0780
     * @tc.name testGetValue0780
     * @tc.desc Verify instance field getValue after direct property modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance() as TargetClass035;
      instance.data = 'direct_modify';
      let field = cls.getInstanceField('data')!;
      expect(field.getValue(instance) as string).assertEqual('direct_modify');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0790
     * @tc.name testGetValue0790
     * @tc.desc Verify getValue loop reads return consistent value on each iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StateClass038>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, 42);
      for (let i = 0; i < 100; i++) {
        expect(field.getValue(instance) as int).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0800
     * @tc.name testGetValue0800
     * @tc.desc Verify getValue returns independent value after direct field modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TargetClass035>();
      let instance = cls.createInstance() as TargetClass035;
      let field = cls.getInstanceField('data')!;
      let before: string = field.getValue(instance) as string;
      instance.data = 'changed_externally';
      let after: string = field.getValue(instance) as string;
      expect(after).assertEqual('changed_externally');
      expect(after !== before).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0810
     * @tc.name testGetValue0810
     * @tc.desc Verify getValue via Class.of matches Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<ValueOfFrom_062>();
      let instance = clsFrom.createInstance();
      let obj = new ValueOfFrom_062();
      let clsOf = Class.of(obj);
      let vFrom = clsFrom.getInstanceField('val')!.getValue(instance) as int;
      let vOf = clsOf.getInstanceField('val')!.getValue(obj) as int;
      expect(vFrom).assertEqual(42);
      expect(vOf).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0820
     * @tc.name testGetValue0820
     * @tc.desc Verify getValue via Class.ofAny returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new ValueOfAny_063();
      let cls = Class.ofAny(obj)!;
      let field = cls.getInstanceField('key')!;
      let val: string = field.getValue(obj) as string;
      expect(val).assertEqual('ofAnyVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0830
     * @tc.name testGetValue0830
     * @tc.desc Verify getValue on 5-level deep inheritance chain fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = Class.from<ValueDeepE_060>();
      let inst = e.createInstance();
      let d = e.getSuper()!;
      let c = d.getSuper()!;
      let b = c.getSuper()!;
      let a = b.getSuper()!;
      expect(e.getInstanceField('e')!.getValue(inst) as int).assertEqual(5);
      expect(d.getInstanceField('d')!.getValue(inst) as int).assertEqual(4);
      expect(c.getInstanceField('c')!.getValue(inst) as int).assertEqual(3);
      expect(b.getInstanceField('b')!.getValue(inst) as int).assertEqual(2);
      expect(a.getInstanceField('a')!.getValue(inst) as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0840
     * @tc.name testGetValue0840
     * @tc.desc Verify getValue on shadowed field returns child value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<ValueShadowDerived_061>();
      let parent = child.getSuper()!;
      let cInst = child.createInstance();
      let pInst = parent.createInstance();
      expect(child.getInstanceField('childTag')!.getValue(cInst) as string).assertEqual('ctag');
      expect(parent.getInstanceField('baseTag')!.getValue(pInst) as string).assertEqual('btag');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0850
     * @tc.name testGetValue0850
     * @tc.desc Verify getValue on FixedArray field reads without setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueFixedArr_064>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('fa')!;
      let val = field.getValue(instance);
      expect(val !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0860
     * @tc.name testGetValue0860
     * @tc.desc Verify getValue on multi-dimensional array field default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueMultiDim_065>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('matrix')!;
      let val: Array<Array<int>> = field.getValue(instance) as Array<Array<int>>;
      expect(val.length).assertEqual(2);
      expect(val[0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0870
     * @tc.name testGetValue0870
     * @tc.desc Verify getValue on multi-interface class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueMultiIface_066>();
      let instance = cls.createInstance();
      let xf = cls.getInstanceField('xf')!;
      let yf = cls.getInstanceField('yf')!;
      expect(xf.getValue(instance) as string).assertEqual('xval');
      expect(yf.getValue(instance) as int).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0880
     * @tc.name testGetValue0880
     * @tc.desc Verify getValue on nullable union field reads initial string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueNullable_067>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('nv')!;
      let val: string = field.getValue(instance) as string;
      expect(val).assertEqual('initial');
    });
