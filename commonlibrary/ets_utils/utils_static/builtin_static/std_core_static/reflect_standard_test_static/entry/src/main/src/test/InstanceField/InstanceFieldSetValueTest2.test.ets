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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0770
     * @tc.name testSetValue0770
     * @tc.desc Verify setValue and getValue roundtrip on Person037 array field ao from class SetArrObjE23 and verify member name arrp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ao')!;
      const p = new Person037();
      p.name = 'arrp';
      const v: Array<Person037> = [p];
      field.setValue(instance, v);
      const g: Array<Person037> = field.getValue(instance) as Array<Person037>;
      expect(g.length).assertEqual(1);
      expect(g[0].name).assertEqual('arrp');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0780
     * @tc.name testSetValue0780
     * @tc.desc Verify setValue on Person037 object field co from class SetComplexE38 and getValue confirms name property objset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetComplexE38>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('co')!;
      const p = new Person037();
      p.name = 'objset';
      p.age = 7;
      field.setValue(instance, p);
      const g: Person037 = field.getValue(instance) as Person037;
      expect(g.name).assertEqual('objset');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0790
     * @tc.name testSetValue0790
     * @tc.desc Verify setValue on nullable string field nstr from class SetValNullE37 with null value and getValue returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValNullE37>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('nstr')!;
      field.setValue(instance, null);
      const tmpVal = field.getValue(instance);
      expect(tmpVal as string | null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0800
     * @tc.name testSetValue0800
     * @tc.desc Verify setValue and getValue roundtrip on union int field uis from class SetUnionNullE24 with int value 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionNullE24>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('uis')!;
      field.setValue(instance, 123);
      expect(field.getValue(instance) as int).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0810
     * @tc.name testSetValue0810
     * @tc.desc Verify setValue and getValue roundtrip on union field uis from class SetUnionNullE24 with string value ustr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionNullE24>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('uis')!;
      field.setValue(instance, 'ustr');
      expect(field.getValue(instance) as string).assertEqual('ustr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0820
     * @tc.name testSetValue0820
     * @tc.desc Verify setValue on int field mi from class SetMismatchMoreE40 with null value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mi')!;
      try {
        field.setValue(instance, null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0830
     * @tc.name testSetValue0830
     * @tc.desc Verify setValue on string field ms from class SetMismatchMoreE40 with int value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ms')!;
      try {
        field.setValue(instance, 42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0840
     * @tc.name testSetValue0840
     * @tc.desc Verify setValue on string field ms from class SetMismatchMoreE40 with Person037 object value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('ms')!;
      try {
        field.setValue(instance, new Person037());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0850
     * @tc.name testSetValue0850
     * @tc.desc Verify setValue on boolean field mb from class SetMismatchMoreE40 with int value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mb')!;
      try {
        field.setValue(instance, 42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0860
     * @tc.name testSetValue0860
     * @tc.desc Verify setValue on boolean field mb from class SetMismatchMoreE40 with string value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mb')!;
      try {
        field.setValue(instance, 'true');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0870
     * @tc.name testSetValue0870
     * @tc.desc Verify setValue on int field mi from class SetMismatchMoreE40 with byte value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mi')!;
      try {
        field.setValue(instance, 127 as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0880
     * @tc.name testSetValue0880
     * @tc.desc Verify setValue on char field mc from class SetMismatchMoreE40 with string value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mc')!;
      try {
        field.setValue(instance, 'x');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0890
     * @tc.name testSetValue0890
     * @tc.desc Verify setValue on float field mf from class SetMismatchMoreE40 with string value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMismatchMoreE40>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('mf')!;
      try {
        field.setValue(instance, '3.14');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0900
     * @tc.name testSetValue0900
     * @tc.desc Verify setValue on string field f from class SetThisWrongA28 with SetThisWrongC28 unrelated instance as thisObj throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<SetThisWrongA28>();
      let field = clsA.getInstanceField('f')!;
      let instC = Class.from<SetThisWrongC28>().createInstance();
      try {
        field.setValue(instC, 'val');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0910
     * @tc.name testSetValue0910
     * @tc.desc Verify setValue with null! thisObj on string field f from class SetThisWrongA28 throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetThisWrongA28>();
      let field = cls.getInstanceField('f')!;
      try {
        field.setValue(null!, 'val');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0920
     * @tc.name testSetValue0920
     * @tc.desc Verify setValue on string field iso from class SetIsolationE32 with two instances and values one and two are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetIsolationE32>();
      let i1 = cls.createInstance();
      let i2 = cls.createInstance();
      let field = cls.getInstanceField('iso')!;
      field.setValue(i1, 'one');
      field.setValue(i2, 'two');
      expect(field.getValue(i1) as string).assertEqual('one');
      expect(field.getValue(i2) as string).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0930
     * @tc.name testSetValue0930
     * @tc.desc Verify setValue on string field iso from class SetIsolationE32 with three sequential writes and final value x3 overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetIsolationE32>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('iso')!;
      field.setValue(inst, 'x1');
      field.setValue(inst, 'x2');
      field.setValue(inst, 'x3');
      expect(field.getValue(inst) as string).assertEqual('x3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0940
     * @tc.name testSetValue0940
     * @tc.desc Verify setValue on string field iso from class SetIsolationE32 and direct property access matches getValue result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetIsolationE32>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('iso')!;
      field.setValue(inst, 'directMatch');
      const s: SetIsolationE32 = inst as SetIsolationE32;
      expect(s.iso).assertEqual('directMatch');
      expect(field.getValue(inst) as string).assertEqual('directMatch');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0950
     * @tc.name testSetValue0950
     * @tc.desc Verify setValue on string field iso from class SetIsolationE32 via one reference and getValue via another reference returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetIsolationE32>();
      let inst = cls.createInstance();
      let f1 = cls.getInstanceField('iso')!;
      let f2 = cls.getInstanceField('iso')!;
      f1.setValue(inst, 'viaf1');
      expect(f2.getValue(inst) as string).assertEqual('viaf1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0960
     * @tc.name testSetValue0960
     * @tc.desc Verify setValue on string field pu from class SetPurityE30 and new instance retains initial value init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('pu')!;
      field.setValue(inst, 'changed');
      let instNew = cls.createInstance();
      expect(field.getValue(instNew) as string).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0970
     * @tc.name testSetValue0970
     * @tc.desc Verify setValue on string field f from different classes SetThisWrongA28 and SetThisWrongB28 with values isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SetThisWrongA28>();
      let cls2 = Class.from<SetThisWrongB28>();
      let i1 = cls1.createInstance();
      let i2 = cls2.createInstance();
      cls1.getInstanceField('f')!.setValue(i1, 'aa');
      cls2.getInstanceField('f')!.setValue(i2, 'bb');
      expect(cls1.getInstanceField('f')!.getValue(i1) as string).assertEqual('aa');
      expect(cls2.getInstanceField('f')!.getValue(i2) as string).assertEqual('bb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0980
     * @tc.name testSetValue0980
     * @tc.desc Verify setValue on string field pu from class SetPurityE30 and two InstanceField references equals returns true before and after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let f1 = cls.getInstanceField('pu')!;
      let f2 = cls.getInstanceField('pu')!;
      expect(f1.equals(f2)).assertTrue();
      let inst = cls.createInstance();
      f1.setValue(inst, 'eqtest');
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0990
     * @tc.name testSetValue0990
     * @tc.desc Verify setValue and getValue roundtrip on int field z from class SetSpecialValsE34 with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetSpecialValsE34>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('z')!;
      field.setValue(inst, 0);
      expect(field.getValue(inst) as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1000
     * @tc.name testSetValue1000
     * @tc.desc Verify setValue and getValue roundtrip on int field m1 from class SetSpecialValsE34 with negative one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetSpecialValsE34>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('m1')!;
      field.setValue(inst, -1);
      expect(field.getValue(inst) as int).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1010
     * @tc.name testSetValue1010
     * @tc.desc Verify setValue and getValue roundtrip on string field emj from class SetSpecialValsE34 with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetSpecialValsE34>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('emj')!;
      field.setValue(inst, '😀🔥🚀');
      expect(field.getValue(inst) as string).assertEqual('😀🔥🚀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1020
     * @tc.name testSetValue1020
     * @tc.desc Verify setValue and getValue roundtrip on string field xss from class SetSpecialValsE34 with XSS script payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetSpecialValsE34>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('xss')!;
      const p: string = '<script>alert(1)</script>';
      field.setValue(inst, p);
      expect(field.getValue(inst) as string).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1030
     * @tc.name testSetValue1030
     * @tc.desc Verify setValue and getValue roundtrip on string field sql from class SetSpecialValsE34 with SQL injection payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetSpecialValsE34>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('sql')!;
      const p: string = "' OR '1'='1";
      field.setValue(inst, p);
      expect(field.getValue(inst) as string).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1040
     * @tc.name testSetValue1040
     * @tc.desc Verify setValue on int field ao from class SetAfterOpE35 confirms getName getType and getOwner remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAfterOpE35>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('ao')!;
      const nameBefore: string = field.getName();
      const typeBefore: string = field.getType().getName();
      field.setValue(inst, 123);
      expect(field.getName()).assertEqual(nameBefore);
      expect(field.getType().getName()).assertEqual(typeBefore);
      expect(field.getOwner().getName().endsWith('SetAfterOpE35')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1050
     * @tc.name testSetValue1050
     * @tc.desc Verify setValue on int field ao from class SetAfterOpE35 confirms isReadonly status unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAfterOpE35>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('ao')!;
      const roBefore: boolean = field.isReadonly();
      field.setValue(inst, 99);
      expect(field.isReadonly()).assertEqual(roBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1060
     * @tc.name testSetValue1060
     * @tc.desc Verify setValue on int field ao from class SetAfterOpE35 then another InstanceField reference equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAfterOpE35>();
      let inst = cls.createInstance();
      let f1 = cls.getInstanceField('ao')!;
      f1.setValue(inst, 55);
      let f2 = cls.getInstanceField('ao')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1070
     * @tc.name testSetValue1070
     * @tc.desc Verify setValue on nullable int field nint from class SetValNullE37 with null value and getValue returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValNullE37>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('nint')!;
      field.setValue(inst, null);
      const tmpVal = field.getValue(inst);
      expect(tmpVal as int | null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1080
     * @tc.name testSetValue1080
     * @tc.desc Verify setValue on union field uis from class SetUnionNullE24 with repeated switching between int and string branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionNullE24>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('uis')!;
      field.setValue(inst, 11);
      expect(field.getValue(inst) as int).assertEqual(11);
      field.setValue(inst, 's2');
      expect(field.getValue(inst) as string).assertEqual('s2');
      field.setValue(inst, 33);
      expect(field.getValue(inst) as int).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1090
     * @tc.name testSetValue1090
     * @tc.desc Verify setValue on string field pu from class SetPurityE30 with createInstance and new operator instances as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst1 = cls.createInstance();
      const inst2 = new SetPurityE30();
      let field = cls.getInstanceField('pu')!;
      field.setValue(inst1, 'ci1');
      field.setValue(inst2, 'ci2');
      expect(field.getValue(inst1) as string).assertEqual('ci1');
      expect(field.getValue(inst2) as string).assertEqual('ci2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1100
     * @tc.name testSetValue1100
     * @tc.desc Verify setValue on string field msn from class SetMetaStableE42 confirms getName and getType remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetaStableE42>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('msn')!;
      const n1: string = field.getName();
      const t1: string = field.getType().getName();
      field.setValue(inst, 'changed');
      expect(field.getName()).assertEqual(n1);
      expect(field.getType().getName()).assertEqual(t1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1110
     * @tc.name testSetValue1110
     * @tc.desc Verify setValue on string field pu from class SetPurityE30 and immediate getValue returns the written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('pu')!;
      field.setValue(inst, 'imm');
      expect(field.getValue(inst) as string).assertEqual('imm');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1120
     * @tc.name testSetValue1120
     * @tc.desc Verify setValue on int field msi from class SetMetaStableE42 confirms getOwner and getName remain stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetaStableE42>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('msi')!;
      field.setValue(inst, 42);
      expect(field.getOwner().getName().endsWith('SetMetaStableE42')).assertTrue();
      expect(field.getName()).assertEqual('msi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1130
     * @tc.name testSetValue1130
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with three sequential values each verified by getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('i')!;
      field.setValue(inst, 1);
      expect(field.getValue(inst) as int).assertEqual(1);
      field.setValue(inst, 2);
      expect(field.getValue(inst) as int).assertEqual(2);
      field.setValue(inst, 999);
      expect(field.getValue(inst) as int).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1140
     * @tc.name testSetValue1140
     * @tc.desc Verify setValue on string field cn from class SetStringSpecialE22 with three sequential values and final value is c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('cn')!;
      field.setValue(inst, 'a');
      field.setValue(inst, 'b');
      field.setValue(inst, 'c');
      expect(field.getValue(inst) as string).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1150
     * @tc.name testSetValue1150
     * @tc.desc Verify setValue on int field i2 from class SetMoreTypeE39 with float value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMoreTypeE39>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('i2')!;
      try {
        field.setValue(inst, 1.1f);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1160
     * @tc.name testSetValue1160
     * @tc.desc Verify setValue on byte field b from class SetAllPrimE21 with double value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('b')!;
      try {
        field.setValue(inst, 1.1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1170
     * @tc.name testSetValue1170
     * @tc.desc Verify setValue on byte field b2 from class SetMoreTypeE39 with string value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMoreTypeE39>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('b2')!;
      try {
        field.setValue(inst, 'abc');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1180
     * @tc.name testSetValue1180
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with SetAllPrimE21 object value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('i')!;
      try {
        field.setValue(inst, new SetAllPrimE21());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1190
     * @tc.name testSetValue1190
     * @tc.desc Verify setValue on int field i2 from class SetMoreTypeE39 with null value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMoreTypeE39>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('i2')!;
      try {
        field.setValue(inst, null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1200
     * @tc.name testSetValue1200
     * @tc.desc Verify setValue on number field n from class SetAllPrimE21 with array value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('n')!;
      try {
        field.setValue(inst, [1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1210
     * @tc.name testSetValue1210
     * @tc.desc Verify setValue on number field n from class SetAllPrimE21 with boolean value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('n')!;
      try {
        field.setValue(inst, true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1220
     * @tc.name testSetValue1220
     * @tc.desc Verify setValue and getValue roundtrip on byte field b from class SetAllPrimE21 with value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('b')!;
      field.setValue(inst, 5 as byte);
      expect(field.getValue(inst) as byte).assertEqual(5 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1230
     * @tc.name testSetValue1230
     * @tc.desc Verify setValue and getValue roundtrip on int field i from class SetAllPrimE21 with value 12345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('i')!;
      field.setValue(inst, 12345);
      expect(field.getValue(inst) as int).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1240
     * @tc.name testSetValue1240
     * @tc.desc Verify setValue and getValue roundtrip on string field empty from class SetStringSpecialE22 with afterset value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('empty')!;
      field.setValue(inst, 'afterset');
      expect(field.getValue(inst) as string).assertEqual('afterset');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1250
     * @tc.name testSetValue1250
     * @tc.desc Verify setValue and getValue roundtrip on boolean field flag from class SetAllPrimE21 with true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('flag')!;
      field.setValue(inst, true);
      expect(field.getValue(inst) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1260
     * @tc.name testSetValue1260
     * @tc.desc Verify setValue and getValue roundtrip on int array field ai from class SetArrObjE23 with two element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('ai')!;
      const arr: Array<int> = [9, 8];
      field.setValue(inst, arr);
      const g: Array<int> = field.getValue(inst) as Array<int>;
      expect(g.length).assertEqual(2);
      expect(g[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1270
     * @tc.name testSetValue1270
     * @tc.desc Verify setValue on Person037 object field co from class SetComplexE38 and getValue confirms name property gobj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetComplexE38>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('co')!;
      const p = new Person037();
      p.name = 'gobj';
      field.setValue(inst, p);
      const g: Person037 = field.getValue(inst) as Person037;
      expect(g.name).assertEqual('gobj');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1280
     * @tc.name testSetValue1280
     * @tc.desc Verify setValue and getValue roundtrip on union field uis from class SetUnionNullE24 with string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionNullE24>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('uis')!;
      field.setValue(inst, 'un');
      expect(field.getValue(inst) as string).assertEqual('un');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1290
     * @tc.name testSetValue1290
     * @tc.desc Verify setValue on nullable string field nstr from class SetValNullE37 with null value and getValue returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValNullE37>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('nstr')!;
      field.setValue(inst, null);
      const tmpVal = field.getValue(inst);
      expect(tmpVal as string | null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1300
     * @tc.name testSetValue1300
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with five iterations and getValue returns last value 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('i')!;
      for (let k = 1; k <= 5; k++) {
        field.setValue(inst, k * 10);
      }
      expect(field.getValue(inst) as int).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1310
     * @tc.name testSetValue1310
     * @tc.desc Verify setValue and getValue roundtrip on string field pu from class SetPurityE30 with createInstance thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('pu')!;
      field.setValue(inst, 'crea');
      expect(field.getValue(inst) as string).assertEqual('crea');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1320
     * @tc.name testSetValue1320
     * @tc.desc Verify setValue modify and getValue roundtrip on Person037 object field rt from class SetRoundtripE41 with age property update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetRoundtripE41>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rt')!;
      const p = new Person037();
      p.name = 'r1';
      field.setValue(inst, p);
      const g1: Person037 = field.getValue(inst) as Person037;
      g1.age = 11;
      field.setValue(inst, g1);
      const g2: Person037 = field.getValue(inst) as Person037;
      expect(g2.age).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1330
     * @tc.name testSetValue1330
     * @tc.desc Verify setValue and getValue roundtrip on Person037 object field rt from class SetRoundtripE41 with three iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetRoundtripE41>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('rt')!;
      for (let i = 0; i < 3; i++) {
        const p = new Person037();
        p.name = 'rt' + i;
        field.setValue(inst, p);
        const g: Person037 = field.getValue(inst) as Person037;
        expect(g.name).assertEqual('rt' + i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1340
     * @tc.name testSetValue1340
     * @tc.desc Verify setValue on int field mt from class SetMetadataE29 and two field references equal returns true after set operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetadataE29>();
      let f1 = cls.getInstanceField('mt')!;
      let f2 = cls.getInstanceField('mt')!;
      let inst = cls.createInstance();
      f1.setValue(inst, 100);
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1350
     * @tc.name testSetValue1350
     * @tc.desc Verify setValue on byte field b and int field i from class SetAllPrimE21 and getName returns correct field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let fb = cls.getInstanceField('b')!;
      fb.setValue(inst, 1 as byte);
      expect(fb.getName()).assertEqual('b');
      let fi = cls.getInstanceField('i')!;
      fi.setValue(inst, 2);
      expect(fi.getName()).assertEqual('i');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1360
     * @tc.name testSetValue1360
     * @tc.desc Verify setValue on union field uis from class SetUnionNullE24 and getType returns union type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetUnionNullE24>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('uis')!;
      f.setValue(inst, 99);
      expect(f.getType().getName()).assertEqual('{Ustd.core.Int,std.core.String}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1370
     * @tc.name testSetValue1370
     * @tc.desc Verify setValue on int array field ai from class SetArrObjE23 and getType returns std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('ai')!;
      f.setValue(inst, [1]);
      expect(f.getType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1380
     * @tc.name testSetValue1380
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with three sequential values and getValue returns last value 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('i')!;
      f.setValue(inst, 11);
      f.setValue(inst, 22);
      f.setValue(inst, 33);
      expect(f.getValue(inst) as int).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1390
     * @tc.name testSetValue1390
     * @tc.desc Verify setValue and getValue roundtrip on double field dMax from class SetBoundaryNumE26 with maximum double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetBoundaryNumE26>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('dMax')!;
      const v: double = 1.7976931348623157e+308;
      f.setValue(inst, v);
      expect(f.getValue(inst) as double).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1400
     * @tc.name testSetValue1400
     * @tc.desc Verify setValue and getValue roundtrip on int field iMin from class SetBoundaryNumE26 with minimum int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetBoundaryNumE26>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('iMin')!;
      f.setValue(inst, -2147483648);
      expect(f.getValue(inst) as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1410
     * @tc.name testSetValue1410
     * @tc.desc Verify setValue on string field empty from class SetStringSpecialE22 and getName still returns empty after set operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('empty')!;
      f.setValue(inst, 'xx');
      expect(f.getName()).assertEqual('empty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1420
     * @tc.name testSetValue1420
     * @tc.desc Verify setValue on string field msn from class SetMetaStableE42 with cross verification of getName getValue and getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetaStableE42>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('msn')!;
      const gname = f.getName();
      f.setValue(inst, 'newv');
      expect(f.getName()).assertEqual(gname);
      expect(f.getValue(inst) as string).assertEqual('newv');
      expect(f.getOwner().getName().endsWith('SetMetaStableE42')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1430
     * @tc.name testSetValue1430
     * @tc.desc Verify setValue on string field pu from class SetPurityE30 and direct property access matches the value written via setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('pu')!;
      f.setValue(inst, 'dprop');
      const s: SetPurityE30 = inst as SetPurityE30;
      expect(s.pu).assertEqual('dprop');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1440
     * @tc.name testSetValue1440
     * @tc.desc Verify setValue and getValue on string field pu from class SetPurityE30 then equals between field references remains true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst = cls.createInstance();
      let f1 = cls.getInstanceField('pu')!;
      f1.setValue(inst, 'eqgv');
      let f2 = cls.getInstanceField('pu')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1450
     * @tc.name testSetValue1450
     * @tc.desc Verify setValue on int field ao from class SetAfterOpE35 confirms isPublic status unchanged after set operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAfterOpE35>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('ao')!;
      const pub = f.isPublic();
      f.setValue(inst, 1);
      expect(f.isPublic()).assertEqual(pub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1460
     * @tc.name testSetValue1460
     * @tc.desc Verify setValue and getValue roundtrip on int array field am from class SetArrayMoreE45 with fifty element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrayMoreE45>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('am')!;
      const big: Array<int> = [];
      for (let i = 0; i < 50; i++) {
        big.push(i);
      }
      f.setValue(inst, big);
      const g: Array<int> = f.getValue(inst) as Array<int>;
      expect(g.length).assertEqual(50);
      expect(g[49]).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1470
     * @tc.name testSetValue1470
     * @tc.desc Verify setValue and getValue roundtrip on literal type field lit from class SetLiteralE25 with value b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetLiteralE25>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('lit')!;
      f.setValue(inst, 'b');
      expect(f.getValue(inst) as string).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1480
     * @tc.name testSetValue1480
     * @tc.desc Verify setValue on Person037 object field co from class SetComplexE38 and getValue confirms name property nestg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetComplexE38>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('co')!;
      const p = new Person037();
      p.name = 'nestg';
      f.setValue(inst, p);
      const g: Person037 = f.getValue(inst) as Person037;
      expect(g.name).assertEqual('nestg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1490
     * @tc.name testSetValue1490
     * @tc.desc Verify setValue and getValue roundtrip on short field s from class SetAllPrimE21 with four sequential value iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('s')!;
      for (let i = 0; i < 4; i++) {
        f.setValue(inst, Int.toShort(i * 100));
        expect(f.getValue(inst) as short).assertEqual(Int.toShort(i * 100));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1500
     * @tc.name testSetValue1500
     * @tc.desc Verify setValue on int field mt from class SetMetadataE29 then two field references equal returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetadataE29>();
      let inst = cls.createInstance();
      let f1 = cls.getInstanceField('mt')!;
      f1.setValue(inst, 7);
      let f2 = cls.getInstanceField('mt')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1510
     * @tc.name testSetValue1510
     * @tc.desc Verify setValue and getValue roundtrip on char field c from class SetAllPrimE21 with uppercase character Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('c')!;
      f.setValue(inst, c'Z');
      expect(f.getValue(inst) as char).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1520
     * @tc.name testSetValue1520
     * @tc.desc Verify setValue on string field cn from class SetStringSpecialE22 and three consecutive getValue calls return consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('cn')!;
      f.setValue(inst, 'consist');
      expect(f.getValue(inst) as string).assertEqual('consist');
      expect(f.getValue(inst) as string).assertEqual('consist');
      expect(f.getValue(inst) as string).assertEqual('consist');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1530
     * @tc.name testSetValue1530
     * @tc.desc Verify setValue and getValue roundtrip on int field i from class SetAllPrimE21 with six iterations of sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('i')!;
      for (let i = 0; i < 6; i++) {
        f.setValue(inst, i);
        expect(f.getValue(inst) as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1540
     * @tc.name testSetValue1540
     * @tc.desc Verify setValue and getValue roundtrip on parent string field pf from class SetValueParentE20 with SetValueChildE20 child instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pcls = Class.from<SetValueParentE20>();
      let field = pcls.getInstanceField('pf')!;
      let ch = Class.from<SetValueChildE20>().createInstance();
      field.setValue(ch, 'subthis');
      expect(field.getValue(ch) as string).assertEqual('subthis');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1550
     * @tc.name testSetValue1550
     * @tc.desc Verify setValue and getValue roundtrip on inherited string field pf from class SetInheritParentE27 with SetInheritChildE27 instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pcls = Class.from<SetInheritParentE27>();
      let field = pcls.getInstanceField('pf')!;
      let ch = Class.from<SetInheritChildE27>().createInstance();
      field.setValue(ch, 'viaCh');
      expect(field.getValue(ch) as string).assertEqual('viaCh');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1560
     * @tc.name testSetValue1560
     * @tc.desc Verify setValue on number field n from class SetAllPrimE21 and getType returns f64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('n')!;
      f.setValue(inst, 9.9);
      expect(f.getType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1570
     * @tc.name testSetValue1570
     * @tc.desc Verify setValue and getValue roundtrip on long field be from class SetBoundExtraE43 with boundary long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetBoundExtraE43>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('be')!;
      const lv: long = 9007199254740991 as long;
      f.setValue(inst, lv);
      expect(f.getValue(inst) as long).assertEqual(lv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1580
     * @tc.name testSetValue1580
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with seven iterations and getValue returns the last value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('i')!;
      for (let k = 1; k <= 7; k++) {
        f.setValue(inst, k);
      }
      expect(f.getValue(inst) as int).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1590
     * @tc.name testSetValue1590
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with eight iterations of k plus 100 and getValue returns 108
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('i')!;
      for (let k = 1; k <= 8; k++) {
        f.setValue(inst, k + 100);
      }
      expect(f.getValue(inst) as int).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1600
     * @tc.name testSetValue1600
     * @tc.desc Verify setValue on int field msi from class SetMetaStableE42 with cross verification of getName getType and getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetaStableE42>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('msi')!;
      f.setValue(inst, 123);
      expect(f.getName()).assertEqual('msi');
      expect(f.getType().getName()).assertEqual('i32');
      expect(f.getOwner().getName().endsWith('SetMetaStableE42')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1610
     * @tc.name testSetValue1610
     * @tc.desc Verify setValue on int field ao from class SetAfterOpE35 confirms isReadonly unchanged and equals between references remains true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAfterOpE35>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('ao')!;
      const ro = f.isReadonly();
      f.setValue(inst, 4);
      expect(f.isReadonly()).assertEqual(ro);
      let f2 = cls.getInstanceField('ao')!;
      expect(f.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1620
     * @tc.name testSetValue1620
     * @tc.desc Verify setValue and getValue on string field pu from class SetPurityE30 then equals between two field references remains true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetPurityE30>();
      let inst = cls.createInstance();
      let f1 = cls.getInstanceField('pu')!;
      let f2 = cls.getInstanceField('pu')!;
      f1.setValue(inst, 'seq');
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1630
     * @tc.name testSetValue1630
     * @tc.desc Verify setValue on byte field mb and short field ms from class SetMultiPrimE13 with values 11 and 22 and verify isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMultiPrimE13>();
      let inst = cls.createInstance();
      cls.getInstanceField('mb')!.setValue(inst, 11 as byte);
      cls.getInstanceField('ms')!.setValue(inst, 22 as short);
      expect(cls.getInstanceField('mb')!.getValue(inst) as byte).assertEqual(11 as byte);
      expect(cls.getInstanceField('ms')!.getValue(inst) as short).assertEqual(22 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1640
     * @tc.name testSetValue1640
     * @tc.desc Verify setValue on Person037 object field co from class SetComplexE38 and getValue confirms email property ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetComplexE38>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('co')!;
      const p = new Person037();
      p.email = 'ref';
      f.setValue(inst, p);
      const g: Person037 = f.getValue(inst) as Person037;
      expect(g.email).assertEqual('ref');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1650
     * @tc.name testSetValue1650
     * @tc.desc Verify setValue and getValue roundtrip on string field zeroW from class SetStringSpecialE22 with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetStringSpecialE22>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('zeroW')!;
      f.setValue(inst, '零宽');
      expect(f.getValue(inst) as string).assertEqual('零宽');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1660
     * @tc.name testSetValue1660
     * @tc.desc Verify setValue on double field d from class SetAllPrimE21 and three consecutive getValue calls return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('d')!;
      f.setValue(inst, 3.3);
      expect(f.getValue(inst) as double).assertEqual(3.3);
      expect(f.getValue(inst) as double).assertEqual(3.3);
      expect(f.getValue(inst) as double).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1670
     * @tc.name testSetValue1670
     * @tc.desc Verify setValue on int field msi from class SetMetaStableE42 confirms isPublic returns true and getType returns i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMetaStableE42>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('msi')!;
      f.setValue(inst, 5);
      expect(f.isPublic()).assertTrue();
      expect(f.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1680
     * @tc.name testSetValue1680
     * @tc.desc Verify setValue and getValue roundtrip on number field n from class SetAllPrimE21 with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('n')!;
      f.setValue(inst, Number.MAX_VALUE);
      expect(f.getValue(inst) as number).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1690
     * @tc.name testSetValue1690
     * @tc.desc Verify setValue on int field i from class SetAllPrimE21 with ten iterations and getValue returns the last written value 209
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('i')!;
      for (let k = 0; k < 10; k++) {
        f.setValue(inst, k + 200);
      }
      expect(f.getValue(inst) as int).assertEqual(209);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1700
     * @tc.name testSetValue1700
     * @tc.desc Verify setValue and getValue roundtrip on parent string field pf from class SetInheritParentE27 with child SetInheritChildE27 instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pcls = Class.from<SetInheritParentE27>();
      let f = pcls.getInstanceField('pf')!;
      let c = Class.from<SetInheritChildE27>().createInstance();
      f.setValue(c, 'gchild');
      expect(f.getValue(c) as string).assertEqual('gchild');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1710
     * @tc.name testSetValue1710
     * @tc.desc Verify setValue and getValue roundtrip on grandparent string field gf from class SetInheritGrandE27 with grandchild SetInheritChildE27 instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gcls = Class.from<SetInheritGrandE27>();
      let field = gcls.getInstanceField('gf')!;
      let ch = Class.from<SetInheritChildE27>().createInstance();
      field.setValue(ch, 'grandViaChild');
      expect(field.getValue(ch) as string).assertEqual('grandViaChild');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1720
     * @tc.name testSetValue1720
     * @tc.desc Verify setValue on string field cf from class SetInheritChildE27 and getOwner returns child class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetInheritChildE27>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('cf')!;
      f.setValue(inst, 'cfv');
      expect(f.getOwner().getName().endsWith('SetInheritChildE27')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1730
     * @tc.name testSetValue1730
     * @tc.desc Verify setValue and getValue roundtrip on two-dimensional int array field a2 from class SetArrObjE23 with nested element verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetArrObjE23>();
      let inst = cls.createInstance();
      let f = cls.getInstanceField('a2')!;
      const inner: Array<int> = [7];
      const v: Array<Array<int>> = [inner];
      f.setValue(inst, v);
      const g: Array<Array<int>> = f.getValue(inst) as Array<Array<int>>;
      expect(g.length).assertEqual(1);
      expect(g[0][0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1740
     * @tc.name testSetValue1740
     * @tc.desc Verify setValue batch operation on byte short and int fields from class SetAllPrimE21 with respective type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetAllPrimE21>();
      let inst = cls.createInstance();
      cls.getInstanceField('b')!.setValue(inst, 1 as byte);
      cls.getInstanceField('s')!.setValue(inst, 2 as short);
      cls.getInstanceField('i')!.setValue(inst, 3);
      cls.getInstanceField('l')!.setValue(inst, 4 as long);
      expect(cls.getInstanceField('b')!.getValue(inst) as byte).assertEqual(1 as byte);
      expect(cls.getInstanceField('s')!.getValue(inst) as short).assertEqual(2 as short);
      expect(cls.getInstanceField('i')!.getValue(inst) as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1750
     * @tc.name testSetValue1750
     * @tc.desc Verify setValue on nullable byte field nb from class SetNullableByteE08 with null value and getValue returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetNullableByteE08>();
      let inst = cls.createInstance();
      let field = cls.getInstanceField('nb')!;
      field.setValue(inst, null);
      const tmpVal = field.getValue(inst);
      expect(tmpVal as byte | null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1760
     * @tc.name testSetValue1760
     * @tc.desc Verify setValue and getValue roundtrip on string field pf from class SetValueParentE20 with subclass SetValueChildE20 instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<SetValueParentE20>();
      let field = parentCls.getInstanceField('pf')!;
      let childInst = Class.from<SetValueChildE20>().createInstance();
      field.setValue(childInst, 'subclassVal');
      expect(field.getValue(childInst) as string).assertEqual('subclassVal');
    });
