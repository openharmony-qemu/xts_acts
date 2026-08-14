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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayJoinTestOneTest(): void {
  describe('Int16ArrayJoinTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0100
     * @tc.name testInt16ArrayJoinTestOne001
     * @tc.desc Verify join() without argument on multi-element array uses default comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join();
      expect(actual1).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0200
     * @tc.name testInt16ArrayJoinTestOne002
     * @tc.desc Verify join() without argument on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual1: string = arr.join();
      expect(actual1).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0300
     * @tc.name testInt16ArrayJoinTestOne003
     * @tc.desc Verify join() without argument on single-element array returns element without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let actual1: string = arr.join();
      expect(actual1).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0400
     * @tc.name testInt16ArrayJoinTestOne004
     * @tc.desc Verify join(separator) with explicit separator argument uses provided separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('|');
      expect(actual1).assertEqual('10|20|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0500
     * @tc.name testInt16ArrayJoinTestOne005
     * @tc.desc Verify join() default comma with 2 elements produces single comma between
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let actual1: string = arr.join();
      expect(actual1).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0600
     * @tc.name testInt16ArrayJoinTestOne006
     * @tc.desc Verify join() default comma with 4 elements produces three commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let actual1: string = arr.join();
      expect(actual1).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0700
     * @tc.name testInt16ArrayJoinTestOne007
     * @tc.desc Verify join('') with multi-element array concatenates elements directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('');
      expect(actual1).assertEqual('102030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0800
     * @tc.name testInt16ArrayJoinTestOne008
     * @tc.desc Verify join('') with empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual1: string = arr.join('');
      expect(actual1).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_0900
     * @tc.name testInt16ArrayJoinTestOne009
     * @tc.desc Verify join('') with single-element array returns element string only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let actual1: string = arr.join('');
      expect(actual1).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1000
     * @tc.name testInt16ArrayJoinTestOne010
     * @tc.desc Verify join('') with 2 elements concatenates without any separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let actual1: string = arr.join('');
      expect(actual1).assertEqual('1020');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1100
     * @tc.name testInt16ArrayJoinTestOne011
     * @tc.desc Verify join separator = ',' explicitly passed produces same result as default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join(',');
      expect(actual1).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1200
     * @tc.name testInt16ArrayJoinTestOne012
     * @tc.desc Verify join separator = '-' dash between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('-');
      expect(actual1).assertEqual('10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1300
     * @tc.name testInt16ArrayJoinTestOne013
     * @tc.desc Verify join separator = ';' semicolon between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join(';');
      expect(actual1).assertEqual('10;20;30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1400
     * @tc.name testInt16ArrayJoinTestOne014
     * @tc.desc Verify join separator = ' ' space between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join(' ');
      expect(actual1).assertEqual('10 20 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1500
     * @tc.name testInt16ArrayJoinTestOne015
     * @tc.desc Verify join separator = ", " two-character separator with space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join(', ');
      expect(actual1).assertEqual('10, 20, 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1600
     * @tc.name testInt16ArrayJoinTestOne016
     * @tc.desc Verify join separator = " -- " multi-character separator with surrounding spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join(' -- ');
      expect(actual1).assertEqual('10 -- 20 -- 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1700
     * @tc.name testInt16ArrayJoinTestOne017
     * @tc.desc Verify join separator = "###" repeated same character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('###');
      expect(actual1).assertEqual('10###20###30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1800
     * @tc.name testInt16ArrayJoinTestOne018
     * @tc.desc Verify join separator = "ab" two different letter characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('ab');
      expect(actual1).assertEqual('10ab20ab30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_1900
     * @tc.name testInt16ArrayJoinTestOne019
     * @tc.desc Verify join separator = "::" repeated punctuation pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('::');
      expect(actual1).assertEqual('10::20::30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2000
     * @tc.name testInt16ArrayJoinTestOne020
     * @tc.desc Verify join separator = "xyz" three-character alphabetical separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('xyz');
      expect(actual1).assertEqual('10xyz20xyz30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2100
     * @tc.name testInt16ArrayJoinTestOne021
     * @tc.desc Verify join separator = '\n' newline between elements in multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\n');
      expect(actual1).assertEqual('10\n20\n30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2200
     * @tc.name testInt16ArrayJoinTestOne022
     * @tc.desc Verify join separator = '\n' newline on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual1: string = arr.join('\n');
      expect(actual1).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2300
     * @tc.name testInt16ArrayJoinTestOne023
     * @tc.desc Verify join separator = '\t' tab between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\t');
      expect(actual1).assertEqual('10\t20\t30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2400
     * @tc.name testInt16ArrayJoinTestOne024
     * @tc.desc Verify join separator = '\\' backslash between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\\');
      expect(actual1).assertEqual('10\\20\\30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2500
     * @tc.name testInt16ArrayJoinTestOne025
     * @tc.desc Verify join separator = '\r' carriage return between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\r');
      expect(actual1).assertEqual('10\r20\r30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2600
     * @tc.name testInt16ArrayJoinTestOne026
     * @tc.desc Verify join separator = "\r\n" CRLF pair between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\r\n');
      expect(actual1).assertEqual('10\r\n20\r\n30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2700
     * @tc.name testInt16ArrayJoinTestOne027
     * @tc.desc Verify join separator = '\0' null character between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\u0000');
      let expected1: string = '10' + '\u0000' + '20' + '\u0000' + '30';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2800
     * @tc.name testInt16ArrayJoinTestOne028
     * @tc.desc Verify join separator = "<script>" treated as literal string not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let actual1: string = arr.join('<script>');
      expect(actual1).assertEqual('10<script>20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_2900
     * @tc.name testInt16ArrayJoinTestOne029
     * @tc.desc Verify join separator = '&' ampersand between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('&');
      expect(actual1).assertEqual('10&20&30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3000
     * @tc.name testInt16ArrayJoinTestOne030
     * @tc.desc Verify join separator = '<' less-than between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('<');
      expect(actual1).assertEqual('10<20<30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3100
     * @tc.name testInt16ArrayJoinTestOne031
     * @tc.desc Verify join separator = '>' greater-than between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('>');
      expect(actual1).assertEqual('10>20>30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3200
     * @tc.name testInt16ArrayJoinTestOne032
     * @tc.desc Verify join separator = '"' double quote between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('"');
      expect(actual1).assertEqual('10"20"30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3300
     * @tc.name testInt16ArrayJoinTestOne033
     * @tc.desc Verify join separator = '\'' single quote between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join("'");
      let expected1: string = "10'20'30";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3400
     * @tc.name testInt16ArrayJoinTestOne034
     * @tc.desc Verify join separator = '0' zero digit as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('0');
      expect(actual1).assertEqual('10020030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3500
     * @tc.name testInt16ArrayJoinTestOne035
     * @tc.desc Verify join separator = '.' decimal point as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('.');
      expect(actual1).assertEqual('10.20.30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3600
     * @tc.name testInt16ArrayJoinTestOne036
     * @tc.desc Verify join separator = 'e' exponent notation character as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('e');
      expect(actual1).assertEqual('10e20e30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3700
     * @tc.name testInt16ArrayJoinTestOne037
     * @tc.desc Verify join separator = '+' plus sign as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('+');
      expect(actual1).assertEqual('10+20+30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3800
     * @tc.name testInt16ArrayJoinTestOne038
     * @tc.desc Verify join with Chinese separator string joins elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('中文');
      expect(actual1).assertEqual('10中文20中文30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3900
     * @tc.name testInt16ArrayJoinTestOne039
     * @tc.desc Verify join uses emoji character as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('😀');
      expect(actual1).assertEqual('10😀20😀30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4000
     * @tc.name testInt16ArrayJoinTestOne040
     * @tc.desc Verify join uses accented Latin character as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('ñ');
      expect(actual1).assertEqual('10ñ20ñ30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4100
     * @tc.name testInt16ArrayJoinTestOne041
     * @tc.desc Verify join separator as 100-character string placed between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep: string =
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: string = arr.join(sep);
      let parts: Array<string> = result.split('10');
      let actual1: int = parts.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4200
     * @tc.name testInt16ArrayJoinTestOne042
     * @tc.desc Verify join separator as 500-character string placed between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep: string = '';
      for (let i: int = 0; i < 500; i++) {
        sep = sep + 'x';
      }
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: string = arr.join(sep);
      let parts: Array<string> = result.split('10');
      let actual1: int = parts.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4300
     * @tc.name testInt16ArrayJoinTestOne043
     * @tc.desc Verify join separator longer than any individual element string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sep: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      let arr: Int16Array = Int16Array.of(1, 2);
      let actual1: string = arr.join(sep);
      let expected1: string = '1' + sep + '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4400
     * @tc.name testInt16ArrayJoinTestOne044
     * @tc.desc Verify join separator = "NaN" treated as literal string not special value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('NaN');
      expect(actual1).assertEqual('10NaN20NaN30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4500
     * @tc.name testInt16ArrayJoinTestOne045
     * @tc.desc Verify join separator = "Infinity" treated as literal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('Infinity');
      expect(actual1).assertEqual('10Infinity20Infinity30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4600
     * @tc.name testInt16ArrayJoinTestOne046
     * @tc.desc Verify join separator = "undefined" treated as literal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('undefined');
      expect(actual1).assertEqual('10undefined20undefined30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4700
     * @tc.name testInt16ArrayJoinTestOne047
     * @tc.desc Verify join separator = "null" treated as literal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('null');
      expect(actual1).assertEqual('10null20null30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4800
     * @tc.name testInt16ArrayJoinTestOne048
     * @tc.desc Verify join separator character appears in element string representation causing adjacent repeats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let actual1: string = arr.join('1');
      expect(actual1).assertEqual('11213');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_4900
     * @tc.name testInt16ArrayJoinTestOne049
     * @tc.desc Verify join separator = '-' with array containing negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-10, -20, -30);
      let actual1: string = arr.join('-');
      expect(actual1).assertEqual('-10--20--30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5000
     * @tc.name testInt16ArrayJoinTestOne050
     * @tc.desc Verify join separator = digit string overlapping with element digit representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let actual1: string = arr.join('0');
      expect(actual1).assertEqual('10020');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5100
     * @tc.name testInt16ArrayJoinTestOne051
     * @tc.desc Verify join separator with array element at int16.MIN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
      let actual1: string = arr.join('|');
      expect(actual1).assertEqual('-32768|0|32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5200
     * @tc.name testInt16ArrayJoinTestOne052
     * @tc.desc Verify join separator with array element at int16.MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -32768);
      let actual1: string = arr.join(':');
      expect(actual1).assertEqual('32767:0:-32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5300
     * @tc.name testInt16ArrayJoinTestOne053
     * @tc.desc Verify join("  ") double space between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('  ');
      expect(actual1).assertEqual('10  20  30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5400
     * @tc.name testInt16ArrayJoinTestOne054
     * @tc.desc Verify join separator = " \t " mixed space and tab between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join(' \t ');
      expect(actual1).assertEqual('10 \t 20 \t 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5500
     * @tc.name testInt16ArrayJoinTestOne055
     * @tc.desc Verify join separator = "\n\t" newline followed by tab between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\n\t');
      expect(actual1).assertEqual('10\n\t20\n\t30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5600
     * @tc.name testInt16ArrayJoinTestOne056
     * @tc.desc Verify join separator = '!' exclamation mark between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('!');
      expect(actual1).assertEqual('10!20!30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5700
     * @tc.name testInt16ArrayJoinTestOne057
     * @tc.desc Verify join separator = '?' question mark between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('?');
      expect(actual1).assertEqual('10?20?30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5800
     * @tc.name testInt16ArrayJoinTestOne058
     * @tc.desc Verify join separator = '@' at sign between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('@');
      expect(actual1).assertEqual('10@20@30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_5900
     * @tc.name testInt16ArrayJoinTestOne059
     * @tc.desc Verify join separator = '\b' backspace control character between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\b');
      expect(actual1).assertEqual('10\b20\b30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_6000
     * @tc.name testInt16ArrayJoinTestOne060
     * @tc.desc Verify join separator = '\f' form feed control character between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('\f');
      expect(actual1).assertEqual('10\f20\f30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_6100
     * @tc.name testInt16ArrayJoinTestOne061
     * @tc.desc Verify join separator = "true" boolean-like string as literal separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('true');
      expect(actual1).assertEqual('10true20true30');
    });
  });
}
