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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class MyObj010 {
  toString(): string {
    return "MyObject";
  }
}

class NumberLikeObj010 {
  toString(): string {
    return "42";
  }
}

class Inner010 {
  toString(): string {
    return "inner";
  }
}

class Outer010 {
  inner: Inner010 = new Inner010();
  toString(): string {
    return "outer-" + this.inner.toString();
  }
}

class BadObj058 {
  toString(): string {
    throw new Error("toString error");
  }
}

class KeyValObj010 {
  key: string = "";
  constructor(key: string) {
    this.key = key;
  }
}

export default function StringBuilderAppendTest(): void {
  describe('StringBuilderAppendTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0001
     * @tc.name testStringBuilderAppend001
     * @tc.desc Verify append with one parameter for each major type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("hello");
        builder.append(true);
        builder.append(100);
        expect(builder.toString()).assertEqual("hellotrue100");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0002
     * @tc.name testStringBuilderAppend002
     * @tc.desc Verify append with English string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("hello");
        expect(builder.toString()).assertEqual("hello");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0003
     * @tc.name testStringBuilderAppend003
     * @tc.desc Verify append with Chinese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("你好世界");
        expect(builder.toString()).assertEqual("你好世界");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0004
     * @tc.name testStringBuilderAppend004
     * @tc.desc Verify append with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("12345");
        expect(builder.toString()).assertEqual("12345");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0005
     * @tc.name testStringBuilderAppend005
     * @tc.desc Verify append with special character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("!@#$%^&*()");
        expect(builder.toString()).assertEqual("!@#$%^&*()");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0006
     * @tc.name testStringBuilderAppend006
     * @tc.desc Verify append with Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("????");
        expect(builder.toString()).assertEqual("????");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0007
     * @tc.name testStringBuilderAppend007
     * @tc.desc Verify append with multiple consecutive spaces preserves spacing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("one  two   three");
        expect(builder.toString()).assertEqual("one  two   three");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0008
     * @tc.name testStringBuilderAppend008
     * @tc.desc Verify append with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("A");
        expect(builder.toString()).assertEqual("A");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0009
     * @tc.name testStringBuilderAppend009
     * @tc.desc Verify append with long string of 10000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let longStr: string = "a".repeat(10000);
        builder.append(longStr);
        expect(builder.toString()).assertEqual(longStr);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0010
     * @tc.name testStringBuilderAppend010
     * @tc.desc Verify append with newline and tab character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("\n\t\r");
        expect(builder.toString()).assertEqual("\n\t\r");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0011
     * @tc.name testStringBuilderAppend011
     * @tc.desc Verify append with null string parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        try {
          let s: string | null = null;
          builder.append(s!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0012
     * @tc.name testStringBuilderAppend012
     * @tc.desc Verify append with undefined string parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        try {
          let s: string | undefined = undefined;
          builder.append(s!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0013
     * @tc.name testStringBuilderAppend013
     * @tc.desc Verify append with boolean value true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(true);
        expect(builder.toString()).assertEqual("true");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0014
     * @tc.name testStringBuilderAppend014
     * @tc.desc Verify append with boolean value false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(false);
        expect(builder.toString()).assertEqual("false");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0015
     * @tc.name testStringBuilderAppend015
     * @tc.desc Verify chained append of multiple boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(true).append(false);
        expect(builder.toString()).assertEqual("truefalse");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0016
     * @tc.name testStringBuilderAppend016
     * @tc.desc Verify boolean append embedded in key-value text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("enabled=");
        builder.append(false);
        builder.append(";checked=");
        builder.append(true);
        expect(builder.toString()).assertEqual("enabled=false;checked=true");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0017
     * @tc.name testStringBuilderAppend017
     * @tc.desc Verify append with byte value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let val: byte = 0;
        builder.append(val);
        expect(builder.toString()).assertEqual("0");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0018
     * @tc.name testStringBuilderAppend018
     * @tc.desc Verify byte append inside comma-separated record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("byte,");
        let val: byte = 12;
        builder.append(val);
        builder.append(",ok");
        expect(builder.toString()).assertEqual("byte,12,ok");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0019
     * @tc.name testStringBuilderAppend019
     * @tc.desc Verify byte value from hex literal can be appended with prefix text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("hex-byte=");
        let val: byte = 0x0A;
        builder.append(val);
        expect(builder.toString()).assertEqual("hex-byte=10");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0020
     * @tc.name testStringBuilderAppend020
     * @tc.desc Verify append with byte minimum value -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let val: byte = -128;
        builder.append(val);
        expect(builder.toString()).assertEqual("-128");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0021
     * @tc.name testStringBuilderAppend021
     * @tc.desc Verify append with byte maximum value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let val: byte = 127;
        builder.append(val);
        expect(builder.toString()).assertEqual("127");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0022
     * @tc.name testStringBuilderAppend022
     * @tc.desc Verify byte minimum and maximum values can be paired with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let minVal: byte = -128;
        let maxVal: byte = 127;
        builder.append(minVal).append("|").append(maxVal);
        expect(builder.toString()).assertEqual("-128|127");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0023
     * @tc.name testStringBuilderAppend023
     * @tc.desc Verify append with char value 'A'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'A');
        expect(builder.toString()).assertEqual("A");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0024
     * @tc.name testStringBuilderAppend024
     * @tc.desc Verify append with Chinese char '\u4e2d'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\u4e2d');
        expect(builder.toString()).assertEqual("\u4e2d");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0025
     * @tc.name testStringBuilderAppend025
     * @tc.desc Verify append with numeric char '9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'9');
        expect(builder.toString()).assertEqual("9");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0026
     * @tc.name testStringBuilderAppend026
     * @tc.desc Verify append with null char c'\u0000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\u0000');
        expect(builder.toString().length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0027
     * @tc.name testStringBuilderAppend027
     * @tc.desc Verify append with maximum char value c'\uffff'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\uffff');
        expect(builder.toString().length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0028
     * @tc.name testStringBuilderAppend028
     * @tc.desc Verify append with newline char c'\n'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\n');
        expect(builder.toString()).assertEqual("\n");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0029
     * @tc.name testStringBuilderAppend029
     * @tc.desc Verify append with tab char c'\t'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\t');
        expect(builder.toString()).assertEqual("\t");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0030
     * @tc.name testStringBuilderAppend030
     * @tc.desc Verify append with DEL char c'\x7F'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\x7F');
        expect(builder.toString().length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0031
     * @tc.name testStringBuilderAppend031
     * @tc.desc Verify append with quote and backslash chars preserves escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(c'\'');
        builder.append(c'\\');
        expect(builder.toString()).assertEqual("'\\");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0032
     * @tc.name testStringBuilderAppend032
     * @tc.desc Verify short append with unit suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("size=");
        let val: short = 2048;
        builder.append(val);
        builder.append("KB");
        expect(builder.toString()).assertEqual("size=2048KB");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0033
     * @tc.name testStringBuilderAppend033
     * @tc.desc Verify short value from hex literal in labeled output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("shortHex:");
        let val: short = 0x7FF;
        builder.append(val);
        expect(builder.toString()).assertEqual("shortHex:2047");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0034
     * @tc.name testStringBuilderAppend034
     * @tc.desc Verify append with short minimum value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let val: short = -32768;
        builder.append(val);
        expect(builder.toString()).assertEqual("-32768");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0035
     * @tc.name testStringBuilderAppend035
     * @tc.desc Verify append with short maximum value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let val: short = 32767;
        builder.append(val);
        expect(builder.toString()).assertEqual("32767");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0036
     * @tc.name testStringBuilderAppend036
     * @tc.desc Verify short min and max values preserve ordering with arrows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let minVal: short = -32768;
        let maxVal: short = 32767;
        builder.append(minVal).append("->").append(maxVal);
        expect(builder.toString()).assertEqual("-32768->32767");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0037
     * @tc.name testStringBuilderAppend037
     * @tc.desc Verify append with int value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(1);
        expect(builder.toString()).assertEqual("1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0038
     * @tc.name testStringBuilderAppend038
     * @tc.desc Verify append with int value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(0);
        builder.append(0.0f);
        builder.append(0.0);
        expect(builder.toString()).assertEqual("000");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0039
     * @tc.name testStringBuilderAppend039
     * @tc.desc Verify append with int value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(-1);
        builder.append(0);
        builder.append(1);
        expect(builder.toString()).assertEqual("-101");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0040
     * @tc.name testStringBuilderAppend040
     * @tc.desc Verify hex int literal appended beside original radix label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("0x1234=");
        builder.append(0x1234);
        expect(builder.toString()).assertEqual("0x1234=4660");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0041
     * @tc.name testStringBuilderAppend041
     * @tc.desc Verify binary int literal appended beside original radix label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("0b1010=");
        builder.append(0b1010);
        expect(builder.toString()).assertEqual("0b1010=10");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0042
     * @tc.name testStringBuilderAppend042
     * @tc.desc Verify int min/max boundaries with string labels preserve ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("R:");
        builder.append(-2147483648);
        builder.append(",L:");
        builder.append(2147483647);
        expect(builder.toString()).assertEqual("R:-2147483648,L:2147483647");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0043
     * @tc.name testStringBuilderAppend043
     * @tc.desc Verify append with long maximum value 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let l: long = 9223372036854775807;
        builder.append(l);
        expect(builder.toString()).assertEqual("9223372036854775807");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0044
     * @tc.name testStringBuilderAppend044
     * @tc.desc Verify int append can build equation-like text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(40).append("+").append(2).append("=").append(42);
        expect(builder.toString()).assertEqual("40+2=42");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0045
     * @tc.name testStringBuilderAppend045
     * @tc.desc Verify long append with currency-like prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("amount=");
        let l: long = 100
        builder.append(l);
        builder.append(" cents");
        expect(builder.toString()).assertEqual("amount=100 cents");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0046
     * @tc.name testStringBuilderAppend046
     * @tc.desc Verify hex long literal with explicit textual label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("longHex=");
        let l:long=0x1234
        builder.append(l);
        expect(builder.toString()).assertEqual("longHex=4660");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0047
     * @tc.name testStringBuilderAppend047
     * @tc.desc Verify negative long append in delta expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("delta:");
        let l: long = -100
        builder.append(l);
        builder.append("ms");
        expect(builder.toString()).assertEqual("delta:-100ms");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0048
     * @tc.name testStringBuilderAppend048
     * @tc.desc Verify append with long minimum safe integer value -9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let l:long=-9007199254740991
        builder.append(l);
        expect(builder.toString()).assertEqual("-9007199254740991");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0049
     * @tc.name testStringBuilderAppend049
     * @tc.desc Verify append with long maximum safe integer value 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let l:long=9007199254740991
        builder.append(l);
        expect(builder.toString()).assertEqual("9007199254740991");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0050
     * @tc.name testStringBuilderAppend050
     * @tc.desc Verify long safe integer values can be wrapped in brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("[");
        let val: long = 9007199254740991;
        builder.append(val).append("]");
        expect(builder.toString()).assertEqual("[9007199254740991]");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0051
     * @tc.name testStringBuilderAppend051
     * @tc.desc Verify append with typeof Float.MIN_VALUE returns "string"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Float.MIN_VALUE);
        const result=builder.toString()
        expect(typeof result).assertEqual("string");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0052
     * @tc.name testStringBuilderAppend052
     * @tc.desc Verify float value embedded between string labels preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("Start:");
        builder.append(3.14f);
        builder.append(":End");
        expect(builder.toString()).assertEqual("Start:3.14:End");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0053
     * @tc.name testStringBuilderAppend053
     * @tc.desc Verify Float.MAX_VALUE embedded in real-world label context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("Temp: ");
        builder.append(Float.MAX_VALUE);
        builder.append("°C");
        expect(builder.toString()).assertEqual("Temp: 3.4028235e+38°C");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0054
     * @tc.name testStringBuilderAppend054
     * @tc.desc Verify append with Float.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Float.MAX_VALUE);
        expect(builder.toString()).assertEqual("3.4028235e+38");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0055
     * @tc.name testStringBuilderAppend055
     * @tc.desc Verify consecutive float and double NaN values in builder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Float.NaN);
        builder.append("|");
        builder.append(Double.NaN);
        expect(builder.toString()).assertEqual("NaN|NaN");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0056
     * @tc.name testStringBuilderAppend056
     * @tc.desc Verify append with Float.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Float.POSITIVE_INFINITY);
        expect(builder.toString()).assertEqual("Infinity");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0057
     * @tc.name testStringBuilderAppend057
     * @tc.desc Verify float append with percent sign suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("rate=");
        builder.append(12.5f);
        builder.append("%");
        expect(builder.toString()).assertEqual("rate=12.5%");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0058
     * @tc.name testStringBuilderAppend058
     * @tc.desc Verify double zero embedded between string content preserves context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("V:");
        builder.append(0.0);
        builder.append(":V");
        expect(builder.toString()).assertEqual("V:0:V");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0059
     * @tc.name testStringBuilderAppend059
     * @tc.desc Verify append with small positive double 0.001 preserves leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(0.001);
        expect(builder.toString()).assertEqual("0.001");
        expect(builder.stringLength).assertEqual(5);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0060
     * @tc.name testStringBuilderAppend060
     * @tc.desc Verify append with small negative double -0.001 preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(-0.001);
        expect(builder.toString()).assertEqual("-0.001");
        expect(builder.stringLength).assertEqual(6);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0061
     * @tc.name testStringBuilderAppend061
     * @tc.desc Verify append with scientific notation double 1.0e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(1.0e6);
        expect(builder.toString()).assertEqual("1000000");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0062
     * @tc.name testStringBuilderAppend062
     * @tc.desc Verify append with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Double.MIN_VALUE);
        expect(builder.toString()).assertEqual("5e-324");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0063
     * @tc.name testStringBuilderAppend063
     * @tc.desc Verify append with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Double.MAX_VALUE);
        expect(builder.toString()).assertEqual("1.7976931348623157e+308");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0064
     * @tc.name testStringBuilderAppend064
     * @tc.desc Verify append with double negative infinity produces -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(-Double.POSITIVE_INFINITY);
        expect(builder.toString()).assertEqual("-Infinity");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0065
     * @tc.name testStringBuilderAppend065
     * @tc.desc Verify double append with coordinate-like formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder("(");
        builder.append(12.34);
        builder.append(",");
        builder.append(-56.78);
        builder.append(")");
        expect(builder.toString()).assertEqual("(12.34,-56.78)");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0066
     * @tc.name testStringBuilderAppend066
     * @tc.desc Verify append with object containing toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(new MyObj010());
        expect(builder.toString()).assertEqual("MyObject");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0067
     * @tc.name testStringBuilderAppend067
     * @tc.desc Verify append with nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(new Outer010());
        expect(builder.toString()).assertEqual("outer-inner");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0068
     * @tc.name testStringBuilderAppend068
     * @tc.desc Verify append with number-like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const obj: Object = new NumberLikeObj010();
        builder.append(obj);
        expect(builder.toString()).assertEqual("42");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0069
     * @tc.name testStringBuilderAppend069
     * @tc.desc Verify append with empty object produces default object string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let obj: Object = {};
        builder.append(obj);
        expect(builder.toString()).assertEqual("[object Object]");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0070
     * @tc.name testStringBuilderAppend070
     * @tc.desc Verify append with array object produces comma-separated content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let arr: Object = [1, 2, 3] as Object;
        builder.append(arr);
        expect(builder.toString()).assertEqual("1,2,3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0071
     * @tc.name testStringBuilderAppend071
     * @tc.desc Verify append with undefined Object parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        try {
          let obj: Object | undefined = undefined;
          builder.append(obj as Object);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0072
     * @tc.name testStringBuilderAppend072
     * @tc.desc Verify append with object without toString produces default object string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let obj: KeyValObj010 = new KeyValObj010("value");
        builder.append(obj);
        expect(builder.toString()).assertEqual("[object Object]");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0073
     * @tc.name testStringBuilderAppend073
     * @tc.desc Verify return type is StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let result: StringBuilder = builder.append("test");
        expect(result instanceof StringBuilder).assertTrue();
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0074
     * @tc.name testStringBuilderAppend074
     * @tc.desc Verify return value is the current instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let result = builder.append("test");
        expect(result === builder).assertTrue();
        expect(builder.toString()).assertEqual("test");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0075
     * @tc.name testStringBuilderAppend075
     * @tc.desc Verify each type overload returns StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        expect(builder.append("s") === builder).assertTrue();
        expect(builder.append(true) === builder).assertTrue();
        expect(builder.append(1) === builder).assertTrue();
        expect(builder.append(3.14) === builder).assertTrue();
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0076
     * @tc.name testStringBuilderAppend076
     * @tc.desc Verify two-step chained append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("Hello").append(" World");
        expect(builder.toString()).assertEqual("Hello World");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0077
     * @tc.name testStringBuilderAppend077
     * @tc.desc Verify multi-step chained append with mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("ArkTS").append("-").append(20);
        expect(builder.toString()).assertEqual("ArkTS-20");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0078
     * @tc.name testStringBuilderAppend078
     * @tc.desc Verify long chain append with mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("a").append(true).append(1).append(3.14).append(c'X');
        expect(builder.toString()).assertEqual("atrue13.14X");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0079
     * @tc.name testStringBuilderAppend079
     * @tc.desc Verify chained append from new StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result = new StringBuilder().append("A").append("B").toString();
        expect(result).assertEqual("AB");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0080
     * @tc.name testStringBuilderAppend080
     * @tc.desc Verify continuous append 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        for (let i = 0; i < 1000; i++) {
          builder.append("a");
        }
        expect(builder.toString().length).assertEqual(1000);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0081
     * @tc.name testStringBuilderAppend081
     * @tc.desc Verify continuous append with mixed types 500 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        for (let i = 0; i < 500; i++) {
          builder.append("x").append(i).append(true);
        }
        expect(builder.toString().length).assertEqual(3890);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0082
     * @tc.name testStringBuilderAppend082
     * @tc.desc Verify appending null text before BadObj failure preserves prior content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("before-error");
        try {
          let obj: Object = new BadObj058();
          builder.append(obj!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
          expect(builder.toString()).assertEqual("before-error");
        }
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0083
     * @tc.name testStringBuilderAppend083
     * @tc.desc Verify repeated append and toString integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let expected: string = "";
        for (let i = 0; i < 100; i++) {
          let s: string = i.toString();
          builder.append(s);
          expected += s;
        }
        expect(builder.toString()).assertEqual(expected);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0084
     * @tc.name testStringBuilderAppend084
     * @tc.desc Verify append then check stringLength reflects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("Hello");
        builder.append(" World");
        expect(builder.toString()).assertEqual("Hello World");
        expect(builder.stringLength).assertEqual(11);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0085
     * @tc.name testStringBuilderAppend085
     * @tc.desc Verify append result interacts with concatStrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("A");
        builder.append("B");
        let appendResult: string = builder.toString();
        let concatResult: string = StringBuilder.concatStrings("C", "D");
        let combined: string = appendResult + concatResult;
        expect(combined).assertEqual("ABCD");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0086
     * @tc.name testStringBuilderAppend086
     * @tc.desc Verify multiple instances do not interfere after appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder1: StringBuilder = new StringBuilder();
        const builder2: StringBuilder = new StringBuilder();
        builder1.append("inst1");
        builder2.append("inst2");
        builder1.append("_extra");
        expect(builder1.toString()).assertEqual("inst1_extra");
        expect(builder2.toString()).assertEqual("inst2");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0087
     * @tc.name testStringBuilderAppend087
     * @tc.desc Verify append then toString then stringLength consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("TestString");
        let str: string = builder.toString();
        let len: int = builder.stringLength;
        expect(str.length).assertEqual(len);
        expect(str).assertEqual("TestString");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0088
     * @tc.name testStringBuilderAppend088
     * @tc.desc Verify 300 appends then toString result integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        for (let i = 0; i < 300; i++) {
          builder.append("x");
        }
        expect(builder.toString().length).assertEqual(300);
        expect(builder.stringLength).assertEqual(300);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0089
     * @tc.name testStringBuilderAppend089
     * @tc.desc Verify append 50000 character string then toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let longStr: string = "x".repeat(50000);
        builder.append(longStr);
        expect(builder.toString()).assertEqual(longStr);
        expect(builder.stringLength).assertEqual(50000);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0090
     * @tc.name testStringBuilderAppend090
     * @tc.desc Verify append all numeric type boundaries sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(0);
        builder.append(-1);
        builder.append(2147483647);
        builder.append(-2147483648);
        expect(builder.toString()).assertEqual("0-12147483647-2147483648");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0091
     * @tc.name testStringBuilderAppend091
     * @tc.desc Verify append all float type boundaries sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(0.0f);
        builder.append(3.14f);
        builder.append(-99.99f);
        builder.append(Float.NaN);
        expect(builder.toString()).assertEqual("03.14-99.99NaN");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0092
     * @tc.name testStringBuilderAppend092
     * @tc.desc Verify append all double type boundaries sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(0.0);
        builder.append(123.456);
        builder.append(-888.88);
        builder.append(Double.NaN);
        expect(builder.toString()).assertEqual("0123.456-888.88NaN");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0093
     * @tc.name testStringBuilderAppend093
     * @tc.desc Verify repeated toString returns consistent results after mixed-type appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("Item-");
        builder.append(2026);
        builder.append(true);
        builder.append(c'!');
        const r1: string = builder.toString();
        const r2: string = builder.toString();
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual("Item-2026true!");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0094
     * @tc.name testStringBuilderAppend094
     * @tc.desc Verify append byte, short, int, long sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        let b: byte = 12;
        let s: short = 100;
        builder.append(b);
        builder.append(s);
        builder.append(10000);
        builder.append(100);
        expect(builder.toString()).assertEqual("1210010000100");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0095
     * @tc.name testStringBuilderAppend095
     * @tc.desc Verify append float and double sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(3.14f);
        builder.append(123.456);
        expect(builder.toString()).assertEqual("3.14123.456");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0096
     * @tc.name testStringBuilderAppend096
     * @tc.desc Verify 100 append toString cycles maintain data integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        for (let i = 0; i < 100; i++) {
          builder.append("x");
          let s: string = builder.toString();
          expect(s.length).assertEqual(i + 1);
          expect(s.length).assertEqual(builder.stringLength);
        }
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0097
     * @tc.name testStringBuilderAppend097
     * @tc.desc Verify 300 appends then stringLength precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        for (let i = 0; i < 300; i++) {
          builder.append("ab");
        }
        expect(builder.stringLength).assertEqual(600);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0098
     * @tc.name testStringBuilderAppend098
     * @tc.desc Verify mixed type stress test with 20 different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("str");
        builder.append(true);
        builder.append(1);
        builder.append(0.0f);
        builder.append(0.0);
        builder.append(c'A');
        let b: byte = 12;
        builder.append(b);
        let s: short = 100;
        builder.append(s);
        builder.append(100);
        builder.append(3.14f);
        builder.append(123.456);
        expect(builder.toString()).assertEqual("strtrue100A121001003.14123.456");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0099
     * @tc.name testStringBuilderAppend099
     * @tc.desc Verify building a URL-like string with append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("https://");
        builder.append("example");
        builder.append(".");
        builder.append("com");
        builder.append("/");
        builder.append("path");
        expect(builder.toString()).assertEqual("https://example.com/path");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0100
     * @tc.name testStringBuilderAppend100
     * @tc.desc Verify building CSV-like content with append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("name");
        builder.append(",");
        builder.append("age");
        builder.append(",");
        builder.append("city");
        expect(builder.toString()).assertEqual("name,age,city");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0101
     * @tc.name testStringBuilderAppend101
     * @tc.desc Verify append result of concatStrings as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const cs: string = StringBuilder.concatStrings("Hello", " ");
        const builder: StringBuilder = new StringBuilder();
        builder.append(cs);
        builder.append("World");
        expect(builder.toString()).assertEqual("Hello World");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0102
     * @tc.name testStringBuilderAppend102
     * @tc.desc Verify append business phone number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("13800138000");
        builder.append(" ");
        builder.append("01012345678");
        expect(builder.toString()).assertEqual("13800138000 01012345678");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0103
     * @tc.name testStringBuilderAppend103
     * @tc.desc Verify append Arabic script text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631");
        builder.append(" ");
        builder.append("\u0639\u0631\u0628\u064A");
        expect(builder.toString()).assertEqual("\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631 \u0639\u0631\u0628\u064A");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0104
     * @tc.name testStringBuilderAppend104
     * @tc.desc Verify append encoding garbled string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("\u00E6\u00B5\u008B\u00E8\u00AF\u0058");
        builder.append("\uFFFD");
        expect(builder.toString()).assertEqual("\u00E6\u00B5\u008B\u00E8\u00AF\u0058\uFFFD");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0105
     * @tc.name testStringBuilderAppend105
     * @tc.desc Verify append hex format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("0x123");
        builder.append(" ");
        builder.append("0xFF");
        expect(builder.toString()).assertEqual("0x123 0xFF");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0106
     * @tc.name testStringBuilderAppend106
     * @tc.desc Verify append scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("1.0e6");
        builder.append(" ");
        builder.append("3.14E-2");
        expect(builder.toString()).assertEqual("1.0e6 3.14E-2");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0107
     * @tc.name testStringBuilderAppend107
     * @tc.desc Verify append elements from string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const arr: string[] = ["A", "B", "C"];
        for (let i = 0; i < arr.length; i++) {
          builder.append(arr[i]);
        }
        expect(builder.toString()).assertEqual("ABC");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0108
     * @tc.name testStringBuilderAppend108
     * @tc.desc Verify append elements from int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
        const builder: StringBuilder = new StringBuilder();
        const arr: int[] = [10, 20, 30];
        for (let i = 0; i < arr.length; i++) {
          builder.append(arr[i]);
        }
        expect(builder.toString()).assertEqual("102030");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0109
     * @tc.name testStringBuilderAppend109
     * @tc.desc Verify append email string with domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("test");
        builder.append("@");
        builder.append("example.com");
        expect(builder.toString()).assertEqual("test@example.com");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0110
     * @tc.name testStringBuilderAppend110
     * @tc.desc Verify append octal and binary format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append("0123");
        builder.append(" ");
        builder.append("0b1010");
        expect(builder.toString()).assertEqual("0123 0b1010");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_APPEND_0111
     * @tc.name testStringBuilderAppend111
     * @tc.desc Verify append with BadObj that throws on toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderAppend111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        try {
          let obj: Object = new BadObj058();
          builder.append(obj);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
        }
      }
    );
  });
}


