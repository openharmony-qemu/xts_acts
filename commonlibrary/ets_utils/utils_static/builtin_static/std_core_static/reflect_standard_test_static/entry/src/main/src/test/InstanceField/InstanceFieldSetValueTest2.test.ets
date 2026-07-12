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

class ReadonlyClass022 {
  public readonly readonlyField: string = 'original';
}

class Person037 {
  public name: string = '';
  public age: int = 0;
  public email: string = '';
}

class RichStringClass390 {
  public emptyStr: string = 'init';
  public unicodeStr: string = 'init';
  public emojiStr: string = 'init';
  public longStr: string = 'init';
  public xssStr: string = 'init';
}

class RichNumericClass391 {
  public intField: int = 0;
  public longField: long = 0;
}

class RichArrayClass392 {
  public emptyArr: Array<string> = ['seed'];
  public multiArr: Array<int> = [];
  public objArr: Array<Person037> = [];
}

class RichPOJOClass393 {
  public person: Person037 = new Person037();
}

class XSSAndBoundaryClass394 {
  public content: string = '';
  public flag: boolean = false;
}

class SetByteE01 {
  public b: byte = 0;
}

class SetShortE02 {
  public s: short = 0;
}

class SetFloatE03 {
  public f: float = 0.0f;
}

class SetDoubleE04 {
  public d: double = 0;
}

class SetCharE05 {
  public c: char = c'0';
}

class SetLongE06 {
  public l: long = 0;
}

class SetNumberE07 {
  public n: number = 0;
}

class SetNullableByteE08 {
  public nb: byte | null = null;
}

class SetOptionalShortE09 {
  public os: short | undefined = undefined;
}

class SetUnionPrimE10 {
  public u: int | string = 0;
}

class SetArrayByteE11 {
  public ab: Array<byte> = [];
}

class SetNestedObjE12 {
  public no: Person037 = new Person037();
}

class SetMultiPrimE13 {
  public mb: byte = 1;
  public ms: short = 2;
  public mf: float = 0.1f;
}

class SetWrongThisBaseE14 {
  public w: string = 'w';
}

class SetWrongThisOtherE14 {
  public w: string = 'o';
}

class SetGetTypeE16 {
  public gt: int = 42;
}

class SetGenericIntE18<T> {
  public gi: T | undefined = undefined;
}

class SetBigArrayE19 {
  public ba: Array<int> = [];
}

class SetValueParentE20 {
  public pf: string = 'pf';
}

class SetValueChildE20 extends SetValueParentE20 {
  public cf: string = 'cf';
}

class SetAllPrimE21 {
  public b: byte = 0;
  public s: short = 0;
  public i: int = 0;
  public l: long = 0;
  public f: float = 0.0f;
  public d: double = 0;
  public c: char = c' ';
  public flag: boolean = false;
  public n: number = 0;
}

class SetStringSpecialE22 {
  public empty: string = 'init';
  public space: string = 'init';
  public cn: string = 'init';
  public jp: string = 'init';
  public kr: string = 'init';
  public ru: string = 'init';
  public ar: string = 'init';
  public zeroW: string = 'init';
  public ctrl: string = 'init';
  public full: string = 'init';
  public sym: string = 'init';
  public hex: string = 'init';
  public sci: string = 'init';
  public longS: string = 'init';
}

class SetArrObjE23 {
  public ai: Array<int> = [];
  public asArr: Array<string> = [];
  public ab: Array<byte> = [];
  public ao: Array<Person037> = [];
  public a2: Array<Array<int>> = [];
}

class SetUnionNullE24 {
  public uis: int | string = 0;
  public nbl: string | null = null;
  public opt: int | undefined = undefined;
  public u3: int | string | boolean = 0;
}

class SetLiteralE25 {
  public lit: 'a' | 'b' = 'a';
}

class SetBoundaryNumE26 {
  public iMin: int = 0;
  public dMax: double = 0;
  public fMax: float = 0.0f;
}

class SetInheritGrandE27 {
  public gf: string = 'grand';
}

class SetInheritParentE27 extends SetInheritGrandE27 {
  public pf: string = 'parent';
}

class SetInheritChildE27 extends SetInheritParentE27 {
  public cf: string = 'child';
}

class SetThisWrongA28 {
  public f: string = 'a';
}

class SetThisWrongB28 {
  public f: string = 'b';
}

class SetThisWrongC28 {
  public f: string = 'c';
}

class SetMetadataE29 {
  public mt: int = 1;
}

class SetPurityE30 {
  public pu: string = 'init';
}

class SetIsolationE32 {
  public iso: string = 'iso';
}

class SetSpecialValsE34 {
  public z: int = 99;
  public m1: int = 99;
  public emj: string = '';
  public xss: string = '';
  public sql: string = '';
}

class SetAfterOpE35 {
  public ao: int = 0;
  public nameF: string = 'nf';
}

class SetValNullE37 {
  public nstr: string | null = null;
  public nint: int | null = null;
}

class SetComplexE38 {
  public co: Person037 = new Person037();
}

class SetMoreTypeE39 {
  public b2: byte = 0;
  public s2: short = 0;
  public i2: int = 0;
}

class SetMismatchMoreE40 {
  public mi: int = 0;
  public ms: string = '';
  public mb: boolean = false;
  public mc: char = c'0';
  public mf: float = 0.0f;
  public md: double = 0;
}

class SetRoundtripE41 {
  public rt: Person037 = new Person037();
}

class SetMetaStableE42 {
  public msn: string = 'x';
  public msi: int = 5;
}

class SetBoundExtraE43 {
  public be: long = 0;
}

class SetArrayMoreE45 {
  public am: Array<int> = [];
}

class SetParentE49 {
  public pf: string = 'pf';
}

class SetChildE49 extends SetParentE49 {
  public cf: string = 'cf';
}

class SetAccessAfterE50 {
  public aaa: string = 'aaa';
}

class SetMisIntE51 {
  public mi: int = 0;
}

class SetMisStringE52 {
  public ms: string = 'x';
}

class SetMisBoolE53 {
  public mb: boolean = false;
}

class SetMisByteE54 {
  public mbt: byte = 0;
}

class SetMisShortE55 {
  public mst: short = 0;
}

class SetMisFloatE56 {
  public mf: float = 0.0f;
}

class SetMisDoubleE57 {
  public md: double = 0;
}

class SetMisCharE58 {
  public mc: char = c'a';
}

class SetParentUnrelatedE59 {
  public pf: string = 'pf';
}

class SetUnrelatedE60 {
  public uf: string = 'uf';
}

class SetGetValueWrongE61 {
  public gv: string = 'gv';
}

class SetGetValueNullE62 {
  public gn: string = 'gn';
}

class SetOverwrite3E63 {
  public ov3: string = 'ov3';
}

class SetTwoInstE64 {
  public ti: string = 'ti';
}

class SetFreshInstE65 {
  public fi: string = 'fi';
}

class SetIntZeroE66 {
  public iz: int = 99;
}

class SetIntNegE67 {
  public ine: int = 99;
}

class SetByteOverflowE68 {
  public b: byte = 0;
}

class SetShortOverflowE69 {
  public s: short = 0;
}

class SetIntOverflowE70 {
  public i: int = 0;
}

class SetFloatSpecialE71 {
  public f: float = 0.0f;
}

class SetDoubleSpecialE72 {
  public d: double = 0;
}

class SetCharEdgeE73 {
  public c: char = c'a';
}

class SetStringSpecialE75 {
  public s: string = '';
}

class SetArrayEdgeE76 {
  public arr: Array<int> = [1];
}

class TypesClass014 {
  public longField: long = 0;
}

class TestClass019 {
  public objArr: Array<Person037> = [];
}

export default function InstanceFieldSetValueTest2(): void {
  describe('InstanceFieldSetValueTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0010
     * @tc.name testSetValue0010
     * @tc.desc Verify setValue and getValue roundtrip on string field emptyStr from class RichStringClass390 with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('emptyStr')!;
      field.setValue(instance, '');
      expect(field.getValue(instance) as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0020
     * @tc.name testSetValue0020
     * @tc.desc Verify setValue and getValue roundtrip on string field unicodeStr from class RichStringClass390 with Chinese Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('unicodeStr')!;
      const val: string = '中文测试中文';
      field.setValue(instance, val);
      expect(field.getValue(instance) as string).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0030
     * @tc.name testSetValue0030
     * @tc.desc Verify setValue and getValue roundtrip on string field emojiStr from class RichStringClass390 with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('emojiStr')!;
      const val: string = '😀🔥🚀测试';
      field.setValue(instance, val);
      expect(field.getValue(instance) as string).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0040
     * @tc.name testSetValue0040
     * @tc.desc Verify setValue and getValue roundtrip on string field longStr from class RichStringClass390 with 500 character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longStr')!;
      let longVal: string = '';
      for (let i = 0; i < 500; i++) {
        longVal += 'A';
      }
      field.setValue(instance, longVal);
      const got: string = field.getValue(instance) as string;
      expect(got.length).assertEqual(500);
      expect(got[0]).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0050
     * @tc.name testSetValue0050
     * @tc.desc Verify setValue and getValue roundtrip on string field xssStr from class RichStringClass390 with XSS attack payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('xssStr')!;
      const payload: string = '<script>alert("xss")</script>\'"\\';
      field.setValue(instance, payload);
      expect(field.getValue(instance) as string).assertEqual(payload);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0060
     * @tc.name testSetValue0060
     * @tc.desc Verify setValue and getValue roundtrip on int field intField from class RichNumericClass391 with zero one and negative one values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichNumericClass391>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      field.setValue(instance, 0);
      expect(field.getValue(instance) as int).assertEqual(0);
      field.setValue(instance, 1);
      expect(field.getValue(instance) as int).assertEqual(1);
      field.setValue(instance, -1);
      expect(field.getValue(instance) as int).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0070
     * @tc.name testSetValue0070
     * @tc.desc Verify setValue and getValue roundtrip on int field intField from class RichNumericClass391 with maximum and minimum int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichNumericClass391>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      const maxLike: int = 2147483647;
      const minLike: int = -2147483648;
      field.setValue(instance, maxLike);
      expect(field.getValue(instance) as int).assertEqual(maxLike);
      field.setValue(instance, minLike);
      expect(field.getValue(instance) as int).assertEqual(minLike);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0080
     * @tc.name testSetValue0080
     * @tc.desc Verify setValue and getValue roundtrip on long field longField from class TypesClass014 with large long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypesClass014>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longField')!;
      const big: long = 1234567890123456;
      field.setValue(instance, big);
      expect(field.getValue(instance) as long).assertEqual(big);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0090
     * @tc.name testSetValue0090
     * @tc.desc Verify setValue and getValue roundtrip on string array field emptyArr from class RichArrayClass392 with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichArrayClass392>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('emptyArr')!;
      const empty: Array<string> = [];
      field.setValue(instance, empty);
      const got: Array<string> = field.getValue(instance) as Array<string>;
      expect(got.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0100
     * @tc.name testSetValue0100
     * @tc.desc Verify setValue and getValue roundtrip on int array field multiArr from class RichArrayClass392 with five element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichArrayClass392>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('multiArr')!;
      const input: Array<int> = [10, 20, 30, 40, 50];
      field.setValue(instance, input);
      const got: Array<int> = field.getValue(instance) as Array<int>;
      expect(got.length).assertEqual(5);
      expect(got[0]).assertEqual(10);
      expect(got[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0110
     * @tc.name testSetValue0110
     * @tc.desc Verify setValue and getValue roundtrip on Person037 array field objArr from class TestClass019 and verify member name Alice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass019>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('objArr')!;
      const p1 = new Person037();
      p1.name = 'Alice';
      p1.age = 30;
      const input: Array<Person037> = [p1];
      field.setValue(instance, input);
      const got: Array<Person037> = field.getValue(instance) as Array<Person037>;
      expect(got.length).assertEqual(1);
      expect(got[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0120
     * @tc.name testSetValue0120
     * @tc.desc Verify setValue on Person037 nested object field person from class RichPOJOClass393 and getValue confirms name and age
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichPOJOClass393>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('person')!;
      const newPerson = new Person037();
      newPerson.name = 'Bob';
      newPerson.age = 25;
      newPerson.email = 'bob@example.com';
      field.setValue(instance, newPerson);
      const got: Person037 = field.getValue(instance) as Person037;
      expect(got.name).assertEqual('Bob');
      expect(got.age).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0130
     * @tc.name testSetValue0130
     * @tc.desc Verify setValue and getValue roundtrip on boolean field flag from class XSSAndBoundaryClass394 with true and false values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<XSSAndBoundaryClass394>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('flag')!;
      field.setValue(instance, true);
      expect(field.getValue(instance) as boolean).assertTrue();
      field.setValue(instance, false);
      expect(field.getValue(instance) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0140
     * @tc.name testSetValue0140
     * @tc.desc Verify setValue and getValue roundtrip on string field content from class XSSAndBoundaryClass394 with XSS attack payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<XSSAndBoundaryClass394>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('content')!;
      const payload: string = '"><img src=x onerror=alert(1)>';
      field.setValue(instance, payload);
      expect(field.getValue(instance) as string).assertEqual(payload);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0150
     * @tc.name testSetValue0150
     * @tc.desc Verify setValue on string field emptyStr from class RichStringClass390 with RichNumericClass391 object throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('emptyStr')!;
      try {
        field.setValue(instance, new RichNumericClass391());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0160
     * @tc.name testSetValue0160
     * @tc.desc Verify setValue on string field unicodeStr from class RichStringClass390 with two different values and final overwrites correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('unicodeStr')!;
      field.setValue(instance, 'first');
      expect(field.getValue(instance) as string).assertEqual('first');
      field.setValue(instance, '第二值😅');
      expect(field.getValue(instance) as string).assertEqual('第二值😅');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0170
     * @tc.name testSetValue0170
     * @tc.desc Verify setValue and getValue roundtrip on byte field b from class SetByteE01 with byte value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetByteE01>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('b')!;
      field.setValue(instance, 42 as byte);
      expect(field.getValue(instance) as byte).assertEqual(42 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0180
     * @tc.name testSetValue0180
     * @tc.desc Verify setValue and getValue roundtrip on short field s from class SetShortE02 with short value 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetShortE02>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('s')!;
      field.setValue(instance, 1000 as short);
      expect(field.getValue(instance) as short).assertEqual(1000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0190
     * @tc.name testSetValue0190
     * @tc.desc Verify setValue and getValue roundtrip on float field f from class SetFloatE03 with float value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetFloatE03>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('f')!;
      field.setValue(instance, 3.14f);
      expect(field.getValue(instance) as float).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0200
     * @tc.name testSetValue0200
     * @tc.desc Verify setValue and getValue roundtrip on double field d from class SetDoubleE04 with value 2.71828
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetDoubleE04>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('d')!;
      field.setValue(instance, 2.71828);
      expect(field.getValue(instance) as double).assertEqual(2.71828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0210
     * @tc.name testSetValue0210
     * @tc.desc Verify setValue and getValue roundtrip on char field c from class SetCharE05 with character Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetCharE05>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('c')!;
      field.setValue(instance, c'Z');
      expect(field.getValue(instance) as char).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0220
     * @tc.name testSetValue0220
     * @tc.desc Verify setValue and getValue roundtrip on long field l from class SetLongE06 with long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetLongE06>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('l')!;
      field.setValue(instance, 9876543210 as long);
      expect(field.getValue(instance) as long).assertEqual(9876543210 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0230
     * @tc.name testSetValue0230
     * @tc.desc Verify setValue and getValue roundtrip on number field n from class SetNumberE07 with value 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetNumberE07>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('n')!;
      field.setValue(instance, 123.456);
      expect(field.getValue(instance) as number).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0240
     * @tc.name testSetValue0240
     * @tc.desc Verify setValue on nullable byte field nb from class SetNullableByteE08 with null value and getValue returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetNullableByteE08>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('nb')!;
      field.setValue(instance, null);
      const tmpVal = field.getValue(instance);
      expect(tmpVal as byte | null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0250
     * @tc.name testSetValue0250
     * @tc.desc Verify setValue on optional short field os from class SetOptionalShortE09 with undefined and getValue returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetOptionalShortE09>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('os')!;
      field.setValue(instance, undefined);
      const tmpVal = field.getValue(instance);
      expect(tmpVal as short | undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0260
     * @tc.name testSetValue0260
     * @tc.desc Verify setValue and getValue roundtrip on union int field u from class SetUnionPrimE10 with int value 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionPrimE10>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('u')!;
      field.setValue(instance, 123);
      expect(field.getValue(instance) as int).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0270
     * @tc.name testSetValue0270
     * @tc.desc Verify setValue and getValue roundtrip on union field u from class SetUnionPrimE10 with string value unionStr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionPrimE10>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('u')!;
      field.setValue(instance, 'unionStr');
      expect(field.getValue(instance) as string).assertEqual('unionStr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0280
     * @tc.name testSetValue0280
     * @tc.desc Verify setValue and getValue roundtrip on byte array field ab from class SetArrayByteE11 with two element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrayByteE11>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ab')!;
      const arr: Array<byte> = [1 as byte, 2 as byte];
      field.setValue(instance, arr);
      const got: Array<byte> = field.getValue(instance) as Array<byte>;
      expect(got.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0290
     * @tc.name testSetValue0290
     * @tc.desc Verify setValue on Person037 nested object field no from class SetNestedObjE12 and getValue confirms name nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetNestedObjE12>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('no')!;
      const p = new Person037();
      p.name = 'nested';
      p.age = 55;
      field.setValue(instance, p);
      const got: Person037 = field.getValue(instance) as Person037;
      expect(got.name).assertEqual('nested');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0300
     * @tc.name testSetValue0300
     * @tc.desc Verify setValue on byte field mb and short field ms from class SetMultiPrimE13 with values 99 and 999 and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMultiPrimE13>();
      let instance = cls.createInstance();
      cls.getInstanceField('mb')!.setValue(instance, 99 as byte);
      cls.getInstanceField('ms')!.setValue(instance, 999 as short);
      cls.getInstanceField('mf')!.setValue(instance, 9.9f);
      expect(cls.getInstanceField('mb')!.getValue(instance) as byte).assertEqual(99 as byte);
      expect(cls.getInstanceField('ms')!.getValue(instance) as short).assertEqual(999 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0310
     * @tc.name testSetValue0310
     * @tc.desc Verify setValue on string field w from class SetWrongThisBaseE14 with SetWrongThisOtherE14 instance as thisObj throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SetWrongThisBaseE14>();
      let field = cls1.getInstanceField('w')!;
      let cls2 = Class.from<SetWrongThisOtherE14>();
      let wrongInst = cls2.createInstance();
      try {
        field.setValue(wrongInst, 'val');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0320
     * @tc.name testSetValue0320
     * @tc.desc Verify setValue on int field gt from class SetGetTypeE16 and getType returns i32 unchanged after set operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetGetTypeE16>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('gt')!;
      field.setValue(instance, 100);
      expect(field.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0330
     * @tc.name testSetValue0330
     * @tc.desc Verify setValue and getValue roundtrip on generic field gi from class SetGenericIntE18 with int value 777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetGenericIntE18<int>>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('gi')!;
      field.setValue(instance, 777);
      expect(field.getValue(instance) as int).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0340
     * @tc.name testSetValue0340
     * @tc.desc Verify setValue and getValue roundtrip on int array field ba from class SetBigArrayE19 with 100 element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetBigArrayE19>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ba')!;
      let big: Array<int> = [];
      for (let i = 0; i < 100; i++) {
        big.push(i);
      }
      field.setValue(instance, big);
      const got: Array<int> = field.getValue(instance) as Array<int>;
      expect(got.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0350
     * @tc.name testSetValue0350
     * @tc.desc Verify setValue on char field c from class SetCharE05 with int value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetCharE05>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('c')!;
      try {
        field.setValue(instance, 123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0360
     * @tc.name testSetValue0360
     * @tc.desc Verify setValue on readonly string field readonlyField from class ReadonlyClass022 with string value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyClass022>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('readonlyField')!;
      try {
        field.setValue(instance, 'x');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0370
     * @tc.name testSetValue0370
     * @tc.desc Verify setValue on int field intField from class RichNumericClass391 with string value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichNumericClass391>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      try {
        field.setValue(instance, 'string');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0380
     * @tc.name testSetValue0380
     * @tc.desc Verify setValue on int field intField from class RichNumericClass391 with boolean value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichNumericClass391>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      try {
        field.setValue(instance, true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0390
     * @tc.name testSetValue0390
     * @tc.desc Verify setValue on int field intField from class RichNumericClass391 with null value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichNumericClass391>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      try {
        field.setValue(instance, null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0400
     * @tc.name testSetValue0400
     * @tc.desc Verify setValue on int field intField from class RichNumericClass391 with undefined value throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichNumericClass391>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      try {
        field.setValue(instance, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0410
     * @tc.name testSetValue0410
     * @tc.desc Verify setValue and getValue roundtrip on parent string field pf from class SetValueParentE20 with SetValueChildE20 child as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<SetValueParentE20>();
      let field = parentCls.getInstanceField('pf')!;
      let childInst = Class.from<SetValueChildE20>().createInstance();
      field.setValue(childInst, 'fromParentField');
      expect(field.getValue(childInst) as string).assertEqual('fromParentField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0420
     * @tc.name testSetValue0420
     * @tc.desc Verify setValue with null! thisObj on string field emptyStr from class RichStringClass390 throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let field = cls.getInstanceField('emptyStr')!;
      try {
        field.setValue(null!, 'val');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0430
     * @tc.name testSetValue0430
     * @tc.desc Verify setValue on string field unicodeStr from class RichStringClass390 with two instances and values are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let inst1 = cls.createInstance();
      let inst2 = cls.createInstance();
      let field = cls.getInstanceField('unicodeStr')!;
      field.setValue(inst1, 'a');
      field.setValue(inst2, 'b');
      expect(field.getValue(inst1) as string).assertEqual('a');
      expect(field.getValue(inst2) as string).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0440
     * @tc.name testSetValue0440
     * @tc.desc Verify setValue on string field emojiStr from class RichStringClass390 and direct instance property access matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('emojiStr')!;
      field.setValue(instance, 'direct');
      let s: RichStringClass390 = instance as RichStringClass390;
      expect(s.emojiStr).assertEqual('direct');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0450
     * @tc.name testSetValue0450
     * @tc.desc Verify setValue and getValue roundtrip on float field f from class SetFloatE03 with boundary maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetFloatE03>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('f')!;
      const fmax: float = 3.402823466e+38 as float;
      const fmin: float = -3.402823466e+38 as float;
      field.setValue(instance, fmax);
      expect(field.getValue(instance) as float).assertEqual(fmax);
      field.setValue(instance, fmin);
      expect(field.getValue(instance) as float).assertEqual(fmin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0460
     * @tc.name testSetValue0460
     * @tc.desc Verify setValue and getValue roundtrip on double field d from class SetDoubleE04 with boundary maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetDoubleE04>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('d')!;
      const dmax: double = 1.7976931348623157e+308;
      const dmin: double = -1.7976931348623157e+308;
      field.setValue(instance, dmax);
      expect(field.getValue(instance) as double).assertEqual(dmax);
      field.setValue(instance, dmin);
      expect(field.getValue(instance) as double).assertEqual(dmin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0470
     * @tc.name testSetValue0470
     * @tc.desc Verify setValue on byte field b from class SetByteE01 with three sequential values and getType remains i8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetByteE01>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('b')!;
      field.setValue(instance, 1 as byte);
      field.setValue(instance, 2 as byte);
      field.setValue(instance, 3 as byte);
      expect(field.getType().getName()).assertEqual('i8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0480
     * @tc.name testSetValue0480
     * @tc.desc Verify setValue on string field longStr from class RichStringClass390 with three sequential values and final value is v3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichStringClass390>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longStr')!;
      field.setValue(instance, 'v1');
      field.setValue(instance, 'v2');
      field.setValue(instance, 'v3');
      expect(field.getValue(instance) as string).assertEqual('v3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0490
     * @tc.name testSetValue0490
     * @tc.desc Verify setValue and getValue roundtrip on Person037 object field person from class RichPOJOClass393 with name and age
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RichPOJOClass393>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('person')!;
      const p = new Person037();
      p.name = 'roundtrip';
      p.age = 99;
      p.email = 'round@example.com';
      field.setValue(instance, p);
      const got: Person037 = field.getValue(instance) as Person037;
      expect(got.name).assertEqual('roundtrip');
      expect(got.age).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0500
     * @tc.name testSetValue0500
     * @tc.desc Verify setValue and getValue roundtrip on byte field b from class SetAllPrimE21 with boundary maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('b')!;
      field.setValue(instance, 127 as byte);
      expect(field.getValue(instance) as byte).assertEqual(127 as byte);
      field.setValue(instance, -128 as byte);
      expect(field.getValue(instance) as byte).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0510
     * @tc.name testSetValue0510
     * @tc.desc Verify setValue and getValue roundtrip on short field s from class SetAllPrimE21 with boundary maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('s')!;
      field.setValue(instance, 32767 as short);
      expect(field.getValue(instance) as short).assertEqual(32767 as short);
      field.setValue(instance, -32768 as short);
      expect(field.getValue(instance) as short).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0520
     * @tc.name testSetValue0520
     * @tc.desc Verify setValue and getValue roundtrip on int field i from class SetAllPrimE21 with maximum and minimum int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('i')!;
      field.setValue(instance, 2147483647);
      expect(field.getValue(instance) as int).assertEqual(2147483647);
      field.setValue(instance, -2147483648);
      expect(field.getValue(instance) as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0530
     * @tc.name testSetValue0530
     * @tc.desc Verify setValue and getValue roundtrip on long field l from class SetAllPrimE21 with boundary maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('l')!;
      const maxL: long = 9223372036854775807 as long;
      const minL: long = -9223372036854775808 as long;
      field.setValue(instance, maxL);
      expect(field.getValue(instance) as long).assertEqual(maxL);
      field.setValue(instance, minL);
      expect(field.getValue(instance) as long).assertEqual(minL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0540
     * @tc.name testSetValue0540
     * @tc.desc Verify setValue and getValue roundtrip on float field f from class SetAllPrimE21 with Float MAX and MIN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('f')!;
      const maxF: float = Float.MAX_VALUE;
      const minF: float = Float.MIN_VALUE;
      field.setValue(instance, maxF);
      expect(field.getValue(instance) as float).assertEqual(maxF);
      field.setValue(instance, minF);
      expect(field.getValue(instance) as float).assertEqual(minF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0550
     * @tc.name testSetValue0550
     * @tc.desc Verify setValue and getValue roundtrip on double field d from class SetAllPrimE21 with boundary maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('d')!;
      const maxD: double = 1.7976931348623157e+308;
      const minD: double = -1.7976931348623157e+308;
      field.setValue(instance, maxD);
      expect(field.getValue(instance) as double).assertEqual(maxD);
      field.setValue(instance, minD);
      expect(field.getValue(instance) as double).assertEqual(minD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0560
     * @tc.name testSetValue0560
     * @tc.desc Verify setValue and getValue roundtrip on char field c from class SetAllPrimE21 with characters Z and a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('c')!;
      field.setValue(instance, c'Z');
      expect(field.getValue(instance) as char).assertEqual(c'Z');
      field.setValue(instance, c'a');
      expect(field.getValue(instance) as char).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0570
     * @tc.name testSetValue0570
     * @tc.desc Verify setValue and getValue roundtrip on boolean field flag from class SetAllPrimE21 with false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('flag')!;
      field.setValue(instance, false);
      expect(field.getValue(instance) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0580
     * @tc.name testSetValue0580
     * @tc.desc Verify setValue and getValue roundtrip on number field n from class SetAllPrimE21 with value and Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('n')!;
      field.setValue(instance, 123.456);
      expect(field.getValue(instance) as number).assertEqual(123.456);
      field.setValue(instance, Number.MAX_VALUE);
      expect(field.getValue(instance) as number).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0590
     * @tc.name testSetValue0590
     * @tc.desc Verify setValue and getValue roundtrip on string field empty from class SetStringSpecialE22 with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('empty')!;
      field.setValue(instance, '');
      expect(field.getValue(instance) as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0600
     * @tc.name testSetValue0600
     * @tc.desc Verify setValue and getValue roundtrip on string field space from class SetStringSpecialE22 with whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('space')!;
      field.setValue(instance, '   ');
      expect(field.getValue(instance) as string).assertEqual('   ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0610
     * @tc.name testSetValue0610
     * @tc.desc Verify setValue and getValue roundtrip on string field cn from class SetStringSpecialE22 with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('cn')!;
      field.setValue(instance, '中文测试');
      expect(field.getValue(instance) as string).assertEqual('中文测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0620
     * @tc.name testSetValue0620
     * @tc.desc Verify setValue and getValue roundtrip on string field jp from class SetStringSpecialE22 with Japanese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('jp')!;
      field.setValue(instance, 'テスト');
      expect(field.getValue(instance) as string).assertEqual('テスト');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0630
     * @tc.name testSetValue0630
     * @tc.desc Verify setValue and getValue roundtrip on string field kr from class SetStringSpecialE22 with Korean characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('kr')!;
      field.setValue(instance, '테스트');
      expect(field.getValue(instance) as string).assertEqual('테스트');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0640
     * @tc.name testSetValue0640
     * @tc.desc Verify setValue and getValue roundtrip on string field ru from class SetStringSpecialE22 with Russian characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ru')!;
      field.setValue(instance, 'АБВГД');
      expect(field.getValue(instance) as string).assertEqual('АБВГД');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0650
     * @tc.name testSetValue0650
     * @tc.desc Verify setValue and getValue roundtrip on string field ar from class SetStringSpecialE22 with Arabic characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ar')!;
      field.setValue(instance, 'الاختبار');
      expect(field.getValue(instance) as string).assertEqual('الاختبار');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0660
     * @tc.name testSetValue0660
     * @tc.desc Verify setValue and getValue roundtrip on string field zeroW from class SetStringSpecialE22 with zero width character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('zeroW')!;
      field.setValue(instance, '\u200B');
      expect(field.getValue(instance) as string).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0670
     * @tc.name testSetValue0670
     * @tc.desc Verify setValue and getValue roundtrip on string field ctrl from class SetStringSpecialE22 with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ctrl')!;
      field.setValue(instance, '\t\n\r');
      expect(field.getValue(instance) as string).assertEqual('\t\n\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0680
     * @tc.name testSetValue0680
     * @tc.desc Verify setValue and getValue roundtrip on string field sym from class SetStringSpecialE22 with special symbol characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('sym')!;
      field.setValue(instance, '!@#$%^&*()');
      expect(field.getValue(instance) as string).assertEqual('!@#$%^&*()');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0690
     * @tc.name testSetValue0690
     * @tc.desc Verify setValue and getValue roundtrip on string field hex from class SetStringSpecialE22 with hexadecimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('hex')!;
      field.setValue(instance, '0x1A');
      expect(field.getValue(instance) as string).assertEqual('0x1A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0700
     * @tc.name testSetValue0700
     * @tc.desc Verify setValue and getValue roundtrip on string field sci from class SetStringSpecialE22 with scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('sci')!;
      field.setValue(instance, '1.0e6');
      expect(field.getValue(instance) as string).assertEqual('1.0e6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0710
     * @tc.name testSetValue0710
     * @tc.desc Verify setValue and getValue roundtrip on string field longS from class SetStringSpecialE22 with 100 character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('longS')!;
      let val: string = '';
      for (let i = 0; i < 100; i++) {
        val += 'a';
      }
      field.setValue(instance, val);
      const got: string = field.getValue(instance) as string;
      expect(got.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0720
     * @tc.name testSetValue0720
     * @tc.desc Verify setValue and getValue roundtrip on int array field ai from class SetArrObjE23 with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ai')!;
      const v: Array<int> = [];
      field.setValue(instance, v);
      const g: Array<int> = field.getValue(instance) as Array<int>;
      expect(g.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0730
     * @tc.name testSetValue0730
     * @tc.desc Verify setValue and getValue roundtrip on int array field ai from class SetArrObjE23 with single element 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ai')!;
      const v: Array<int> = [42];
      field.setValue(instance, v);
      const g: Array<int> = field.getValue(instance) as Array<int>;
      expect(g[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0740
     * @tc.name testSetValue0740
     * @tc.desc Verify setValue and getValue roundtrip on int array field ai from class SetArrObjE23 with five elements and verify middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ai')!;
      const v: Array<int> = [1, 2, 3, 4, 5];
      field.setValue(instance, v);
      const g: Array<int> = field.getValue(instance) as Array<int>;
      expect(g.length).assertEqual(5);
      expect(g[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0750
     * @tc.name testSetValue0750
     * @tc.desc Verify setValue and getValue roundtrip on string array field asArr from class SetArrObjE23 and verify element at index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('asArr')!;
      const v: Array<string> = ['a', 'b', 'c'];
      field.setValue(instance, v);
      const g: Array<string> = field.getValue(instance) as Array<string>;
      expect(g[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0760
     * @tc.name testSetValue0760
     * @tc.desc Verify setValue and getValue roundtrip on byte array field ab from class SetArrObjE23 with two element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ab')!;
      const v: Array<byte> = [1 as byte, 2 as byte];
      field.setValue(instance, v);
      const g: Array<byte> = field.getValue(instance) as Array<byte>;
      expect(g.length).assertEqual(2);
    });
