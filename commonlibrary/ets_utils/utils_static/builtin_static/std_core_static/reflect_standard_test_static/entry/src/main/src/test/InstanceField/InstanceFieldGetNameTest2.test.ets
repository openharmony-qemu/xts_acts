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

class MyClass001 {
  public name: string = 'test';
}

class UnicodeField005 {
  public 名字: string = '中文';
  public имя: string = 'Russian';
  public 名前: string = 'Japanese';
}

class TestClass008 {
  public value: int = 0;
}

class LongName015 {
  public veryLongFieldName: string = '';
}

class ShortName016 {
  public a: string = '';
  public b: int = 0;
}

class NumberStart017 {
  public field1x: string = '';
  public field2x: string = '';
}

class GroupedFields019 {
  public user_id: int = 0;
  public user_name: string = '';
  public user_age: int = 0;
  public post_id: int = 1;
  public post_title: string = '';
}

class TestClass020 {
  public camelCase: string = '';
  public PascalCase: string = '';
  public snake_case: string = '';
}

class TestClass025 {
  public fieldA: string = 'valueA';
  public fieldB: string = 'valueB';
  public fieldC: string = 'valueC';
}

class StaticTest024 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class ParentWithName026 {
  public parentName: string = 'parent';
}

class ChildWithName026 extends ParentWithName026 {
  public childName: string = 'child';
}

class CaseSensitive027 {
  public camelCase: string = 'c';
  public PascalCase: string = 'P';
  public UPPERCASE: string = 'U';
}

interface IName028 {
  ifaceName: string;
}

class ImplName028 implements IName028 {
  public ifaceName: string = 'impl';
}

class MultiTypeFields029 {
  public intField: int = 0;
  public boolField: boolean = false;
  public floatField: float = 0.0f;
  public doubleField: double = 0.0;
  public stringField: string = '';
}

class PrivateFieldClass030 {
  public publicField: string = 'public';
  private privateField: string = 'private';
}

class SendValueNameTest031 {
  public data: string = 'initial';
}

class ByteFieldName032 {
  public byteField: byte = 0;
}

class ShortFieldName033 {
  public shortField: short = 0;
}

class LongFieldName034 {
  public longField: long = 0;
}

class CharFieldName035 {
  public charField: char = c'X';
}

class ArrayFieldName036 {
  public arrField: Array<int> = [];
}

class MapFieldName037 {
  public mapField: Map<string, int> = new Map<string, int>();
}

class NullableFieldName038 {
  public nullableStr: string | null = null;
}

class UnionFieldName039 {
  public unionVal: int | string = 0;
}

final class FinalName040 {
  public finalData: string = 'final';
}

abstract class AbstractName041 {
  public abstractField: string = 'abstract';
}

class ConcreteName041 extends AbstractName041 {
  public concreteField: string = 'concrete';
}

interface IName042 {
  ifaceField: string;
}

class ImplName042 implements IName042 {
  public ifaceField: string = 'iface';
}

class SingleCharZ043 {
  public z: string = 'z';
}

class UnderscorePrefix044 {
  public _hidden: string = 'hidden';
}

class MixedLangName045 {
  public 用户name: string = 'mixed';
}

class NumSuffix046 {
  public field1: string = 'a';
  public field2: string = 'b';
  public field3: string = 'c';
}

class GetNameConsistency047 {
  public data: string = 'test';
}

class TenFieldsName048 {
  public n0: int = 0;
  public n1: int = 1;
  public n2: int = 2;
  public n3: int = 3;
  public n4: int = 4;
  public n5: int = 5;
  public n6: int = 6;
  public n7: int = 7;
  public n8: int = 8;
  public n9: int = 9;
}

class GetNameGetValue049 {
  public name: string = 'test';
}

class SortedFields050 {
  public zebra: string = 'z';
  public apple: string = 'a';
  public mango: string = 'm';
  public banana: string = 'b';
  public cherry: string = 'c';
}

class ReadonlyNameClass051 {
  public readonly data: string = 'readonly';
}

class DeepA_060 {
  public lv1: string = 'L1'
}

class DeepB_060 extends DeepA_060 {
  public lv2: string = 'L2'
}

class DeepC_060 extends DeepB_060 {
  public lv3: string = 'L3'
}

class DeepD_060 extends DeepC_060 {
  public lv4: string = 'L4'
}

class DeepE_060 extends DeepD_060 {
  public lv5: string = 'L5'
}

class ShadowBase_061 {
  public common: string = 'base';
  public baseTag: string = 'btag'
}

class ShadowDerived_061 extends ShadowBase_061 {
  public common: string = 'derived';
  public childTag: string = 'ctag'
}

class FixedArrName_062 {
  public fa: FixedArray<int> = new FixedArray<int>(3)
}

class MultiDim_063 {
  public matrix: Array<Array<int>> = []
}

interface INameX_064 { ifx: string }

interface INameY_064 { ify: string }

class MultiIface_064 implements INameX_064, INameY_064 {
  public ifx: string = 'x';
  public ify: string = 'y'
}

class OfVsFrom_065 {
  public field: string = 'ofv'
}

class OfAny_066 {
  public data: string = 'any'
}

class CurrentGetName_070 {
  public data: string = 'currentName';

  public getClass(): Class {
    return Class.current();
  }
}

class MixedUnicodeField_071 {
  public 用户test名: string = 'unicode'
}

class SpecialName_072 {
  public m_prefix_val: string = 'prefixed';
  public __dunder__: string = 'dunder'
}

class DoubleInitName_073 {
  public data: string = 'initTest'
}

class NestedGenericName_074 {
  public deepMap: Map<string, Array<int>> = new Map<string, Array<int>>()
}

class ChainBase_075 {
  public baseVal: string = 'base'
}

class ChainMid_075 extends ChainBase_075 {
  public midVal: string = 'mid'
}

class ChainLeaf_075 extends ChainMid_075 {
  public leafVal: string = 'leaf'
}

interface AbsIface_076 { ifaceField: string }

abstract class AbsBase_076 implements AbsIface_076 {
  public absField: string = 'abs';
  public ifaceField: string = 'ifaceVal'
}

class AbsConcrete_076 extends AbsBase_076 {
  public concreteField: string = 'conc'
}

interface IFSharedA_077 { sharedName: string }

interface IFSharedB_077 { sharedName: string }

class MultiSharedName_077 implements IFSharedA_077, IFSharedB_077 {
  public sharedName: string = 'shared';
  public uniqueField: string = 'unique'
}

class GrandParentCount_078 {
  public a: int = 0
}

class ParentCount_078 extends GrandParentCount_078 {
  public b: int = 0
}

class ChildCount_078 extends ParentCount_078 {
  public c: int = 0
}

class GlobalNames_079 {
  public 테스트: string = 'korean';
  public اختبار: string = 'arabic'
}

interface IBaseGetName_080 { baseField: string }

interface IDerivedGetName_080 extends IBaseGetName_080 { derivedField: string }

class ImplChainName_080 implements IDerivedGetName_080 {
  public baseField: string = 'b';
  public derivedField: string = 'd'
}

abstract class AbsBaseName_081 {
  public absBaseVal: string = 'ab'
}

abstract class AbsDerivedName_081 extends AbsBaseName_081 {
  public absDerivedVal: string = 'ad'
}

class ConcreteAbsName_081 extends AbsDerivedName_081 {
  public concVal: string = 'c'
}

class BigintName_082 {
  public bigVal: bigint = 0n
}

interface IXName_083 { x: string }

interface IYName_083 { y: string }

interface IZName_083 { z: string }

class TripleIfaceName_083 implements IXName_083, IYName_083, IZName_083 {
  public x: string = 'x';
  public y: string = 'y';
  public z: string = 'z'
}

class MixedPatternName_084 {
  public _count_1: int = 0;
  public value_2x: string = ''
}

class CustomType_085 {
  public val: int = 0
}

class HasCustomField_085 {
  public obj: CustomType_085 = new CustomType_085()
}

class MapIntStr_086 {
  public mis: Map<int, string> = new Map<int, string>()
}

class StaticInstanceName_087 {
  public static name: string = 'staticName';
  public name: string = 'instanceName'
}

class GPName_088 {
  public gp: string = 'gp'
}

class PName_088 extends GPName_088 {
  public p: string = 'p'
}

class CName_088 extends PName_088 {
  public c: string = 'c'
}

class StaticFieldName_089 {
  public static sName: string = 'staticName';
  public iName: string = 'instanceName'
}

class ParentFieldsName_090 {
  public parentField: string = 'p'
}

class ChildFieldsName_090 extends ParentFieldsName_090 {
  public childField: string = 'c';
  public anotherField: int = 0
}

class MultiStaticName_091 {
  public static a: int = 1;
  public static b: int = 2;
  public static c: int = 3
}

class ParentStaticName_092 {
  public static pStatic: string = 'ps';
  public pInst: string = 'pi'
}

class ChildStaticName_092 extends ParentStaticName_092 {
  public cInst: string = 'ci'
}

enum NameEnum_093 { ALPHA, BETA }

class EnumFieldName_093 {
  public status: NameEnum_093 = NameEnum_093.ALPHA;
  public label: string = 'lbl'
}

class MixStaticInstName_094 {
  public static s1: int = 1;
  public static s2: int = 2;
  public i1: string = 'a';
  public i2: string = 'b'
}

export default function InstanceFieldGetNameTest2(): void {
  describe('InstanceFieldGetNameTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0010
     * @tc.name testGetName0010
     * @tc.desc Verify getName after class initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getInstanceField('name')!;
      expect(field.getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0020
     * @tc.name testGetName0020
     * @tc.desc Verify getName preserves exact character case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CaseSensitive027>();
      let c1 = cls.getInstanceField('camelCase')!;
      let c2 = cls.getInstanceField('PascalCase')!;
      let c3 = cls.getInstanceField('UPPERCASE')!;
      expect(c1.getName()).assertEqual('camelCase');
      expect(c2.getName()).assertEqual('PascalCase');
      expect(c3.getName()).assertEqual('UPPERCASE');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0030
     * @tc.name testGetName0030
     * @tc.desc Verify getName on fields from parent class via getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildWithName026>();
      let childField = childCls.getInstanceField('childName')!;
      expect(childField.getName()).assertEqual('childName');

      let parentCls = childCls.getSuper()!;
      let parentField = parentCls.getInstanceField('parentName')!;
      expect(parentField.getName()).assertEqual('parentName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0040
     * @tc.name testGetName0040
     * @tc.desc Verify getName on all fields in array iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass025>();
      let fields = cls.getInstanceFields();
      let names: Array<string> = [];
      for (let i = 0; i < fields.length; i++) {
        names.push(fields[i].getName());
      }
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('fieldA');
      expect(names[1]).assertEqual('fieldB');
      expect(names[2]).assertEqual('fieldC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0050
     * @tc.name testGetName0050
     * @tc.desc Verify getName on public field returns the declared field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      expect(field.getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0060
     * @tc.name testGetName0060
     * @tc.desc Verify getName matches the exact lookup string used in getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass025>();
      let lookupNames: Array<string> = ['fieldA', 'fieldB', 'fieldC'];
      for (let i = 0; i < lookupNames.length; i++) {
        let field = cls.getInstanceField(lookupNames[i])!;
        expect(field.getName()).assertEqual(lookupNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0070
     * @tc.name testGetName0070
     * @tc.desc Verify getName result length matches declaration length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CaseSensitive027>();
      let field = cls.getInstanceField('camelCase')!;
      expect(field.getName().length).assertEqual('camelCase'.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0080
     * @tc.name testGetName0080
     * @tc.desc Verify getName on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplName028>();
      let field = cls.getInstanceField('ifaceName')!;
      expect(field.getName()).assertEqual('ifaceName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0090
     * @tc.name testGetName0090
     * @tc.desc Verify getName unchanged after setValue on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('name')!;
      let nameBefore: string = field.getName();
      field.setValue(instance, 'newName');
      let nameAfter: string = field.getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0100
     * @tc.name testGetName0100
     * @tc.desc Verify getName on int type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let field = cls.getInstanceField('intField')!;
      expect(field.getName()).assertEqual('intField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0110
     * @tc.name testGetName0110
     * @tc.desc Verify getName on boolean type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let field = cls.getInstanceField('boolField')!;
      expect(field.getName()).assertEqual('boolField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0120
     * @tc.name testGetName0120
     * @tc.desc Verify getName on float type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let field = cls.getInstanceField('floatField')!;
      expect(field.getName()).assertEqual('floatField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0130
     * @tc.name testGetName0130
     * @tc.desc Verify getName on double type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let field = cls.getInstanceField('doubleField')!;
      expect(field.getName()).assertEqual('doubleField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0140
     * @tc.name testGetName0140
     * @tc.desc Verify getInstanceField returns undefined for private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateFieldClass030>();
      let field = cls.getInstanceField('privateField');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0150
     * @tc.name testGetName0150
     * @tc.desc Verify getInstanceField returns InstanceField for public field alongside private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateFieldClass030>();
      let field = cls.getInstanceField('publicField')!;
      expect(field.getName()).assertEqual('publicField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0160
     * @tc.name testGetName0160
     * @tc.desc Verify getName unchanged after multiple setValue calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SendValueNameTest031>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let nameBefore: string = field.getName();
      field.setValue(instance, 'val1');
      field.setValue(instance, 'val2');
      field.setValue(instance, 'val3');
      let nameAfter: string = field.getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0170
     * @tc.name testGetName0170
     * @tc.desc Verify getName on all primitive type fields in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(5);
      let fieldNames: Array<string> = ['intField', 'boolField', 'floatField', 'doubleField', 'stringField'];
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getName()).assertEqual(fieldNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0180
     * @tc.name testGetName0180
     * @tc.desc Verify getName on byte type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteFieldName032>();
      let field = cls.getInstanceField('byteField')!;
      expect(field.getName()).assertEqual('byteField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0190
     * @tc.name testGetName0190
     * @tc.desc Verify getName on short type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortFieldName033>();
      let field = cls.getInstanceField('shortField')!;
      expect(field.getName()).assertEqual('shortField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0200
     * @tc.name testGetName0200
     * @tc.desc Verify getName on long type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongFieldName034>();
      let field = cls.getInstanceField('longField')!;
      expect(field.getName()).assertEqual('longField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0210
     * @tc.name testGetName0210
     * @tc.desc Verify getName on char type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CharFieldName035>();
      let field = cls.getInstanceField('charField')!;
      expect(field.getName()).assertEqual('charField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0220
     * @tc.name testGetName0220
     * @tc.desc Verify getName on Array type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayFieldName036>();
      let field = cls.getInstanceField('arrField')!;
      expect(field.getName()).assertEqual('arrField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0230
     * @tc.name testGetName0230
     * @tc.desc Verify getName on Map type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MapFieldName037>();
      let field = cls.getInstanceField('mapField')!;
      expect(field.getName()).assertEqual('mapField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0240
     * @tc.name testGetName0240
     * @tc.desc Verify getName on nullable type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullableFieldName038>();
      let field = cls.getInstanceField('nullableStr')!;
      expect(field.getName()).assertEqual('nullableStr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0250
     * @tc.name testGetName0250
     * @tc.desc Verify getName on union type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnionFieldName039>();
      let field = cls.getInstanceField('unionVal')!;
      expect(field.getName()).assertEqual('unionVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0260
     * @tc.name testGetName0260
     * @tc.desc Verify getName on final class field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalName040>();
      let field = cls.getInstanceField('finalData')!;
      expect(field.getName()).assertEqual('finalData');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0270
     * @tc.name testGetName0270
     * @tc.desc Verify getName on abstract class field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractName041>();
      let field = cls.getInstanceField('abstractField')!;
      expect(field.getName()).assertEqual('abstractField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0280
     * @tc.name testGetName0280
     * @tc.desc Verify getName on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplName042>();
      let field = cls.getInstanceField('ifaceField')!;
      expect(field.getName()).assertEqual('ifaceField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0290
     * @tc.name testGetName0290
     * @tc.desc Verify getName on single char field name z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleCharZ043>();
      let field = cls.getInstanceField('z')!;
      expect(field.getName()).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0300
     * @tc.name testGetName0300
     * @tc.desc Verify getName on underscore-prefixed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnderscorePrefix044>();
      let field = cls.getInstanceField('_hidden')!;
      expect(field.getName()).assertEqual('_hidden');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0310
     * @tc.name testGetName0310
     * @tc.desc Verify getName on mixed-language field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedLangName045>();
      let field = cls.getInstanceField('用户name')!;
      expect(field.getName()).assertEqual('用户name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0320
     * @tc.name testGetName0320
     * @tc.desc Verify getName on fields with number suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumSuffix046>();
      expect(cls.getInstanceField('field1')!.getName()).assertEqual('field1');
      expect(cls.getInstanceField('field2')!.getName()).assertEqual('field2');
      expect(cls.getInstanceField('field3')!.getName()).assertEqual('field3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0330
     * @tc.name testGetName0330
     * @tc.desc Verify getName returns consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<GetNameGetValue049>();
      let instance1 = cls1.createInstance();
      let field1 = cls1.getInstanceField('name')!;
      let before1: string = field1.getName();
      let after1: string = field1.getName();
      expect(after1).assertEqual(before1);

      let cls2 = Class.from<GetNameConsistency047>();
      let field2 = cls2.getInstanceField('data')!;
      let before2: string = field2.getName();
      let after2: string = field2.getName();
      expect(after2).assertEqual(before2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0340
     * @tc.name testGetName0340
     * @tc.desc Verify getName on 10 fields class returns all correct names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldsName048>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(10);
      for (let i = 0; i < fields.length; i++) {
        let expectedName: string = 'n' + i;
        expect(fields[i].getName()).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0350
     * @tc.name testGetName0350
     * @tc.desc Verify 1000 repeated getName calls return consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetNameConsistency047>();
      let field = cls.getInstanceField('data')!;
      for (let i = 0; i < 1000; i++) {
        expect(field.getName()).assertEqual('data');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0360
     * @tc.name testGetName0360
     * @tc.desc Verify getName before and after class initialize stays same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetNameConsistency047>();
      let field = cls.getInstanceField('data')!;
      let before: string = field.getName();
      cls.initialize();
      let after: string = field.getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0370
     * @tc.name testGetName0370
     * @tc.desc Verify getName from Class.from vs Class.of is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<GetNameConsistency047>();
      let fFrom = clsFrom.getInstanceField('data')!;
      let obj = new GetNameConsistency047();
      let clsOf = Class.of(obj);
      let fOf = clsOf.getInstanceField('data')!;
      expect(fFrom.getName()).assertEqual(fOf.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0380
     * @tc.name testGetName0380
     * @tc.desc Verify getName on readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyNameClass051>();
      let field = cls.getInstanceField('data')!;
      expect(field.getName()).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0390
     * @tc.name testGetName0390
     * @tc.desc Verify getName on static field via InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest024>();
      let instanceField = cls.getInstanceField('instanceValue')!;
      expect(instanceField.getName()).assertEqual('instanceValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0400
     * @tc.name testGetName0400
     * @tc.desc Verify getName with all methods combined in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetNameGetValue049>();
      let field = cls.getInstanceField('name')!;
      expect(field.getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0410
     * @tc.name testGetName0410
     * @tc.desc Verify getName returns all expected fruit-named fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SortedFields050>();
      let fields = cls.getInstanceFields();
      let names: Array<string> = [];
      for (let i = 0; i < fields.length; i++) {
        names.push(fields[i].getName());
      }
      let hasApple: boolean = false;
      let hasBanana: boolean = false;
      let hasCherry: boolean = false;
      let hasMango: boolean = false;
      let hasZebra: boolean = false;
      for (let i = 0; i < names.length; i++) {
        if (names[i] === 'apple') {
          hasApple = true;
        }
        if (names[i] === 'banana') {
          hasBanana = true;
        }
        if (names[i] === 'cherry') {
          hasCherry = true;
        }
        if (names[i] === 'mango') {
          hasMango = true;
        }
        if (names[i] === 'zebra') {
          hasZebra = true;
        }
      }
      expect(hasApple).assertTrue();
      expect(hasBanana).assertTrue();
      expect(hasCherry).assertTrue();
      expect(hasMango).assertTrue();
      expect(hasZebra).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0420
     * @tc.name testGetName0420
     * @tc.desc Verify getName on string field via getInstanceField exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let field = cls.getInstanceField('stringField')!;
      expect(field.getName()).assertEqual('stringField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0430
     * @tc.name testGetName0430
     * @tc.desc Verify getName on 5 different field types in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let fields = cls.getInstanceFields();
      let foundInt: boolean = false;
      let foundBool: boolean = false;
      let foundFloat: boolean = false;
      let foundDouble: boolean = false;
      let foundString: boolean = false;
      for (let i = 0; i < fields.length; i++) {
        let n = fields[i].getName();
        if (n === 'intField') {
          foundInt = true;
        }
        if (n === 'boolField') {
          foundBool = true;
        }
        if (n === 'floatField') {
          foundFloat = true;
        }
        if (n === 'doubleField') {
          foundDouble = true;
        }
        if (n === 'stringField') {
          foundString = true;
        }
      }
      expect(foundInt).assertTrue();
      expect(foundBool).assertTrue();
      expect(foundFloat).assertTrue();
      expect(foundDouble).assertTrue();
      expect(foundString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0440
     * @tc.name testGetName0440
     * @tc.desc Verify getName on field with underscore in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GroupedFields019>();
      let field = cls.getInstanceField('user_id')!;
      expect(field.getName()).assertEqual('user_id');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0450
     * @tc.name testGetName0450
     * @tc.desc Verify getName on field with snake_case naming
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass020>();
      let field = cls.getInstanceField('snake_case')!;
      expect(field.getName()).assertEqual('snake_case');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0460
     * @tc.name testGetName0460
     * @tc.desc Verify getName on field with PascalCase naming
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass020>();
      let field = cls.getInstanceField('PascalCase')!;
      expect(field.getName()).assertEqual('PascalCase');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0470
     * @tc.name testGetName0470
     * @tc.desc Verify getName on Unicode Chinese field name exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeField005>();
      let field = cls.getInstanceField('名字')!;
      expect(field.getName()).assertEqual('名字');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0480
     * @tc.name testGetName0480
     * @tc.desc Verify getName on Unicode Russian field name exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeField005>();
      let field = cls.getInstanceField('имя')!;
      expect(field.getName()).assertEqual('имя');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0490
     * @tc.name testGetName0490
     * @tc.desc Verify getName on field from parent class accessed via child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildWithName026>();
      let parentCls = childCls.getSuper()!;
      let pf = parentCls.getInstanceField('parentName')!;
      expect(pf.getName()).assertEqual('parentName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0500
     * @tc.name testGetName0500
     * @tc.desc Verify getName returns expected field name from TestClass008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('value')!;
      expect(field.getName()).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0510
     * @tc.name testGetName0510
     * @tc.desc Verify getName on fields from getInstanceFields and getInstanceField match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldsName048>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField('n' + i)!;
        expect(byName.getName()).assertEqual(fields[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0520
     * @tc.name testGetName0520
     * @tc.desc Verify getName on short field name a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortName016>();
      let field = cls.getInstanceField('a')!;
      expect(field.getName()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0530
     * @tc.name testGetName0530
     * @tc.desc Verify getName on short field name b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortName016>();
      let field = cls.getInstanceField('b')!;
      expect(field.getName()).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0540
     * @tc.name testGetName0540
     * @tc.desc Verify getName on very long field name exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongName015>();
      let field = cls.getInstanceField('veryLongFieldName')!;
      expect(field.getName()).assertEqual('veryLongFieldName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0550
     * @tc.name testGetName0550
     * @tc.desc Verify getName on field with number-in-name prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberStart017>();
      let field = cls.getInstanceField('field1x')!;
      expect(field.getName()).assertEqual('field1x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0560
     * @tc.name testGetName0560
     * @tc.desc Verify getName combined with getType on each field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let fields = cls.getInstanceFields();
      let expectedNames = ['intField', 'boolField', 'floatField', 'doubleField', 'stringField'];
      let expectedTypes = ['i32', 'u1', 'f32', 'f64', 'std.core.String'];
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getName()).assertEqual(expectedNames[i]);
        expect(fields[i].getType().getName()).assertEqual(expectedTypes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0570
     * @tc.name testGetName0570
     * @tc.desc Verify getName combined with getOwner on each field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiTypeFields029>();
      let fields = cls.getInstanceFields();
      let expectedNames = ['intField', 'boolField', 'floatField', 'doubleField', 'stringField'];
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getName()).assertEqual(expectedNames[i]);
        expect(fields[i].getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetNameTest2.test.MultiTypeFields029');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0580
     * @tc.name testGetName0580
     * @tc.desc Verify getName on fields from getInstanceFields count matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumSuffix046>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(3);
      let names: Array<string> = [];
      for (let i = 0; i < fields.length; i++) {
        names.push(fields[i].getName());
      }
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0590
     * @tc.name testGetName0590
     * @tc.desc Verify getName on subclass concrete field via abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteName041>();
      let field = cls.getInstanceField('concreteField')!;
      expect(field.getName()).assertEqual('concreteField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0600
     * @tc.name testGetName0600
     * @tc.desc Verify getName on field with Japanese Unicode name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeField005>();
      let field = cls.getInstanceField('名前')!;
      expect(field.getName()).assertEqual('名前');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0610
     * @tc.name testGetName0610
     * @tc.desc Verify getName on all group fields with user_ prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GroupedFields019>();
      let fields = cls.getInstanceFields();
      let userFields: Array<string> = [];
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName().startsWith('user_')) {
          userFields.push(fields[i].getName());
        }
      }
      expect(userFields.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0620
     * @tc.name testGetName0620
     * @tc.desc Verify getName on all group fields with post_ prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GroupedFields019>();
      let fields = cls.getInstanceFields();
      let postFields: Array<string> = [];
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName().startsWith('post_')) {
          postFields.push(fields[i].getName());
        }
      }
      expect(postFields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0630
     * @tc.name testGetName0630
     * @tc.desc Verify getName on fields via getInstanceFields size matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GroupedFields019>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0640
     * @tc.name testGetName0640
     * @tc.desc Verify getName length check matches expected name length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      expect(field.getName()).assertEqual('name');
      expect(field.getName().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0650
     * @tc.name testGetName0650
     * @tc.desc Verify getName on field from getInstanceField with exact string lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass025>();
      let field = cls.getInstanceField('fieldA')!;
      expect(field.getName()).assertEqual('fieldA');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0660
     * @tc.name testGetName0660
     * @tc.desc Verify getName on field after createInstance preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass025>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('fieldB')!;
      let name: string = field.getName();
      field.setValue(instance, 'changed');
      expect(field.getName()).assertEqual(name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0670
     * @tc.name testGetName0670
     * @tc.desc Verify getName via Class.of matches Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<OfVsFrom_065>();
      let obj = new OfVsFrom_065();
      let clsOf = Class.of(obj);
      let nameFrom = clsFrom.getInstanceField('field')!.getName();
      let nameOf = clsOf.getInstanceField('field')!.getName();
      expect(nameFrom).assertEqual(nameOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0680
     * @tc.name testGetName0680
     * @tc.desc Verify getName via Class.ofAny returns correct field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new OfAny_066();
      let cls = Class.ofAny(obj)!;
      let field = cls.getInstanceField('data')!;
      expect(field.getName()).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0690
     * @tc.name testGetName0690
     * @tc.desc Verify getName on 5-level deep inheritance chain field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = Class.from<DeepE_060>();
      let d = e.getSuper()!;
      let c = d.getSuper()!;
      let b = c.getSuper()!;
      let a = b.getSuper()!;
      expect(e.getInstanceField('lv5')!.getName()).assertEqual('lv5');
      expect(d.getInstanceField('lv4')!.getName()).assertEqual('lv4');
      expect(c.getInstanceField('lv3')!.getName()).assertEqual('lv3');
      expect(b.getInstanceField('lv2')!.getName()).assertEqual('lv2');
      expect(a.getInstanceField('lv1')!.getName()).assertEqual('lv1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0700
     * @tc.name testGetName0700
     * @tc.desc Verify getName on shadowed field in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<ShadowDerived_061>();
      let parent = child.getSuper()!;
      let childField = child.getInstanceField('childTag')!;
      let parentField = parent.getInstanceField('baseTag')!;
      expect(childField.getName()).assertEqual('childTag');
      expect(parentField.getName()).assertEqual('baseTag');
      expect(childField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetNameTest2.test.ShadowDerived_061');
      expect(parentField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetNameTest2.test.ShadowBase_061');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0710
     * @tc.name testGetName0710
     * @tc.desc Verify getName on FixedArray type field returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrName_062>();
      let field = cls.getInstanceField('fa')!;
      expect(field.getName()).assertEqual('fa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0720
     * @tc.name testGetName0720
     * @tc.desc Verify getName on multi-dimensional array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiDim_063>();
      let field = cls.getInstanceField('matrix')!;
      expect(field.getName()).assertEqual('matrix');
      expect(field.getType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0730
     * @tc.name testGetName0730
     * @tc.desc Verify getName on multi-interface implementation class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiIface_064>();
      let f1 = cls.getInstanceField('ifx')!;
      let f2 = cls.getInstanceField('ify')!;
      expect(f1.getName()).assertEqual('ifx');
      expect(f2.getName()).assertEqual('ify');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0740
     * @tc.name testGetName0740
     * @tc.desc Verify getName via Class.current matches Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new CurrentGetName_070();
      let clsCur = obj.getClass();
      let clsFrom = Class.from<CurrentGetName_070>();
      let nameCur = clsCur.getInstanceField('data')!.getName();
      let nameFrom = clsFrom.getInstanceField('data')!.getName();
      expect(nameCur).assertEqual(nameFrom);
      expect(nameCur).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0750
     * @tc.name testGetName0750
     * @tc.desc Verify getInstanceField with empty string returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleInitName_073>();
      let field = cls.getInstanceField('');
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0760
     * @tc.name testGetName0760
     * @tc.desc Verify getName consistency after double initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleInitName_073>();
      let field = cls.getInstanceField('data')!;
      let before = field.getName();
      cls.initialize();
      cls.initialize();
      let after = field.getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0770
     * @tc.name testGetName0770
     * @tc.desc Verify getName on field with mixed-language Unicode combo name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedUnicodeField_071>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('用户test名');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0780
     * @tc.name testGetName0780
     * @tc.desc Verify getName on underscore-prefixed and special identifier field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialName_072>();
      let fields = cls.getInstanceFields();
      let expectedNames = ['m_prefix_val', '__dunder__'];
      expect(fields.length).assertEqual(2);
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getName()).assertEqual(expectedNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0790
     * @tc.name testGetName0790
     * @tc.desc Verify getName on deep nested generic type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedGenericName_074>();
      let field = cls.getInstanceField('deepMap')!;
      expect(field.getName()).assertEqual('deepMap');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0800
     * @tc.name testGetName0800
     * @tc.desc Verify getName via multi-level getSuper chain matches direct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf = Class.from<ChainLeaf_075>();
      let mid = leaf.getSuper()!;
      let base = mid.getSuper()!;
      expect(leaf.getInstanceField('leafVal')!.getName()).assertEqual('leafVal');
      expect(mid.getInstanceField('midVal')!.getName()).assertEqual('midVal');
      expect(base.getInstanceField('baseVal')!.getName()).assertEqual('baseVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0810
     * @tc.name testGetName0810
     * @tc.desc Verify getName on abstract+interface hierarchy concrete class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbsConcrete_076>();
      let field = cls.getInstanceField('concreteField')!;
      expect(field.getName()).assertEqual('concreteField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0820
     * @tc.name testGetName0820
     * @tc.desc Verify getName on abstract class field via concrete subclass getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let concrete = Class.from<AbsConcrete_076>();
      let abs = concrete.getSuper()!;
      let field = abs.getInstanceField('absField')!;
      expect(field.getName()).assertEqual('absField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0830
     * @tc.name testGetName0830
     * @tc.desc Verify getName on multi-interface shared field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiSharedName_077>();
      let field = cls.getInstanceField('sharedName')!;
      expect(field.getName()).assertEqual('sharedName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0840
     * @tc.name testGetName0840
     * @tc.desc Verify getInstanceFields count on multi-inheritance class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<ChildCount_078>();
      let fields = child.getInstanceFields();
      expect(fields.length).assertEqual(1);
      let parent = child.getSuper()!;
      let pFields = parent.getInstanceFields();
      expect(pFields.length).assertEqual(1);
      let grand = parent.getSuper()!;
      let gFields = grand.getInstanceFields();
      expect(gFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0850
     * @tc.name testGetName0850
     * @tc.desc Verify getName on fields with Korean and Arabic script names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GlobalNames_079>();
      let fields = cls.getInstanceFields();
      let expectedNames = ['테스트', 'اختبار'];
      expect(fields.length).assertEqual(2);
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getName()).assertEqual(expectedNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0860
     * @tc.name testGetName0860
     * @tc.desc Verify getName on interface-extends-interface hierarchy field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplChainName_080>();
      expect(cls.getInstanceField('baseField')!.getName()).assertEqual('baseField');
      expect(cls.getInstanceField('derivedField')!.getName()).assertEqual('derivedField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0870
     * @tc.name testGetName0870
     * @tc.desc Verify getName on abstract-extends-abstract hierarchy field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let conc = Class.from<ConcreteAbsName_081>();
      let ad = conc.getSuper()!;
      let ab = ad.getSuper()!;
      expect(conc.getInstanceField('concVal')!.getName()).assertEqual('concVal');
      expect(ad.getInstanceField('absDerivedVal')!.getName()).assertEqual('absDerivedVal');
      expect(ab.getInstanceField('absBaseVal')!.getName()).assertEqual('absBaseVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0880
     * @tc.name testGetName0880
     * @tc.desc Verify getName on bigint typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BigintName_082>();
      let field = cls.getInstanceField('bigVal')!;
      expect(field.getName()).assertEqual('bigVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0890
     * @tc.name testGetName0890
     * @tc.desc Verify getInstanceFields count on triple interface class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleIfaceName_083>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0900
     * @tc.name testGetName0900
     * @tc.desc Verify getName on fields with underscore-number mixed names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedPatternName_084>();
      let f1 = cls.getInstanceField('_count_1')!;
      let f2 = cls.getInstanceField('value_2x')!;
      expect(f1.getName()).assertEqual('_count_1');
      expect(f2.getName()).assertEqual('value_2x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0910
     * @tc.name testGetName0910
     * @tc.desc Verify getName on field typed as custom class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HasCustomField_085>();
      let field = cls.getInstanceField('obj')!;
      expect(field.getName()).assertEqual('obj');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0920
     * @tc.name testGetName0920
     * @tc.desc Verify getName on Map<int,string> typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MapIntStr_086>();
      let field = cls.getInstanceField('mis')!;
      expect(field.getName()).assertEqual('mis');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0930
     * @tc.name testGetName0930
     * @tc.desc Verify getName on class with static and instance same-named fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticInstanceName_087>();
      let field = cls.getInstanceField('name')!;
      expect(field.getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0940
     * @tc.name testGetName0940
     * @tc.desc Verify getName on grandparent field via deep getSuper chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<CName_088>();
      let parent = child.getSuper()!;
      let gp = parent.getSuper()!;
      let field = gp.getInstanceField('gp')!;
      expect(field.getName()).assertEqual('gp');
    });
