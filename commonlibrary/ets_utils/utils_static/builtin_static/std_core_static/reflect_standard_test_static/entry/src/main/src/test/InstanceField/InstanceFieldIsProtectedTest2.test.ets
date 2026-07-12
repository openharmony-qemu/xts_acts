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

class ProtectedAccess020 {
  public publicField: string = 'public';
  protected protectedField: string = 'protected';
}

interface MyInterface015 { field: string; }

class ProtectedMixed023 {
  public pub: string = 'p';
  protected prot1: string = 'pr1';
  protected prot2: string = 'pr2';
  private priv: string = 'pv';
}

class ProtectedParent024 {
  public parentPub: string = 'ppub';
  protected parentProt: string = 'pp';
}

class ProtectedChild024 extends ProtectedParent024 {
  public childPub: string = 'cp';
}

class ProtectedReadonly025 {
  public readonly pubRo: string = 'pro';
  protected readonly protRo: string = 'protRo';
}

class ProtectedStatic026 {
  public static STATIC_PUB: string = 'sp';
  protected static STATIC_PROT: string = 'sprot';
}

class ReflectProtByteC01 {
  public pubB: byte = 1;
  protected protB: byte = 2;
}

class ReflectProtShortC02 {
  public pubS: short = 3;
  protected protS: short = 4;
}

class ReflectProtMultiC03 {
  public p1: int = 5;
  public p2: double = 2.2;
  protected r1: string = 'r';
  protected r2: boolean = true;
}

class ReflectProtGetTypeC05 {
  public pub: long = 9;
  protected pro: float = 1.0f;
}

class ReflectProtInterfaceC08 implements MyInterface015 {
  public field: string = 'if';
  protected protIf: string = 'pi';
}

class ReflectProtMultiTypePro01 {
  public pubShort: short = 10;
  public pubChar: char = c'z';
  protected proInt: int = 20;
}

class ReflectProtEquals01 {
  public eqPub: boolean = true;
}

class ProtectedDefaultAccess031 {
  defaultField: string = 'd';
  public pubField: string = 'p';
}

class ReflectProtNumberC60 {
  public n: number = 0;
  protected protN: number = 1;
}

class ReflectProtArrayIntC61 {
  public arr: Array<int> = [];
  protected protArr: Array<int> = [];
}

class ReflectProtArrayStringC62 {
  public arr: Array<string> = [];
  protected protArrS: Array<string> = [];
}

class ReflectProtArrayByteC63 {
  public arr: Array<byte> = [];
  protected protArrB: Array<byte> = [];
}

class ReflectProtObjectC64 {
  public obj: Object = {};
  protected protObj: Object = {};
}

class ReflectProtUnionC65 {
  public u: int | string = 0;
  protected protU: int | string = 0;
}

class ReflectProtNullableStringC66 {
  public nb: string | null = null;
  protected protNb: string | null = null;
}

class ReflectProtOptionalIntC67 {
  public os: int | undefined = undefined;
  protected protOs: int | undefined = undefined;
}

class ReflectProtTripleUnionC68 {
  public u3: int | string | boolean = 0;
  protected protU3: int | string | boolean = 0;
}

class ReflectProtNullableNumberC69 {
  public nn: number | null = null;
  protected protNn: number | null = null;
}

class ReflectProtNullableBooleanC70 {
  public nb: boolean | null = null;
  protected protNb: boolean | null = null;
}

class ReflectProtArrayObjectC71 {
  public arr: Array<Object> = [];
  protected protArrO: Array<Object> = [];
}

class ReflectProtPersonC72 {
  public name: string = '';
}

class ReflectProtArrayPersonC73 {
  public arr: Array<ReflectProtPersonC72> = [];
  protected protArrP: Array<ReflectProtPersonC72> = [];
}

class ReflectProtNestedC74 {
  public no: ReflectProtPersonC72 = new ReflectProtPersonC72();
  protected protNo: ReflectProtPersonC72 = new ReflectProtPersonC72();
}

class ReflectProtGenericC75<T> {
  public gi: T | undefined = undefined;
  protected protGi: T | undefined = undefined;
}

class ReflectProtLiteralC76 {
  public lit: 'a' | 'b' = 'a';
  protected protLit: 'a' | 'b' = 'a';
}

class ReflectProtDoubleBoundaryC77 {
  public dMax: double = Double.MAX_VALUE;
  protected protDMax: double = 0;
}

class ReflectProtIntBoundaryC78 {
  public iMin: int = Int.MIN_VALUE;
  protected protIMin: int = 0;
}

class ReflectProtFloatPubC88 {
  public pubF: float = 1.0f;
  protected protF: float = 2.0f;
}

class ReflectProtAbstractBaseC89 {
  public absPub: string = 'ap';
  protected absProt: string = 'aprot';
}

class ReflectProtAccessorC90 {
  public pubAcc: string = 'pa';
  protected secret: string = 'sec';

  public getSecret(): string {
    return this.secret;
  }
}

class ReflectProtDefaultAccessC80 {
  defaultField: string = 'def';
  public pubDef: string = 'pubd';
}

class ReflectProtInheritGrandC81 {
  public gpPub: string = 'gp';
  protected gpProt: string = 'gppr';
}

class ReflectProtInheritParentC81 extends ReflectProtInheritGrandC81 {
  public pPub: string = 'pp';
  protected pProt: string = 'ppr';
}

class ReflectProtInheritChildC81 extends ReflectProtInheritParentC81 {
  public cPub: string = 'cp';
  protected cProt: string = 'cpr';
}

class ReflectProtForPathC83 {
  public pathF: string = 'pf';
  protected pathProt: string = 'pp';
}

class ReflectProtForConsistencyC84 {
  public consF: int = 42;
  protected consProt: int = 43;
}

class ReflectProtForCrossC85 {
  public crossPub: boolean = true;
  protected crossProt: boolean = false;
}

class ReflectProtForReturnTypeC86 {
  public retF: string = 'ret';
  protected retProt: string = 'rp';
}

class ProtTypeofC92 {
  public tf: string = 'tf';
}

export default function InstanceFieldIsProtectedTest2(): void {
  describe('InstanceFieldIsProtectedTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0100
     * @tc.name testIsProtected0100
     * @tc.desc Verify getInstanceFields exposes exactly one field pub with isProtected returning false from mixed-modifier class ProtectedMixed023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedMixed023>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('pub');
      expect(fields[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0200
     * @tc.name testIsProtected0200
     * @tc.desc Verify parent protected field parentProt is inaccessible via reflection from both child class ProtectedChild024 and its parent class ProtectedParent024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ProtectedChild024>();
      let childPub = childCls.getInstanceField('childPub')!;
      expect(childPub.isProtected()).assertFalse();
      let parentProt = childCls.getInstanceField('parentProt');
      expect(parentProt).assertEqual(undefined);
      let parentCls = childCls.getSuper()!;
      let parentProt2 = parentCls.getInstanceField('parentProt');
      expect(parentProt2).assertEqual(undefined);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0300
     * @tc.name testIsProtected0300
     * @tc.desc Verify protected static field STATIC_PROT is invisible via getStaticField while public static field STATIC_PUB is accessible with isProtected returning false in ProtectedStatic026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedStatic026>();
      let protStatic = cls.getStaticField('STATIC_PROT');
      expect(protStatic).assertEqual(undefined);
      let pubStatic = cls.getStaticField('STATIC_PUB')!;
      expect(pubStatic.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0400
     * @tc.name testIsProtected0400
     * @tc.desc Verify cross-validation of isProtected returning false, isPublic returning true, and isPrivate returning false on public string field publicField from ProtectedAccess020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
      let pub = cls.getInstanceField('publicField')!;
      expect(pub.isProtected()).assertFalse();
      expect(pub.isPublic()).assertTrue();
      expect(pub.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0500
     * @tc.name testIsProtected0500
     * @tc.desc Verify protected byte field protB is inaccessible via getInstanceField while public byte field pubB is accessible with isProtected returning false from ReflectProtByteC01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtByteC01>();
      expect(cls.getInstanceField('protB')).assertEqual(undefined);
      let pub = cls.getInstanceField('pubB')!;
      expect(pub.isProtected()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0600
     * @tc.name testIsProtected0600
     * @tc.desc Verify isProtected() results are consistent between field publicField obtained via getInstanceField and the matching element from getInstanceFields in ProtectedAccess020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
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
      expect(f1.isProtected()).assertEqual(f2.isProtected());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0700
     * @tc.name testIsProtected0700
     * @tc.desc Verify isProtected() returns consistent results when called on two separate field references to publicField obtained via getInstanceField from class ProtectedAccess020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
      let f1 = cls.getInstanceField('publicField')!;
      let f2 = cls.getInstanceField('publicField')!;
      expect(f1.isProtected()).assertEqual(f2.isProtected());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0800
     * @tc.name testIsProtected0800
     * @tc.desc Verify isProtected() returns false and isPublic() returns true on default-visibility string field defaultField from class ProtectedDefaultAccess031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedDefaultAccess031>();
      let defF = cls.getInstanceField('defaultField')!;
      expect(defF.isProtected()).assertFalse();
      expect(defF.isPublic()).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0900
     * @tc.name testIsProtected0900
     * @tc.desc Verify three consecutive calls to isProtected() on public string field publicField all return identical results from class ProtectedAccess020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
      let field = cls.getInstanceField('publicField')!;
      const v1 = field.isProtected();
      const v2 = field.isProtected();
      const v3 = field.isProtected();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1000
     * @tc.name testIsProtected1000
     * @tc.desc Verify isProtected() returns the same value before and after calling getValue on public string field publicField from class ProtectedAccess020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
      let field = cls.getInstanceField('publicField')!;
      let instance = cls.createInstance();
      const before = field.isProtected();
      field.getValue(instance);
      const after = field.isProtected();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1100
     * @tc.name testIsProtected1100
     * @tc.desc Verify isProtected() returns false and isPublic() returns true are mutually exclusive on public string field publicField from class ProtectedAccess020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
      let field = cls.getInstanceField('publicField')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1200
     * @tc.name testIsProtected1200
     * @tc.desc Verify isProtected() returns false and isReadonly() returns true independently on public readonly string field pubRo from class ProtectedReadonly025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedReadonly025>();
      let field = cls.getInstanceField('pubRo')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1300
     * @tc.name testIsProtected1300
     * @tc.desc Verify isProtected() returns false on public double field p2 from multi-field class ReflectProtMultiC03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtMultiC03>();
      let field = cls.getInstanceField('p2')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1400
     * @tc.name testIsProtected1400
     * @tc.desc Verify isProtected() returns false on public int field p1 from multi-modifier class ReflectProtMultiC03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtMultiC03>();
      let field = cls.getInstanceField('p1')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1500
     * @tc.name testIsProtected1500
     * @tc.desc Verify isProtected() returns false and isPublic() returns true on public byte field pubB from class ReflectProtByteC01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtByteC01>();
      let field = cls.getInstanceField('pubB')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1600
     * @tc.name testIsProtected1600
     * @tc.desc Verify isProtected() returns false on public short field pubS from class ReflectProtShortC02
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtShortC02>();
      let field = cls.getInstanceField('pubS')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1700
     * @tc.name testIsProtected1700
     * @tc.desc Verify isProtected() returns false on public long field pub from class ReflectProtGetTypeC05
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtGetTypeC05>();
      let field = cls.getInstanceField('pub')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1800
     * @tc.name testIsProtected1800
     * @tc.desc Verify isProtected() returns false on public float field pubF from class ReflectProtFloatPubC88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtFloatPubC88>();
      let field = cls.getInstanceField('pubF')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1900
     * @tc.name testIsProtected1900
     * @tc.desc Verify isProtected() returns false on public char field pubChar from class ReflectProtMultiTypePro01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtMultiTypePro01>();
      let field = cls.getInstanceField('pubChar')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2000
     * @tc.name testIsProtected2000
     * @tc.desc Verify isProtected() returns false on public boolean field eqPub from class ReflectProtEquals01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtEquals01>();
      let field = cls.getInstanceField('eqPub')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2100
     * @tc.name testIsProtected2100
     * @tc.desc Verify isProtected() returns false and isPublic() returns true on public number field n from class ReflectProtNumberC60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtNumberC60>();
      let field = cls.getInstanceField('n')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2200
     * @tc.name testIsProtected2200
     * @tc.desc Verify isProtected() returns false on public Array<int> field arr from class ReflectProtArrayIntC61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtArrayIntC61>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2300
     * @tc.name testIsProtected2300
     * @tc.desc Verify isProtected() returns false on public Array<string> field arr from class ReflectProtArrayStringC62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtArrayStringC62>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2400
     * @tc.name testIsProtected2400
     * @tc.desc Verify isProtected() returns false on public Array<byte> field arr from class ReflectProtArrayByteC63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtArrayByteC63>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2500
     * @tc.name testIsProtected2500
     * @tc.desc Verify isProtected() returns false on public Object field obj from class ReflectProtObjectC64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtObjectC64>();
      let field = cls.getInstanceField('obj')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2600
     * @tc.name testIsProtected2600
     * @tc.desc Verify isProtected() returns false on public union-type field u typed as int|string from class ReflectProtUnionC65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtUnionC65>();
      let field = cls.getInstanceField('u')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2700
     * @tc.name testIsProtected2700
     * @tc.desc Verify isProtected() returns false on public nullable string|null field nb from class ReflectProtNullableStringC66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtNullableStringC66>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2800
     * @tc.name testIsProtected2800
     * @tc.desc Verify isProtected() returns false on public optional int|undefined field os from class ReflectProtOptionalIntC67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtOptionalIntC67>();
      let field = cls.getInstanceField('os')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_2900
     * @tc.name testIsProtected2900
     * @tc.desc Verify isProtected() returns false on public triple-union type field u3 typed as int|string|boolean from class ReflectProtTripleUnionC68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtTripleUnionC68>();
      let field = cls.getInstanceField('u3')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3000
     * @tc.name testIsProtected3000
     * @tc.desc Verify isProtected() returns false on public nullable number|null field nn from class ReflectProtNullableNumberC69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtNullableNumberC69>();
      let field = cls.getInstanceField('nn')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3100
     * @tc.name testIsProtected3100
     * @tc.desc Verify isProtected() returns false on public nullable boolean|null field nb from class ReflectProtNullableBooleanC70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtNullableBooleanC70>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3200
     * @tc.name testIsProtected3200
     * @tc.desc Verify isProtected() returns false on public Array<Object> field arr from class ReflectProtArrayObjectC71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtArrayObjectC71>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3300
     * @tc.name testIsProtected3300
     * @tc.desc Verify isProtected() returns false on public Array<ReflectProtPersonC72> field arr from class ReflectProtArrayPersonC73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtArrayPersonC73>();
      let field = cls.getInstanceField('arr')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3400
     * @tc.name testIsProtected3400
     * @tc.desc Verify isProtected() returns false on public nested-object field no typed as ReflectProtPersonC72 from class ReflectProtNestedC74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtNestedC74>();
      let field = cls.getInstanceField('no')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3500
     * @tc.name testIsProtected3500
     * @tc.desc Verify isProtected() returns false on public generic field gi typed as T|undefined instantiated with int from class ReflectProtGenericC75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtGenericC75<int>>();
      let field = cls.getInstanceField('gi')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3600
     * @tc.name testIsProtected3600
     * @tc.desc Verify isProtected() returns false on public literal union type field lit typed as 'a'|'b' from class ReflectProtLiteralC76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtLiteralC76>();
      let field = cls.getInstanceField('lit')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3700
     * @tc.name testIsProtected3700
     * @tc.desc Verify isProtected() returns false on public double field dMax initialized to Double.MAX_VALUE from class ReflectProtDoubleBoundaryC77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtDoubleBoundaryC77>();
      let field = cls.getInstanceField('dMax')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3800
     * @tc.name testIsProtected3800
     * @tc.desc Verify isProtected() returns false on public int boundary-value field iMin initialized to Int.MIN_VALUE from class ReflectProtIntBoundaryC78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtIntBoundaryC78>();
      let field = cls.getInstanceField('iMin')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_3900
     * @tc.name testIsProtected3900
     * @tc.desc Verify isProtected() returns false on public string field pubDef accessed via getInstanceField from class ReflectProtDefaultAccessC80 that also has a default-access field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtDefaultAccessC80>();
      let field = cls.getInstanceField('pubDef')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4000
     * @tc.name testIsProtected4000
     * @tc.desc Verify isProtected() returns false and isReadonly() returns false on default-visibility string field defaultField from class ProtectedDefaultAccess031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedDefaultAccess031>();
      let field = cls.getInstanceField('defaultField')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4100
     * @tc.name testIsProtected4100
     * @tc.desc Verify isProtected() returns false on static public string field STATIC_PUB accessed via getStaticField from class ProtectedStatic026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedStatic026>();
      let field = cls.getStaticField('STATIC_PUB')!;
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4200
     * @tc.name testIsProtected4200
     * @tc.desc Verify all three levels of protected fields gpProt, pProt, cProt are inaccessible via reflection from child class ReflectProtInheritChildC81 in three-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ReflectProtInheritChildC81>();
      expect(childCls.getInstanceField('gpProt')).assertEqual(undefined);
      expect(childCls.getInstanceField('pProt')).assertEqual(undefined);
      expect(childCls.getInstanceField('cProt')).assertEqual(undefined);
      let pub = childCls.getInstanceField('cPub')!;
      expect(pub.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4300
     * @tc.name testIsProtected4300
     * @tc.desc Verify isProtected() returns false on grandparent public string field gpPub accessed via getInstanceField from class ReflectProtInheritGrandC81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gCls = Class.from<ReflectProtInheritGrandC81>();
      let f = gCls.getInstanceField('gpPub')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4400
     * @tc.name testIsProtected4400
     * @tc.desc Verify isProtected() returns false on public string field pathF accessed via getInstanceField from Class.from of ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let f = cls.getInstanceField('pathF')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4500
     * @tc.name testIsProtected4500
     * @tc.desc Verify isProtected() returns false on public string field pathF accessed via getInstanceField from Class.of instance of ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst = new ReflectProtForPathC83();
      let cls = Class.of(inst);
      let f = cls.getInstanceField('pathF')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4600
     * @tc.name testIsProtected4600
     * @tc.desc Verify isProtected() returns false on field pathF found by iterating getInstanceFields and matching field name from class ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let fields = cls.getInstanceFields();
      let found = false;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'pathF') {
          expect(fields[i].isProtected()).assertFalse();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4700
     * @tc.name testIsProtected4700
     * @tc.desc Verify isProtected() returns false and getValue returns correct string value 'pf' on field pathF after createInstance from class ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('pathF')!;
      expect(f.isProtected()).assertFalse();
      const tmpVal = f.getValue(inst);
      expect(tmpVal as string).assertEqual('pf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4800
     * @tc.name testIsProtected4800
     * @tc.desc Verify isProtected() returns consistent results when field consF is obtained from two different Class instances of ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ReflectProtForConsistencyC84>();
      let cls2 = Class.from<ReflectProtForConsistencyC84>();
      let f1 = cls1.getInstanceField('consF')!;
      let f2 = cls2.getInstanceField('consF')!;
      expect(f1.isProtected()).assertEqual(f2.isProtected());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_4900
     * @tc.name testIsProtected4900
     * @tc.desc Verify isProtected() results are consistent between field consF obtained via getInstanceField and via getInstanceFields[0] from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f1 = cls.getInstanceField('consF')!;
      let fs = cls.getInstanceFields();
      let f2 = fs[0]!;
      expect(f1.isProtected()).assertEqual(f2.isProtected());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5000
     * @tc.name testIsProtected5000
     * @tc.desc Verify three consecutive calls to isProtected() on public int field consF all return identical values from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f = cls.getInstanceField('consF')!;
      const v1 = f.isProtected();
      const v2 = f.isProtected();
      const v3 = f.isProtected();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5100
     * @tc.name testIsProtected5100
     * @tc.desc Verify isProtected() returns the same result before and after calling getValue on public int field consF from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f = cls.getInstanceField('consF')!;
      let inst = cls.createInstance();
      const b = f.isProtected();
      f.getValue(inst);
      expect(f.isProtected()).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5200
     * @tc.name testIsProtected5200
     * @tc.desc Verify getValue still returns correct int value 42 after calling isProtected() on public int field consF from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f = cls.getInstanceField('consF')!;
      let inst = cls.createInstance();
      f.isProtected();
      const tmpVal = f.getValue(inst);
      expect(tmpVal as Object).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5300
     * @tc.name testIsProtected5300
     * @tc.desc Verify equals returns true between two getInstanceField references to field consF after calling isProtected() on one of them from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f1 = cls.getInstanceField('consF')!;
      let f2 = cls.getInstanceField('consF')!;
      f1.isProtected();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5400
     * @tc.name testIsProtected5400
     * @tc.desc Verify getType().getName() returns 'i32' after calling isProtected() on public int field consF from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f = cls.getInstanceField('consF')!;
      f.isProtected();
      expect(f.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5500
     * @tc.name testIsProtected5500
     * @tc.desc Verify isProtected() returns false, isPrivate() returns false, and isPublic() returns true jointly on public boolean field crossPub from class ReflectProtForCrossC85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForCrossC85>();
      let f = cls.getInstanceField('crossPub')!;
      expect(f.isProtected()).assertFalse();
      expect(f.isPrivate()).assertFalse();
      expect(f.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5600
     * @tc.name testIsProtected5600
     * @tc.desc Verify getName() still returns 'crossPub' after calling isProtected() on public boolean field crossPub from class ReflectProtForCrossC85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForCrossC85>();
      let f = cls.getInstanceField('crossPub')!;
      f.isProtected();
      expect(f.getName()).assertEqual('crossPub');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5700
     * @tc.name testIsProtected5700
     * @tc.desc Verify getType().getName() returns 'u1' after calling isProtected() on public boolean field crossPub from class ReflectProtForCrossC85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForCrossC85>();
      let f = cls.getInstanceField('crossPub')!;
      f.isProtected();
      expect(f.getType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5800
     * @tc.name testIsProtected5800
     * @tc.desc Verify getOwner returns correct owning class name ending with ReflectProtForCrossC85 after calling isProtected() on public boolean field crossPub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForCrossC85>();
      let f = cls.getInstanceField('crossPub')!;
      f.isProtected();
      expect(f.getOwner().getName().endsWith('ReflectProtForCrossC85')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_5900
     * @tc.name testIsProtected5900
     * @tc.desc Verify equals returns true between two getInstanceField references to field crossPub after calling isProtected() on one of them from class ReflectProtForCrossC85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForCrossC85>();
      let f1 = cls.getInstanceField('crossPub')!;
      let f2 = cls.getInstanceField('crossPub')!;
      f1.isProtected();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6000
     * @tc.name testIsProtected6000
     * @tc.desc Verify isProtected() consistently returns false across repeated calls on public string field retF accessed via getInstanceField from class ReflectProtForReturnTypeC86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForReturnTypeC86>();
      let f = cls.getInstanceField('retF')!;
      const v = f.isProtected();
      expect(v).assertFalse();
      expect(v).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6100
     * @tc.name testIsProtected6100
     * @tc.desc Verify isProtected() returns false for every field when iterating through all getInstanceFields from class ReflectProtForReturnTypeC86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForReturnTypeC86>();
      let fs = cls.getInstanceFields();
      for (let i = 0; i < fs.length; i++) {
        expect(fs[i].isProtected()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6200
     * @tc.name testIsProtected6200
     * @tc.desc Verify isProtected() returns false on child public string field cPub accessed via getInstanceField from child class ReflectProtInheritChildC81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Class.from<ReflectProtInheritChildC81>();
      let f = c.getInstanceField('cPub')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6300
     * @tc.name testIsProtected6300
     * @tc.desc Verify isProtected() returns false for every element when iterating over all getInstanceFields from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let fs = cls.getInstanceFields();
      for (let i = 0; i < fs.length; i++) {
        expect(fs[i].isProtected()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6400
     * @tc.name testIsProtected6400
     * @tc.desc Verify isProtected() returns the same value before and after calling getValue on public int field consF from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let f = cls.getInstanceField('consF')!;
      let inst = cls.createInstance();
      const before = f.isProtected();
      const tmpVal = f.getValue(inst);
      expect(tmpVal as Object).assertEqual(42);
      expect(f.isProtected()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6500
     * @tc.name testIsProtected6500
     * @tc.desc Verify isProtected() returns false on public string field pPub accessed via getInstanceField from parent class ReflectProtInheritParentC81 in inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtInheritParentC81>();
      let f = cls.getInstanceField('pPub')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6600
     * @tc.name testIsProtected6600
     * @tc.desc Verify protected field prot1 is not accessible via getInstanceField while public string field pub is accessible with isProtected returning false in ProtectedMixed023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedMixed023>();
      expect(cls.getInstanceField('prot1')).assertEqual(undefined);
      let pub = cls.getInstanceField('pub')!;
      expect(pub.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6700
     * @tc.name testIsProtected6700
     * @tc.desc Verify isProtected() returns false and isPublic() returns true on default-visibility string field defaultField from class ReflectProtDefaultAccessC80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtDefaultAccessC80>();
      let f = cls.getInstanceField('defaultField')!;
      expect(f.isProtected()).assertFalse();
      expect(f.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6800
     * @tc.name testIsProtected6800
     * @tc.desc Verify isProtected() results are consistent between field pathF obtained via getInstanceField and via getInstanceFields array from class ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let f1 = cls.getInstanceField('pathF')!;
      let fs = cls.getInstanceFields();
      let f2 = fs[0]!;
      expect(f1.isProtected()).assertEqual(f2.isProtected());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_6900
     * @tc.name testIsProtected6900
     * @tc.desc Verify field metadata remains unchanged with isProtected() returning false and getName() returning 'pathF' after calling isProtected and getValue on field pathF from ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let f = cls.getInstanceField('pathF')!;
      let inst = cls.createInstance();
      f.isProtected();
      f.getValue(inst);
      expect(f.isProtected()).assertFalse();
      expect(f.getName()).assertEqual('pathF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7000
     * @tc.name testIsProtected7000
     * @tc.desc Verify getOwner returns correct owning class ReflectProtForReturnTypeC86 after calling isProtected() on public string field retF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForReturnTypeC86>();
      let f = cls.getInstanceField('retF')!;
      f.isProtected();
      expect(f.getOwner().getName().endsWith('ReflectProtForReturnTypeC86')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7100
     * @tc.name testIsProtected7100
     * @tc.desc Verify isProtected() returns false on public string field absPub accessed via getInstanceField from abstract class ReflectProtAbstractBaseC89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtAbstractBaseC89>();
      let f = cls.getInstanceField('absPub')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7200
     * @tc.name testIsProtected7200
     * @tc.desc Verify protected field secret is inaccessible via reflection but retrievable through accessor method getSecret, while public field pubAcc isProtected returns false in ReflectProtAccessorC90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst = new ReflectProtAccessorC90();
      expect(inst.getSecret()).assertEqual('sec');
      let cls = Class.from<ReflectProtAccessorC90>();
      let pubf = cls.getInstanceField('pubAcc')!;
      expect(pubf.isProtected()).assertFalse();
      expect(cls.getInstanceField('secret')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7300
     * @tc.name testIsProtected7300
     * @tc.desc Verify getInstanceFields returns one element and its isProtected() returns false on class ReflectProtForPathC83 that only contains public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let fs = cls.getInstanceFields();
      expect(fs.length).assertEqual(1);
      expect(fs[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7400
     * @tc.name testIsProtected7400
     * @tc.desc Verify isProtected() returns false on both getInstanceField references to public string field pathF from class ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let f1 = cls.getInstanceField('pathF')!;
      let f2 = cls.getInstanceField('pathF')!;
      expect(f1.isProtected()).assertFalse();
      expect(f2.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7500
     * @tc.name testIsProtected7500
     * @tc.desc Verify isProtected() returns false on public string field field accessed via getInstanceField from interface-implementing class ReflectProtInterfaceC08
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtInterfaceC08>();
      let f = cls.getInstanceField('field')!;
      expect(f.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7600
     * @tc.name testIsProtected7600
     * @tc.desc Verify getValue still returns correct string value 'pf' after calling isProtected() on public string field pathF from class ReflectProtForPathC83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForPathC83>();
      let f = cls.getInstanceField('pathF')!;
      let inst = cls.createInstance();
      f.isProtected();
      const tmpVal = f.getValue(inst);
      expect(tmpVal as string).assertEqual('pf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7700
     * @tc.name testIsProtected7700
     * @tc.desc Verify isProtected() returns false on the first element of getInstanceFields obtained from class ReflectProtForConsistencyC84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectProtForConsistencyC84>();
      let fs = cls.getInstanceFields();
      expect(fs[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7800
     * @tc.name testIsProtected7800
     * @tc.desc Verify that calling isProtected() on field publicField from ProtectedAccess020 does not make protectedField accessible via reflection, with getInstanceField returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();
      let pub = cls.getInstanceField('publicField')!;
      pub.isProtected();
      expect(cls.getInstanceField('protectedField')).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_7900
     * @tc.name testIsProtected7900
     * @tc.desc Verify isProtected() returns a boolean value when called on public string field tf obtained via getInstanceField from class ProtTypeofC92
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtTypeofC92>();
      let field = cls.getInstanceField('tf')!;
      const result = field.isProtected();
      expect(result).assertFalse();
    });

  });
}