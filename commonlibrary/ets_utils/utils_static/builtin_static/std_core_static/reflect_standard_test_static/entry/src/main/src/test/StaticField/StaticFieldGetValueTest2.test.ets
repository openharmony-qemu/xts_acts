'use static';
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
import Utils from '../Util.test';

class StrField {
  static val: string = '';
}

class LongField {
  static val: long = 0;
}

class IntField {
  static val: int = 0;
}

class FloatField {
  static val: float = 0.0f;
}

class DoubleField {
  static val: double = 0.0;
}

class BoolField {
  static val: boolean = false;
}

class GetValLinkA073 {
  public static count: int = 0;
}

class GetValDoubleD052 {
  public static maxDbl: double = Number.MAX_VALUE;
}

class GetValDoubleE053 {
  public static minDbl: double = Number.MIN_VALUE;
}

class GetValNullA061 {
  public static optStr: string | null = null;
}

class GetValInvF070 {
  public static direct: int = 77;
}

class GetValInvG071 {
  public static strField: string = 'abc';
  public static intField: int = 123;
}

class GetValLinkC075 {
  public static score: int = 0;
}

class GetValLinkF078 {
  public static optStr: string | null = 'initial';
}

class GetValModD086 {
  public static pub: string = 'pub';
  public static priv: string = 'priv';
}

class GetValErrF096 {
  public static uninit: int;
}

class NewFloatValClass {
  public static fVal: float = 3.14f;
}

class NewFloatNaNClass {
  public static nanVal: float = Float.NaN;
}

class NewCharClass {
  public static cVal: char = c'Z';
}

class NewByteClass {
  public static bVal: byte = 127;
}

class NewShortClass {
  public static sVal: short = 32767;
}

class NewBigintClass {
  public static bigVal: bigint = 999n;
}

class NewIntArrayClass {
  public static arr: int[] = [10, 20, 30];
}

class NewChainClass {
  public static val: int = 42;
}

class NewReadonlyValClass {
  public static readonly roVal: string = 'readonlyValue';
}

class GetValIntH {
  public static hexMax: int = 0x7FFFFFFF;
}

class GetValIntI {
  public static hexMin: int = -2147483648;
}

class GetValIntL {
  public static val: int = 100;
}

class GetValLongF {
  public static val: long = 42;
}

class GetValFloatE {
  public static val: float = 1.5f;
}

class GetValDoubleF {
  public static val: double = 3.14159;
}

class GetValStrT {
  public static msg: string = 'test';
}

class GetValBoolC {
  public static t: boolean = true;
}

class GetValSpecA {
  public static computed: int = 1 + 2;
}

class GetValSpecB {
  public static concat: string = 'a' + 'b';
}

class GetValSpecD {
  public static bitOr: int = 0x0F | 0xF0;
}

class GetValErrD {
  public static large: string = 'data';
}

class CharNullField {
  public static cVal: char = c'\0';
}

class CharTildeField {
  public static cVal: char = c'~';
}

class ByteMinField {
  public static bVal: byte = -128;
}

class ByteOneField {
  public static bVal: byte = 1;
}

class ShortMinField {
  public static sVal: short = -32768;
}

export default function staticFieldGetValueTest2(): void {
  describe('StaticFieldGetValueTest2', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0100
     * @tc.name testStaticFieldGetValueAtTwo001
     * @tc.desc Verify getValue returns 'hello' after setValue('hello') on StrField.val (setValue/getValue round-trip)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      field!.setValue('hello');
      let value = field!.getValue() as string;
      expect(value).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0200
     * @tc.name testStaticFieldGetValueAtTwo002
     * @tc.desc Verify getValue returns 0 for IntField.val using intermediate field variable (cls+field+val intermediate variables)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0300
     * @tc.name testStaticFieldGetValueAtTwo003
     * @tc.desc Verify getValue returns empty string for StrField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('');
      expect(field!.getValue() as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0400
     * @tc.name testStaticFieldGetValueAtTwo004
     * @tc.desc Verify getValue returns 'X' after setValue('X') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('X');
      expect(field!.getValue() as string).assertEqual('X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0500
     * @tc.name testStaticFieldGetValueAtTwo005
     * @tc.desc Verify getValue returns whitespace string '   ' (3 spaces) after setValue('   ') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('   ');
      expect(field!.getValue() as string).assertEqual('   ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0600
     * @tc.name testStaticFieldGetValueAtTwo006
     * @tc.desc Verify getValue returns '  leading' (two leading spaces) after setValue('  leading') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('  leading');
      expect(field!.getValue() as string).assertEqual('  leading');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0700
     * @tc.name testStaticFieldGetValueAtTwo007
     * @tc.desc Verify getValue returns 'trailing  ' (two trailing spaces) after setValue('trailing  ') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('trailing  ');
      expect(field!.getValue() as string).assertEqual('trailing  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0800
     * @tc.name testStaticFieldGetValueAtTwo008
     * @tc.desc Verify getValue returns Chinese characters after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('中文测试');
      expect(field!.getValue() as string).assertEqual('中文测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_0900
     * @tc.name testStaticFieldGetValueAtTwo009
     * @tc.desc Verify getValue returns emoji characters after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('😀🔥');
      expect(field!.getValue() as string).assertEqual('😀🔥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1000
     * @tc.name testStaticFieldGetValueAtTwo010
     * @tc.desc Verify getValue returns '$dollar$' after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('$dollar$');
      expect(field!.getValue() as string).assertEqual('$dollar$');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1100
     * @tc.name testStaticFieldGetValueAtTwo011
     * @tc.desc Verify getValue returns string with embedded newline 'line1\nline2' after setValue('line1\nline2') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('line1\nline2');
      expect(field!.getValue() as string).assertEqual('line1\nline2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1200
     * @tc.name testStaticFieldGetValueAtTwo012
     * @tc.desc Verify getValue returns zero-width space character (U+200B) after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('​');
      expect(field!.getValue() as string).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1300
     * @tc.name testStaticFieldGetValueAtTwo013
     * @tc.desc Verify getValue returns 'C:\\path\\to\\file' after setValue('C:\\path\\to\\file') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('C:\\path\\to\\file');
      expect(field!.getValue() as string).assertEqual('C:\\path\\to\\file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1400
     * @tc.name testStaticFieldGetValueAtTwo014
     * @tc.desc Verify getValue returns string of length 248 after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('a'.repeat(248));
      let val = field!.getValue() as string;
      expect(val.length).assertEqual(248);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1500
     * @tc.name testStaticFieldGetValueAtTwo015
     * @tc.desc Verify getValue returns HTML string '<script>alert(1)</script>' after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('<script>alert(1)</script>');
      expect(field!.getValue() as string).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1600
     * @tc.name testStaticFieldGetValueAtTwo016
     * @tc.desc Verify getValue returns 1 after setValue(1) on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(1);
      expect(field!.getValue() as Object).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1700
     * @tc.name testStaticFieldGetValueAtTwo017
     * @tc.desc Verify getValue returns -1 after setValue(-1) on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(-1);
      expect(field!.getValue() as Object).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1800
     * @tc.name testStaticFieldGetValueAtTwo018
     * @tc.desc Verify setValue(2147483647) on IntField.val then getValue returns int32 MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(2147483647);
      expect(field!.getValue() as Object).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_1900
     * @tc.name testStaticFieldGetValueAtTwo019
     * @tc.desc Verify setValue(-2147483648) on IntField.val then getValue returns int32 MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(-2147483648);
      expect(field!.getValue() as Object).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2000
     * @tc.name testStaticFieldGetValueAtTwo020
     * @tc.desc Verify getValue returns 0 after setValue(0) on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(0);
      let result = field!.getValue();
      expect(result as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2100
     * @tc.name testStaticFieldGetValueAtTwo021
     * @tc.desc Verify getValue returns 0 for LongField.val (default initial value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      expect(field!.getValue() as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2200
     * @tc.name testStaticFieldGetValueAtTwo022
     * @tc.desc Verify getValue returns 100 after setValue(100) on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      let v: long = 100;
      field!.setValue(v);
      expect(field!.getValue() as Object).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2300
     * @tc.name testStaticFieldGetValueAtTwo023
     * @tc.desc Verify getValue returns 9223372036854775807 (long MAX_VALUE) after setValue on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      field!.setValue(9223372036854775807);
      expect(field!.getValue() as Object).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2400
     * @tc.name testStaticFieldGetValueAtTwo024
     * @tc.desc Verify getValue returns -9223372036854775808 (long MIN_VALUE) after setValue on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      field!.setValue(-9223372036854775808);
      expect(field!.getValue() as Object).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2500
     * @tc.name testStaticFieldGetValueAtTwo025
     * @tc.desc Verify getValue returns -1 after setValue(-1) on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      let v: long = -1;
      field!.setValue(v);
      expect(field!.getValue() as Object).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2600
     * @tc.name testStaticFieldGetValueAtTwo026
     * @tc.desc Verify getValue returns 0 after setValue(0) on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      let v: long = 0;
      field!.setValue(v);
      let result = field!.getValue();
      expect(result as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2700
     * @tc.name testStaticFieldGetValueAtTwo027
     * @tc.desc Verify getValue returns 0.0 for FloatField.val (default initial value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FloatField>().getStaticField('val');
      expect(field!.getValue() as Object).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2800
     * @tc.name testStaticFieldGetValueAtTwo028
     * @tc.desc Verify getValue returns 3.14 after setValue(3.14f) on FloatField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FloatField>().getStaticField('val');
      field!.setValue(3.14f);
      expect((field!.getValue() as Object).toString()).assertEqual('3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_2900
     * @tc.name testStaticFieldGetValueAtTwo029
     * @tc.desc Verify getValue returns -2.5 after setValue(-2.5f) on FloatField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FloatField>().getStaticField('val');
      field!.setValue(-2.5f);
      expect(field!.getValue() as Object).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3000
     * @tc.name testStaticFieldGetValueAtTwo030
     * @tc.desc Verify getValue returns -0.0 after setValue(-0.0) on FloatField.val (negative zero preservation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FloatField>().getStaticField('val');
      field!.setValue(-0.0f);
      let val = field!.getValue() as float;
      expect(1.0 / val).assertEqual(Number.NEGATIVE_INFINITY);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3100
     * @tc.name testStaticFieldGetValueAtTwo031
     * @tc.desc Verify getValue returns 123.456 after setValue(123.456) on DoubleField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleField>().getStaticField('val');
      field!.setValue(123.456);
      expect(field!.getValue() as Object).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3200
     * @tc.name testStaticFieldGetValueAtTwo032
     * @tc.desc Verify getValue returns -999.99 after setValue(-999.99) on DoubleField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleField>().getStaticField('val');
      field!.setValue(-999.99);
      expect(field!.getValue() as Object).assertEqual(-999.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3300
     * @tc.name testStaticFieldGetValueAtTwo033
     * @tc.desc Verify int setValue(2147483646) (MAX-1) then getValue returns 2147483646 on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(2147483646);
      expect(field!.getValue() as Object).assertEqual(2147483646);
      IntField.val = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3400
     * @tc.name testStaticFieldGetValueAtTwo034
     * @tc.desc Verify int setValue(-2147483647) (MIN+1) then getValue returns -2147483647 on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(-2147483647);
      expect(field!.getValue() as Object).assertEqual(-2147483647);
      IntField.val = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3500
     * @tc.name testStaticFieldGetValueAtTwo035
     * @tc.desc Verify long setValue(9223372036854775806) (MAX-1) then getValue returns 9223372036854775806 on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      field!.setValue(9223372036854775806);
      expect(field!.getValue() as Object).assertEqual(9223372036854775806);
      LongField.val = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3600
     * @tc.name testStaticFieldGetValueAtTwo036
     * @tc.desc Verify long setValue(-9223372036854775807) (MIN+1) then getValue returns -9223372036854775807 on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongField>().getStaticField('val');
      field!.setValue(-9223372036854775807);
      expect(field!.getValue() as Object).assertEqual(-9223372036854775807);
      LongField.val = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3700
     * @tc.name testStaticFieldGetValueAtTwo037
     * @tc.desc Verify double setValue(9007199254740992.0) (2^53) exact roundtrip on DoubleField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleField>().getStaticField('val');
      let value: double = 9007199254740992.0;
      field!.setValue(value);
      expect(field!.getValue() as Object).assertEqual(9007199254740992.0);
      DoubleField.val = 0.0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3800
     * @tc.name testStaticFieldGetValueAtTwo038
     * @tc.desc Verify double setValue(9007199254740993) (2^53+1) rounds to 9007199254740992 on DoubleField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleField>().getStaticField('val');
      let value: double = 9007199254740993.0;
      field!.setValue(value);
      expect(field!.getValue() as Object).assertEqual(9007199254740992.0);
      DoubleField.val = 0.0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_3900
     * @tc.name testStaticFieldGetValueAtTwo039
     * @tc.desc Verify getValue returns Number.MAX_VALUE for GetValDoubleD052.maxDbl (double max boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValDoubleD052>().getStaticField('maxDbl');
      let val = field!.getValue() as double;
      expect(val).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4000
     * @tc.name testStaticFieldGetValueAtTwo040
     * @tc.desc Verify getValue returns Number.MIN_VALUE for GetValDoubleE053.minDbl (double min boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValDoubleE053>().getStaticField('minDbl');
      let val = field!.getValue() as double;
      expect(val).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4100
     * @tc.name testStaticFieldGetValueAtTwo041
     * @tc.desc Verify getValue returns true after setValue(true) on BoolField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<BoolField>().getStaticField('val');
      field!.setValue(true);
      expect(field!.getValue() as Object).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4200
     * @tc.name testStaticFieldGetValueAtTwo042
     * @tc.desc Verify getValue returns false after setValue(false) on BoolField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<BoolField>().getStaticField('val');
      field!.setValue(false);
      expect(field!.getValue() as Object).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4300
     * @tc.name testStaticFieldGetValueAtTwo043
     * @tc.desc Verify getValue returns null for string | null field (GetValNullA061.optStr)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValNullA061>().getStaticField('optStr');
      expect(field!.getValue() as Object | null).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4400
     * @tc.name testStaticFieldGetValueAtTwo044
     * @tc.desc Verify multiple getValue() calls on StrField.val do not change the stored value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('stable');
      let before = field!.getValue() as string;
      field!.getValue();
      field!.getValue();
      let after = field!.getValue() as string;
      expect(before).assertEqual('stable');
      expect(after).assertEqual('stable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4500
     * @tc.name testStaticFieldGetValueAtTwo045
     * @tc.desc Verify getValue returns 10 after setValue(10) and int arithmetic (val+5==15)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('val');
      field!.setValue(10);
      let val = field!.getValue() as int;
      expect(val + 5).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4600
     * @tc.name testStaticFieldGetValueAtTwo046
     * @tc.desc Verify getValue returns 'Hello' and supports string concatenation ('Hello' + ' World' == 'Hello World') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('Hello');
      let val = field!.getValue() as string;
      expect(val + ' World').assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4700
     * @tc.name testStaticFieldGetValueAtTwo047
     * @tc.desc Verify getValue() on GetValInvF070.direct static field returns value matching direct access
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValInvF070>().getStaticField('direct');
      let reflectedVal = field!.getValue() as Object;
      expect(reflectedVal).assertEqual(GetValInvF070.direct);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4800
     * @tc.name testStaticFieldGetValueAtTwo048
     * @tc.desc Verify getValue() on GetValInvG071 returns correct values for strField ('abc') and intField (123)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetValInvG071>();
      let fStr = cls.getStaticField('strField');
      let fInt = cls.getStaticField('intField');
      expect(fStr!.getValue() as string).assertEqual('abc');
      expect(fInt!.getValue() as Object).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_4900
     * @tc.name testStaticFieldGetValueAtTwo049
     * @tc.desc Verify getValue returns 100 for GetValLinkA073
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetValLinkA073>();
      let field = cls.getStaticField('count');
      field!.setValue(100);
      expect(field!.getValue() as Object).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5000
     * @tc.name testStaticFieldGetValueAtTwo050
     * @tc.desc Verify setValue(88) on GetValLinkC075.score then getValue returns 88 (matching direct field access)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetValLinkC075>();
      let field = cls.getStaticField('score');
      field!.setValue(88);
      expect(field!.getValue() as Object).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5100
     * @tc.name testStaticFieldGetValueAtTwo051
     * @tc.desc Verify getValue returns 3 for IntField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      field!.setValue(1);
      field!.setValue(2);
      field!.setValue(3);
      expect(field!.getValue() as Object).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5200
     * @tc.name testStaticFieldGetValueAtTwo052
     * @tc.desc Verify setValue(null) then getValue returns null on GetValLinkF078.optStr
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetValLinkF078>();
      let field = cls.getStaticField('optStr');
      field!.setValue(null);
      expect(field!.getValue() as Object | null).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5300
     * @tc.name testStaticFieldGetValueAtTwo053
     * @tc.desc Verify getValue returns correct values for pub and priv fields in GetValModD086
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetValModD086>();
      let fPub = cls.getStaticField('pub');
      let fPriv = cls.getStaticField('priv');
      expect(fPub!.getValue() as string).assertEqual('pub');
      expect(fPriv!.getValue() as string).assertEqual('priv');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5400
     * @tc.name testStaticFieldGetValueAtTwo054
     * @tc.desc Verify getValue on non-existent field 'nonExistent' of IntField throws NullPointerError (caught via try-catch)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IntField>().getStaticField('nonExistent');
      try {
        field!.getValue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5500
     * @tc.name testStaticFieldGetValueAtTwo055
     * @tc.desc Verify getValue in try-finally block returns empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('');
      let result: string = '';
      try {
        result = field!.getValue() as string;
      } finally {
        expect(result).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5600
     * @tc.name testStaticFieldGetValueAtTwo056
     * @tc.desc Verify getValue() on uninitialized int static field of GetValErrF096 returns default value 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValErrF096>().getStaticField('uninit');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5700
     * @tc.name testStaticFieldGetValueAtTwo057
     * @tc.desc Verify float field getValue returns correct float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewFloatValClass>().getStaticField('fVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5800
     * @tc.name testStaticFieldGetValueAtTwo058
     * @tc.desc Verify float NaN field getValue returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewFloatNaNClass>().getStaticField('nanVal');
      let val: Object = field!.getValue() as Object;
      expect(isNaN(val as float)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_5900
     * @tc.name testStaticFieldGetValueAtTwo059
     * @tc.desc Verify char field getValue returns correct char value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewCharClass>().getStaticField('cVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6000
     * @tc.name testStaticFieldGetValueAtTwo060
     * @tc.desc Verify byte field getValue returns correct byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewByteClass>().getStaticField('bVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6100
     * @tc.name testStaticFieldGetValueAtTwo061
     * @tc.desc Verify short field getValue returns correct short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewShortClass>().getStaticField('sVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6200
     * @tc.name testStaticFieldGetValueAtTwo062
     * @tc.desc Verify bigint field getValue returns correct bigint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewBigintClass>().getStaticField('bigVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(999n);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6300
     * @tc.name testStaticFieldGetValueAtTwo063
     * @tc.desc Verify int array field getValue returns array and iterate elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewIntArrayClass>().getStaticField('arr');
      let val = field!.getValue() as Object[];
      expect((val[0] as int)).assertEqual(10);
      expect((val[1] as int)).assertEqual(20);
      expect((val[2] as int)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6400
     * @tc.name testStaticFieldGetValueAtTwo064
     * @tc.desc Verify getValue returns 42 on NewChainClass.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewChainClass>();
      let field = cls.getStaticField('val');
      let value = field!.getValue() as Object;
      expect(value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6500
     * @tc.name testStaticFieldGetValueAtTwo065
     * @tc.desc Verify getName returns 'val' on NewChainClass.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewChainClass>();
      let field = cls.getStaticField('val');
      expect(field!.getName()).assertEqual('val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6600
     * @tc.name testStaticFieldGetValueAtTwo066
     * @tc.desc Verify getOwner().getName() endsWith 'NewChainClass' on NewChainClass.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewChainClass>();
      let field = cls.getStaticField('val');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetValueTest2.test.NewChainClass',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6700
     * @tc.name testStaticFieldGetValueAtTwo067
     * @tc.desc Verify getType().getName() returns 'i32' on NewChainClass.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewChainClass>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6800
     * @tc.name testStaticFieldGetValueAtTwo068
     * @tc.desc Verify readonly static field getValue returns initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewReadonlyValClass>().getStaticField('roVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual('readonlyValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_6900
     * @tc.name testStaticFieldGetValueAtTwo069
     * @tc.desc Verify hex literal 0x7FFFFFFF static int field getValue returns 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValIntH>().getStaticField('hexMax');
      expect(field!.getValue() as Object).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7000
     * @tc.name testStaticFieldGetValueAtTwo070
     * @tc.desc Verify int32 MIN -2147483648 static int field getValue returns -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValIntI>().getStaticField('hexMin');
      expect(field!.getValue() as Object).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7100
     * @tc.name testStaticFieldGetValueAtTwo071
     * @tc.desc Verify int field getValue returns initial value 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValIntL>().getStaticField('val');
      let result = field!.getValue();
      expect(result as Object).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7200
     * @tc.name testStaticFieldGetValueAtTwo072
     * @tc.desc Verify long field getValue returns initial value 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValLongF>().getStaticField('val');
      let result = field!.getValue();
      expect(result as Object).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7300
     * @tc.name testStaticFieldGetValueAtTwo073
     * @tc.desc Verify float field getValue returns initial value 1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValFloatE>().getStaticField('val');
      expect(field!.getValue() as Object).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7400
     * @tc.name testStaticFieldGetValueAtTwo074
     * @tc.desc Verify double field getValue returns initial value 3.14159
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValDoubleF>().getStaticField('val');
      expect(field!.getValue() as Object).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7500
     * @tc.name testStaticFieldGetValueAtTwo075
     * @tc.desc Verify string field getValue returns initial value 'test'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValStrT>().getStaticField('msg');
      let val = field!.getValue();
      expect(val as Object).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7600
     * @tc.name testStaticFieldGetValueAtTwo076
     * @tc.desc Verify boolean field getValue returns initial true value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValBoolC>().getStaticField('t');
      expect(field!.getValue() as Object).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7700
     * @tc.name testStaticFieldGetValueAtTwo077
     * @tc.desc Verify int field with computed initializer 1+2 getValue returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValSpecA>().getStaticField('computed');
      expect(field!.getValue() as Object).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7800
     * @tc.name testStaticFieldGetValueAtTwo078
     * @tc.desc Verify string field with concatenated initializer 'a'+'b' getValue returns 'ab'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValSpecB>().getStaticField('concat');
      expect(field!.getValue() as string).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_7900
     * @tc.name testStaticFieldGetValueAtTwo079
     * @tc.desc Verify int field with bitwise OR initializer 0x0F|0xF0 getValue returns 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValSpecD>().getStaticField('bitOr');
      expect(field!.getValue() as Object).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8000
     * @tc.name testStaticFieldGetValueAtTwo080
     * @tc.desc Verify getValue on string field returns initial value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetValErrD>().getStaticField('large');
      expect(field!.getValue() as Object).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8100
     * @tc.name testStaticFieldGetValueAtTwo081
     * @tc.desc Verify char field getValue returns null char (backslash-zero, zero char boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<CharNullField>().getStaticField('cVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(c'\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8200
     * @tc.name testStaticFieldGetValueAtTwo082
     * @tc.desc Verify char field getValue returns tilde (printable ASCII upper boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<CharTildeField>().getStaticField('cVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(c'~');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8300
     * @tc.name testStaticFieldGetValueAtTwo083
     * @tc.desc Verify byte field getValue returns -128 (MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ByteMinField>().getStaticField('bVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8400
     * @tc.name testStaticFieldGetValueAtTwo084
     * @tc.desc Verify byte field getValue returns 1 (positive small value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ByteOneField>().getStaticField('bVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8500
     * @tc.name testStaticFieldGetValueAtTwo085
     * @tc.desc Verify short field getValue returns -32768 (MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ShortMinField>().getStaticField('sVal');
      let val = field!.getValue() as Object;
      expect(val).assertEqual(-32768);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8600
     * @tc.name testStaticFieldGetValueAtTwo086
     * @tc.desc Verify getValue returns _under_score_ for StrField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('_under_score_');
      expect(field!.getValue() as string).assertEqual('_under_score_');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETVALUE_TWO_8700
     * @tc.name testStaticFieldGetValueAtTwo087
     * @tc.desc Verify getValue returns string with embedded tab 'col1\tcol2' after setValue('col1\tcol2') on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetValueAtTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<StrField>().getStaticField('val');
      field!.setValue('col1\tcol2');
      expect(field!.getValue() as string).assertEqual('col1\tcol2');
    });

  });
}
