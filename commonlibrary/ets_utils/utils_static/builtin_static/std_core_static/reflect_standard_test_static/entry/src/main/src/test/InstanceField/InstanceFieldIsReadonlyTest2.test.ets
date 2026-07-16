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

class ReadonlyMixed022 {
  public readonly ro1: string = 'r1';
  public readonly ro2: number = 99;
  public mutable: string = 'm';
}

class ReadonlyInheritanceParent023 {
  public readonly parentRo: string = 'parentRo';
}

class ReadonlyInheritanceChild023 extends ReadonlyInheritanceParent023 {
  public childField: string = 'child';
}

class ReadonlyProtected024 {
  public readonly pubRo: string = 'pr';
  protected readonly protRo: string = 'protRo';
}

class ReadonlyDefault025 {
  readonly defaultRo: string = 'defRo';
  public pubRo: string = 'pub';
}

class ReadonlyVarious027 {
  public readonly strRo: string = '';
  public readonly intRo: int = 0;
  public readonly boolRo: boolean = true;
  public readonly arrRo: Array<int> = [];
}

class ReadonlyTest018 {
  public readonly value: string = 'original';
}

class ReflectRoByteD01 {
  public readonly roB: byte = 1;
  public mutB: byte = 2;
}

class ReflectRoShortD02 {
  public readonly roS: short = 3;
  public mutS: short = 4;
}

class ReflectRoFloatD03 {
  public readonly roF: float = 0.1f;
  public mutF: float = 0.2f;
}

class ReflectRoDoubleD04 {
  public readonly roD: double = 1.1;
  public mutD: double = 2.2;
}

class ReflectRoCharD05 {
  public readonly roC: char = c'x';
  public mutC: char = c'y';
}

class ReflectRoLongD06 {
  public readonly roL: long = 100;
  public mutL: long = 200;
}

class ReflectRoNumberD07 {
  public readonly roN: number = 1.5;
  public mutN: number = 2.5;
}

class ReflectRoMultiD08 {
  public readonly r1: string = 'r1';
  public readonly r2: int = 99;
  public mut: boolean = false;
}

class ReflectRoDeepGrandD09 {
  public readonly gRo: string = 'g';
}

class ReflectRoDeepParentD09 extends ReflectRoDeepGrandD09 {
  public readonly pRo: string = 'p';
}

class ReflectRoDeepChildD09 extends ReflectRoDeepParentD09 {
  public c: string = 'c';
}

class ReflectRoMultiTypeRo01 {
  public readonly roByte: byte = 1;
  public readonly roShort: short = 2;
  public readonly roChar: char = c'k';
  public mut: int = 3;
}

class ReflectRoInheritRo01 {
  public readonly baseRo: string = 'base';
}

class ReflectRoInheritRo02 extends ReflectRoInheritRo01 {
  public readonly childRo: string = 'child';
  public childMut: string = 'mut';
}

class ReflectRoGetType01 {
  public readonly roType: long = 999;
}

class ReflectRoUnionP12 {
  public readonly u: int | string = 0;
}

class ReflectRoNullableP13 {
  public readonly nb: string | null = null;
}

class ReflectRoGenericP14<T> {
  public readonly gi: T | undefined = undefined;
}

class Person037 {
  public name: string = '';
  public age: int = 0;
  public email: string = '';
}

class RoByteT01 {
  public readonly rb: byte = 0;
}

class RoShortT02 {
  public readonly rs: short = 0;
}

class RoIntT03 {
  public readonly ri: int = 0;
}

class RoLongT04 {
  public readonly rl: long = 0;
}

class RoFloatT05 {
  public readonly rf: float = 0.0f;
}

class RoDoubleT06 {
  public readonly rd: double = 0;
}

class RoCharT07 {
  public readonly rc: char = c'a';
}

class RoBoolT08 {
  public readonly rb2: boolean = false;
}

class RoNumberT09 {
  public readonly rnum: number = 0;
}

class RoStringT10 {
  public readonly rs2: string = '';
}

class RoArrIntT11 {
  public readonly ra: Array<int> = [];
}

class RoArrStrT12 {
  public readonly ras: Array<string> = [];
}

class RoArrByteT13 {
  public readonly rab: Array<byte> = [];
}

class RoObjT14 {
  public readonly ro: Object = {};
}

class RoUnionT15 {
  public readonly ru: int | string = 0;
}

class RoNullT16 {
  public readonly rnl: string | null = null;
}

class RoOptT17 {
  public readonly ros: int | undefined = undefined;
}

class RoUnion3T18 {
  public readonly ru3: int | string | boolean = 0;
}

class RoNumNullT19 {
  public readonly rnn: number | null = null;
}

class RoBoolNullT20 {
  public readonly rnb: boolean | null = null;
}

class RoArrObjT21 {
  public readonly rao: Array<Object> = [];
}

class RoArrPerT22 {
  public readonly rap: Array<Person037> = [];
}

class RoNestObjT23 {
  public readonly rno: Person037 = new Person037();
}

class RoGenT24<T> {
  public readonly rgi: T | undefined = undefined;
}

class RoLitT25 {
  public readonly rlit: 'a' | 'b' = 'a';
}

class RoDblMaxT26 {
  public readonly rdMax: double = Double.MAX_VALUE;
}

class RoIntMinT27 {
  public readonly riMin: int = Int.MIN_VALUE;
}

class MutByteT28 {
  public mb: byte = 0;
}

class MutShortT29 {
  public ms: short = 0;
}

class MutIntT30 {
  public mi: int = 0;
}

class MutLongT31 {
  public ml: long = 0;
}

class MutFloatT32 {
  public mf: float = 0.0f;
}

class MutDoubleT33 {
  public md: double = 0;
}

class MutCharT34 {
  public mc: char = c'a';
}

class MutBoolT35 {
  public mb2: boolean = false;
}

class MutNumberT36 {
  public mn2: number = 0;
}

class MutStringT37 {
  public ms2: string = '';
}

class MutArrIntT38 {
  public ma: Array<int> = [];
}

class MutArrStrT39 {
  public mas: Array<string> = [];
}

class MutArrByteT40 {
  public mab: Array<byte> = [];
}

class MutObjT41 {
  public mo: Object = {};
}

class MutUnionT42 {
  public mu: int | string = 0;
}

class MutNullT43 {
  public mnl: string | null = null;
}

class MutOptT44 {
  public mos: int | undefined = undefined;
}

class MutUnion3T45 {
  public mu3: int | string | boolean = 0;
}

class MutNumNullT46 {
  public mnn: number | null = null;
}

class MutBoolNullT47 {
  public mnb: boolean | null = null;
}

class MutArrObjT48 {
  public mao: Array<Object> = [];
}

class MutArrPerT49 {
  public map: Array<Person037> = [];
}

class MutNestObjT50 {
  public mno: Person037 = new Person037();
}

class MutGenT51<T> {
  public mgi: T | undefined = undefined;
}

class MutLitT52 {
  public mlit: 'a' | 'b' = 'a';
}

class MutDblMaxT53 {
  public mdMax: double = Double.MAX_VALUE;
}

class MutIntMinT54 {
  public miMin: int = Int.MIN_VALUE;
}

class DefaultRo058 {
  readonly dr: int = 0;
}

class StaticPubRo059 {
  public static readonly spr: string = 'x';
}

class StaticPubMut060 {
  public static spm: string = 'y';
}

class RoEmptyStr063 {
  public readonly re: string = '';
}

class RoZero064 {
  public readonly rz: int = 0;
}

class RoGrand065 {
  public readonly gRo: string = 'g';
}

class RoParent065 extends RoGrand065 {
  public readonly pRo: string = 'p';
}

class RoChild065 extends RoParent065 {
  public readonly cRo: string = 'c';
}

class ParentRoMutOverride067 {
  public readonly roToMut: string = 'ro';
}

interface IRoField069 {}

class ImplRoInterface069 implements IRoField069 {
  public readonly field: string = 'f';
}

abstract class AbsRo070 {
  public readonly absRo: string = 'abs';
}

class RoForSetByte079 {
  public readonly rsb: byte = 1;
}

class RoForSetShort080 {
  public readonly rss: short = 2;
}

class RoForSetInt081 {
  public readonly rsi: int = 3;
}

class RoForSetLong082 {
  public readonly rsl: long = 4;
}

class RoForSetFloat083 {
  public readonly rsf: float = 0.1f;
}

class RoForSetDouble084 {
  public readonly rsd: double = 1.1;
}

class RoForSetChar085 {
  public readonly rsc: char = c'x';
}

class RoForSetBool086 {
  public readonly rsb2: boolean = true;
}

class RoForSetNum087 {
  public readonly rsn: number = 5.5;
}

class RoForSetStr088 {
  public readonly rss2: string = 's';
}

class RoForSetArr089 {
  public readonly rsa: Array<int> = [1];
}

class RoForSetStatic090 {
  public static readonly srs: string = 'sr';
}

class RoPathCls091 {
  public readonly pathRo: string = 'path';
}

class RoConsistCls096 {
  public readonly cRo: string = 'c';
}

class RoMultiForPath {
  public readonly p1: string = 'path';
  public p2: string = 'mut';
}

class Ro2DArrT {
  public readonly r2d: Array<Array<int>> = [[1, 2], [3]];
}

class RoNestedArrT {
  public readonly rnest: Array<Array<string>> = [['a', 'b']];
}

export default function InstanceFieldIsReadonlyTest2(): void {
  describe('InstanceFieldIsReadonlyTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0010
     * @tc.name testIsReadonly0010
     * @tc.desc Verify getInstanceFields returns three fields with first two readonly and getName returns 'ro1' for class ReadonlyMixed022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyMixed022>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(3);
      expect(fields[0].isReadonly()).assertTrue();
      expect(fields[1].isReadonly()).assertTrue();
      expect(fields[0].getName()).assertEqual('ro1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0020
     * @tc.name testIsReadonly0020
     * @tc.desc Verify childField isReadonly returns false while inherited parentRo isReadonly and isPublic return true from ReadonlyInheritanceChild023 hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ReadonlyInheritanceChild023>();
      let childField = childCls.getInstanceField('childField')!;
      expect(childField.isReadonly()).assertFalse();
      let parentCls = childCls.getSuper()!;
      let parentRo = parentCls.getInstanceField('parentRo')!;
      expect(parentRo.isReadonly()).assertTrue();
      expect(parentRo.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0030
     * @tc.name testIsReadonly0030
     * @tc.desc Verify getInstanceField returns undefined for protected readonly field protRo and isReadonly true for public readonly field pubRo from ReadonlyProtected024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyProtected024>();
      let protRo = cls.getInstanceField('protRo');
      expect(protRo).assertEqual(undefined);
      let pubRo = cls.getInstanceField('pubRo')!;
      expect(pubRo.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0040
     * @tc.name testIsReadonly0040
     * @tc.desc Verify isReadonly and isPublic both return true for default-access-modifier readonly string field defaultRo from class ReadonlyDefault025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyDefault025>();
      let defRo = cls.getInstanceField('defaultRo')!;
      expect(defRo.isReadonly()).assertTrue();
      expect(defRo.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0050
     * @tc.name testIsReadonly0050
     * @tc.desc Verify isReadonly and isPublic both return true for all four public readonly fields of types string int boolean ArrayInt from class ReadonlyVarious027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyVarious027>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(4);
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isReadonly()).assertTrue();
        expect(fields[i].isPublic()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0060
     * @tc.name testIsReadonly0060
     * @tc.desc Verify setValue throws TypeError and getValue remains 'original' for public readonly string field value from class ReadonlyTest018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyTest018>();
      let field = cls.getInstanceField('value')!;
      expect(field.isReadonly()).assertTrue();
      let instance = cls.createInstance();
      try {
        field.setValue(instance, 'newValue');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(field.getValue(instance) as string).assertEqual('original');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0070
     * @tc.name testIsReadonly0070
     * @tc.desc Verify isReadonly and isPublic both return true for public readonly byte field roB from class ReflectRoByteD01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoByteD01>();
      let ro = cls.getInstanceField('roB')!;
      expect(ro.isReadonly()).assertTrue();
      expect(ro.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0080
     * @tc.name testIsReadonly0080
     * @tc.desc Verify isReadonly returns true for public readonly short field roS from class ReflectRoShortD02 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoShortD02>();
      expect(cls.getInstanceField('roS')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0090
     * @tc.name testIsReadonly0090
     * @tc.desc Verify isReadonly returns true for public readonly float field roF from class ReflectRoFloatD03 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoFloatD03>();
      expect(cls.getInstanceField('roF')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0100
     * @tc.name testIsReadonly0100
     * @tc.desc Verify isReadonly returns true for public readonly double field roD from class ReflectRoDoubleD04 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoDoubleD04>();
      expect(cls.getInstanceField('roD')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0110
     * @tc.name testIsReadonly0110
     * @tc.desc Verify isReadonly returns true for public readonly char field roC from class ReflectRoCharD05 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoCharD05>();
      expect(cls.getInstanceField('roC')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0120
     * @tc.name testIsReadonly0120
     * @tc.desc Verify isReadonly returns true for public readonly long field roL from class ReflectRoLongD06 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoLongD06>();
      expect(cls.getInstanceField('roL')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0130
     * @tc.name testIsReadonly0130
     * @tc.desc Verify isReadonly returns true for public readonly number field roN from class ReflectRoNumberD07 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoNumberD07>();
      expect(cls.getInstanceField('roN')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0140
     * @tc.name testIsReadonly0140
     * @tc.desc Verify getInstanceFields returns three fields with first two readonly for class ReflectRoMultiD08 having two readonly and one mutable field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoMultiD08>();
      let fs = cls.getInstanceFields();
      expect(fs.length).assertEqual(3);
      expect(fs[0].isReadonly()).assertTrue();
      expect(fs[1].isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0150
     * @tc.name testIsReadonly0150
     * @tc.desc Verify isReadonly returns true for inherited readonly fields pRo in parent and gRo in grandparent via deep chain from ReflectRoDeepChildD09
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<ReflectRoDeepChildD09>();
      let parent = child.getSuper()!;
      expect(parent.getInstanceField('pRo')!.isReadonly()).assertTrue();
      let grand = parent.getSuper()!;
      expect(grand.getInstanceField('gRo')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0160
     * @tc.name testIsReadonly0160
     * @tc.desc Verify isReadonly correctly identifies three readonly fields out of four total public fields from class ReflectRoMultiTypeRo01 via getInstanceFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoMultiTypeRo01>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(4);
      let roCount = 0;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].isReadonly()) {
          roCount++;
        }
      }
      expect(roCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0170
     * @tc.name testIsReadonly0170
     * @tc.desc Verify isReadonly returns true for public readonly string field childRo in ReflectRoInheritRo02 and baseRo in parent class ReflectRoInheritRo01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ReflectRoInheritRo02>();
      let childRo = childCls.getInstanceField('childRo')!;
      expect(childRo.isReadonly()).assertTrue();

      let parentCls = childCls.getSuper()!;
      let baseRo = parentCls.getInstanceField('baseRo')!;
      expect(baseRo.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0180
     * @tc.name testIsReadonly0180
     * @tc.desc Verify getType returns i64 and isReadonly returns true for public readonly long field roType from class ReflectRoGetType01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoGetType01>();
      let field = cls.getInstanceField('roType')!;
      expect(field.getType().getName()).assertEqual('i64');
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0190
     * @tc.name testIsReadonly0190
     * @tc.desc Verify isReadonly matches between getInstanceField and getInstanceFields array index for public readonly string field ro1 from class ReadonlyMixed022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyMixed022>();
      let f1 = cls.getInstanceField('ro1')!;
      let fields = cls.getInstanceFields();
      let idx = -1;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'ro1') {
          idx = i;
          break;
        }
      }
      expect(idx >= 0).assertTrue();
      let f2 = fields[idx]!;
      expect(f1.isReadonly()).assertEqual(f2.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0200
     * @tc.name testIsReadonly0200
     * @tc.desc Verify isReadonly returns consistent result for two getInstanceField calls on public readonly string field parentRo from ReadonlyInheritanceParent023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyInheritanceParent023>();
      let f1 = cls.getInstanceField('parentRo')!;
      let f2 = cls.getInstanceField('parentRo')!;
      expect(f1.isReadonly()).assertEqual(f2.isReadonly());
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0210
     * @tc.name testIsReadonly0210
     * @tc.desc Verify isReadonly returns consistent value across three repeated calls on public readonly string field ro1 from class ReadonlyMixed022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyMixed022>();
      let field = cls.getInstanceField('ro1')!;
      const v1 = field.isReadonly();
      const v2 = field.isReadonly();
      const v3 = field.isReadonly();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0220
     * @tc.name testIsReadonly0220
     * @tc.desc Verify isReadonly remains unchanged after calling getValue on public readonly string field value from class ReadonlyTest018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyTest018>();
      let field = cls.getInstanceField('value')!;
      let instance = cls.createInstance();
      const before = field.isReadonly();
      field.getValue(instance);
      const after = field.isReadonly();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0230
     * @tc.name testIsReadonly0230
     * @tc.desc Verify isReadonly returns true for public readonly int pipe string union field u from class ReflectRoUnionP12 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoUnionP12>();
      let field = cls.getInstanceField('u')!;
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0240
     * @tc.name testIsReadonly0240
     * @tc.desc Verify isReadonly returns true for public readonly string pipe null nullable field nb from class ReflectRoNullableP13 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoNullableP13>();
      let field = cls.getInstanceField('nb')!;
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0250
     * @tc.name testIsReadonly0250
     * @tc.desc Verify isReadonly returns true for public readonly generic T pipe undefined field gi from class ReflectRoGenericP14 int via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoGenericP14<int>>();
      let field = cls.getInstanceField('gi')!;
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0260
     * @tc.name testIsReadonly0260
     * @tc.desc Verify isReadonly returns true for public readonly byte field rb from class RoByteT01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoByteT01>();
      let f = cls.getInstanceField('rb')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0270
     * @tc.name testIsReadonly0270
     * @tc.desc Verify isReadonly returns true for public readonly short field rs from class RoShortT02 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoShortT02>();
      let f = cls.getInstanceField('rs')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0280
     * @tc.name testIsReadonly0280
     * @tc.desc Verify isReadonly returns true for public readonly int field ri from class RoIntT03 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoIntT03>();
      let f = cls.getInstanceField('ri')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0290
     * @tc.name testIsReadonly0290
     * @tc.desc Verify isReadonly returns true for public readonly long field rl from class RoLongT04 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoLongT04>();
      let f = cls.getInstanceField('rl')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0300
     * @tc.name testIsReadonly0300
     * @tc.desc Verify isReadonly returns true for public readonly float field rf from class RoFloatT05 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoFloatT05>();
      let f = cls.getInstanceField('rf')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0310
     * @tc.name testIsReadonly0310
     * @tc.desc Verify isReadonly returns true for public readonly double field rd from class RoDoubleT06 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoDoubleT06>();
      let f = cls.getInstanceField('rd')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0320
     * @tc.name testIsReadonly0320
     * @tc.desc Verify isReadonly returns true for public readonly char field rc from class RoCharT07 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoCharT07>();
      let f = cls.getInstanceField('rc')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0330
     * @tc.name testIsReadonly0330
     * @tc.desc Verify isReadonly returns true for public readonly boolean field rb2 from class RoBoolT08 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoBoolT08>();
      let f = cls.getInstanceField('rb2')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0340
     * @tc.name testIsReadonly0340
     * @tc.desc Verify isReadonly returns true for public readonly number field rnum from class RoNumberT09 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoNumberT09>();
      let f = cls.getInstanceField('rnum')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0350
     * @tc.name testIsReadonly0350
     * @tc.desc Verify isReadonly returns true for public readonly string field rs2 from class RoStringT10 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoStringT10>();
      let f = cls.getInstanceField('rs2')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0360
     * @tc.name testIsReadonly0360
     * @tc.desc Verify isReadonly returns true for public readonly ArrayInt field ra from class RoArrIntT11 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoArrIntT11>();
      let f = cls.getInstanceField('ra')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0370
     * @tc.name testIsReadonly0370
     * @tc.desc Verify isReadonly returns true for public readonly ArrayString field ras from class RoArrStrT12 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoArrStrT12>();
      let f = cls.getInstanceField('ras')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0380
     * @tc.name testIsReadonly0380
     * @tc.desc Verify isReadonly returns true for public readonly ArrayByte field rab from class RoArrByteT13 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoArrByteT13>();
      let f = cls.getInstanceField('rab')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0390
     * @tc.name testIsReadonly0390
     * @tc.desc Verify isReadonly returns true for public readonly Object field ro from class RoObjT14 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoObjT14>();
      let f = cls.getInstanceField('ro')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0400
     * @tc.name testIsReadonly0400
     * @tc.desc Verify isReadonly returns true for public readonly int string union field ru from class RoUnionT15 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoUnionT15>();
      let f = cls.getInstanceField('ru')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0410
     * @tc.name testIsReadonly0410
     * @tc.desc Verify isReadonly returns true for public readonly string null nullable field rnl from class RoNullT16 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoNullT16>();
      let f = cls.getInstanceField('rnl')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0420
     * @tc.name testIsReadonly0420
     * @tc.desc Verify isReadonly returns true for public readonly int undefined optional field ros from class RoOptT17 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoOptT17>();
      let f = cls.getInstanceField('ros')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0430
     * @tc.name testIsReadonly0430
     * @tc.desc Verify isReadonly returns true for public readonly int string boolean triple union field ru3 from class RoUnion3T18 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoUnion3T18>();
      let f = cls.getInstanceField('ru3')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0440
     * @tc.name testIsReadonly0440
     * @tc.desc Verify isReadonly returns true for public readonly number null nullable field rnn from class RoNumNullT19 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoNumNullT19>();
      let f = cls.getInstanceField('rnn')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0450
     * @tc.name testIsReadonly0450
     * @tc.desc Verify isReadonly returns true for public readonly boolean null nullable field rnb from class RoBoolNullT20 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoBoolNullT20>();
      let f = cls.getInstanceField('rnb')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0460
     * @tc.name testIsReadonly0460
     * @tc.desc Verify isReadonly returns true for public readonly ArrayObject field rao from class RoArrObjT21 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoArrObjT21>();
      let f = cls.getInstanceField('rao')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0470
     * @tc.name testIsReadonly0470
     * @tc.desc Verify isReadonly returns true for public readonly ArrayPerson037 field rap from class RoArrPerT22 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoArrPerT22>();
      let f = cls.getInstanceField('rap')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0480
     * @tc.name testIsReadonly0480
     * @tc.desc Verify isReadonly returns true for public readonly nested Person037 object field rno from class RoNestObjT23 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoNestObjT23>();
      let f = cls.getInstanceField('rno')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0490
     * @tc.name testIsReadonly0490
     * @tc.desc Verify isReadonly returns true for public readonly generic T undefined field rgi from class RoGenT24 int via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoGenT24<int>>();
      let f = cls.getInstanceField('rgi')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0500
     * @tc.name testIsReadonly0500
     * @tc.desc Verify isReadonly returns true for public readonly literal-union field rlit of type 'a' pipe 'b' from class RoLitT25 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoLitT25>();
      let f = cls.getInstanceField('rlit')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0510
     * @tc.name testIsReadonly0510
     * @tc.desc Verify isReadonly returns true and getValue returns Double.MAX_VALUE for public readonly double field rdMax from class RoDblMaxT26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoDblMaxT26>();
      let f = cls.getInstanceField('rdMax')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(cls.createInstance()) as double).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0520
     * @tc.name testIsReadonly0520
     * @tc.desc Verify isReadonly returns true and getValue returns Int.MIN_VALUE for public readonly int field riMin from class RoIntMinT27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoIntMinT27>();
      let f = cls.getInstanceField('riMin')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(cls.createInstance()) as int).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0530
     * @tc.name testIsReadonly0530
     * @tc.desc Verify isReadonly returns false for public byte mutable field mb from class MutByteT28 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutByteT28>();
      let f = cls.getInstanceField('mb')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0540
     * @tc.name testIsReadonly0540
     * @tc.desc Verify isReadonly returns false for public short mutable field ms from class MutShortT29 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutShortT29>();
      let f = cls.getInstanceField('ms')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0550
     * @tc.name testIsReadonly0550
     * @tc.desc Verify isReadonly returns false for public int mutable field mi from class MutIntT30 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutIntT30>();
      let f = cls.getInstanceField('mi')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0560
     * @tc.name testIsReadonly0560
     * @tc.desc Verify isReadonly returns false for public long mutable field ml from class MutLongT31 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutLongT31>();
      let f = cls.getInstanceField('ml')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0570
     * @tc.name testIsReadonly0570
     * @tc.desc Verify isReadonly returns false for public float mutable field mf from class MutFloatT32 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutFloatT32>();
      let f = cls.getInstanceField('mf')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0580
     * @tc.name testIsReadonly0580
     * @tc.desc Verify isReadonly returns false for public double mutable field md from class MutDoubleT33 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutDoubleT33>();
      let f = cls.getInstanceField('md')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0590
     * @tc.name testIsReadonly0590
     * @tc.desc Verify isReadonly returns false for public char mutable field mc from class MutCharT34 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutCharT34>();
      let f = cls.getInstanceField('mc')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0600
     * @tc.name testIsReadonly0600
     * @tc.desc Verify isReadonly returns false for public boolean mutable field mb2 from class MutBoolT35 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutBoolT35>();
      let f = cls.getInstanceField('mb2')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0610
     * @tc.name testIsReadonly0610
     * @tc.desc Verify isReadonly returns false for public number mutable field mn2 from class MutNumberT36 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutNumberT36>();
      let f = cls.getInstanceField('mn2')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0620
     * @tc.name testIsReadonly0620
     * @tc.desc Verify isReadonly returns false for public string mutable field ms2 from class MutStringT37 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutStringT37>();
      let f = cls.getInstanceField('ms2')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0630
     * @tc.name testIsReadonly0630
     * @tc.desc Verify isReadonly returns false for public ArrayInt mutable field ma from class MutArrIntT38 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutArrIntT38>();
      let f = cls.getInstanceField('ma')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0640
     * @tc.name testIsReadonly0640
     * @tc.desc Verify isReadonly returns false for public ArrayString mutable field mas from class MutArrStrT39 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutArrStrT39>();
      let f = cls.getInstanceField('mas')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0650
     * @tc.name testIsReadonly0650
     * @tc.desc Verify isReadonly returns false for public ArrayByte mutable field mab from class MutArrByteT40 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutArrByteT40>();
      let f = cls.getInstanceField('mab')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0660
     * @tc.name testIsReadonly0660
     * @tc.desc Verify isReadonly returns false for public Object mutable field mo from class MutObjT41 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutObjT41>();
      let f = cls.getInstanceField('mo')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0670
     * @tc.name testIsReadonly0670
     * @tc.desc Verify isReadonly returns false for public int string union mutable field mu from class MutUnionT42 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutUnionT42>();
      let f = cls.getInstanceField('mu')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0680
     * @tc.name testIsReadonly0680
     * @tc.desc Verify isReadonly returns false for public string null nullable mutable field mnl from class MutNullT43 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutNullT43>();
      let f = cls.getInstanceField('mnl')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0690
     * @tc.name testIsReadonly0690
     * @tc.desc Verify isReadonly returns false for public int undefined optional mutable field mos from class MutOptT44 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutOptT44>();
      let f = cls.getInstanceField('mos')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0700
     * @tc.name testIsReadonly0700
     * @tc.desc Verify isReadonly returns false for public int string boolean triple union mutable field mu3 from class MutUnion3T45 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutUnion3T45>();
      let f = cls.getInstanceField('mu3')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0710
     * @tc.name testIsReadonly0710
     * @tc.desc Verify isReadonly returns false for public number null nullable mutable field mnn from class MutNumNullT46 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutNumNullT46>();
      let f = cls.getInstanceField('mnn')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0720
     * @tc.name testIsReadonly0720
     * @tc.desc Verify isReadonly returns false for public boolean null nullable mutable field mnb from class MutBoolNullT47 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutBoolNullT47>();
      let f = cls.getInstanceField('mnb')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0730
     * @tc.name testIsReadonly0730
     * @tc.desc Verify isReadonly returns false for public ArrayObject mutable field mao from class MutArrObjT48 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutArrObjT48>();
      let f = cls.getInstanceField('mao')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0740
     * @tc.name testIsReadonly0740
     * @tc.desc Verify isReadonly returns false for public ArrayPerson037 mutable field map from class MutArrPerT49 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutArrPerT49>();
      let f = cls.getInstanceField('map')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0750
     * @tc.name testIsReadonly0750
     * @tc.desc Verify isReadonly returns false for public Person037 nested object mutable field mno from class MutNestObjT50 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutNestObjT50>();
      let f = cls.getInstanceField('mno')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0760
     * @tc.name testIsReadonly0760
     * @tc.desc Verify isReadonly returns false for public generic T undefined mutable field mgi from class MutGenT51 int via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutGenT51<int>>();
      let f = cls.getInstanceField('mgi')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0770
     * @tc.name testIsReadonly0770
     * @tc.desc Verify isReadonly returns false for public literal-union 'a' pipe 'b' mutable field mlit from class MutLitT52 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutLitT52>();
      let f = cls.getInstanceField('mlit')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0780
     * @tc.name testIsReadonly0780
     * @tc.desc Verify isReadonly returns false for public double field mdMax with Double.MAX_VALUE from class MutDblMaxT53 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutDblMaxT53>();
      let f = cls.getInstanceField('mdMax')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0790
     * @tc.name testIsReadonly0790
     * @tc.desc Verify isReadonly returns false for public int field miMin with boundary value Int.MIN_VALUE from class MutIntMinT54 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MutIntMinT54>();
      let f = cls.getInstanceField('miMin')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0800
     * @tc.name testIsReadonly0800
     * @tc.desc Verify isReadonly and isPublic both return true for public readonly byte field rb from class RoByteT01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoByteT01>();
      let f = cls.getInstanceField('rb')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0810
     * @tc.name testIsReadonly0810
     * @tc.desc Verify isReadonly and isPublic both return true for default-access-level readonly int field dr from class DefaultRo058 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultRo058>();
      let f = cls.getInstanceField('dr')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0820
     * @tc.name testIsReadonly0820
     * @tc.desc Verify isReadonly returns true for public static readonly string field spr from class StaticPubRo059 accessed via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPubRo059>();
      let f = cls.getStaticField('spr')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0830
     * @tc.name testIsReadonly0830
     * @tc.desc Verify isReadonly returns false for public static string field spm from class StaticPubMut060 accessed via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPubMut060>();
      let f = cls.getStaticField('spm')!;
      expect(f.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0840
     * @tc.name testIsReadonly0840
     * @tc.desc Verify isReadonly returns true and getValue returns empty string for public readonly string field re from class RoEmptyStr063
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoEmptyStr063>();
      let f = cls.getInstanceField('re')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(cls.createInstance()) as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0850
     * @tc.name testIsReadonly0850
     * @tc.desc Verify isReadonly returns true and getValue returns 0 for public readonly int field rz from class RoZero064 via createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoZero064>();
      let f = cls.getInstanceField('rz')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(cls.createInstance()) as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0860
     * @tc.name testIsReadonly0860
     * @tc.desc Verify isReadonly returns true for public readonly string field cRo from child class RoChild065 via Class.from and getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoChild065>();
      let f = cls.getInstanceField('cRo')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0870
     * @tc.name testIsReadonly0870
     * @tc.desc Verify isReadonly returns true for readonly field cRo in RoChild065 and false for mutable field mb in MutByteT28 combination scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoChild065>();
      let f = cls.getInstanceField('cRo')!;
      expect(f.isReadonly()).assertTrue();
      let mutCls = Class.from<MutByteT28>();
      expect(mutCls.getInstanceField('mb')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0880
     * @tc.name testIsReadonly0880
     * @tc.desc Verify isReadonly returns true for public readonly string field pRo from parent class RoParent065 via Class.from and getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pCls = Class.from<RoParent065>();
      let f = pCls.getInstanceField('pRo')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0890
     * @tc.name testIsReadonly0890
     * @tc.desc Verify isReadonly returns true for public readonly string field roToMut from parent class ParentRoMutOverride067 via Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pCls = Class.from<ParentRoMutOverride067>();
      let f = pCls.getInstanceField('roToMut')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0900
     * @tc.name testIsReadonly0900
     * @tc.desc Verify isReadonly returns true for public readonly string field gRo from grandparent class RoGrand065 via Class.from and getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gCls = Class.from<RoGrand065>();
      let f = gCls.getInstanceField('gRo')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0910
     * @tc.name testIsReadonly0910
     * @tc.desc Verify isReadonly returns true for readonly fields gRo pRo cRo across three-level inheritance chain from RoGrand065 RoParent065 RoChild065
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = Class.from<RoGrand065>();
      expect(g.getInstanceField('gRo')!.isReadonly()).assertTrue();
      let p = Class.from<RoParent065>();
      expect(p.getInstanceField('pRo')!.isReadonly()).assertTrue();
      let c = Class.from<RoChild065>();
      expect(c.getInstanceField('cRo')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0920
     * @tc.name testIsReadonly0920
     * @tc.desc Verify isReadonly returns true for public readonly string field field from interface-implementing class ImplRoInterface069 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplRoInterface069>();
      let f = cls.getInstanceField('field')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0930
     * @tc.name testIsReadonly0930
     * @tc.desc Verify isReadonly returns true for public readonly string field absRo from abstract class AbsRo070 via Class.from and getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbsRo070>();
      let f = cls.getInstanceField('absRo')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0940
     * @tc.name testIsReadonly0940
     * @tc.desc Verify isReadonly returns true for public readonly string field pathRo from class RoPathCls091 accessed via Class.from method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0950
     * @tc.name testIsReadonly0950
     * @tc.desc Verify isReadonly returns true for public readonly string field pathRo from class RoPathCls091 accessed via Class.of instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst = new RoPathCls091();
      let cls = Class.of(inst);
      let f = cls.getInstanceField('pathRo')!;
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0960
     * @tc.name testIsReadonly0960
     * @tc.desc Verify isReadonly returns true for public readonly string field p1 and false for public string field p2 from class RoMultiForPath
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoMultiForPath>();
      let fs = cls.getInstanceFields();
      for (let i = 0; i < fs.length; i++) {
        if (fs[i].getName() === 'p1') {
          expect(fs[i].isReadonly()).assertTrue();
        }
        if (fs[i].getName() === 'p2') {
          expect(fs[i].isReadonly()).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0970
     * @tc.name testIsReadonly0970
     * @tc.desc Verify isReadonly returns true and getValue returns 'path' after createInstance for public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      let inst = cls.createInstance();
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(inst) as string).assertEqual('path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0980
     * @tc.name testIsReadonly0980
     * @tc.desc Verify isReadonly returns true and getOwner name ends with RoPathCls091 for public readonly string field pathRo via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getOwner().getName().endsWith('RoPathCls091')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0990
     * @tc.name testIsReadonly0990
     * @tc.desc Verify isReadonly returns consistent value for two getInstanceField calls on public readonly string field cRo from class RoConsistCls096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoConsistCls096>();
      let f1 = cls.getInstanceField('cRo')!;
      let f2 = cls.getInstanceField('cRo')!;
      expect(f1.isReadonly()).assertEqual(f2.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1000
     * @tc.name testIsReadonly1000
     * @tc.desc Verify isReadonly matches between getInstanceField and getInstanceFields array index for public readonly string field cRo from class RoConsistCls096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoConsistCls096>();
      let f1 = cls.getInstanceField('cRo')!;
      let fs = cls.getInstanceFields();
      expect(f1.isReadonly()).assertEqual(fs[0].isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1010
     * @tc.name testIsReadonly1010
     * @tc.desc Verify isReadonly returns consistent value across three consecutive calls on public readonly string field cRo from class RoConsistCls096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoConsistCls096>();
      let f = cls.getInstanceField('cRo')!;
      const r1 = f.isReadonly();
      const r2 = f.isReadonly();
      const r3 = f.isReadonly();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1020
     * @tc.name testIsReadonly1020
     * @tc.desc Verify isReadonly remains true after setValue throws TypeError on public readonly string field rss2 from class RoForSetStr088
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetStr088>();
      let f = cls.getInstanceField('rss2')!;
      const before = f.isReadonly();
      let inst = cls.createInstance();
      try {
        f.setValue(inst, 'x');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(before).assertEqual(f.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1030
     * @tc.name testIsReadonly1030
     * @tc.desc Verify isReadonly result remains unchanged after calling getValue on public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      let inst = cls.createInstance();
      const before = f.isReadonly();
      f.getValue(inst);
      expect(before).assertEqual(f.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1040
     * @tc.name testIsReadonly1040
     * @tc.desc Verify isReadonly returns true after calling equals on two same-named public readonly string field cRo from class RoConsistCls096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoConsistCls096>();
      let f = cls.getInstanceField('cRo')!;
      let f2 = cls.getInstanceField('cRo')!;
      f.equals(f2);
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1050
     * @tc.name testIsReadonly1050
     * @tc.desc Verify getType returns std.core.String after calling isReadonly on public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      f.isReadonly();
      expect(f.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1060
     * @tc.name testIsReadonly1060
     * @tc.desc Verify isReadonly returns true after calling getOwner on public readonly string field pathRo from class RoPathCls091 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      f.getOwner();
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1070
     * @tc.name testIsReadonly1070
     * @tc.desc Verify getValue returns 'path' after calling isReadonly on public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      let inst = cls.createInstance();
      f.isReadonly();
      expect(f.getValue(inst) as string).assertEqual('path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1080
     * @tc.name testIsReadonly1080
     * @tc.desc Verify isReadonly returns true for public readonly string field pathRo in RoPathCls091 and false for public byte field mb in MutByteT28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let roCls = Class.from<RoPathCls091>();
      expect(roCls.getInstanceField('pathRo')!.isReadonly()).assertTrue();
      let mutCls = Class.from<MutByteT28>();
      expect(mutCls.getInstanceField('mb')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1090
     * @tc.name testIsReadonly1090
     * @tc.desc Verify getName returns 'roB' and isReadonly returns true for public readonly byte field roB from class ReflectRoByteD01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoByteD01>();
      expect(cls.getInstanceField('roB')!.getName()).assertEqual('roB');
      expect(cls.getInstanceField('roB')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1100
     * @tc.name testIsReadonly1100
     * @tc.desc Verify getName returns 'pathRo' and isReadonly returns true for public readonly string field pathRo from class RoPathCls091 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      expect(f.getName()).assertEqual('pathRo');
      expect(f.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1110
     * @tc.name testIsReadonly1110
     * @tc.desc Verify getType returns i8 and isReadonly returns true for public readonly byte field roB from class ReflectRoByteD01 via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReflectRoByteD01>();
      expect(cls.getInstanceField('roB')!.getType().getName()).assertEqual('i8');
      expect(cls.getInstanceField('roB')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1120
     * @tc.name testIsReadonly1120
     * @tc.desc Verify isReadonly returns true and getType returns std.core.String for public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      expect(cls.getInstanceField('pathRo')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('pathRo')!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1130
     * @tc.name testIsReadonly1130
     * @tc.desc Verify equals returns true after calling isReadonly on two separately obtained public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f1 = cls.getInstanceField('pathRo')!;
      let f2 = cls.getInstanceField('pathRo')!;
      f1.isReadonly();
      f2.isReadonly();
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1140
     * @tc.name testIsReadonly1140
     * @tc.desc Verify isReadonly returns true and equals remains correct after getValue on public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let f = cls.getInstanceField('pathRo')!;
      let inst = cls.createInstance();
      f.getValue(inst);
      expect(f.isReadonly()).assertTrue();
      expect(f.equals(cls.getInstanceField('pathRo')!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1150
     * @tc.name testIsReadonly1150
     * @tc.desc Verify isReadonly returns true with correct getName getType getOwner for public readonly byte field rb in RoByteT01 and string field rs2 in RoStringT10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<RoByteT01>();
      let f1 = c1.getInstanceField('rb')!;
      expect(f1.isReadonly()).assertTrue();
      expect(f1.getName()).assertEqual('rb');
      expect(f1.getType().getName()).assertEqual('i8');
      expect(f1.getOwner().getName().endsWith('RoByteT01')).assertTrue();
      let c2 = Class.from<RoStringT10>();
      let f2 = c2.getInstanceField('rs2')!;
      expect(f2.isReadonly()).assertTrue();
      expect(f2.equals(c2.getInstanceField('rs2')!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1160
     * @tc.name testIsReadonly1160
     * @tc.desc Verify isReadonly returns true and getValue returns 'path' for public readonly string field pathRo via Class.of from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instObj = new RoPathCls091();
      let cls = Class.of(instObj);
      let f = cls.getInstanceField('pathRo')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(instObj) as string).assertEqual('path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1170
     * @tc.name testIsReadonly1170
     * @tc.desc Verify isReadonly returns true and getValue returns 'path' after createInstance for public readonly string field pathRo from class RoPathCls091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoPathCls091>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('pathRo')!;
      expect(f.isReadonly()).assertTrue();
      expect(f.getValue(inst) as string).assertEqual('path');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1180
     * @tc.name testIsReadonly1180
     * @tc.desc Verify setValue on readonly byte field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetByte079>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsb')!;
      try {
        field.setValue(inst, 99 as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1190
     * @tc.name testIsReadonly1190
     * @tc.desc Verify setValue on readonly short field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetShort080>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rss')!;
      try {
        field.setValue(inst, 1 as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1200
     * @tc.name testIsReadonly1200
     * @tc.desc Verify setValue on readonly int field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetInt081>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsi')!;
      try {
        field.setValue(inst, 123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1210
     * @tc.name testIsReadonly1210
     * @tc.desc Verify setValue on readonly long field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetLong082>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsl')!;
      try {
        field.setValue(inst, 1 as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1220
     * @tc.name testIsReadonly1220
     * @tc.desc Verify setValue on readonly float field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetFloat083>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsf')!;
      try {
        field.setValue(inst, 1.0f);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1230
     * @tc.name testIsReadonly1230
     * @tc.desc Verify setValue on readonly double field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetDouble084>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsd')!;
      try {
        field.setValue(inst, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1240
     * @tc.name testIsReadonly1240
     * @tc.desc Verify setValue on readonly char field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetChar085>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsc')!;
      try {
        field.setValue(inst, c'x');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1250
     * @tc.name testIsReadonly1250
     * @tc.desc Verify setValue on readonly boolean field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetBool086>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsb2')!;
      try {
        field.setValue(inst, true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1260
     * @tc.name testIsReadonly1260
     * @tc.desc Verify setValue on readonly number field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetNum087>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsn')!;
      try {
        field.setValue(inst, 1.1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1270
     * @tc.name testIsReadonly1270
     * @tc.desc Verify setValue on readonly string field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetStr088>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rss2')!;
      try {
        field.setValue(inst, 'x');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1280
     * @tc.name testIsReadonly1280
     * @tc.desc Verify setValue on readonly Array field throws TypeError (list 4.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetArr089>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rsa')!;
      try {
        field.setValue(inst, [9]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1290
     * @tc.name testIsReadonly1290
     * @tc.desc Verify setValue on static readonly field srs from class RoForSetStatic090 using null! thisObj throws NullPointerError (unified null! pattern per review)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoForSetStatic090>();
      let field = cls.getStaticField('srs')!;
      try {
        field.setValue(null!, 'x');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1300
     * @tc.name testIsReadonly1300
     * @tc.desc Verify setValue on 2D readonly array field throws TypeError (2D/nested + readonly combo)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ro2DArrT>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('r2d')!;
      try {
        field.setValue(inst, [[9, 9]]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1310
     * @tc.name testIsReadonly1310
     * @tc.desc Verify setValue on nested array readonly field throws TypeError (2D/nested + readonly combo)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RoNestedArrT>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rnest')!;
      try {
        field.setValue(inst, [['x', 'y']]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

  });
}