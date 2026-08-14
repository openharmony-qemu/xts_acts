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

export default function int16ArrayWithTestFourTest(): void {
  describe('Int16ArrayWithTestFourTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0100
     * @tc.name testInt16ArrayWithTestFour001
     * @tc.desc Verify with(0, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0200
     * @tc.name testInt16ArrayWithTestFour002
     * @tc.desc Verify with(1, nv) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let nv: number = 99;
      let result: Int16Array = arr.with(1, nv);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0300
     * @tc.name testInt16ArrayWithTestFour003
     * @tc.desc Verify with(0, sv), with(0, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 77 as short;
      let nv: number = 77;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = arr.with(0, nv);
      let actual1: number = r1.$_get(0);
      let expected1: number = r2.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = r1.$_get(1);
      let expected2: number = r2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0400
     * @tc.name testInt16ArrayWithTestFour004
     * @tc.desc Verify with(0, sv) via short overload and number overload with MAX_SHORT stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 32767 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0500
     * @tc.name testInt16ArrayWithTestFour005
     * @tc.desc Verify with(0, sv) via short overload and number overload with MIN_SHORT,overflow stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = -32768 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0600
     * @tc.name testInt16ArrayWithTestFour006
     * @tc.desc Verify with(0, 3.14) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 3.14);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0700
     * @tc.name testInt16ArrayWithTestFour007
     * @tc.desc Verify with(0, -Number.POSITIVE_INFINITY) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, -Double.POSITIVE_INFINITY);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0800
     * @tc.name testInt16ArrayWithTestFour008
     * @tc.desc Verify with(1, sv), with(1, nv) via short overload and number overload join matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 0 as short;
      let nv: number = 0;
      let r1: Int16Array = arr.with(1, sv);
      let r2: Int16Array = arr.with(1, nv);
      let actual1: string = r1.join(',');
      let expected1: string = r2.join(',');
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_0900
     * @tc.name testInt16ArrayWithTestFour009
     * @tc.desc Verify with(1, sv), with(1, nv) via short overload and number overload join matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = -1 as short;
      let nv: number = -1;
      let r1: Int16Array = arr.with(1, sv);
      let r2: Int16Array = arr.with(1, nv);
      let actual1: string = r1.join(',');
      let expected1: string = r2.join(',');
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1000
     * @tc.name testInt16ArrayWithTestFour010
     * @tc.desc Verify with(2, sv), with(2, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 1 as short;
      let nv: number = 1;
      let r1: Int16Array = arr.with(2, sv);
      let r2: Int16Array = arr.with(2, nv);
      let actual1: number = r1.$_get(0);
      let expected1: number = r2.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = r1.$_get(1);
      let expected2: number = r2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1100
     * @tc.name testInt16ArrayWithTestFour011
     * @tc.desc Verify with(0, 1.9) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 1.9);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1200
     * @tc.name testInt16ArrayWithTestFour012
     * @tc.desc Verify with(arr.length - 1, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(arr.length - 1, sv);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1300
     * @tc.name testInt16ArrayWithTestFour013
     * @tc.desc Verify with(arr.length - 1, nv) via number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let nv: number = 99;
      let result: Int16Array = arr.with(arr.length - 1, nv);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1400
     * @tc.name testInt16ArrayWithTestFour014
     * @tc.desc Verify with(-1, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 55 as short;
      let result: Int16Array = arr.with(-1, sv);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1500
     * @tc.name testInt16ArrayWithTestFour015
     * @tc.desc Verify with(-1, nv) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let nv: number = 55;
      let result: Int16Array = arr.with(-1, nv);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1600
     * @tc.name testInt16ArrayWithTestFour016
     * @tc.desc Verify with(0, sv), with(2, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 11 as short;
      let nv: number = 33;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = r1.with(2, nv);
      let actual1: number = r2.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = r2.$_get(2);
      expect(actual2).assertEqual(33);
      let actual3: number = r2.$_get(1);
      expect(actual3).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1700
     * @tc.name testInt16ArrayWithTestFour017
     * @tc.desc Verify with(0, sv) via short overload length and first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 5 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: int = result.length;
      expect(actual1).assertEqual(2);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1800
     * @tc.name testInt16ArrayWithTestFour018
     * @tc.desc Verify with(0, 5) via number overload length and first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: Int16Array = arr.with(0, 5);
      let actual1: int = result.length;
      expect(actual1).assertEqual(2);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_1900
     * @tc.name testInt16ArrayWithTestFour019
     * @tc.desc Verify with(0, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 5 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: int = result.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2000
     * @tc.name testInt16ArrayWithTestFour020
     * @tc.desc Verify with(0, 5) via number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 5);
      let actual1: int = result.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2100
     * @tc.name testInt16ArrayWithTestFour021
     * @tc.desc Verify with(0, sv) via short overload keeps BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 5 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: int = result.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2200
     * @tc.name testInt16ArrayWithTestFour022
     * @tc.desc Verify with(0, 5) via number overload keeps BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: Int16Array = arr.with(0, 5);
      let actual1: int = result.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2300
     * @tc.name testInt16ArrayWithTestFour023
     * @tc.desc Verify with(0, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 5 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: int = result.byteLength;
      let expected1: int = result.length * 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2400
     * @tc.name testInt16ArrayWithTestFour024
     * @tc.desc Verify with(0, 5) via number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 5);
      let actual1: int = result.byteLength;
      let expected1: int = result.length * 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2500
     * @tc.name testInt16ArrayWithTestFour025
     * @tc.desc Verify with(0, sv), with(0, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 99 as short;
      let nv: number = 99;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = arr.with(0, nv);
      let actual1: string = r1.toString();
      let expected1: string = r2.toString();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2600
     * @tc.name testInt16ArrayWithTestFour026
     * @tc.desc Verify with(0, sv), with(0, nv) via short overload and number overload join matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 77 as short;
      let nv: number = 77;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = arr.with(0, nv);
      let actual1: string = r1.join();
      let expected1: string = r2.join();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2700
     * @tc.name testInt16ArrayWithTestFour027
     * @tc.desc Verify with(0, 66) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 66);
      let actual1 = result.at(0)!;
      expect(actual1).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2800
     * @tc.name testInt16ArrayWithTestFour028
     * @tc.desc Verify with(0, sv), with(0, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let nv: number = 99;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = arr.with(0, nv);
      let first1: [int, number] = r1.entries().next().value!;
      let first2: [int, number] = r2.entries().next().value!;
      let actual1: number = first1[1];
      let expected1: number = first2[1];
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_2900
     * @tc.name testInt16ArrayWithTestFour029
     * @tc.desc Verify with(0, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let count: int = 0;
      result.forEach((_v: number, _i: int, _a: Int16Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3000
     * @tc.name testInt16ArrayWithTestFour030
     * @tc.desc Verify with(0, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 5 as short;
      let result: Int16Array = arr.with(0, sv);
      let mapped: Int16Array = result.map((v: number, _i: int, _a: Int16Array): number => {
        return v + 1;
      });
      let actual1: number = mapped.$_get(0);
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3100
     * @tc.name testInt16ArrayWithTestFour031
     * @tc.desc Verify with(0, 5) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 5);
      let mapped: Int16Array = result.map((v: number, _i: int, _a: Int16Array): number => {
        return v + 1;
      });
      let actual1: number = mapped.$_get(0);
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3200
     * @tc.name testInt16ArrayWithTestFour032
     * @tc.desc Verify with(0, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let filtered: Int16Array = result.filter((v: number, _i: int, _a: Int16Array): boolean => {
        return v > 50;
      });
      let actual1: int = filtered.length;
      expect(actual1).assertEqual(1);
      let actual2: number = filtered.$_get(0);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3300
     * @tc.name testInt16ArrayWithTestFour033
     * @tc.desc Verify with(0, 15) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 15);
      let allPositive: boolean = result.every((v: number, _i: int, _a: Int16Array): boolean => {
        return v > 0;
      });
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3400
     * @tc.name testInt16ArrayWithTestFour034
     * @tc.desc Verify with(0, 5) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 5);
      let hasValue: boolean = result.some((v: number, _i: int, _a: Int16Array): boolean => {
        return v === 5;
      });
      expect(hasValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3500
     * @tc.name testInt16ArrayWithTestFour035
     * @tc.desc Verify with undefined (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let found: number | undefined = result.find((v: number, _i: int, _a: Int16Array): boolean => {
        return v === 99;
      });
      expect(found).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3600
     * @tc.name testInt16ArrayWithTestFour036
     * @tc.desc Verify with(0, 5) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 5);
      let sum: number = result.reduce((acc: number, v: number, _i: int, _a: Int16Array): number => {
        return acc + v;
      }, 0);
      expect(sum).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3700
     * @tc.name testInt16ArrayWithTestFour037
     * @tc.desc Verify with(0, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let copied: Int16Array = Int16Array.from(result);
      let actual1: number = copied.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: int = copied.length;
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3800
     * @tc.name testInt16ArrayWithTestFour038
     * @tc.desc Verify with(0, 99) via number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 99);
      let copied: Int16Array = Int16Array.from(result);
      let actual1: number = copied.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: int = copied.length;
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_3900
     * @tc.name testInt16ArrayWithTestFour039
     * @tc.desc Verify with(arr.length, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      try {
        arr.with(arr.length, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.length;
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4000
     * @tc.name testInt16ArrayWithTestFour040
     * @tc.desc Verify with(arr.length, 99) via number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.with(arr.length, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.length;
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4100
     * @tc.name testInt16ArrayWithTestFour041
     * @tc.desc Verify with(-4, sv) via short overload and number overload throws expected error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      try {
        arr.with(-4, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
      let actual3: number = arr.$_get(1);
      expect(actual3).assertEqual(20);
      let actual4: number = arr.$_get(2);
      expect(actual4).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4200
     * @tc.name testInt16ArrayWithTestFour042
     * @tc.desc Verify with(-4, 99) via number overload throws expected error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
      let actual3: number = arr.$_get(1);
      expect(actual3).assertEqual(20);
      let actual4: number = arr.$_get(2);
      expect(actual4).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4300
     * @tc.name testInt16ArrayWithTestFour043
     * @tc.desc Verify short with(0,v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let sv: short = 99 as short;
      try {
        arr.with(0, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.length;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4400
     * @tc.name testInt16ArrayWithTestFour044
     * @tc.desc Verify number with(0,v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      try {
        arr.with(0, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.length;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4500
     * @tc.name testInt16ArrayWithTestFour045
     * @tc.desc Verify with(5, sv) via short overload and number overload keeps BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 99 as short;
      try {
        arr.with(5, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.BYTES_PER_ELEMENT;
      expect(actual2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4600
     * @tc.name testInt16ArrayWithTestFour046
     * @tc.desc Verify with(5, 99) via number overload keeps BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.BYTES_PER_ELEMENT;
      expect(actual2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4700
     * @tc.name testInt16ArrayWithTestFour047
     * @tc.desc Verify with(10, sv) via short overload and number overload throws expected error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      try {
        arr.with(10, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.byteLength;
      expect(actual2).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4800
     * @tc.name testInt16ArrayWithTestFour048
     * @tc.desc Verify with(10, 99) via number overload throws expected error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.with(10, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      let actual2: int = arr.byteLength;
      expect(actual2).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_4900
     * @tc.name testInt16ArrayWithTestFour049
     * @tc.desc Verify with(5, sv) via short overload and number overload throws expected error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 99 as short;
      try {
        arr.with(5, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      arr.$_set(0, 88);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5000
     * @tc.name testInt16ArrayWithTestFour050
     * @tc.desc Verify with(5, 99) via number overload throws expected error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      arr.$_set(0, 88);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5100
     * @tc.name testInt16ArrayWithTestFour051
     * @tc.desc Verify with(0, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5200
     * @tc.name testInt16ArrayWithTestFour052
     * @tc.desc Verify with(arr.length + 2, sv), with(arr.length + 2, 99) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 99 as short;
      try {
        arr.with(arr.length + 2, sv);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
      try {
        arr.with(arr.length + 2, 99);
        expect().assertFail();
      } catch (e) {
        let actual2: string = e.name;
        expect(actual2).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5300
     * @tc.name testInt16ArrayWithTestFour053
     * @tc.desc Verify with(0, sv) via short overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let sameRef: boolean = result === arr;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5400
     * @tc.name testInt16ArrayWithTestFour054
     * @tc.desc Verify with(0, 99) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 99);
      let sameRef: boolean = result === arr;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5500
     * @tc.name testInt16ArrayWithTestFour055
     * @tc.desc Verify with(0, sv) via short overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let sv: short = 5 as short;
      let result: Int16Array = arr.with(0, sv);
      let sameBuf: boolean = result.buffer === arr.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5600
     * @tc.name testInt16ArrayWithTestFour056
     * @tc.desc Verify with(0, 5) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: Int16Array = arr.with(0, 5);
      let sameBuf: boolean = result.buffer === arr.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5700
     * @tc.name testInt16ArrayWithTestFour057
     * @tc.desc Verify with(0, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      arr.$_set(0, 888);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5800
     * @tc.name testInt16ArrayWithTestFour058
     * @tc.desc Verify with(0, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      result.$_set(0, 777);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_5900
     * @tc.name testInt16ArrayWithTestFour059
     * @tc.desc Verify with(0, sv), with(1, sv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 11 as short;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = arr.with(1, sv);
      r1.$_set(1, 999);
      let actual1: number = r2.$_get(1);
      expect(actual1).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6000
     * @tc.name testInt16ArrayWithTestFour060
     * @tc.desc Verify with(0, 11), with(1, 11) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let r1: Int16Array = arr.with(0, 11);
      let r2: Int16Array = arr.with(1, 11);
      r1.$_set(1, 999);
      let actual1: number = r2.$_get(1);
      expect(actual1).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6100
     * @tc.name testInt16ArrayWithTestFour061
     * @tc.desc Verify with(0, sv), with(1, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sv: short = 11 as short;
      let nv: number = 22;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = r1.with(1, nv);
      let r3: Int16Array = r2.with(2, 33);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6200
     * @tc.name testInt16ArrayWithTestFour062
     * @tc.desc Verify with byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: int = result.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6300
     * @tc.name testInt16ArrayWithTestFour063
     * @tc.desc Verify with(0, 99) via number overload checks buffer metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(0, 99);
      let actual1: int = result.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6400
     * @tc.name testInt16ArrayWithTestFour064
     * @tc.desc Verify with(0, sv1), with(1, sv2) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv1: short = 11 as short;
      let sv2: short = 22 as short;
      let r1: Int16Array = arr.with(0, sv1);
      let r2: Int16Array = r1.with(1, sv2);
      r1.$_set(2, 999);
      let actual1: number = r2.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6500
     * @tc.name testInt16ArrayWithTestFour065
     * @tc.desc Verify with(0, 11), with(1, 22) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let r1: Int16Array = arr.with(0, 11);
      let r2: Int16Array = r1.with(1, 22);
      r1.$_set(2, 999);
      let actual1: number = r2.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6600
     * @tc.name testInt16ArrayWithTestFour066
     * @tc.desc Verify with(0, sv), with(0, nv) via short overload and number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let sv: short = 99 as short;
      let nv: number = 99;
      let r1: Int16Array = arr.with(0, sv);
      let r2: Int16Array = arr.with(0, nv);
      r1.$_set(0, 777);
      let actual1: number = r2.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6700
     * @tc.name testInt16ArrayWithTestFour067
     * @tc.desc Verify with(0, sv) via short overload and number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sv: short = 99 as short;
      let result: Int16Array = arr.with(0, sv);
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
      let actual2: int = result.length;
      let expected2: int = arr.length;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6800
     * @tc.name testInt16ArrayWithTestFour068
     * @tc.desc Verify with(0, 99) via number overload preserves length/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
      let actual2: int = result.length;
      let expected2: int = arr.length;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_6900
     * @tc.name testInt16ArrayWithTestFour069
     * @tc.desc Verify with(0, 99) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let result: Int16Array = arr.with(0, 99);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(20);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = result.$_get(3);
      expect(actual3).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_7000
     * @tc.name testInt16ArrayWithTestFour070
     * @tc.desc Verify with(0, 50) via number overload stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, -200, 30);
      let result: Int16Array = arr.with(0, 50);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(-200);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_7100
     * @tc.name testInt16ArrayWithTestFour071
     * @tc.desc Verify with(2, sv) via short overload and number overload with MAX_SHORT,MIN_SHORT,overflow stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768, 0);
      let sv: short = 100 as short;
      let result: Int16Array = arr.with(2, sv);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_FOUR_7200
     * @tc.name testInt16ArrayWithTestFour072
     * @tc.desc Verify with(2, 100) via number overload with MAX_SHORT,MIN_SHORT,overflow stores expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768, 0);
      let result: Int16Array = arr.with(2, 100);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(-32768);
    });
  });
}
