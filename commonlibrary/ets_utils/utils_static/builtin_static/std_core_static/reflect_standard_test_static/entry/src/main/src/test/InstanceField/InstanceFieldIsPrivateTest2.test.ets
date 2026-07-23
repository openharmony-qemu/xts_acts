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

class PrivateAccess019 {
  public publicField: string = 'public';
  private privateField: string = 'secret';
}

class PrivateMixed022 {
  public pub: string = 'pub';
  protected prot: string = 'prot';
  private priv1: string = 'p1';
  private priv2: string = 'p2';
}

class PrivateInheritanceParent023 {
  public parentPub: string = 'pp';
  private parentPriv: string = 'privP';
}

class PrivateInheritanceChild023 extends PrivateInheritanceParent023 {
  public childPub: string = 'cp';
}

class PrivateReadonly024 {
  public publicRo: string = 'pro';
  private readonly privRo: string = 'secretRo';
}

class PrivateStatic025 {
  public static STATIC_PUB: string = 'spub';
  private static STATIC_PRIV: string = 'spriv';
}

class ReflectPrivateByteB01 {
  public pubB: byte = 1;
  private privB: byte = 2;
}

class ReflectPrivateShortB02 {
  public pubS: short = 3;
  private privS: short = 4;
}

class ReflectPrivateMultiB03 {
  public p1: int = 10;
  public p2: double = 1.1;
  private r1: string = 'r';
  private r2: boolean = false;
}

class ReflectPrivateInterfaceB08 implements MyInterface015 {
  public field: string = 'if';
  private secret: string = 's';
}

class ReflectPrivateMultiTypePri01 {
  public pubInt: int = 100;
  public pubBool: boolean = true;
  private priLong: long = 200;
}

class ReflectPrivateGetType01 {
  public pubType: float = 1.0f;
  private priType: byte = 5;
}

class ReflectPrivateGetOwner01 {
  public ownPub: double = 3.3;
}

class PrivateEmptyStrB42 {
  public f: string = 'x';
}

class PrivateDefaultAccess030 {
  defaultField: string = 'd';
  public pubField: string = 'p';
}

class ReflectPrivateCharB10 {
  public c: char = c'a';
}

class ReflectPrivateArrayIntB11 {
  public arr: Array<int> = [];
}

class ReflectPrivateArrayStringB12 {
  public arr: Array<string> = [];
}

class ReflectPrivateArrayByteB13 {
  public arr: Array<byte> = [];
}

class ReflectPrivateObjectB14 {
  public obj: Object = {};
}

class ReflectPrivateUnionB15 {
  public u: int | string = 0;
}

class ReflectPrivateNullableStringB16 {
  public nb: string | null = null;
}

class ReflectPrivateOptionalIntB17 {
  public os: int | undefined = undefined;
}

class ReflectPrivateTripleUnionB18 {
  public u3: int | string | boolean = 0;
}

class ReflectPrivateNullableNumberB19 {
  public nn: double | null = null;
}

class ReflectPrivateNullableBooleanB20 {
  public nb: boolean | null = null;
}

class ReflectPrivateArrayObjectB21 {
  public arr: Array<Object> = [];
}

class ReflectPrivatePerson {
  public name: string = '';
}

class ReflectPrivateArrayPersonB22 {
  public arr: Array<ReflectPrivatePerson> = [];
}

class ReflectPrivateNestedB23 {
  public no: ReflectPrivatePerson = new ReflectPrivatePerson();
}

class ReflectPrivateGenericB24<T> {
  public gi: T | undefined = undefined;
}

class ReflectPrivateLiteralB25 {
  public lit: 'a' | 'b' = 'a';
}

class ReflectPrivateDoubleBoundaryB26 {
  public dMax: double = Double.MAX_VALUE;
}

class ReflectPrivateIntBoundaryB27 {
  public iMin: int = -2147483648;
}

class ReflectPrivateDefaultReadonlyB28 {
  readonly dr: int = 99;
  public pubDr: string = 'pdr';
}

class ReflectPrivateStaticRoB29 {
  public static readonly spr: string = 'sprv';
  public static sp: string = 'spv';
}

class ReflectPrivatePurePrivB30 {
  private onlyPriv1: string = 'op1';
  private onlyPriv2: int = 22;
}

class ReflectPrivateMixedCountB31 {
  public pubA: int = 10;
  public pubB: string = 'pb';
  private p1: string = 'p1';
  private p2: boolean = true;
}

abstract class ReflectPrivateAbstractB32 {
  public absPub: string = 'abs';
}

class ReflectPrivateParentPubB33 {
  public parentF: string = 'pf';
}

class ReflectPrivateChildPubB33 extends ReflectPrivateParentPubB33 {
  public childF: string = 'cf';
}

class ReflectPrivateParentPrivB34 {
  private privF: string = 'pp';
}

class ReflectPrivateChildPrivB34 extends ReflectPrivateParentPrivB34 {
  public cpub: string = 'cp';
}

class ReflectPrivateGrandPubB35 {
  public g: string = 'g';
}

class ReflectPrivateOverrideParentB36 {
  public ov: string = 'par';
}

interface IExtraB37 { extra: int; }

class ReflectPrivateMultiImplB37 implements MyInterface015, IExtraB37 {
  public field: string = 'mif';
  public extra: int = 5;
}

class ReflectPrivatePathB38 {
  public pathF: string = 'pf';
}

class ReflectPrivateConsistB39 {
  public cF: int = 42;
}

class ReflectPrivateCrossB40 {
  public crossF: string = 'cf';
  public readonly roF: int = 7;
}

class ReflectPrivateMetaB41 {
  public metaF: double = 1.1;
}

class PrivateTypeofB43 {
  public tf: string = 'tf';
}

export default function InstanceFieldIsPrivateTest2(): void {
  describe('InstanceFieldIsPrivateTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0100
     * @tc.name testIsPrivate0100
     * @tc.desc Verify getInstanceFields returns only public field pub and isPrivate() returns false on class PrivateMixed022 with multiple private and protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateMixed022>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('pub');
      expect(fields[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0200
     * @tc.name testIsPrivate0200
     * @tc.desc Verify child class cannot access inherited parent private field parentPriv via getInstanceField and getSuper also returns undefined on class PrivateInheritanceChild023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<PrivateInheritanceChild023>();
      let childPub = childCls.getInstanceField('childPub')!;
      expect(childPub.isPrivate()).assertFalse();
      let inheritedPriv = childCls.getInstanceField('parentPriv');
      expect(inheritedPriv).assertEqual(undefined);
      let parentCls = childCls.getSuper()!;
      let parentPriv = parentCls.getInstanceField('parentPriv');
      expect(parentPriv).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0300
     * @tc.name testIsPrivate0300
     * @tc.desc Verify getStaticField returns undefined for private static string field STATIC_PRIV and isPrivate() returns false on public static field STATIC_PUB from class PrivateStatic025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateStatic025>();
      let privStatic = cls.getStaticField('STATIC_PRIV');
      expect(privStatic).assertEqual(undefined);
      let pubStatic = cls.getStaticField('STATIC_PUB')!;
      expect(pubStatic.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0400
     * @tc.name testIsPrivate0400
     * @tc.desc Verify isPrivate() returns false, isPublic() returns true, and isProtected() returns false on public string field publicField from class PrivateAccess019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();
      let pubField = cls.getInstanceField('publicField')!;
      expect(pubField.isPrivate()).assertFalse();
      expect(pubField.isPublic()).assertTrue();
      expect(pubField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0500
     * @tc.name testIsPrivate0500
     * @tc.desc Verify getInstanceField returns undefined for private byte field privB and isPrivate() returns false on public byte field pubB from class ReflectPrivateByteB01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateByteB01>();
      let priv = cls.getInstanceField('privB');
      expect(priv).assertEqual(undefined);
      let pub = cls.getInstanceField('pubB')!;
      expect(pub.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0600
     * @tc.name testIsPrivate0600
     * @tc.desc Verify getInstanceField returns undefined for private field secret and isPrivate() returns false on public string field field from class ReflectPrivateInterfaceB08 implementing MyInterface015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateInterfaceB08>();
      expect(cls.getInstanceField('secret')).assertEqual(undefined);
      let pub = cls.getInstanceField('field')!;
      expect(pub.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0700
     * @tc.name testIsPrivate0700
     * @tc.desc Verify getInstanceFields returns two public fields and isPrivate() returns false on both from class ReflectPrivateMultiTypePri01 with multiple private fields of mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMultiTypePri01>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(2);
      expect(fields[0].isPrivate()).assertFalse();
      expect(fields[1].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0800
     * @tc.name testIsPrivate0800
     * @tc.desc Verify isPrivate() returns consistent result whether obtained via getInstanceField directly or getInstanceFields traversal on public string field publicField from class PrivateAccess019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();
      let f1 = cls.getInstanceField('publicField')!;
      let fields = cls.getInstanceFields();
      let idx = -1;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'publicField') {
          idx = i;
          break;
        }
      }
      expect(idx >= 0).assertTrue();
      let f2 = fields[idx]!;
      expect(f1.isPrivate()).assertEqual(f2.isPrivate());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0900
     * @tc.name testIsPrivate0900
     * @tc.desc Verify isPrivate() returns consistent result across separate getInstanceField calls and getValue retrieves correct field value on public string field publicField from class PrivateAccess019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();
      let f1 = cls.getInstanceField('publicField')!;
      let inst2 = cls.createInstance();
      let f2 = cls.getInstanceField('publicField')!;
      expect(f1.isPrivate()).assertEqual(f2.isPrivate());
      expect(f1.getValue(inst2) as string).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1000
     * @tc.name testIsPrivate1000
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on default-access string field defaultField from class PrivateDefaultAccess030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateDefaultAccess030>();
      let defF = cls.getInstanceField('defaultField')!;
      expect(defF.isPrivate()).assertFalse();
      expect(defF.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1100
     * @tc.name testIsPrivate1100
     * @tc.desc Verify isPrivate() returns pairwise consistent results across three consecutive calls on public string field publicField from class PrivateAccess019 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();
      let field = cls.getInstanceField('publicField')!;
      const v1 = field.isPrivate();
      const v2 = field.isPrivate();
      const v3 = field.isPrivate();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1200
     * @tc.name testIsPrivate1200
     * @tc.desc Verify isPrivate() returns consistent result before and after calling getValue on public string field publicField from class PrivateAccess019 obtained via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();
      let field = cls.getInstanceField('publicField')!;
      let instance = cls.createInstance();
      const before = field.isPrivate();
      field.getValue(instance);
      const after = field.isPrivate();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1300
     * @tc.name testIsPrivate1300
     * @tc.desc Verify isPrivate() returns false and isReadonly() returns false on public non-readonly string field publicRo from class PrivateReadonly024 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateReadonly024>();
      let field = cls.getInstanceField('publicRo')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1400
     * @tc.name testIsPrivate1400
     * @tc.desc Verify isPrivate() returns false on public char field c from class ReflectPrivateCharB10 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCharB10>();
      let field = cls.getInstanceField('c')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1500
     * @tc.name testIsPrivate1500
     * @tc.desc Verify isPrivate() returns false on public field arr of type Array<int> from class ReflectPrivateArrayIntB11 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayIntB11>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1600
     * @tc.name testIsPrivate1600
     * @tc.desc Verify isPrivate() returns false on public field arr of type Array<string> from class ReflectPrivateArrayStringB12 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayStringB12>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1700
     * @tc.name testIsPrivate1700
     * @tc.desc Verify isPrivate() returns false on public field arr of type Array<byte> from class ReflectPrivateArrayByteB13 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayByteB13>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1800
     * @tc.name testIsPrivate1800
     * @tc.desc Verify isPrivate() returns false on public Object field obj from class ReflectPrivateObjectB14 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateObjectB14>();
      let field = cls.getInstanceField('obj')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1900
     * @tc.name testIsPrivate1900
     * @tc.desc Verify isPrivate() returns false on public union type field u of type int|string from class ReflectPrivateUnionB15 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateUnionB15>();
      let field = cls.getInstanceField('u')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2000
     * @tc.name testIsPrivate2000
     * @tc.desc Verify isPrivate() returns false on public nullable string field nb of type string|null from class ReflectPrivateNullableStringB16 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNullableStringB16>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2100
     * @tc.name testIsPrivate2100
     * @tc.desc Verify isPrivate() returns false on public optional int field os of type int|undefined from class ReflectPrivateOptionalIntB17 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateOptionalIntB17>();
      let field = cls.getInstanceField('os')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2200
     * @tc.name testIsPrivate2200
     * @tc.desc Verify isPrivate() returns false on public triple union field u3 of type int|string|boolean from class ReflectPrivateTripleUnionB18 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateTripleUnionB18>();
      let field = cls.getInstanceField('u3')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2300
     * @tc.name testIsPrivate2300
     * @tc.desc Verify isPrivate() returns false on public nullable double field nn of type double|null from class ReflectPrivateNullableNumberB19 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNullableNumberB19>();
      let field = cls.getInstanceField('nn')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2400
     * @tc.name testIsPrivate2400
     * @tc.desc Verify isPrivate() returns false on public nullable boolean field nb of type boolean|null from class ReflectPrivateNullableBooleanB20 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNullableBooleanB20>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2500
     * @tc.name testIsPrivate2500
     * @tc.desc Verify isPrivate() returns false on public field arr of type Array<Object> from class ReflectPrivateArrayObjectB21 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayObjectB21>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2600
     * @tc.name testIsPrivate2600
     * @tc.desc Verify isPrivate() returns false on public field arr of type Array<ReflectPrivatePerson> from class ReflectPrivateArrayPersonB22 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayPersonB22>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2700
     * @tc.name testIsPrivate2700
     * @tc.desc Verify isPrivate() returns false on public nested object field no of type ReflectPrivatePerson from class ReflectPrivateNestedB23 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNestedB23>();
      let field = cls.getInstanceField('no')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2800
     * @tc.name testIsPrivate2800
     * @tc.desc Verify isPrivate() returns false on public generic field gi of type T|undefined from class ReflectPrivateGenericB24 instantiated with int accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateGenericB24<int>>();
      let field = cls.getInstanceField('gi')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2900
     * @tc.name testIsPrivate2900
     * @tc.desc Verify isPrivate() returns false on public literal union type field lit of type 'a'|'b' from class ReflectPrivateLiteralB25 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateLiteralB25>();
      let field = cls.getInstanceField('lit')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3000
     * @tc.name testIsPrivate3000
     * @tc.desc Verify isPrivate() returns false on public double field dMax initialized to Double.MAX_VALUE from class ReflectPrivateDoubleBoundaryB26 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateDoubleBoundaryB26>();
      let field = cls.getInstanceField('dMax')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3100
     * @tc.name testIsPrivate3100
     * @tc.desc Verify isPrivate() returns false on public int field iMin initialized to int minimum boundary value -2147483648 from class ReflectPrivateIntBoundaryB27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateIntBoundaryB27>();
      let field = cls.getInstanceField('iMin')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3200
     * @tc.name testIsPrivate3200
     * @tc.desc Verify isPrivate() returns false while isReadonly() returns true on default-access readonly int field dr from class ReflectPrivateDefaultReadonlyB28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateDefaultReadonlyB28>();
      let field = cls.getInstanceField('dr')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3300
     * @tc.name testIsPrivate3300
     * @tc.desc Verify isPrivate() returns false on public static readonly string field spr from class ReflectPrivateStaticRoB29 accessed via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateStaticRoB29>();
      let field = cls.getStaticField('spr')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3400
     * @tc.name testIsPrivate3400
     * @tc.desc Verify isPrivate() returns false on child class own public string field childF from class ReflectPrivateChildPubB33 extending ReflectPrivateParentPubB33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateChildPubB33>();
      let field = cls.getInstanceField('childF')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3500
     * @tc.name testIsPrivate3500
     * @tc.desc Verify isPrivate() returns false on parent public string field parentF accessed directly via parent Class.from on class ReflectPrivateParentPubB33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ReflectPrivateParentPubB33>();
      let field = parentCls.getInstanceField('parentF')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3600
     * @tc.name testIsPrivate3600
     * @tc.desc Verify isPrivate() returns false on public string field g from grandparent class ReflectPrivateGrandPubB35 in a three-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gCls = Class.from<ReflectPrivateGrandPubB35>();
      let field = gCls.getInstanceField('g')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3700
     * @tc.name testIsPrivate3700
     * @tc.desc Verify isPrivate() returns false on public string field ov from parent class ReflectPrivateOverrideParentB36 whose field is overridden by child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ReflectPrivateOverrideParentB36>();
      let field = parentCls.getInstanceField('ov')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3800
     * @tc.name testIsPrivate3800
     * @tc.desc Verify isPrivate() returns false on public string field field from class ReflectPrivateInterfaceB08 which implements interface MyInterface015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateInterfaceB08>();
      let field = cls.getInstanceField('field')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_3900
     * @tc.name testIsPrivate3900
     * @tc.desc Verify isPrivate() returns false on both public fields field and extra from class ReflectPrivateMultiImplB37 implementing two interfaces MyInterface015 and IExtraB37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMultiImplB37>();
      let f1 = cls.getInstanceField('field')!;
      let f2 = cls.getInstanceField('extra')!;
      expect(f1.isPrivate()).assertFalse();
      expect(f2.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4000
     * @tc.name testIsPrivate4000
     * @tc.desc Verify isPrivate() returns false on public string field pathF obtained via Class.from<Class> from class ReflectPrivatePathB38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivatePathB38>();
      let field = cls.getInstanceField('pathF')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4100
     * @tc.name testIsPrivate4100
     * @tc.desc Verify isPrivate() returns false on public string field pathF obtained via Class.of(instance) from class ReflectPrivatePathB38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst = new ReflectPrivatePathB38();
      let cls = Class.of(inst);
      let field = cls.getInstanceField('pathF')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4200
     * @tc.name testIsPrivate4200
     * @tc.desc Verify getInstanceFields returns exactly two public fields and isPrivate() returns false for both from class ReflectPrivateMixedCountB31 with multiple private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMixedCountB31>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(2);
      expect(fields[0].isPrivate()).assertFalse();
      expect(fields[1].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4300
     * @tc.name testIsPrivate4300
     * @tc.desc Verify isPrivate() returns false and getValue returns correct field value pf on public string field pathF from class ReflectPrivatePathB38 via createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivatePathB38>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('pathF')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.getValue(inst) as string).assertEqual('pf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4400
     * @tc.name testIsPrivate4400
     * @tc.desc Verify isPrivate() returns identical results when same public int field cF is retrieved twice via getInstanceField from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let f1 = cls.getInstanceField('cF')!;
      let f2 = cls.getInstanceField('cF')!;
      expect(f1.isPrivate()).assertEqual(f2.isPrivate());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4500
     * @tc.name testIsPrivate4500
     * @tc.desc Verify isPrivate() returns identical results when public int field cF is obtained from two separate Class.from calls on class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ReflectPrivateConsistB39>();
      let cls2 = Class.from<ReflectPrivateConsistB39>();
      let f1 = cls1.getInstanceField('cF')!;
      let f2 = cls2.getInstanceField('cF')!;
      expect(f1.isPrivate()).assertEqual(f2.isPrivate());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4600
     * @tc.name testIsPrivate4600
     * @tc.desc Verify isPrivate() returns consistent result whether obtained via getInstanceField directly or getInstanceFields traversal on public int field cF from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let f1 = cls.getInstanceField('cF')!;
      let fields = cls.getInstanceFields();
      let idx = -1;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'cF') {
          idx = i;
          break;
        }
      }
      expect(idx >= 0).assertTrue();
      let f2 = fields[idx]!;
      expect(f1.isPrivate()).assertEqual(f2.isPrivate());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4700
     * @tc.name testIsPrivate4700
     * @tc.desc Verify isPrivate() returns pairwise identical results across three consecutive calls on public int field cF from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let field = cls.getInstanceField('cF')!;
      const v1 = field.isPrivate();
      const v2 = field.isPrivate();
      const v3 = field.isPrivate();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4800
     * @tc.name testIsPrivate4800
     * @tc.desc Verify isPrivate() remains consistent across 100 consecutive calls with each call matching previous result on public int field cF from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let field = cls.getInstanceField('cF')!;
      let last: boolean = field.isPrivate();
      for (let i = 0; i < 100; i++) {
        const cur = field.isPrivate();
        expect(cur).assertEqual(last);
        last = cur;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_4900
     * @tc.name testIsPrivate4900
     * @tc.desc Verify isPrivate() returns false and getValue independently retrieves correct field value 42 on public int field cF from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let field = cls.getInstanceField('cF')!;
      let inst = cls.createInstance();
      const isP = field.isPrivate();
      const val: Object = field.getValue(inst) as Object;
      expect(isP).assertFalse();
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5000
     * @tc.name testIsPrivate5000
     * @tc.desc Verify isPrivate() still returns false after calling getValue on public int field cF from class ReflectPrivateConsistB39 obtained via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let field = cls.getInstanceField('cF')!;
      let inst = cls.createInstance();
      field.getValue(inst);
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5100
     * @tc.name testIsPrivate5100
     * @tc.desc Verify calling isPrivate() on one field reference does not affect equals comparison which returns true for same public int field cF from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let f1 = cls.getInstanceField('cF')!;
      let f2 = cls.getInstanceField('cF')!;
      f1.isPrivate();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5200
     * @tc.name testIsPrivate5200
     * @tc.desc Verify calling isPrivate() does not affect subsequent getType which correctly returns type name i32 on public int field cF from class ReflectPrivateConsistB39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateConsistB39>();
      let field = cls.getInstanceField('cF')!;
      field.isPrivate();
      expect(field.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5300
     * @tc.name testIsPrivate5300
     * @tc.desc Verify isPrivate() returns false on public string field absPub from abstract class ReflectPrivateAbstractB32 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateAbstractB32>();
      let field = cls.getInstanceField('absPub')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5400
     * @tc.name testIsPrivate5400
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true as mutually exclusive results on public string field crossF from class ReflectPrivateCrossB40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCrossB40>();
      let field = cls.getInstanceField('crossF')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5500
     * @tc.name testIsPrivate5500
     * @tc.desc Verify both isPrivate() and isProtected() return false on public string field crossF from class ReflectPrivateCrossB40 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCrossB40>();
      let field = cls.getInstanceField('crossF')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5600
     * @tc.name testIsPrivate5600
     * @tc.desc Verify isPrivate() returns false while isReadonly() returns true on public readonly int field roF from class ReflectPrivateCrossB40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCrossB40>();
      let ro = cls.getInstanceField('roF')!;
      expect(ro.isPrivate()).assertFalse();
      expect(ro.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5700
     * @tc.name testIsPrivate5700
     * @tc.desc Verify isPrivate() returns false and getName independently returns correct field name crossF on public string field from class ReflectPrivateCrossB40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCrossB40>();
      let field = cls.getInstanceField('crossF')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.getName()).assertEqual('crossF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5800
     * @tc.name testIsPrivate5800
     * @tc.desc Verify isPrivate() returns false and getType returns type name f64 on public double field metaF from class ReflectPrivateMetaB41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMetaB41>();
      let field = cls.getInstanceField('metaF')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.getType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_5900
     * @tc.name testIsPrivate5900
     * @tc.desc Verify isPrivate() returns false and getOwner returns owning class name ReflectPrivateMetaB41 on public double field metaF accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMetaB41>();
      let field = cls.getInstanceField('metaF')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.getOwner().getName().endsWith('ReflectPrivateMetaB41')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6000
     * @tc.name testIsPrivate6000
     * @tc.desc Verify isPrivate() returns false and two getInstanceField references of metaF are equal via equals on public double field from class ReflectPrivateMetaB41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMetaB41>();
      let f1 = cls.getInstanceField('metaF')!;
      let f2 = cls.getInstanceField('metaF')!;
      expect(f1.isPrivate()).assertFalse();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6100
     * @tc.name testIsPrivate6100
     * @tc.desc Verify isPrivate() returns consistent result before and after getValue and setValue operations on public string field crossF from class ReflectPrivateCrossB40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCrossB40>();
      let field = cls.getInstanceField('crossF')!;
      let inst = cls.createInstance();
      const before = field.isPrivate();
      field.getValue(inst);
      field.setValue(inst, 'new');
      const after = field.isPrivate();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6200
     * @tc.name testIsPrivate6200
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public byte field pubB from class ReflectPrivateByteB01 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateByteB01>();
      let field = cls.getInstanceField('pubB')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6300
     * @tc.name testIsPrivate6300
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public short field pubS from class ReflectPrivateShortB02 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateShortB02>();
      let field = cls.getInstanceField('pubS')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6400
     * @tc.name testIsPrivate6400
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public int field p1 from class ReflectPrivateMultiB03 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMultiB03>();
      let field = cls.getInstanceField('p1')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6500
     * @tc.name testIsPrivate6500
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public int field pubInt from class ReflectPrivateMultiTypePri01 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMultiTypePri01>();
      let field = cls.getInstanceField('pubInt')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6600
     * @tc.name testIsPrivate6600
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public float field pubType from class ReflectPrivateGetType01 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateGetType01>();
      let field = cls.getInstanceField('pubType')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6700
     * @tc.name testIsPrivate6700
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public double field ownPub from class ReflectPrivateGetOwner01 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateGetOwner01>();
      let field = cls.getInstanceField('ownPub')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6800
     * @tc.name testIsPrivate6800
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public char field c from class ReflectPrivateCharB10 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateCharB10>();
      let field = cls.getInstanceField('c')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_6900
     * @tc.name testIsPrivate6900
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public double field p2 from class ReflectPrivateMultiB03 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateMultiB03>();
      let field = cls.getInstanceField('p2')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7000
     * @tc.name testIsPrivate7000
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public field arr of type Array<int> from class ReflectPrivateArrayIntB11 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayIntB11>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7100
     * @tc.name testIsPrivate7100
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public field arr of type Array<string> from class ReflectPrivateArrayStringB12 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayStringB12>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7200
     * @tc.name testIsPrivate7200
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public field arr of type Array<byte> from class ReflectPrivateArrayByteB13 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayByteB13>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7300
     * @tc.name testIsPrivate7300
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public Object field obj from class ReflectPrivateObjectB14 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateObjectB14>();
      let field = cls.getInstanceField('obj')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7400
     * @tc.name testIsPrivate7400
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public union type field u of type int|string from class ReflectPrivateUnionB15 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateUnionB15>();
      let field = cls.getInstanceField('u')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7500
     * @tc.name testIsPrivate7500
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public nullable string field nb of type string|null from class ReflectPrivateNullableStringB16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNullableStringB16>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7600
     * @tc.name testIsPrivate7600
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public optional int field os of type int|undefined from class ReflectPrivateOptionalIntB17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateOptionalIntB17>();
      let field = cls.getInstanceField('os')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7700
     * @tc.name testIsPrivate7700
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public triple union field u3 of type int|string|boolean from class ReflectPrivateTripleUnionB18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateTripleUnionB18>();
      let field = cls.getInstanceField('u3')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7800
     * @tc.name testIsPrivate7800
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public nullable double field nn of type double|null from class ReflectPrivateNullableNumberB19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNullableNumberB19>();
      let field = cls.getInstanceField('nn')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_7900
     * @tc.name testIsPrivate7900
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public nullable boolean field nb of type boolean|null from class ReflectPrivateNullableBooleanB20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNullableBooleanB20>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8000
     * @tc.name testIsPrivate8000
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public field arr of type Array<Object> from class ReflectPrivateArrayObjectB21 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayObjectB21>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8100
     * @tc.name testIsPrivate8100
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public field arr of type Array<ReflectPrivatePerson> from class ReflectPrivateArrayPersonB22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateArrayPersonB22>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8200
     * @tc.name testIsPrivate8200
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public nested object field no of type ReflectPrivatePerson from class ReflectPrivateNestedB23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateNestedB23>();
      let field = cls.getInstanceField('no')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8300
     * @tc.name testIsPrivate8300
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public generic field gi of type T|undefined from class ReflectPrivateGenericB24 instantiated with int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateGenericB24<int>>();
      let field = cls.getInstanceField('gi')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8400
     * @tc.name testIsPrivate8400
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public literal union type field lit of type 'a'|'b' from class ReflectPrivateLiteralB25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateLiteralB25>();
      let field = cls.getInstanceField('lit')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8500
     * @tc.name testIsPrivate8500
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public double field dMax initialized to Double.MAX_VALUE from class ReflectPrivateDoubleBoundaryB26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateDoubleBoundaryB26>();
      let field = cls.getInstanceField('dMax')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8600
     * @tc.name testIsPrivate8600
     * @tc.desc Verify isPrivate() returns false and isPublic() returns true on public int field iMin initialized to int minimum boundary -2147483648 from class ReflectPrivateIntBoundaryB27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivateIntBoundaryB27>();
      let field = cls.getInstanceField('iMin')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8700
     * @tc.name testIsPrivate8700
     * @tc.desc Verify isPrivate() consistently returns false across 100 consecutive calls on public string field f from class PrivateEmptyStrB42 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateEmptyStrB42>();
      let field = cls.getInstanceField('f')!;
      for (let i = 0; i < 100; i++) {
        expect(field.isPrivate()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8800
     * @tc.name testIsPrivate8800
     * @tc.desc Verify isPrivate() return type is boolean via typeof check on public string field tf from class PrivateTypeofB43 accessed via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateTypeofB43>();
      let field = cls.getInstanceField('tf')!;
      const result = field.isPrivate();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_8900
     * @tc.name testIsPrivate8900
     * @tc.desc Verify a class containing only private fields exposes no public fields via getInstanceFields (length 0) and getInstanceField returns undefined for private names, confirming private fields cannot be reflected publicly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectPrivatePurePrivB30>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(0);
      expect(cls.getInstanceField('onlyPriv1')).assertEqual(undefined);
      expect(cls.getInstanceField('onlyPriv2')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_9000
     * @tc.name testIsPrivate9000
     * @tc.desc Verify private fields declared in parent class are not accessible via child getInstanceField (returns undefined), providing additional verification for private field handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ReflectPrivateChildPrivB34>();
      expect(childCls.getInstanceField('privF')).assertEqual(undefined);
      let parentCls = Class.from<ReflectPrivateParentPrivB34>();
      expect(parentCls.getInstanceField('privF')).assertEqual(undefined);
    });

  });
}