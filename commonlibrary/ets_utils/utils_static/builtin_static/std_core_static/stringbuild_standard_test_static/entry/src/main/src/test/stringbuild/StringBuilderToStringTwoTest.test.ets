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
export default function StringBuilderToStringTwoTest(): void {
  describe('StringBuilderToStringTwoTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0001
     * @tc.name testStringBuilderToStringTwo001
     * @tc.desc Verify calling static toString with 1 parameter returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(42);
        expect(typeof result).assertEqual('string');
        expect(result).assertEqual('42');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0002
     * @tc.name testStringBuilderToStringTwo002
     * @tc.desc Verify toString(false) returns "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(false);
        expect(result).assertEqual('false');
        expect(result.length).assertEqual(5);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0003
     * @tc.name testStringBuilderToStringTwo003
     * @tc.desc Verify toString(0 as byte) returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0 as byte);
        expect(result).assertEqual('0');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0004
     * @tc.name testStringBuilderToStringTwo004
     * @tc.desc Verify toString(99 as byte) returns "99"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(99 as byte);
        expect(result).assertEqual('99');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0005
     * @tc.name testStringBuilderToStringTwo005
     * @tc.desc Verify toString(0x0A as byte) returns "10"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0x0A as byte);
        expect(result).assertEqual('10');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0006
     * @tc.name testStringBuilderToStringTwo006
     * @tc.desc Verify toString(-128 as byte) returns "-128"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-128 as byte);
        expect(result).assertEqual('-128');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0007
     * @tc.name testStringBuilderToStringTwo007
     * @tc.desc Verify toString(127 as byte) returns "127"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(127 as byte);
        expect(result).assertEqual('127');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0008
     * @tc.name testStringBuilderToStringTwo008
     * @tc.desc Verify toString(c'A') returns "A"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'A');
        expect(result).assertEqual('A');
        expect(result.length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0009
     * @tc.name testStringBuilderToStringTwo009
     * @tc.desc Verify toString(c'中') returns "中"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'中');
        expect(result).assertEqual('中');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0010
     * @tc.name testStringBuilderToStringTwo010
     * @tc.desc Verify toString(c'\u0000') returns string of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'\u0000');
        expect(result.length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0011
     * @tc.name testStringBuilderToStringTwo011
     * @tc.desc Verify toString(c'\uffff') returns char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'\uffff');
        expect(result.length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0012
     * @tc.name testStringBuilderToStringTwo012
     * @tc.desc Verify toString(c'\n') returns newline char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'\n');
        expect(result.length).assertEqual(1);
        expect(result.charCodeAt(0)).assertEqual(10);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0013
     * @tc.name testStringBuilderToStringTwo013
     * @tc.desc Verify toString(c'\t') returns tab char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'\t');
        expect(result.length).assertEqual(1);
        expect(result.charCodeAt(0)).assertEqual(9);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0014
     * @tc.name testStringBuilderToStringTwo014
     * @tc.desc Verify toString(c'\x7F') returns DEL char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(c'\x7F');
        expect(result.length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0015
     * @tc.name testStringBuilderToStringTwo015
     * @tc.desc Verify toString(100 as short) returns "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(100 as short);
        expect(result).assertEqual('100');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0016
     * @tc.name testStringBuilderToStringTwo016
     * @tc.desc Verify toString(-32768 as short) returns "-32768"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-32768 as short);
        expect(result).assertEqual('-32768');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0017
     * @tc.name testStringBuilderToStringTwo017
     * @tc.desc Verify toString(32767 as short) returns "32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(32767 as short);
        expect(result).assertEqual('32767');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0018
     * @tc.name testStringBuilderToStringTwo018
     * @tc.desc Verify toString(0x7FF as short) returns "2047"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0x7FF as short);
        expect(result).assertEqual('2047');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0019
     * @tc.name testStringBuilderToStringTwo019
     * @tc.desc Verify toString(1) returns "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(1);
        expect(result).assertEqual('1');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0020
     * @tc.name testStringBuilderToStringTwo020
     * @tc.desc Verify toString(10000) returns "10000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(10000);
        expect(result).assertEqual('10000');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0021
     * @tc.name testStringBuilderToStringTwo021
     * @tc.desc Verify toString(0x1234) returns "4660"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0x1234);
        expect(result).assertEqual('4660');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0022
     * @tc.name testStringBuilderToStringTwo022
     * @tc.desc Verify toString(0b1010) returns "10"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0b1010);
        expect(result).assertEqual('10');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0023
     * @tc.name testStringBuilderToStringTwo023
     * @tc.desc Verify toString(-2147483648) returns "-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-2147483648);
        expect(result).assertEqual('-2147483648');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0024
     * @tc.name testStringBuilderToStringTwo024
     * @tc.desc Verify toString(2147483647) returns "2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(2147483647);
        expect(result).assertEqual('2147483647');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0025
     * @tc.name testStringBuilderToStringTwo025
     * @tc.desc Verify toString(0) returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0);
        expect(result).assertEqual('0');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0026
     * @tc.name testStringBuilderToStringTwo026
     * @tc.desc Verify toString(-1) returns "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-1);
        expect(result).assertEqual('-1');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0027
     * @tc.name testStringBuilderToStringTwo027
     * @tc.desc Verify toString(100) returns "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(100);
        expect(result).assertEqual('100');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0028
     * @tc.name testStringBuilderToStringTwo028
     * @tc.desc Verify toString(-9223372036854775808) returns
     *  "-9223372036854775808"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let l:long=-9223372036854775808
        let result: string = StringBuilder.toString(l);
        expect(result).assertEqual('-9223372036854775808');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0029
     * @tc.name testStringBuilderToStringTwo029
     * @tc.desc Verify toString(9223372036854775807) returns
     *  "9223372036854775807"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(9223372036854775807);
        expect(result).assertEqual('9223372036854775807');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0030
     * @tc.name testStringBuilderToStringTwo030
     * @tc.desc Verify toString(3.14f) returns "3.14"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(3.14f);
        expect(result).assertEqual('3.14');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0031
     * @tc.name testStringBuilderToStringTwo031
     * @tc.desc Verify toString(Float.MIN_VALUE) returns "1.4e-45"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Float.MIN_VALUE);
        expect(typeof result).assertEqual("string");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0032
     * @tc.name testStringBuilderToStringTwo032
     * @tc.desc Verify toString(Float.MAX_VALUE) returns max float string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Float.MAX_VALUE);
        expect(result).assertEqual('3.4028235e+38');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0033
     * @tc.name testStringBuilderToStringTwo033
     * @tc.desc Verify toString(Float.NaN) returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Float.NaN);
        expect(result).assertEqual('NaN');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0034
     * @tc.name testStringBuilderToStringTwo034
     * @tc.desc Verify toString(Float.POSITIVE_INFINITY) returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Float.POSITIVE_INFINITY);
        expect(result).assertEqual('Infinity');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0035
     * @tc.name testStringBuilderToStringTwo035
     * @tc.desc Verify toString(-0.0f) returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-0.0f);
        expect(result).assertEqual("0");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0036
     * @tc.name testStringBuilderToStringTwo036
     * @tc.desc Verify toString(-99.99f) returns "-99.99"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-99.99f);
        expect(result).assertEqual('-99.99');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0037
     * @tc.name testStringBuilderToStringTwo037
     * @tc.desc Verify toString(123.456) returns "123.456"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(123.456);
        expect(result).assertEqual('123.456');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0038
     * @tc.name testStringBuilderToStringTwo038
     * @tc.desc Verify toString(-888.88) returns "-888.88"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(-888.88);
        expect(result).assertEqual('-888.88');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0039
     * @tc.name testStringBuilderToStringTwo039
     * @tc.desc Verify toString(Double.MIN_VALUE) returns min double string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Double.MIN_VALUE);
        expect(result).assertEqual('5e-324');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0040
     * @tc.name testStringBuilderToStringTwo040
     * @tc.desc Verify toString(Double.MAX_VALUE) returns max double string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Double.MAX_VALUE);
        expect(result).assertEqual('1.7976931348623157e+308');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0041
     * @tc.name testStringBuilderToStringTwo041
     * @tc.desc Verify toString(Double.NaN) returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(Double.NaN);
        expect(result).assertEqual('NaN');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0042
     * @tc.name testStringBuilderToStringTwo042
     * @tc.desc Verify toString(1.0e6) returns "1000000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(1.0e6);
        expect(result).assertEqual('1000000');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0043
     * @tc.name testStringBuilderToStringTwo043
     * @tc.desc Verify double overload returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(3.14);
        expect(typeof result).assertEqual('string');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0044
     * @tc.name testStringBuilderToStringTwo044
     * @tc.desc Verify toString(true) length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(true);
        expect(result.length).assertEqual(4);
        expect(typeof result).assertEqual('string');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0045
     * @tc.name testStringBuilderToStringTwo045
     * @tc.desc Verify toString called via class name StringBuilder works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(20);
        expect(result).assertEqual('20');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0046
     * @tc.name testStringBuilderToStringTwo046
     * @tc.desc Verify static toString with small positive double preserves leading decimal zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = StringBuilder.toString(0.001);
        expect(result).assertEqual('0.001');
        expect(typeof result).assertEqual('string');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0047
     * @tc.name testStringBuilderToStringTwo047
     * @tc.desc Verify all 8 overloads return string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let r1: string = StringBuilder.toString(true);
        let r2: string = StringBuilder.toString(12 as byte);
        let r3: string = StringBuilder.toString(c'A');
        let r4: string = StringBuilder.toString(100 as short);
        let r5: string = StringBuilder.toString(10000);
        let r6: string = StringBuilder.toString(100);
        let r7: string = StringBuilder.toString(3.14f);
        let r8: string = StringBuilder.toString(123.456);
        expect(r1).assertEqual('true');
        expect(r2).assertEqual('12');
        expect(r3).assertEqual('A');
        expect(r4).assertEqual('100');
        expect(r5).assertEqual('10000');
        expect(r6).assertEqual('100');
        expect(r7).assertEqual('3.14');
        expect(r8).assertEqual('123.456');
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0048
     * @tc.name testStringBuilderToStringTwo048
     * @tc.desc Verify toString results can be passed to StringBuilder constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let r1: string = StringBuilder.toString(42);
        let r2: string = StringBuilder.toString(true);
        let r3: string = StringBuilder.toString(3.14);
        const builder = new StringBuilder(r1 + r2 + r3);
        expect(builder.toString()).assertEqual("42true3.14");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0049
     * @tc.name testStringBuilderToStringTwo049
     * @tc.desc Verify toString result can be appended to builder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let strVal: string = StringBuilder.toString(42);
        const builder = new StringBuilder("Value: ");
        builder.append(strVal);
        expect(builder.toString()).assertEqual("Value: 42");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0050
     * @tc.name testStringBuilderToStringTwo050
     * @tc.desc Verify toString result length matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let r1: string = StringBuilder.toString(12345);
        expect(r1.length).assertEqual(5);
        let r2: string = StringBuilder.toString(0);
        expect(r2.length).assertEqual(1);
        let r3: string = StringBuilder.toString(-1);
        expect(r3.length).assertEqual(2);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0051
     * @tc.name testStringBuilderToStringTwo051
     * @tc.desc Verify 200 consecutive static toString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 200; i++) {
          let result: string = StringBuilder.toString(i);
          expect(result).assertEqual(i.toString());
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_TWO_0052
     * @tc.name testStringBuilderToStringTwo052
     * @tc.desc Verify static toString results can be concatenated together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let r1: string = StringBuilder.toString(true);
        let r2: string = StringBuilder.toString(3.14);
        let combined: string = r1 + r2;
        expect(combined).assertEqual("true3.14");
      }
    );
  });
}
