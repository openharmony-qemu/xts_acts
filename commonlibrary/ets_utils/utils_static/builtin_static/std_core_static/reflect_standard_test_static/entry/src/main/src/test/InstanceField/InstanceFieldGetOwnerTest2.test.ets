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

class StaticTest019 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class TestClass003 {
  public value: int = 0;
}

interface MyInterface006 {
  interfaceField: string;
}

class ImplClass006 implements MyInterface006 {
  public interfaceField: string = '';
}

class OuterClass013 {
  public outerField: string = 'outer';
}

class MyClass1014 {
  public field: string = '';
}

class MyClass2014 {
  public field: string = '';
}

class TestClass015 {
  public data: string = 'test';
}

class TestClass016 {
  public field1: string = '';
  public field2: int = 0;
  public field3: boolean = false;
}

class Parent020 {
  public parentData: string = 'parent';
}

class Child020 extends Parent020 {
  public childData: string = 'child';
}

class ShadowParent021 {
  public name: string = 'parent';
  public parentOnly: string = 'onlyInParent';
}

class ShadowChild021 extends ShadowParent021 {
  public name: string = 'child';
  public childOnly: string = 'onlyInChild';
}

class Level1_022 {
  public field1: string = 'level1';
}

class Level2_022 extends Level1_022 {
  public field2: string = 'level2';
}

class Level3_022 extends Level2_022 {
  public field3: string = 'level3';
}

class OwnerNameClass023 {
  public data: string = 'test';
}

interface IOwner024 {
  ifaceField: string;
}

class ImplOwner024 implements IOwner024 {
  public ifaceField: string = '';
}

class ParentType025 {
  public parentField: string = 'parent';
}

class ChildType025 extends ParentType025 {
  public childField: string = 'child';
}

abstract class AbstractClass026 {
  public abstractField: string = 'abstract';
}

class ConcreteClass026 extends AbstractClass026 {
  public concreteField: string = 'concrete';
}

class FinalCheckClass027 {
  public data: string = 'check';
}

final class FinalClass028 {
  public finalData: string = 'final';
}

class FinalOwnerTest029 {
  public value: int = 0;
}

interface IOwner031 {
  ifaceA: string;
}

interface IOwner032 {
  ifaceB: string;
}

class MultiImpl033 implements IOwner031, IOwner032 {
  public ifaceA: string = '';
  public ifaceB: string = '';
}

class Level0_034 {
  public field0: string = 'level0';
}

class Level1_034 extends Level0_034 {
  public field1: string = 'level1';
}

class Level2_034 extends Level1_034 {
  public field2: string = 'level2';
}

class Level3_034 extends Level2_034 {
  public field3: string = 'level3';
}

class SetValueOwnerTest035 {
  public value: int = 0;
}

class GetTypeOwnerTest036 {
  public data: string = 'test';
}

class FinalCheck037 {
  public finalVal: string = 'final';
}

class MultiOwnerClass038 {
  public a: string = 'a';
  public b: int = 0;
  public c: boolean = false;
  public d: float = 0.0f;
  public e: double = 0.0;
}

class OwnerDeepA_060 {
  public a: string = 'a'
}

class OwnerDeepB_060 extends OwnerDeepA_060 {
  public b: string = 'b'
}

class OwnerDeepC_060 extends OwnerDeepB_060 {
  public c: string = 'c'
}

class OwnerDeepD_060 extends OwnerDeepC_060 {
  public d: string = 'd'
}

class OwnerDeepE_060 extends OwnerDeepD_060 {
  public e: string = 'e'
}

class OwnerShadowBase_061 {
  public shared: string = 'base';
  public baseTag: string = 'btag'
}

class OwnerShadowDerived_061 extends OwnerShadowBase_061 {
  public shared: string = 'child';
  public childTag: string = 'ctag'
}

class OwnerOfFrom_062 {
  public val: int = 0
}

class OwnerOfAny_063 {
  public key: string = 'k'
}

interface OwnerIX_064 { xf: string }

interface OwnerIY_064 { yf: string }

class OwnerMultiIface_064 implements OwnerIX_064, OwnerIY_064 {
  public xf: string = 'x';
  public yf: string = 'y'
}

class OwnerFixedArr_065 {
  public fa: FixedArray<int> = new FixedArray<int>(3)
}

class CurrentOwner_070 {
  public val: int = 0;

  public getClass(): Class {
    return Class.current();
  }
}

class DoubleInitOwner_070 {
  public val: int = 0
}

class OwnerChainBase_071 {
  public bv: string = 'b'
}

class OwnerChainMid_071 extends OwnerChainBase_071 {
  public mv: string = 'm'
}

class OwnerChainLeaf_071 extends OwnerChainMid_071 {
  public lv: string = 'l'
}

class SubtypeSelf_072 {
  public val: int = 0
}

class SubParent_073 {
  public pv: int = 0
}

class SubChild_073 extends SubParent_073 {
  public cv: int = 0
}

interface OwnerIFA_074 { sharedField: string }

interface OwnerIFB_074 { sharedField: string }

class OwnerMultiShared_074 implements OwnerIFA_074, OwnerIFB_074 {
  public sharedField: string = 's';
  public uniqueField: string = 'u'
}

interface IOBase_075 { baseField: string }

interface IODerived_075 extends IOBase_075 { derivedField: string }

class OImplChain_075 implements IODerived_075 {
  public baseField: string = 'b';
  public derivedField: string = 'd'
}

abstract class OAbsBase_076 {
  public abVal: string = 'ab'
}

abstract class OAbsDerived_076 extends OAbsBase_076 {
  public adVal: string = 'ad'
}

class OConcAbs_076 extends OAbsDerived_076 {
  public cVal: string = 'c'
}

interface OIX_077 { x: string }

interface OIY_077 { y: string }

interface OIZ_077 { z: string }

class OTriple_077 implements OIX_077, OIY_077, OIZ_077 {
  public x: string = 'x';
  public y: string = 'y';
  public z: string = 'z'
}

class OBigint_078 {
  public bv: bigint = 0n
}

class OMultiField_079 {
  public f1: int = 0;
  public f2: int = 0;
  public f3: string = '';
  public f4: string = '';
  public f5: boolean = false
}

class OwnerReadonly_080 {
  public readonly roVal: int = 100
}

class OwnerCustomType_081 {
  public v: int = 0
}

class OwnerHasCustom_081 {
  public obj: OwnerCustomType_081 = new OwnerCustomType_081()
}

class OwnerMapIS_082 {
  public mis: Map<int, string> = new Map<int, string>()
}

class OGP_083 {
  public gp: int = 0
}

class OP_083 extends OGP_083 {
  public p: int = 0
}

class OC_083 extends OP_083 {
  public c: int = 0
}


class OStaticField_084 {
  public static sVal: int = 0;
  public iVal: int = 0
}

class OPlainClass_085 {
  public val: int = 0
}

class OStaticInst_086 {
  public static sv: string = 's';
  public iv: string = 'i'
}

class OParentStatic_087 {
  public static psVal: int = 0
}

class OChildStatic_087 extends OParentStatic_087 {
  public cVal: int = 0
}

enum OwnerEnum_088 { X, Y, Z }

class OEnumField_088 {
  public kind: OwnerEnum_088 = OwnerEnum_088.X;
  public data: int = 0
}

class OPlain_089 {
  public val: int = 0
}

class OLevel1_090 {
  public l1: int = 0
}

class OLevel2_090 extends OLevel1_090 {
  public l2: int = 0
}

class OLevel3_090 extends OLevel2_090 {
  public l3: int = 0
}

export default function InstanceFieldGetOwnerTest2(): void {
  describe('InstanceFieldGetOwnerTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0010
     * @tc.name testGetOwner0010
     * @tc.desc Verify getOwner returns child class when field name shadows parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ShadowChild021>();
      let childField = childCls.getInstanceField('childOnly')!;
      expect(childField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.ShadowChild021');
      let parentCls = childCls.getSuper()!;
      let parentField = parentCls.getInstanceField('parentOnly')!;
      expect(parentField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.ShadowParent021');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0020
     * @tc.name testGetOwner0020
     * @tc.desc Verify getOwner across 3-level deep inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let level3 = Class.from<Level3_022>();
      let field3 = level3.getInstanceField('field3')!;
      expect(field3.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level3_022');
      let level2 = level3.getSuper()!;
      let field2 = level2.getInstanceField('field2')!;
      expect(field2.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level2_022');
      let level1 = level2.getSuper()!;
      let field1 = level1.getInstanceField('field1')!;
      expect(field1.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level1_022');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0030
     * @tc.name testGetOwner0030
     * @tc.desc Verify getOwner().getName() ends with declaring class name and is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameClass023>();
      let field = cls.getInstanceField('data')!;
      let ownerName: string = field.getOwner().getName();
      expect(ownerName)
        .assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerNameClass023');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0040
     * @tc.name testGetOwner0040
     * @tc.desc Verify getOwner().isEnum() returns false for regular class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameClass023>();
      let field = cls.getInstanceField('data')!;
      let owner = field.getOwner();
      expect(owner.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0050
     * @tc.name testGetOwner0050
     * @tc.desc Verify getOwner().isInterface() returns false for regular class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameClass023>();
      let field = cls.getInstanceField('data')!;
      let owner = field.getOwner();
      expect(owner.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0060
     * @tc.name testGetOwner0060
     * @tc.desc Verify getOwner().getDescriptor() returns exact JVM-style descriptor for OwnerNameClass023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameClass023>();
      let field = cls.getInstanceField('data')!;
      let desc: string = field.getOwner().getDescriptor();
      expect(desc).assertEqual('Lentry/src/main/src/test/InstanceField/InstanceFieldGetOwnerTest2/test/OwnerNameClass023;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0070
     * @tc.name testGetOwner0070
     * @tc.desc Verify getOwner().getSuper() yields std.core.Object with expected class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameClass023>();
      let field = cls.getInstanceField('data')!;
      let owner = field.getOwner();
      let superCls = owner.getSuper();
      expect(superCls !== undefined).assertTrue();
      expect(superCls!.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0080
     * @tc.name testGetOwner0080
     * @tc.desc Verify all fields in same class return identical owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let fields = cls.getInstanceFields();
      let firstOwner = fields[0].getOwner();
      for (let i = 1; i < fields.length; i++) {
        expect(fields[i].getOwner().getName()).assertEqual(firstOwner.getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0090
     * @tc.name testGetOwner0090
     * @tc.desc Verify getOwner().getSuper().getName() returns parent class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameClass023>();
      let field = cls.getInstanceField('data')!;
      let owner = field.getOwner();
      let superCls = owner.getSuper()!;
      expect(superCls.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0100
     * @tc.name testGetOwner0100
     * @tc.desc Verify getOwner on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplOwner024>();
      let field = cls.getInstanceField('ifaceField')!;
      let owner = field.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.ImplOwner024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0110
     * @tc.name testGetOwner0110
     * @tc.desc Verify getOwner().isSubtypeOf check between parent and child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentType025>();
      let childCls = Class.from<ChildType025>();
      let parentOwner = parentCls.getInstanceField('parentField')!.getOwner();
      let childOwner = childCls.getInstanceField('childField')!.getOwner();
      expect(childOwner.isSubtypeOf(parentOwner)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0120
     * @tc.name testGetOwner0120
     * @tc.desc Verify getOwner().isFinal() evaluates to false for non-final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalCheckClass027>();
      let field = cls.getInstanceField('data')!;
      let owner = field.getOwner();
      expect(owner.isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0130
     * @tc.name testGetOwner0130
     * @tc.desc Verify getOwner().isAbstract() returns false for concrete class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteClass026>();
      let field = cls.getInstanceField('concreteField')!;
      let owner = field.getOwner();
      expect(owner.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0140
     * @tc.name testGetOwner0140
     * @tc.desc Verify getOwner().getInterfaces() on interface-implementing class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplOwner024>();
      let field = cls.getInstanceField('ifaceField')!;
      let owner = field.getOwner();
      let interfaces = owner.getInterfaces();
      expect(interfaces.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0150
     * @tc.name testGetOwner0150
     * @tc.desc Verify getOwner on abstract class field via concrete subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = Class.from<AbstractClass026>();
      let absField = absCls.getInstanceField('abstractField')!;
      expect(absField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.AbstractClass026');
      let concreteCls = Class.from<ConcreteClass026>();
      let concreteField = concreteCls.getInstanceField('concreteField')!;
      expect(concreteField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.ConcreteClass026');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0160
     * @tc.name testGetOwner0160
     * @tc.desc Verify getOwner chain across 4-level inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = Class.from<Level3_022>();
      let l2 = l3.getSuper()!;
      let l1 = l2.getSuper()!;
      expect(l3.getInstanceField('field3')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level3_022');
      expect(l2.getInstanceField('field2')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level2_022');
      expect(l1.getInstanceField('field1')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level1_022');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0170
     * @tc.name testGetOwner0170
     * @tc.desc Verify StaticField and InstanceField owner are the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest019>();
      let staticOwner = cls.getStaticField('STATIC_VALUE')!.getOwner();
      let instanceOwner = cls.getInstanceField('instanceValue')!.getOwner();
      expect(staticOwner.getName()).assertEqual(instanceOwner.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0180
     * @tc.name testGetOwner0180
     * @tc.desc Verify getOwner().isFinal() on final class correctly returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass028>();
      let field = cls.getInstanceField('finalData')!;
      let owner = field.getOwner();
      expect(owner.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0190
     * @tc.name testGetOwner0190
     * @tc.desc Verify getOwner().isAbstract() on abstract class correctly identifies it as abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass026>();
      let field = cls.getInstanceField('abstractField')!;
      let owner = field.getOwner();
      expect(owner.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0200
     * @tc.name testGetOwner0200
     * @tc.desc Verify getOwner().isPrimitive() confirms class owner is not a primitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0210
     * @tc.name testGetOwner0210
     * @tc.desc Verify getOwner().getInterfaces() returned interface name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplOwner024>();
      let field = cls.getInstanceField('ifaceField')!;
      let owner = field.getOwner();
      let interfaces = owner.getInterfaces();
      expect(interfaces[0].getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.IOwner024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0220
     * @tc.name testGetOwner0220
     * @tc.desc Verify getOwner unchanged after setValue on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalOwnerTest029>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      let ownerNameBefore: string = field.getOwner().getName();
      field.setValue(instance, 999);
      let ownerNameAfter: string = field.getOwner().getName();
      expect(ownerNameAfter).assertEqual(ownerNameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0230
     * @tc.name testGetOwner0230
     * @tc.desc Verify getOwner().isFinal() for ordinary class expects false result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0240
     * @tc.name testGetOwner0240
     * @tc.desc Verify getOwner().isInterface() on ordinary class correctly reports non-interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0250
     * @tc.name testGetOwner0250
     * @tc.desc Verify getOwner().isAbstract() on concrete class correctly reports non-abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0260
     * @tc.name testGetOwner0260
     * @tc.desc Verify getOwner().isFixedArray() on ordinary class confirms not a fixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0270
     * @tc.name testGetOwner0270
     * @tc.desc Verify getOwner().isUnion() on ordinary class confirms not a union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0280
     * @tc.name testGetOwner0280
     * @tc.desc Verify getOwner().getName() returns exact class name match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let ownerName = field.getOwner().getName();
      expect(ownerName).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.MyClass001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0290
     * @tc.name testGetOwner0290
     * @tc.desc Verify getOwner().getDescriptor() for MyClass001 produces exact descriptor string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let desc: string = field.getOwner().getDescriptor();
      expect(desc).assertEqual('Lentry/src/main/src/test/InstanceField/InstanceFieldGetOwnerTest2/test/MyClass001;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0300
     * @tc.name testGetOwner0300
     * @tc.desc Verify getOwner().getInterfaces() on multi-interface class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiImpl033>();
      let field = cls.getInstanceField('ifaceA')!;
      let owner = field.getOwner();
      let interfaces = owner.getInterfaces();
      expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0310
     * @tc.name testGetOwner0310
     * @tc.desc Verify getOwner() 4-level inheritance chain field owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = Class.from<Level3_034>();
      expect(l3.getInstanceField('field3')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level3_034');
      let l2 = l3.getSuper()!;
      expect(l2.getInstanceField('field2')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level2_034');
      let l1 = l2.getSuper()!;
      expect(l1.getInstanceField('field1')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level1_034');
      let l0 = l1.getSuper()!;
      expect(l0.getInstanceField('field0')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level0_034');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0320
     * @tc.name testGetOwner0320
     * @tc.desc Verify getOwner().isSubtypeOf child-to-parent subtype check yields true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Level1_034>();
      let parentCls = Class.from<Level0_034>();
      let childOwner = childCls.getInstanceField('field1')!.getOwner();
      let parentOwner = parentCls.getInstanceField('field0')!.getOwner();
      expect(childOwner.isSubtypeOf(parentOwner)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0330
     * @tc.name testGetOwner0330
     * @tc.desc Verify getOwner().getSuper() returns non-undefined for subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Level1_034>();
      let field = cls.getInstanceField('field1')!;
      let owner = field.getOwner();
      let superCls = owner.getSuper();
      expect(superCls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0340
     * @tc.name testGetOwner0340
     * @tc.desc Verify getOwner() on abstract class field returns correct owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass026>();
      let field = cls.getInstanceField('abstractField')!;
      let owner = field.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.AbstractClass026');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0350
     * @tc.name testGetOwner0350
     * @tc.desc Verify getOwner() on final class field returns correct owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass028>();
      let field = cls.getInstanceField('finalData')!;
      let owner = field.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.FinalClass028');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0360
     * @tc.name testGetOwner0360
     * @tc.desc Verify getOwner consistency after setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueOwnerTest035>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      let before: string = field.getOwner().getName();
      field.setValue(instance, 999);
      let after: string = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0370
     * @tc.name testGetOwner0370
     * @tc.desc Verify getOwner().getName() returns consistent results on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueOwnerTest035>();
      let field = cls.getInstanceField('value')!;
      let before: string = field.getOwner().getName();
      let after: string = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0380
     * @tc.name testGetOwner0380
     * @tc.desc Verify getOwner consistency after getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetTypeOwnerTest036>();
      let field = cls.getInstanceField('data')!;
      let before: string = field.getOwner().getName();
      let after: string = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0390
     * @tc.name testGetOwner0390
     * @tc.desc Verify same field obtained twice from getInstanceField yields identical owner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetTypeOwnerTest036>();
      let f1 = cls.getInstanceField('data')!;
      let before: string = f1.getOwner().getName();
      let after: string = f1.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0400
     * @tc.name testGetOwner0400
     * @tc.desc Verify all fields in 5-field class have same owner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiOwnerClass038>();
      let fields = cls.getInstanceFields();
      for (let i = 1; i < fields.length; i++) {
        expect(fields[i].getOwner().getName()).assertEqual(fields[0].getOwner().getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0410
     * @tc.name testGetOwner0410
     * @tc.desc Verify getOwner on final class field owner name correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalCheck037>();
      let field = cls.getInstanceField('finalVal')!;
      let owner = field.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.FinalCheck037');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0420
     * @tc.name testGetOwner0420
     * @tc.desc Verify getOwner on fields from Class.from vs Class.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<MyClass001>();
      let fFrom = clsFrom.getInstanceField('name')!;
      let obj = new MyClass001();
      let clsOf = Class.of(obj);
      let fOf = clsOf.getInstanceField('name')!;
      expect(fFrom.getOwner().getName()).assertEqual(fOf.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0430
     * @tc.name testGetOwner0430
     * @tc.desc Verify getOwner().isEnum() on ordinary class confirms it is not an enum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0440
     * @tc.name testGetOwner0440
     * @tc.desc Verify getOwner().isInterface() on interface-implementing class returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplOwner024>();
      let field = cls.getInstanceField('ifaceField')!;
      let owner = field.getOwner();
      expect(owner.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0450
     * @tc.name testGetOwner0450
     * @tc.desc Verify getOwner().isFinal() on concrete class returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteClass026>();
      let field = cls.getInstanceField('concreteField')!;
      let owner = field.getOwner();
      expect(owner.isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0460
     * @tc.name testGetOwner0460
     * @tc.desc Verify getOwner().isPrimitive() on primitive field owner returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let field = cls.getInstanceField('value')!;
      let owner = field.getOwner();
      expect(owner.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0470
     * @tc.name testGetOwner0470
     * @tc.desc Verify getOwner().isFixedArray() on regular owner returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let field = cls.getInstanceField('value')!;
      let owner = field.getOwner();
      expect(owner.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0480
     * @tc.name testGetOwner0480
     * @tc.desc Verify getOwner().isUnion() on regular owner returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let field = cls.getInstanceField('value')!;
      let owner = field.getOwner();
      expect(owner.isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0490
     * @tc.name testGetOwner0490
     * @tc.desc Verify getOwner().getDescriptor() on different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let field = cls.getInstanceField('value')!;
      let desc: string = field.getOwner().getDescriptor();
      expect(desc).assertEqual('Lentry/src/main/src/test/InstanceField/InstanceFieldGetOwnerTest2/test/TestClass003;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0500
     * @tc.name testGetOwner0500
     * @tc.desc Verify getOwner().getSuper().getName() for child class owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child020>();
      let field = cls.getInstanceField('childData')!;
      let owner = field.getOwner();
      let superOwner = owner.getSuper();
      expect(superOwner !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0510
     * @tc.name testGetOwner0510
     * @tc.desc Verify getOwner().getLinker() returns non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      let linker = owner.getLinker();
      expect(linker !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0520
     * @tc.name testGetOwner0520
     * @tc.desc Verify getOwner after createInstance does not change owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let before: string = field.getOwner().getName();
      cls.createInstance();
      let after: string = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0530
     * @tc.name testGetOwner0530
     * @tc.desc Verify getOwner() repeated 500 calls all equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let base: string = field.getOwner().getName();
      for (let i = 0; i < 500; i++) {
        expect(field.getOwner().getName()).assertEqual(base);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0540
     * @tc.name testGetOwner0540
     * @tc.desc Verify getOwner from getInstanceFields all elements have valid owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiOwnerClass038>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getOwner() !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0550
     * @tc.name testGetOwner0550
     * @tc.desc Verify getOwner on different field type owners are same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiOwnerClass038>();
      let f1 = cls.getInstanceField('a')!;
      let f2 = cls.getInstanceField('b')!;
      let f3 = cls.getInstanceField('c')!;
      let f4 = cls.getInstanceField('d')!;
      let f5 = cls.getInstanceField('e')!;
      expect(f1.getOwner().getName()).assertEqual(f2.getOwner().getName());
      expect(f2.getOwner().getName()).assertEqual(f3.getOwner().getName());
      expect(f3.getOwner().getName()).assertEqual(f4.getOwner().getName());
      expect(f4.getOwner().getName()).assertEqual(f5.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0560
     * @tc.name testGetOwner0560
     * @tc.desc Verify getOwner().isSubtypeOf reverse parent-to-child is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<Parent020>();
      let childCls = Class.from<Child020>();
      let parentOwner = parentCls.getInstanceField('parentData')!.getOwner();
      let childOwner = childCls.getInstanceField('childData')!.getOwner();
      expect(parentOwner.isSubtypeOf(childOwner)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0570
     * @tc.name testGetOwner0570
     * @tc.desc Verify getOwner on 2-level inheritance child field owner is child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child020>();
      let childField = childCls.getInstanceField('childData')!;
      expect(childField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Child020');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0580
     * @tc.name testGetOwner0580
     * @tc.desc Verify getOwner on 2-level inheritance parent field owner is parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child020>();
      let parentCls = childCls.getSuper()!;
      let parentField = parentCls.getInstanceField('parentData')!;
      expect(parentField.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Parent020');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0590
     * @tc.name testGetOwner0590
     * @tc.desc Verify getOwner on multi-level inheritance grandchild field owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = Class.from<Level3_034>();
      let l2 = l3.getSuper()!;
      let l1 = l2.getSuper()!;
      let l0 = l1.getSuper()!;
      expect(l3.getInstanceField('field3')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level3_034');
      expect(l2.getInstanceField('field2')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level2_034');
      expect(l1.getInstanceField('field1')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level1_034');
      expect(l0.getInstanceField('field0')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level0_034');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0600
     * @tc.name testGetOwner0600
     * @tc.desc Verify getOwner on all fields from getInstanceFields array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        let owner = fields[i].getOwner();
        expect(owner.getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.TestClass016');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0610
     * @tc.name testGetOwner0610
     * @tc.desc Verify getOwner on same field through different getInstanceField calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      expect(f1.getOwner().getName()).assertEqual(f2.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0620
     * @tc.name testGetOwner0620
     * @tc.desc Verify getOwner on interface-implementing class getInterfaces name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplOwner024>();
      let field = cls.getInstanceField('ifaceField')!;
      let owner = field.getOwner();
      let interfaces = owner.getInterfaces();
      expect(interfaces.length).assertEqual(1);
      expect(interfaces[0].getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.IOwner024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0630
     * @tc.name testGetOwner0630
     * @tc.desc Verify getOwner returns correct owner for outer class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OuterClass013>();
      let field = cls.getInstanceField('outerField')!;
      let owner = field.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OuterClass013');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0640
     * @tc.name testGetOwner0640
     * @tc.desc Verify getOwner on 3 different classes all return distinct owners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass001>();
      let cls2 = Class.from<MyClass1014>();
      let cls3 = Class.from<MyClass2014>();
      let n1 = cls1.getInstanceField('name')!.getOwner().getName();
      let n2 = cls2.getInstanceField('field')!.getOwner().getName();
      let n3 = cls3.getInstanceField('field')!.getOwner().getName();
      expect(n1 !== n2).assertTrue();
      expect(n2 !== n3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0650
     * @tc.name testGetOwner0650
     * @tc.desc Verify getOwner on two different classes have different owner names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass001>();
      let cls2 = Class.from<TestClass003>();
      let n1 = cls1.getInstanceField('name')!.getOwner().getName();
      let n2 = cls2.getInstanceField('value')!.getOwner().getName();
      expect(n1 !== n2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0660
     * @tc.name testGetOwner0660
     * @tc.desc Verify getOwner on fields from static and instance same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest019>();
      let sf = cls.getStaticField('STATIC_VALUE')!;
      let inf = cls.getInstanceField('instanceValue')!;
      expect(sf.getOwner() !== null).assertTrue();
      expect(inf.getOwner() !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0670
     * @tc.name testGetOwner0670
     * @tc.desc Verify getOwner is consistent before and after getSuper call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child020>();
      let field = cls.getInstanceField('childData')!;
      let before: string = field.getOwner().getName();
      cls.getSuper();
      let after: string = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0680
     * @tc.name testGetOwner0680
     * @tc.desc Verify getOwner on class with 3 fields all same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let f1 = cls.getInstanceField('field1')!.getOwner().getName();
      let f2 = cls.getInstanceField('field2')!.getOwner().getName();
      let f3 = cls.getInstanceField('field3')!.getOwner().getName();
      expect(f1).assertEqual(f2);
      expect(f2).assertEqual(f3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0690
     * @tc.name testGetOwner0690
     * @tc.desc Verify getOwner on field with same name across different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<MyClass1014>();
      let c2 = Class.from<MyClass2014>();
      let o1 = c1.getInstanceField('field')!.getOwner().getName();
      let o2 = c2.getInstanceField('field')!.getOwner().getName();
      expect(o1 !== o2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0700
     * @tc.name testGetOwner0700
     * @tc.desc Verify getOwner on interface field via implementing class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplClass006>();
      let field = cls.getInstanceField('interfaceField')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.ImplClass006');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0710
     * @tc.name testGetOwner0710
     * @tc.desc Verify getOwner after getValue call stays consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass015>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      let before: string = field.getOwner().getName();
      field.getValue(instance);
      let after: string = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0720
     * @tc.name testGetOwner0720
     * @tc.desc Verify getOwner on grandparent-inherited field via deep chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = Class.from<Level3_034>();
      let l2 = l3.getSuper()!;
      let l1 = l2.getSuper()!;
      let l0 = l1.getSuper()!;
      let field0 = l0.getInstanceField('field0')!;
      expect(field0.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.Level0_034');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0730
     * @tc.name testGetOwner0730
     * @tc.desc Verify getOwner via Class.of matches Class.from owner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<OwnerOfFrom_062>();
      let obj = new OwnerOfFrom_062();
      let clsOf = Class.of(obj);
      let ownerFrom = clsFrom.getInstanceField('val')!.getOwner().getName();
      let ownerOf = clsOf.getInstanceField('val')!.getOwner().getName();
      expect(ownerFrom).assertEqual(ownerOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0740
     * @tc.name testGetOwner0740
     * @tc.desc Verify getOwner via Class.ofAny returns correct owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new OwnerOfAny_063();
      let cls = Class.ofAny(obj)!;
      let field = cls.getInstanceField('key')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerOfAny_063');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0750
     * @tc.name testGetOwner0750
     * @tc.desc Verify getOwner on 5-level deep inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = Class.from<OwnerDeepE_060>();
      let d = e.getSuper()!;
      let c = d.getSuper()!;
      let b = c.getSuper()!;
      let a = b.getSuper()!;
      expect(e.getInstanceField('e')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerDeepE_060');
      expect(d.getInstanceField('d')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerDeepD_060');
      expect(c.getInstanceField('c')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerDeepC_060');
      expect(b.getInstanceField('b')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerDeepB_060');
      expect(a.getInstanceField('a')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerDeepA_060');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0760
     * @tc.name testGetOwner0760
     * @tc.desc Verify getOwner on shadowed field returns correct owner per class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<OwnerShadowDerived_061>();
      let parent = child.getSuper()!;
      let co = child.getInstanceField('childTag')!.getOwner().getName();
      let po = parent.getInstanceField('baseTag')!.getOwner().getName();
      expect(co).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerShadowDerived_061');
      expect(po).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerShadowBase_061');
      expect(co !== po).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0770
     * @tc.name testGetOwner0770
     * @tc.desc Verify getOwner consistency before and after Class.initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerOfFrom_062>();
      let field = cls.getInstanceField('val')!;
      let before = field.getOwner().getName();
      cls.initialize();
      let after = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0780
     * @tc.name testGetOwner0780
     * @tc.desc Verify getOwner on multi-interface class fields share same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerMultiIface_064>();
      let o1 = cls.getInstanceField('xf')!.getOwner().getName();
      let o2 = cls.getInstanceField('yf')!.getOwner().getName();
      expect(o1).assertEqual(o2);
      expect(o1).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerMultiIface_064');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0790
     * @tc.name testGetOwner0790
     * @tc.desc Verify getOwner on FixedArray type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerFixedArr_065>();
      let field = cls.getInstanceField('fa')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerFixedArr_065');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0800
     * @tc.name testGetOwner0800
     * @tc.desc Verify getOwner via Class.current matches Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new CurrentOwner_070();
      let clsCur = obj.getClass();
      let clsFrom = Class.from<CurrentOwner_070>();
      let ownerCur = clsCur.getInstanceField('val')!.getOwner().getName();
      let ownerFrom = clsFrom.getInstanceField('val')!.getOwner().getName();
      expect(ownerCur).assertEqual(ownerFrom);
      expect(ownerCur).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.CurrentOwner_070');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0810
     * @tc.name testGetOwner0810
     * @tc.desc Verify getOwner consistency after double Class.initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleInitOwner_070>();
      let field = cls.getInstanceField('val')!;
      let before = field.getOwner().getName();
      cls.initialize();
      cls.initialize();
      let after = field.getOwner().getName();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0820
     * @tc.name testGetOwner0820
     * @tc.desc Verify getOwner via multi-level getSuper chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf = Class.from<OwnerChainLeaf_071>();
      let mid = leaf.getSuper()!;
      let base = mid.getSuper()!;
      let leafOwner = leaf.getInstanceField('lv')!.getOwner().getName();
      let midOwner = mid.getInstanceField('mv')!.getOwner().getName();
      let baseOwner = base.getInstanceField('bv')!.getOwner().getName();
      expect(leafOwner).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerChainLeaf_071');
      expect(midOwner).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerChainMid_071');
      expect(baseOwner).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerChainBase_071');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0830
     * @tc.name testGetOwner0830
     * @tc.desc Verify field.getOwner().isSubtypeOf(self) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SubtypeSelf_072>();
      let field = cls.getInstanceField('val')!;
      let owner = field.getOwner();
      expect(owner.isSubtypeOf(owner)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0840
     * @tc.name testGetOwner0840
     * @tc.desc Verify child field owner is subtype of parent field owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<SubChild_073>();
      let parent = Class.from<SubParent_073>();
      let childOwner = child.getInstanceField('cv')!.getOwner();
      let parentOwner = parent.getInstanceField('pv')!.getOwner();
      expect(childOwner.isSubtypeOf(parentOwner)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0850
     * @tc.name testGetOwner0850
     * @tc.desc Verify field.getOwner().getSuper() matches expected parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<SubChild_073>();
      let parent = Class.from<SubParent_073>();
      let childOwner = child.getInstanceField('cv')!.getOwner();
      let superOwner = childOwner.getSuper()!;
      expect(superOwner.getName()).assertEqual(parent.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0860
     * @tc.name testGetOwner0860
     * @tc.desc Verify getOwner on multi-interface shared field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerMultiShared_074>();
      let f1 = cls.getInstanceField('sharedField')!;
      let f2 = cls.getInstanceField('uniqueField')!;
      expect(f1.getOwner().getName()).assertEqual(f2.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0870
     * @tc.name testGetOwner0870
     * @tc.desc Verify getOwner().getDescriptor() for OwnerOfFrom_062 yields precise descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerOfFrom_062>();
      let field = cls.getInstanceField('val')!;
      let desc: string = field.getOwner().getDescriptor();
      expect(desc).assertEqual('Lentry/src/main/src/test/InstanceField/InstanceFieldGetOwnerTest2/test/OwnerOfFrom_062;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0880
     * @tc.name testGetOwner0880
     * @tc.desc Verify getOwner on interface-extends-interface hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OImplChain_075>();
      let f1 = cls.getInstanceField('baseField')!;
      let f2 = cls.getInstanceField('derivedField')!;
      expect(f1.getOwner().getName()).assertEqual(f2.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0890
     * @tc.name testGetOwner0890
     * @tc.desc Verify getOwner on abstract-extends-abstract hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let conc = Class.from<OConcAbs_076>();
      let ad = conc.getSuper()!;
      let ab = ad.getSuper()!;
      expect(conc.getInstanceField('cVal')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OConcAbs_076');
      expect(ad.getInstanceField('adVal')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OAbsDerived_076');
      expect(ab.getInstanceField('abVal')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OAbsBase_076');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0900
     * @tc.name testGetOwner0900
     * @tc.desc Verify getOwner on triple interface class all fields same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OTriple_077>();
      let o1 = cls.getInstanceField('x')!.getOwner().getName();
      let o2 = cls.getInstanceField('y')!.getOwner().getName();
      let o3 = cls.getInstanceField('z')!.getOwner().getName();
      expect(o1).assertEqual(o2);
      expect(o2).assertEqual(o3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0910
     * @tc.name testGetOwner0910
     * @tc.desc Verify getOwner on bigint typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OBigint_078>();
      let field = cls.getInstanceField('bv')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OBigint_078');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0920
     * @tc.name testGetOwner0920
     * @tc.desc Verify getOwner on 5-field class all share same owner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OMultiField_079>();
      let fields = cls.getInstanceFields();
      let base = fields[0].getOwner().getName();
      for (let i = 1; i < fields.length; i++) {
        expect(fields[i].getOwner().getName()).assertEqual(base);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0930
     * @tc.name testGetOwner0930
     * @tc.desc Verify getOwner consistency across Class.from vs Class.of vs Class.current
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cFrom = Class.from<OMultiField_079>();
      let ownerFrom = cFrom.getInstanceField('f1')!.getOwner().getName();
      let obj = new OMultiField_079();
      let cOf = Class.of(obj);
      let ownerOf = cOf.getInstanceField('f1')!.getOwner().getName();
      expect(ownerFrom).assertEqual(ownerOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0940
     * @tc.name testGetOwner0940
     * @tc.desc Verify getOwner on readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerReadonly_080>();
      let field = cls.getInstanceField('roVal')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerReadonly_080');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0950
     * @tc.name testGetOwner0950
     * @tc.desc Verify getOwner on final class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass028>();
      let field = cls.getInstanceField('finalData')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.FinalClass028');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0960
     * @tc.name testGetOwner0960
     * @tc.desc Verify getOwner on custom class typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerHasCustom_081>();
      let field = cls.getInstanceField('obj')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerHasCustom_081');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0970
     * @tc.name testGetOwner0970
     * @tc.desc Verify getOwner on Map<int,string> typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerMapIS_082>();
      let field = cls.getInstanceField('mis')!;
      expect(field.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OwnerMapIS_082');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0980
     * @tc.name testGetOwner0980
     * @tc.desc Verify getOwner deep chain grandchild to grandparent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gc = Class.from<OC_083>();
      let p = gc.getSuper()!;
      let gp = p.getSuper()!;
      expect(gc.getInstanceField('c')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OC_083');
      expect(gp.getInstanceField('gp')!.getOwner().getName()).assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldGetOwnerTest2.test.OGP_083');
    });
