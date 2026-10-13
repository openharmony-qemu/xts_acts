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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_ONE_3800
     * @tc.name testInt16ArrayJoinTestOne038
     * @tc.desc Verify join with Chinese separator string joins elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actual1: string = arr.join('涓枃');
      expect(actual1).assertEqual('10涓枃20涓枃30');
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
      let actual1: string = arr.join('馃榾');
      expect(actual1).assertEqual('10馃榾20馃榾30');
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
      let actual1: string = arr.join('帽');
      expect(actual1).assertEqual('10帽20帽30');
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

  });
}
