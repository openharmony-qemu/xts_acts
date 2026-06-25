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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function TupleLengthTest(): void {
  describe('TupleLengthTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0100
     * @tc.name testTupleLength001
     * @tc.desc Verify TupleLength scenario 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      expect(pair.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0200
     * @tc.name testTupleLength002
     * @tc.desc Verify TupleLength scenario 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const triple = new Tuple3<int, string, boolean>(1, "a", true);
      expect(triple.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0300
     * @tc.name testTupleLength003
     * @tc.desc Verify TupleLength scenario 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      expect(t0.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0400
     * @tc.name testTupleLength004
     * @tc.desc Verify TupleLength scenario 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1 = new Tuple1<int>(42);
      expect(t1.length).assertEqual(1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0500
     * @tc.name testTupleLength005
     * @tc.desc Verify TupleLength scenario 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t4 = new Tuple4<int, int, string, string>(1, 2, "a", "b");
      expect(t4.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0600
     * @tc.name testTupleLength006
     * @tc.desc Verify TupleLength scenario 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, string, string>(1, 2, 3, "a", "b");
      expect(t5.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0700
     * @tc.name testTupleLength007
     * @tc.desc Verify TupleLength scenario 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t6 = new Tuple6<int, int, int, int, string, string>(1, 2, 3, 4, "a", "b");
      expect(t6.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0800
     * @tc.name testTupleLength008
     * @tc.desc Verify TupleLength scenario 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t7 = new Tuple7<int, int, int, int, int, string, string>(1, 2, 3, 4, 5, "a", "b");
      expect(t7.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0900
     * @tc.name testTupleLength009
     * @tc.desc Verify TupleLength scenario 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t8 = new Tuple8<int, int, int, int, int, int, string, string>(1, 2, 3, 4, 5, 6, "a", "b");
      expect(t8.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1000
     * @tc.name testTupleLength010
     * @tc.desc Verify TupleLength scenario 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t9 = new Tuple9<int, int, int, int, int, int, int, string, string>(1, 2, 3, 4, 5, 6, 7, "a", "b");
      expect(t9.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1100
     * @tc.name testTupleLength011
     * @tc.desc Verify TupleLength scenario 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, string, string>(1, 2, 3, 4, 5, 6, 7, 8, "a", "b");
      expect(t10.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1200
     * @tc.name testTupleLength012
     * @tc.desc Verify TupleLength scenario 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<string | null, string | null, string | null>(null, null, null);
      expect(t3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1300
     * @tc.name testTupleLength013
     * @tc.desc Verify Tuple2 int pair stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, int>(0, 0);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(0);
      expect(t2.$1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1400
     * @tc.name testTupleLength014
     * @tc.desc Verify Tuple2 boolean pair stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<boolean, boolean>(false, false);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertFalse();
      expect(t2.$1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1500
     * @tc.name testTupleLength015
     * @tc.desc Verify Tuple2 char pair stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<char, char>(c'A', c'B');
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(c'A');
      expect(t2.$1).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1600
     * @tc.name testTupleLength016
     * @tc.desc Verify Tuple2 mixed int-string stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, string>(1, "one");
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(1);
      expect(t2.$1).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1700
     * @tc.name testTupleLength017
     * @tc.desc Verify length usable in arithmetic and string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, string>(1, "one");
      let len: int = t2.length;
      expect(len).assertEqual(2);
      expect(len + 1).assertEqual(3);
      expect(-len).assertEqual(-2);
      expect(len.toString()).assertEqual("2");
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1800
     * @tc.name testTupleLength018
     * @tc.desc Verify TupleLength scenario 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, string>(1, "one");
      let tuple: Tuple = t2;
      expect(tuple.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1900
     * @tc.name testTupleLength019
     * @tc.desc Verify TupleLength scenario 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, string, boolean>(1, "a", true);
      let len1: int = t3.length;
      let len2: int = t3.length;
      let len3: int = t3.length;
      expect(len1).assertEqual(3);
      expect(len2).assertEqual(3);
      expect(len3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2000
     * @tc.name testTupleLength020
     * @tc.desc Verify TupleLength scenario 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, string, boolean>(1, "a", true);
      let count: int = 0;
      for (let item of t3) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(count).assertEqual(t3.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2100
     * @tc.name testTupleLength021
     * @tc.desc Verify TupleLength scenario 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      let count: int = 0;
      for (let item of t0) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(t0.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2200
     * @tc.name testTupleLength022
     * @tc.desc Verify Tuple length is stable after repeated reads on mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string, string, int, boolean>("涓枃", "emoji馃檪", 2147483647, false);
      let first: int = tuple.length;
      let second: int = tuple.length;
      let third: int = tuple.length;
      expect(first).assertEqual(4);
      expect(second).assertEqual(first);
      expect(third).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2300
     * @tc.name testTupleLength023
     * @tc.desc Verify Tuple length with nested tuple and array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Tuple2<int, string>(-2147483648, "丕賱毓乇亘賷丞");
      const tuple = new Tuple3<Tuple2<int, string>, Array<int>, string>(nested, [1, 2, 3], "日本語");
      expect(tuple.length).assertEqual(3);
      expect(tuple.$0.length).assertEqual(2);
      expect(tuple.$1.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2400
     * @tc.name testTupleLength024
     * @tc.desc Verify Tuple length with null and undefined union element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string | null, string | undefined, int, boolean>(null, undefined, 42, false);
      expect(tuple.length).assertEqual(4);
      expect(tuple.$0).assertEqual(null);
      expect(tuple.$1).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2500
     * @tc.name testTupleLength025
     * @tc.desc Verify Tuple length is independent from repeated object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectValue = new Object();
      const tuple = new Tuple3<Object, Object, string>(objectValue, objectValue, "same");
      expect(tuple.length).assertEqual(3);
      expect(tuple.$0 === tuple.$1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2600
     * @tc.name testTupleLength026
     * @tc.desc Verify Tuple10 length with mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, string, string, boolean, boolean, double, float, char, string>(
      0, -1, "涓枃", "<script>alert(1)</script>", true, false, 1.5, 2.5 as float, c'Z', "emoji馃檪"
      );
      expect(tuple.length).assertEqual(10);
      expect(tuple.$0).assertEqual(0);
      expect(tuple.$9).assertEqual("emoji馃檪");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2700
     * @tc.name testTupleLength027
     * @tc.desc Verify Tuple length with array and nested Tuple container elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple3<int, string, boolean>(100, "inner", true);
      const tuple = new Tuple4<Array<int>, Array<string>, Tuple3<int, string, boolean>, string>(
      [0, -1, 42], ["", "English", "袪褍褋褋泻懈泄"], inner, "outer"
      );
      expect(tuple.length).assertEqual(4);
      expect(tuple.$0.length).assertEqual(3);
      expect(tuple.$1.length).assertEqual(3);
      expect(tuple.$2.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2800
     * @tc.name testTupleLength028
     * @tc.desc Verify Tuple length remains stable after iterator traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      const before: int = tuple.length;
      let count: int = 0;
      for (let item of tuple) {
        count += item as int;
      }
      const after: int = tuple.length;
      expect(before).assertEqual(3);
      expect(count).assertEqual(6);
      expect(after).assertEqual(before);
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2900
     * @tc.name testTupleLength029
     * @tc.desc Verify Tuple0 length toString returns string zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      expect(t0.length.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3000
     * @tc.name testTupleLength030
     * @tc.desc Verify Tuple10 length toString returns string ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(t10.length.toString()).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3100
     * @tc.name testTupleLength031
     * @tc.desc Verify Tuple2 with NaN double elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<double, double>(Double.NaN, Double.NaN);
      expect(t2.length).assertEqual(2);
      expect(t2.$0 !== t2.$0).assertTrue();
      expect(t2.$1 !== t2.$1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3200
     * @tc.name testTupleLength032
     * @tc.desc Verify Tuple2 with infinity double elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<double, double>(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(Double.POSITIVE_INFINITY);
      expect(t2.$1).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3300
     * @tc.name testTupleLength033
     * @tc.desc Verify Tuple2 with int boundary values stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, int>(2147483647, -2147483648);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(2147483647);
      expect(t2.$1).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3400
     * @tc.name testTupleLength034
     * @tc.desc Verify Tuple2 with long boundary values stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<long, long>(9223372036854775807, -9223372036854775807 - 1);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(9223372036854775807);
      expect(t2.$1).assertEqual(-9223372036854775807 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3500
     * @tc.name testTupleLength035
     * @tc.desc Verify Tuple2 with float elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<float, float>(1.5 as float, 2.5 as float);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(1.5 as float);
      expect(t2.$1).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3600
     * @tc.name testTupleLength036
     * @tc.desc Verify Tuple2 with byte and short elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<byte, short>(Int.toByte(1), Int.toShort(2));
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(Int.toByte(1));
      expect(t2.$1).assertEqual(Int.toShort(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3700
     * @tc.name testTupleLength037
     * @tc.desc Verify Tuple2 with very long string element stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = "a".repeat(10000);
      const t2 = new Tuple2<string, string>(big, "short");
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(big);
      expect(t2.$1).assertEqual("short");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3800
     * @tc.name testTupleLength038
     * @tc.desc Verify Tuple2 with Object elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Object();
      const obj2 = new Object();
      const t2 = new Tuple2<Object, Object>(obj1, obj2);
      expect(t2.length).assertEqual(2);
      expect(t2.$0 === obj1).assertTrue();
      expect(t2.$1 === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3900
     * @tc.name testTupleLength039
     * @tc.desc Verify Tuple2 with array elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int> = [1, 2];
      const arr2: Array<string> = ["a", "b"];
      const t2 = new Tuple2<Array<int>, Array<string>>(arr1, arr2);
      expect(t2.length).assertEqual(2);
      expect(t2.$0 === arr1).assertTrue();
      expect(t2.$1 === arr2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4000
     * @tc.name testTupleLength040
     * @tc.desc Verify outer Tuple length when elements are nested Tuple2 instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Tuple2<int, int>(1, 2);
      const inner2 = new Tuple2<int, int>(3, 4);
      const outer = new Tuple2<Tuple2<int, int>, Tuple2<int, int>>(inner1, inner2);
      expect(outer.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4100
     * @tc.name testTupleLength041
     * @tc.desc Verify Tuple length when all elements share the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Object();
      const t3 = new Tuple3<Object, Object, Object>(shared, shared, shared);
      expect(t3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4200
     * @tc.name testTupleLength042
     * @tc.desc Verify two Tuple2 with different generic types have equal length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, string>(1, "a");
      const b = new Tuple2<double, double>(1.1, 2.2);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4300
     * @tc.name testTupleLength043
     * @tc.desc Verify three Tuple2 instances with distinct generics all return length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, string>(1, "a");
      const b = new Tuple2<string, boolean>("x", false);
      const c = new Tuple2<double, double>(1.1, 2.2);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
      expect(c.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4400
     * @tc.name testTupleLength044
     * @tc.desc Verify Tuple array containing Tuple0 through Tuple10 returns correct length each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuples: Tuple[] = [
      new Tuple0(),
      new Tuple1<int>(1),
      new Tuple2<int, int>(1, 2),
      new Tuple3<int, int, int>(1, 2, 3),
      new Tuple4<int, int, int, int>(1, 2, 3, 4),
      new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5),
      new Tuple6<int, int, int, int, int, int>(1, 2, 3, 4, 5, 6),
      new Tuple7<int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7),
      new Tuple8<int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8),
      new Tuple9<int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9),
      new Tuple10<int, int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
      ];
      for (let i: int = 0; i < 11; i++) {
        expect(tuples[i].length).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4500
     * @tc.name testTupleLength045
     * @tc.desc Verify length remains constant after 100 repeated reads on the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      for (let i: int = 0; i < 100; i++) {
        expect(t5.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4600
     * @tc.name testTupleLength046
     * @tc.desc Verify multiple distinct Tuple2 instances all return length two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, int>(1, 2);
      const b = new Tuple2<int, int>(3, 4);
      const c = new Tuple2<int, int>(5, 6);
      expect(a.length).assertEqual(b.length);
      expect(b.length).assertEqual(c.length);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4700
     * @tc.name testTupleLength047
     * @tc.desc Verify Tuple10 length consistent with for-of iteration count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let count: int = 0;
      for (let item of t10) {
        count++;
      }
      expect(count).assertEqual(t10.length);
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4800
     * @tc.name testTupleLength048
     * @tc.desc Verify index-based for loop using length as upper bound on Tuple5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      let iterations: int = 0;
      for (let i: int = 0; i < t5.length; i++) {
        iterations++;
      }
      expect(iterations).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4900
     * @tc.name testTupleLength049
     * @tc.desc Verify while loop terminates when counter reaches Tuple3 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, int, int>(1, 2, 3);
      let i: int = 0;
      while (i < t3.length) {
        i++;
      }
      expect(i).assertEqual(t3.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5000
     * @tc.name testTupleLength050
     * @tc.desc Verify length used directly inside ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, int, int>(1, 2, 3);
      let label: string = t3.length > 0 ? "non-empty" : "empty";
      expect(label).assertEqual("non-empty");
      const t0 = new Tuple0();
      let emptyLabel: string = t0.length > 0 ? "non-empty" : "empty";
      expect(emptyLabel).assertEqual("empty");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5100
     * @tc.name testTupleLength051
     * @tc.desc Verify length used directly inside if condition without temp variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      let branch: string = "init";
      if (t0.length == 0) {
        branch = "empty";
      } else {
        branch = "non-empty";
      }
      expect(branch).assertEqual("empty");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5200
     * @tc.name testTupleLength052
     * @tc.desc Verify length used as switch case discriminator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t4 = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      let label: string = "";
      switch (t4.length) {
        case 0:
        label = "empty";
        break;
        case 4:
        label = "four";
        break;
        default:
        label = "other";
        break;
      }
      expect(label).assertEqual("four");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5300
     * @tc.name testTupleLength053
     * @tc.desc Verify length remains unchanged after multiple element reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, int, int>(10, 20, 30);
      let before: int = t3.length;
      let a: int = t3.$0;
      let b: int = t3.$1;
      let c: int = t3.$2;
      let after: int = t3.length;
      expect(before).assertEqual(3);
      expect(after).assertEqual(before);
      expect(a + b + c).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5400
     * @tc.name testTupleLength054
     * @tc.desc Verify sum of all Tuple0 through Tuple10 lengths equals fifty-five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      const t1 = new Tuple1<int>(1);
      const t2 = new Tuple2<int, int>(1, 2);
      const t3 = new Tuple3<int, int, int>(1, 2, 3);
      const t4 = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      const t6 = new Tuple6<int, int, int, int, int, int>(1, 2, 3, 4, 5, 6);
      const t7 = new Tuple7<int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7);
      const t8 = new Tuple8<int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8);
      const t9 = new Tuple9<int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9);
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let total: int = t0.length + t1.length + t2.length + t3.length + t4.length + t5.length + t6.length + t7.length + t8.length + t9.length + t10.length;
      expect(total).assertEqual(55);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5500
     * @tc.name testTupleLength055
     * @tc.desc Verify length read through Tuple interface type matches concrete length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      let asTuple: Tuple = t5;
      expect(asTuple.length).assertEqual(t5.length);
      expect(asTuple.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5600
     * @tc.name testTupleLength056
     * @tc.desc Verify Tuple9 length boundary value just below Tuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t9 = new Tuple9<int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9);
      expect(t9.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5700
     * @tc.name testTupleLength057
     * @tc.desc Verify Tuple length stable after iterator traversal completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(10, 20, 30, 40, 50);
      let before: int = t5.length;
      let sum: int = 0;
      for (let v of t5) {
        sum += v as int;
      }
      let after: int = t5.length;
      expect(before).assertEqual(5);
      expect(after).assertEqual(before);
      expect(sum).assertEqual(150);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5800
     * @tc.name testTupleLength058
     * @tc.desc Verify Tuple length used as termination guard in cumulative array build
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t6 = new Tuple6<int, int, int, int, int, int>(1, 2, 3, 4, 5, 6);
      let collected: int[] = [];
      let i: int = 0;
      while (i < t6.length) {
        collected.push(i);
        i++;
      }
      expect(collected.length as int).assertEqual(t6.length);
      expect(collected.length as int).assertEqual(6);
    });
  });
}
