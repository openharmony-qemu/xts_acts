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

interface MyInterface015 { field: string; }

class TestClass008 {
  public data: string = '';
}

class TestClass021 {
  public field1: string = '';
  protected field3: string = '';
  private field2: string = '';
}

class DefaultAccessClass022 {
  defaultField: string = 'default';
  public explicitPublic: string = 'public';
}

class GrandParent023 {
  public grandPublic: string = 'grand';
}

class Parent023 extends GrandParent023 {
  public parentPublic: string = 'parent';
}

class Child023 extends Parent023 {
  public childPublic: string = 'child';
}

class MixedVisibility024 {
  public pub1: string = 'p1';
  public pub2: number = 42;
  maybeDefault: string = 'def';
  protected prot: string = 'prot';
  private priv: string = 'priv';
}

class StaticPublicReadonly026 {
  public static readonly STATIC_READONLY: string = 'staticRo';
}

class ReflectPublicByteA01 {
  public b: byte = 0;
}

class ReflectPublicShortA02 {
  public s: short = 0;
}

class ReflectPublicFloatA03 {
  public f: float = 0.0f;
}

class ReflectPublicDoubleA04 {
  public d: double = 0;
}

class ReflectPublicCharA05 {
  public c: char = c'a';
}

class ReflectPublicLongA06 {
  public l: long = 0;
}

class ReflectPublicNumberA07 {
  public n: number = 0;
}

class ReflectPublicMultiFieldA08 {
  public f1: string = 'a';
  public f2: int = 1;
  public f3: boolean = true;
  public f4: Array<int> = [1];
}

class ReflectPublicInterfaceImplA09 implements MyInterface015 {
  public field: string = 'impl';
}

class ReflectPublicEqualsA10 {
  public val: string = 'eq';
}

class ReflectDeepGrandA11 {
  public g: string = 'g';
}

class ReflectDeepParentA11 extends ReflectDeepGrandA11 {
  public p: string = 'p';
}

class ReflectDeepChildA11 extends ReflectDeepParentA11 {
  public ch: string = 'ch';
}

class ReflectPublicMultiTypesP01 {
  public fByte: byte = 1;
  public fShort: short = 2;
  public fChar: char = c'a';
  public fFloat: float = 1.1f;
  public fDouble: double = 2.2;
  public fInt: int = 3;
}

class ReflectPublicDeepInheritP02 {
  public level1: string = 'l1';
}

class ReflectPublicDeepInheritP03 extends ReflectPublicDeepInheritP02 {
  public level2: string = 'l2';
}

class ReflectPublicDeepInheritP04 extends ReflectPublicDeepInheritP03 {
  public level3: string = 'l3';
}

class ReflectPublicGetValueP05 {
  public val: string = 'hello';
}

class ReflectPublicUnionP09 {
  public u: int | string = 0;
}

class ReflectPublicNullableP10 {
  public nb: string | null = null;
}

class ReflectPublicGenericP11<T> {
  public gi: T | undefined = undefined;
}

class ReflectPublicStringP36 {
  public str: string = '';
}

class ReflectPublicBooleanP37 {
  public flag: boolean = false;
}

class ReflectPublicArrayIntP38 {
  public arr: Array<int> = [];
}

class ReflectPublicArrayStringP39 {
  public arr: Array<string> = [];
}

class ReflectPublicArrayByteP40 {
  public arr: Array<byte> = [];
}

class ReflectPublicObjectP41 {
  public obj: Object = {};
}

class ReflectPublicUnion3P42 {
  public u3: int | string | boolean = 0;
}

class ReflectPublicNullableNumberP43 {
  public nn: number | null = null;
}

class ReflectPublicNullableBooleanP44 {
  public nb: boolean | null = null;
}

class ReflectPublicArrayObjectP45 {
  public arr: Array<Object> = [];
}

class Person037 {
  public name: string = 'person';
}

class ReflectPublicArrayPersonP46 {
  public arr: Array<Person037> = [];
}

class ReflectPublicNestedObjectP47 {
  public no: Person037 = new Person037();
}

class ReflectPublicLiteralP48 {
  public lit: 'a' | 'b' = 'a';
}

class ReflectPublicDoubleMaxP49 {
  public dMax: double = Double.MAX_VALUE;
}

class ReflectPublicIntMinP50 {
  public iMin: int = Int.MIN_VALUE;
}

class ReflectPublicOptionalP51 {
  public os: int | undefined = undefined;
}

class PublicReadonlyP52 {
  public readonly r: string = 'x';
}

class DefaultReadonlyP53 {
  readonly dr: int = 0;
}

class StaticPublicP54 {
  public static sp: string = 'x';
}

class StaticPublicReadonlyP55 {
  public static readonly spr: string = 'x';
}

class ParentInheritP58 {
  public parentPub: string = 'pp';
}

class ChildInheritP58 extends ParentInheritP58 {
  public childPub: string = 'cp';
}

class ParentOverrideP59 {
  public sameName: string = 'parent';
}

interface InterfaceFieldP60 { iField: string; }

class ImplInterfaceP60 implements InterfaceFieldP60 {
  public iField: string = 'if';
}

interface I1P61 { f1: number; }

interface I2P61 { f2: number; }

class MultiImplP61 implements I1P61, I2P61 {
  public f1: number = 1;
  public f2: number = 2;
}

abstract class AbstractPubP62 {
  public absField: string = 'abs';
}

class ParentDefaultP63 {
  defPub: string = 'defp';
}

class ChildDefaultP63 extends ParentDefaultP63 {
  defPubChild: string = 'defc';
}

class MixedPrivProtP66 {
  public pubOnly: string = 'pub';
  protected prot: string = 'pro';
  private priv: string = 'pri';
}

class ParentPubForPathP67 {
  public pField: string = 'pf';
}

class ChildPubForPathP67 extends ParentPubForPathP67 {
  public cField: string = 'cf';
}

class ForGetValueCrossP69 {
  public v: string = 'init';
}

export default function InstanceFieldIsPublicTest2(): void {
  describe('InstanceFieldIsPublicTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0010
     * @tc.name testIsPublic0010
     * @tc.desc Verify getInstanceFields returns exactly three public fields pub1 pub2 maybeDefault with isPublic true from MixedVisibility024 having mixed visibility modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedVisibility024>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(3);
      expect(fields[0].getName()).assertEqual('pub1');
      expect(fields[0].isPublic()).assertTrue();
      expect(fields[1].getName()).assertEqual('pub2');
      expect(fields[1].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0020
     * @tc.name testIsPublic0020
     * @tc.desc Verify getInstanceFields returns exactly two fields and default-access field defaultField with no modifier has isPublic true from DefaultAccessClass022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAccessClass022>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(2);
      let defField = cls.getInstanceField('defaultField')!;
      expect(defField.isPublic()).assertTrue();
      let pubField = cls.getInstanceField('explicitPublic')!;
      expect(pubField.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0030
     * @tc.name testIsPublic0030
     * @tc.desc Verify isPublic returns true for public fields at each level of three-layer inheritance chain childPublic parentPublic grandPublic via getSuper from Child023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child023>();
      let childField = childCls.getInstanceField('childPublic')!;
      expect(childField.isPublic()).assertTrue();

      let parentCls = childCls.getSuper()!;
      let parentField = parentCls.getInstanceField('parentPublic')!;
      expect(parentField.isPublic()).assertTrue();

      let grandCls = parentCls.getSuper()!;
      let grandField = grandCls.getInstanceField('grandPublic')!;
      expect(grandField.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0040
     * @tc.name testIsPublic0040
     * @tc.desc Verify isPublic returns true while isPrivate isProtected and isReadonly all return false on public string field data from TestClass008 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0050
     * @tc.name testIsPublic0050
     * @tc.desc Verify isPublic and isReadonly both return true and isPrivate returns false on static public readonly field STATIC_READONLY from StaticPublicReadonly026 via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPublicReadonly026>();
      let staticField = cls.getStaticField('STATIC_READONLY')!;
      expect(staticField.isPublic()).assertTrue();
      expect(staticField.isReadonly()).assertTrue();
      expect(staticField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0060
     * @tc.name testIsPublic0060
     * @tc.desc Verify isPublic returns true and getValue returns 42 on public number field pub2 from MixedVisibility024 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedVisibility024>();
      let field = cls.getInstanceField('pub2')!;
      expect(field.isPublic()).assertTrue();
      let instance = cls.createInstance();
      expect(field.getValue(instance) as number).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0070
     * @tc.name testIsPublic0070
     * @tc.desc Verify getInstanceFields returns exactly one public field field1 with isPublic true excluding protected and private fields from TestClass021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('field1');
      expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0080
     * @tc.name testIsPublic0080
     * @tc.desc Verify isPublic returns true and getType getName returns i8 on public byte field b from ReflectPublicByteA01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicByteA01>();
      let field = cls.getInstanceField('b')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('i8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0090
     * @tc.name testIsPublic0090
     * @tc.desc Verify isPublic returns true and getType getName returns i16 on public short field s from ReflectPublicShortA02 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicShortA02>();
      let field = cls.getInstanceField('s')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('i16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0100
     * @tc.name testIsPublic0100
     * @tc.desc Verify isPublic returns true and getType getName returns f32 on public float field f from ReflectPublicFloatA03 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicFloatA03>();
      let field = cls.getInstanceField('f')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0110
     * @tc.name testIsPublic0110
     * @tc.desc Verify isPublic returns true and getType getName returns f64 on public double field d from ReflectPublicDoubleA04 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicDoubleA04>();
      let field = cls.getInstanceField('d')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0120
     * @tc.name testIsPublic0120
     * @tc.desc Verify isPublic returns true and getType getName returns u16 on public char field c from ReflectPublicCharA05 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicCharA05>();
      let field = cls.getInstanceField('c')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('u16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0130
     * @tc.name testIsPublic0130
     * @tc.desc Verify isPublic returns true and getType getName returns i64 on public long field l from ReflectPublicLongA06 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicLongA06>();
      let field = cls.getInstanceField('l')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('i64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0140
     * @tc.name testIsPublic0140
     * @tc.desc Verify isPublic returns true and getType getName returns f64 on public number field n from ReflectPublicNumberA07 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNumberA07>();
      let field = cls.getInstanceField('n')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0150
     * @tc.name testIsPublic0150
     * @tc.desc Verify isPublic returns true and getName returns field on public interface field field from ReflectPublicInterfaceImplA09 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicInterfaceImplA09>();
      let field = cls.getInstanceField('field')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getName()).assertEqual('field');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0160
     * @tc.name testIsPublic0160
     * @tc.desc Verify isPublic returns true for public fields ch p g at each level of deep inheritance via getSuper chain on ReflectDeepChildA11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ReflectDeepChildA11>();
      let ch = childCls.getInstanceField('ch')!;
      expect(ch.isPublic()).assertTrue();
      let parentCls = childCls.getSuper()!;
      let p = parentCls.getInstanceField('p')!;
      expect(p.isPublic()).assertTrue();
      let grandCls = parentCls.getSuper()!;
      let g = grandCls.getInstanceField('g')!;
      expect(g.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0170
     * @tc.name testIsPublic0170
     * @tc.desc Verify getName returns field name f1 and isPublic returns true on public string field f1 from ReflectPublicMultiFieldA08 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicMultiFieldA08>();
      let field = cls.getInstanceField('f1')!;
      expect(field.getName()).assertEqual('f1');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0180
     * @tc.name testIsPublic0180
     * @tc.desc Verify all six basic-type public fields from getInstanceFields of ReflectPublicMultiTypesP01 return isPublic true when iterated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicMultiTypesP01>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(6);
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isPublic()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0190
     * @tc.name testIsPublic0190
     * @tc.desc Verify getValue returns hello and isPublic returns true on public string field val from ReflectPublicGetValueP05 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicGetValueP05>();
      let field = cls.getInstanceField('val')!;
      let instance = cls.createInstance();
      expect(field.getValue(instance) as string).assertEqual('hello');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0200
     * @tc.name testIsPublic0200
     * @tc.desc Verify isPublic returns true for public fields at each level of three-layer getSuper chain on ReflectPublicDeepInheritP04 level3 level2 level1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let level3Cls = Class.from<ReflectPublicDeepInheritP04>();
      let l3 = level3Cls.getInstanceField('level3')!;
      expect(l3.isPublic()).assertTrue();
      let level2Cls = level3Cls.getSuper()!;
      let l2 = level2Cls.getInstanceField('level2')!;
      expect(l2.isPublic()).assertTrue();
      let level1Cls = level2Cls.getSuper()!;
      let l1 = level1Cls.getInstanceField('level1')!;
      expect(l1.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0210
     * @tc.name testIsPublic0210
     * @tc.desc Verify getType getName returns i32 and isPublic returns true on public int field fInt from ReflectPublicMultiTypesP01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicMultiTypesP01>();
      let field = cls.getInstanceField('fInt')!;
      expect(field.getType().getName()).assertEqual('i32');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0220
     * @tc.name testIsPublic0220
     * @tc.desc Verify consecutive calls to isPublic return consistent values on public field data from TestClass008 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      const v1 = field.isPublic();
      const v2 = field.isPublic();
      expect(v1).assertEqual(v2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0230
     * @tc.name testIsPublic0230
     * @tc.desc Verify isPublic remains unchanged before and after setValue modifies field value on public field data from TestClass008 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let instance = cls.createInstance();
      const before = field.isPublic();
      field.setValue(instance, 'changed');
      const after = field.isPublic();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0240
     * @tc.name testIsPublic0240
     * @tc.desc Verify isPublic returns true on public union int|string field u from ReflectPublicUnionP09 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicUnionP09>();
      let field = cls.getInstanceField('u')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0250
     * @tc.name testIsPublic0250
     * @tc.desc Verify isPublic returns true on public nullable string|null field nb from ReflectPublicNullableP10 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNullableP10>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0260
     * @tc.name testIsPublic0260
     * @tc.desc Verify isPublic returns true on public generic field gi parameterized with int from ReflectPublicGenericP11<int> via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicGenericP11<int>>();
      let field = cls.getInstanceField('gi')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0270
     * @tc.name testIsPublic0270
     * @tc.desc Verify isPublic returns true and getName returns str on public string field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getName()).assertEqual('str');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0280
     * @tc.name testIsPublic0280
     * @tc.desc Verify isPublic returns true on public boolean field flag from ReflectPublicBooleanP37 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicBooleanP37>();
      let field = cls.getInstanceField('flag')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0290
     * @tc.name testIsPublic0290
     * @tc.desc Verify isPublic returns true and getType getName returns std.core.Array on public Array<int> field arr from ReflectPublicArrayIntP38 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayIntP38>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0300
     * @tc.name testIsPublic0300
     * @tc.desc Verify isPublic returns true on public Array<string> field arr from ReflectPublicArrayStringP39 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayStringP39>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0310
     * @tc.name testIsPublic0310
     * @tc.desc Verify isPublic returns true on public Array<byte> field arr from ReflectPublicArrayByteP40 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayByteP40>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0320
     * @tc.name testIsPublic0320
     * @tc.desc Verify isPublic returns true and getType getName returns std.core.Object on public Object field obj from ReflectPublicObjectP41 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicObjectP41>();
      let field = cls.getInstanceField('obj')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType().getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0330
     * @tc.name testIsPublic0330
     * @tc.desc Verify isPublic returns true on public three-way union int|string|boolean field u3 from ReflectPublicUnion3P42 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicUnion3P42>();
      let field = cls.getInstanceField('u3')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0340
     * @tc.name testIsPublic0340
     * @tc.desc Verify isPublic returns true and getValue returns null on public nullable number field nn from ReflectPublicNullableNumberP43 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNullableNumberP43>();
      let field = cls.getInstanceField('nn')!;
      expect(field.isPublic()).assertTrue();
      let instance = cls.createInstance();
      const tmpVal = field.getValue(instance);
      expect(tmpVal as number | null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0350
     * @tc.name testIsPublic0350
     * @tc.desc Verify isPublic returns true on public nullable boolean field nb from ReflectPublicNullableBooleanP44 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNullableBooleanP44>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0360
     * @tc.name testIsPublic0360
     * @tc.desc Verify isPublic returns true on public Array<Object> field arr from ReflectPublicArrayObjectP45 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayObjectP45>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0370
     * @tc.name testIsPublic0370
     * @tc.desc Verify isPublic returns true on public Array<Person037> field arr from ReflectPublicArrayPersonP46 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayPersonP46>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0380
     * @tc.name testIsPublic0380
     * @tc.desc Verify isPublic returns true and getValue name equals person on public nested Person object field no from ReflectPublicNestedObjectP47 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNestedObjectP47>();
      let field = cls.getInstanceField('no')!;
      expect(field.isPublic()).assertTrue();
      let instance = cls.createInstance();
      const obj047 = field.getValue(instance) as Person037;
      expect(obj047.name).assertEqual('person');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0390
     * @tc.name testIsPublic0390
     * @tc.desc Verify isPublic returns true and getValue returns default value a on public literal type field lit from ReflectPublicLiteralP48 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicLiteralP48>();
      let field = cls.getInstanceField('lit')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getValue(cls.createInstance()) as string).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0400
     * @tc.name testIsPublic0400
     * @tc.desc Verify isPublic returns true on public double max boundary field dMax from ReflectPublicDoubleMaxP49 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicDoubleMaxP49>();
      let field = cls.getInstanceField('dMax')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0410
     * @tc.name testIsPublic0410
     * @tc.desc Verify isPublic returns true and getValue returns Int.MIN_VALUE on public int min boundary field iMin from ReflectPublicIntMinP50 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicIntMinP50>();
      let field = cls.getInstanceField('iMin')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getValue(cls.createInstance()) as int).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0420
     * @tc.name testIsPublic0420
     * @tc.desc Verify isPublic returns true on public optional type int|undefined field os from ReflectPublicOptionalP51 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicOptionalP51>();
      let field = cls.getInstanceField('os')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0430
     * @tc.name testIsPublic0430
     * @tc.desc Verify isPublic and isReadonly both return true on public readonly field r from PublicReadonlyP52 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicReadonlyP52>();
      let field = cls.getInstanceField('r')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0440
     * @tc.name testIsPublic0440
     * @tc.desc Verify isPublic returns true and isReadonly returns false on default-access field defaultField with no modifier from DefaultAccessClass022 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAccessClass022>();
      let field = cls.getInstanceField('defaultField')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0450
     * @tc.name testIsPublic0450
     * @tc.desc Verify isPublic and isReadonly both return true on default-access readonly field dr from DefaultReadonlyP53 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultReadonlyP53>();
      let field = cls.getInstanceField('dr')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0460
     * @tc.name testIsPublic0460
     * @tc.desc Verify isPublic returns true on static public field sp from StaticPublicP54 via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPublicP54>();
      let field = cls.getStaticField('sp')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0470
     * @tc.name testIsPublic0470
     * @tc.desc Verify isPublic and isReadonly both return true on static public readonly field spr from StaticPublicReadonlyP55 via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPublicReadonlyP55>();
      let field = cls.getStaticField('spr')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0480
     * @tc.name testIsPublic0480
     * @tc.desc Verify isPublic returns true on self-declared public field childPublic from child class Child023 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child023>();
      let field = cls.getInstanceField('childPublic')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0490
     * @tc.name testIsPublic0490
     * @tc.desc Verify isPublic returns true on public parent field parentPublic from Parent023 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<Parent023>();
      let field = parentCls.getInstanceField('parentPublic')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0500
     * @tc.name testIsPublic0500
     * @tc.desc Verify isPublic returns true on public grandparent field grandPublic from GrandParent023 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandCls = Class.from<GrandParent023>();
      let field = grandCls.getInstanceField('grandPublic')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0510
     * @tc.name testIsPublic0510
     * @tc.desc Verify isPublic returns true for public fields at each level of three-layer inheritance chain Child023 Parent023 GrandParent023 via getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cCls = Class.from<Child023>();
      let pCls = cCls.getSuper()!;
      let gCls = pCls.getSuper()!;
      expect(cCls.getInstanceField('childPublic')!.isPublic()).assertTrue();
      expect(pCls.getInstanceField('parentPublic')!.isPublic()).assertTrue();
      expect(gCls.getInstanceField('grandPublic')!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0520
     * @tc.name testIsPublic0520
     * @tc.desc Verify isPublic returns true and getValue returns parent on public sameName field from parent class ParentOverrideP59 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentOverrideP59>();
      let field = parentCls.getInstanceField('sameName')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getValue(parentCls.createInstance()) as string).assertEqual('parent');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0530
     * @tc.name testIsPublic0530
     * @tc.desc Verify isPublic returns true on public interface field iField from implementation class ImplInterfaceP60 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplInterfaceP60>();
      let field = cls.getInstanceField('iField')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0540
     * @tc.name testIsPublic0540
     * @tc.desc Verify isPublic returns true on both public fields f1 and f2 from multi-interface implementation class MultiImplP61 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiImplP61>();
      expect(cls.getInstanceField('f1')!.isPublic()).assertTrue();
      expect(cls.getInstanceField('f2')!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0550
     * @tc.name testIsPublic0550
     * @tc.desc Verify isPublic returns true on public field absField from abstract class AbstractPubP62 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractPubP62>();
      let field = cls.getInstanceField('absField')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0560
     * @tc.name testIsPublic0560
     * @tc.desc Verify isPublic returns true on default-access field defPub declared in parent class ParentDefaultP63 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentDefaultP63>();
      let field = cls.getInstanceField('defPub')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0570
     * @tc.name testIsPublic0570
     * @tc.desc Verify isPublic returns true on default-access field defPubChild declared in child class ChildDefaultP63 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildDefaultP63>();
      let field = cls.getInstanceField('defPubChild')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0580
     * @tc.name testIsPublic0580
     * @tc.desc Verify isPublic returns true via Class.from and getInstanceField path on public string field str from ReflectPublicStringP36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0590
     * @tc.name testIsPublic0590
     * @tc.desc Verify isPublic returns true for fields from both Class.of and Class.from paths and equals returns true on public field str from ReflectPublicStringP36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<ReflectPublicStringP36>();
      let clsOf = Class.of(new ReflectPublicStringP36());
      let f1 = clsFrom.getInstanceField('str')!;
      let f2 = clsOf.getInstanceField('str')!;
      expect(f1.isPublic()).assertTrue();
      expect(f2.isPublic()).assertTrue();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0600
     * @tc.name testIsPublic0600
     * @tc.desc Verify first element from getInstanceFields array returns isPublic true on public multi-field class ReflectPublicMultiFieldA08
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicMultiFieldA08>();
      let fields = cls.getInstanceFields();
      expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0610
     * @tc.name testIsPublic0610
     * @tc.desc Verify last element from getInstanceFields array returns isPublic true on public multi-field class ReflectPublicMultiFieldA08
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicMultiFieldA08>();
      let fields = cls.getInstanceFields();
      expect(fields[fields.length - 1].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0620
     * @tc.name testIsPublic0620
     * @tc.desc Verify isPublic returns true after createInstance and getValue returns init on public field v from ForGetValueCrossP69 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ForGetValueCrossP69>();
      let field1 = cls.getInstanceField('v')!;
      let instance = cls.createInstance();
      let field2 = cls.getInstanceField('v')!;
      expect(field1.isPublic()).assertTrue();
      expect(field2.isPublic()).assertTrue();
      const tmpVal = field2.getValue(instance);
      expect(tmpVal as string).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0630
     * @tc.name testIsPublic0630
     * @tc.desc Verify getInstanceFields returns non-empty array and first element isPublic returns true on public field data from TestClass008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertLarger(0);
      expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0640
     * @tc.name testIsPublic0640
     * @tc.desc Verify isPublic returns true on public interface field field from implementation class ReflectPublicInterfaceImplA09 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicInterfaceImplA09>();
      let field = cls.getInstanceField('field')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0650
     * @tc.name testIsPublic0650
     * @tc.desc Verify isPublic values are equal for same-named fields obtained via two separate Class.from calls on ReflectPublicStringP36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ReflectPublicStringP36>();
      let cls2 = Class.from<ReflectPublicStringP36>();
      let f1 = cls1.getInstanceField('str')!;
      let f2 = cls2.getInstanceField('str')!;
      expect(f1.isPublic()).assertEqual(f2.isPublic());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0660
     * @tc.name testIsPublic0660
     * @tc.desc Verify isPublic remains consistent before and after getValue and fetched value is init on public field v from ForGetValueCrossP69 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ForGetValueCrossP69>();
      let field = cls.getInstanceField('v')!;
      let instance = cls.createInstance();
      const before = field.isPublic();
      const val = field.getValue(instance);
      const after = field.isPublic();
      expect(before).assertEqual(after);
      expect(val as string).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0670
     * @tc.name testIsPublic0670
     * @tc.desc Verify isPublic remains true after getValue call on public field data from TestClass008 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let instance = cls.createInstance();
      field.getValue(instance);
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0680
     * @tc.name testIsPublic0680
     * @tc.desc Verify isPublic remains true after equals call and same field equals returns true on public field val from ReflectPublicEqualsA10 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicEqualsA10>();
      let f1 = cls.getInstanceField('val')!;
      let f2 = cls.getInstanceField('val')!;
      const pub = f1.isPublic();
      expect(f1.equals(f2)).assertTrue();
      expect(pub).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0690
     * @tc.name testIsPublic0690
     * @tc.desc Verify isPublic remains true after getType call and type name is non-empty on public field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      const t = field.getType();
      expect(field.isPublic()).assertTrue();
      expect(t.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0700
     * @tc.name testIsPublic0700
     * @tc.desc Verify getInstanceFields returns exactly one public field with isPublic true from MixedPrivProtP66 having mixed private and protected modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedPrivProtP66>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(1);
      expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0710
     * @tc.name testIsPublic0710
     * @tc.desc Verify isPublic returns true and isPrivate returns false are mutually exclusive on public field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0720
     * @tc.name testIsPublic0720
     * @tc.desc Verify isPublic returns true and isProtected returns false are mutually exclusive on public field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0730
     * @tc.name testIsPublic0730
     * @tc.desc Verify isPublic returns true and isReadonly returns false are mutually exclusive on mutable public field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0740
     * @tc.name testIsPublic0740
     * @tc.desc Verify isPublic returns true independently of getName and field name is str on public string field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getName()).assertEqual('str');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0750
     * @tc.name testIsPublic0750
     * @tc.desc Verify isPublic returns true independently of getType and type is not null on public field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getType() != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0760
     * @tc.name testIsPublic0760
     * @tc.desc Verify isPublic returns true independently of getOwner and owner name length is greater than zero on public field str from ReflectPublicStringP36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let field = cls.getInstanceField('str')!;
      expect(field.isPublic()).assertTrue();
      expect(field.getOwner().getName())
        .assertEqual('entry.src.main.src.test.InstanceField.InstanceFieldIsPublicTest2.test.ReflectPublicStringP36');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0770
     * @tc.name testIsPublic0770
     * @tc.desc Verify isPublic returns true independently of equals and same field equals returns true on public string field str from ReflectPublicStringP36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicStringP36>();
      let f1 = cls.getInstanceField('str')!;
      let f2 = cls.getInstanceField('str')!;
      expect(f1.isPublic()).assertTrue();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0780
     * @tc.name testIsPublic0780
     * @tc.desc Verify isPublic remains unchanged after setValue and getValue returns new value set on public field v from ForGetValueCrossP69 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ForGetValueCrossP69>();
      let field = cls.getInstanceField('v')!;
      let instance = cls.createInstance();
      const before = field.isPublic();
      field.setValue(instance, 'new');
      const after = field.isPublic();
      expect(before).assertEqual(after);
      const tmpVal = field.getValue(instance);
      expect(tmpVal as string).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0790
     * @tc.name testIsPublic0790
     * @tc.desc Verify all elements from getInstanceFields of ReflectPublicMultiTypesP01 return isPublic true when iterated in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicMultiTypesP01>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isPublic()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0800
     * @tc.name testIsPublic0800
     * @tc.desc Verify getName returns u and isPublic returns true on public union int|string field u from ReflectPublicUnionP09 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicUnionP09>();
      let field = cls.getInstanceField('u')!;
      expect(field.getName()).assertEqual('u');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0810
     * @tc.name testIsPublic0810
     * @tc.desc Verify getName returns nb and isPublic returns true on public nullable string field nb from ReflectPublicNullableP10 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNullableP10>();
      let field = cls.getInstanceField('nb')!;
      expect(field.getName()).assertEqual('nb');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0820
     * @tc.name testIsPublic0820
     * @tc.desc Verify getName returns arr and isPublic returns true on public Array<byte> field arr from ReflectPublicArrayByteP40 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayByteP40>();
      let field = cls.getInstanceField('arr')!;
      expect(field.getName()).assertEqual('arr');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0830
     * @tc.name testIsPublic0830
     * @tc.desc Verify getName returns no and isPublic returns true on public Person object field no from ReflectPublicNestedObjectP47 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNestedObjectP47>();
      let field = cls.getInstanceField('no')!;
      expect(field.getName()).assertEqual('no');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0840
     * @tc.name testIsPublic0840
     * @tc.desc Verify getName returns gi and isPublic returns true on public generic field gi parameterized with string from ReflectPublicGenericP11 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicGenericP11<string>>();
      let field = cls.getInstanceField('gi')!;
      expect(field.getName()).assertEqual('gi');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0850
     * @tc.name testIsPublic0850
     * @tc.desc Verify getName returns lit and isPublic returns true on public literal union field lit from ReflectPublicLiteralP48 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicLiteralP48>();
      let field = cls.getInstanceField('lit')!;
      expect(field.getName()).assertEqual('lit');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0860
     * @tc.name testIsPublic0860
     * @tc.desc Verify getName returns dMax and isPublic returns true on public double field dMax with Double.MAX_VALUE from ReflectPublicDoubleMaxP49 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicDoubleMaxP49>();
      let field = cls.getInstanceField('dMax')!;
      expect(field.getName()).assertEqual('dMax');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0870
     * @tc.name testIsPublic0870
     * @tc.desc Verify getName returns iMin and isPublic returns true on public int field iMin with value Int.MIN_VALUE from ReflectPublicIntMinP50 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicIntMinP50>();
      let field = cls.getInstanceField('iMin')!;
      expect(field.getName()).assertEqual('iMin');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0880
     * @tc.name testIsPublic0880
     * @tc.desc Verify getName remains unchanged after setValue and isPublic stays true on public string field v from ForGetValueCrossP69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ForGetValueCrossP69>();
      let field = cls.getInstanceField('v')!;
      let instance = cls.createInstance();
      const nameBefore = field.getName();
      field.setValue(instance, 'x');
      expect(field.getName()).assertEqual(nameBefore);
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0890
     * @tc.name testIsPublic0890
     * @tc.desc Verify getType returns i8 and isPublic returns true on public byte field b from ReflectPublicByteA01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicByteA01>();
      let field = cls.getInstanceField('b')!;
      expect(field.getType().getName()).assertEqual('i8');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0900
     * @tc.name testIsPublic0900
     * @tc.desc Verify getType returns f32 and isPublic returns true on public float field f from ReflectPublicFloatA03 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicFloatA03>();
      let field = cls.getInstanceField('f')!;
      expect(field.getType().getName()).assertEqual('f32');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0910
     * @tc.name testIsPublic0910
     * @tc.desc Verify getType returns u16 and isPublic returns true on public char field c from ReflectPublicCharA05 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicCharA05>();
      let field = cls.getInstanceField('c')!;
      expect(field.getType().getName()).assertEqual('u16');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0920
     * @tc.name testIsPublic0920
     * @tc.desc Verify getType returns i64 and isPublic returns true on public long field l from ReflectPublicLongA06 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicLongA06>();
      let field = cls.getInstanceField('l')!;
      expect(field.getType().getName()).assertEqual('i64');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0930
     * @tc.name testIsPublic0930
     * @tc.desc Verify getType returns f64 and isPublic returns true on public number field n from ReflectPublicNumberA07 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicNumberA07>();
      let field = cls.getInstanceField('n')!;
      expect(field.getType().getName()).assertEqual('f64');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0940
     * @tc.name testIsPublic0940
     * @tc.desc Verify getType returns u1 and isPublic returns true on public boolean field flag from ReflectPublicBooleanP37 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicBooleanP37>();
      let field = cls.getInstanceField('flag')!;
      expect(field.getType().getName()).assertEqual('u1');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0950
     * @tc.name testIsPublic0950
     * @tc.desc Verify getType returns std.core.Object and isPublic returns true on public Object field obj from ReflectPublicObjectP41 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicObjectP41>();
      let field = cls.getInstanceField('obj')!;
      expect(field.getType().getName()).assertEqual('std.core.Object');
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0960
     * @tc.name testIsPublic0960
     * @tc.desc Verify getType returns std.core.Array and isPublic returns true on public Array<int> field arr from ReflectPublicArrayIntP38 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPublicArrayIntP38>();
      let field = cls.getInstanceField('arr')!;
      expect(field.getType().getName()).assertEqual('std.core.Array');
      expect(field.isPublic()).assertTrue();
    });
