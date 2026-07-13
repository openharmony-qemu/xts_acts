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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class TupleLengthHelpers {
  static makeTuple3(): Tuple3<int, int, int> {
    return new Tuple3<int, int, int>(1, 2, 3);
  }
  static readLength(t: Tuple): int {
    return t.length;
  }
  static echoInt(value: int): int {
    return value;
  }
}

class TupleLengthHolder074 {
  value: Tuple5<int, int, int, int, int>;
  constructor(value: Tuple5<int, int, int, int, int>) {
    this.value = value;
  }
}
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
     * @tc.desc Verify length returns the arity for every Tuple0 through Tuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuples: Tuple[] = [
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
      for (let i = 0; i < tuples.length; i++) {
        expect(tuples[i].length).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0200
     * @tc.name testTupleLength002
     * @tc.desc Verify Tuple2 int pair stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, int>(0, 0);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(0);
      expect(t2.$1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0300
     * @tc.name testTupleLength003
     * @tc.desc Verify Tuple2 boolean pair stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<boolean, boolean>(false, false);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertFalse();
      expect(t2.$1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0400
     * @tc.name testTupleLength004
     * @tc.desc Verify Tuple2 char pair stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<char, char>(c'A', c'B');
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(c'A');
      expect(t2.$1).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0500
     * @tc.name testTupleLength005
     * @tc.desc Verify Tuple2 mixed int-string stores and reads values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, string>(1, "one");
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(1);
      expect(t2.$1).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0600
     * @tc.name testTupleLength006
     * @tc.desc Verify length usable in string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, string>(1, "one");
      let len: int = t2.length;
      expect(len).assertEqual(2);
      expect(len.toString()).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0700
     * @tc.name testTupleLength007
     * @tc.desc Verify Tuple length accessible through Tuple interface type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, string>(1, "one");
      let tuple: Tuple = t2;
      expect(tuple.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0800
     * @tc.name testTupleLength008
     * @tc.desc Verify Tuple3 length returns same value on repeated reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, string, boolean>(1, "a", true);
      let len1: int = t3.length;
      let len2: int = t3.length;
      let len3: int = t3.length;
      expect(len1).assertEqual(3);
      expect(len2).assertEqual(3);
      expect(len3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_0900
     * @tc.name testTupleLength009
     * @tc.desc Verify Tuple3 length matches for-of iteration count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, string, boolean>(1, "a", true);
      let count: int = 0;
      for (let item of t3) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(count).assertEqual(t3.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1000
     * @tc.name testTupleLength010
     * @tc.desc Verify Tuple0 for-of yields zero iterations matching length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      let count: int = 0;
      for (let item of t0) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(t0.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1100
     * @tc.name testTupleLength011
     * @tc.desc Verify Tuple length is stable after repeated reads on mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string, string, int, boolean>("\u4E2D\u6587", "emoji\uD83D\uDE42", 2147483647, false);
      let first: int = tuple.length;
      let second: int = tuple.length;
      let third: int = tuple.length;
      expect(first).assertEqual(4);
      expect(second).assertEqual(first);
      expect(third).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1200
     * @tc.name testTupleLength012
     * @tc.desc Verify Tuple length with nested tuple and array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Tuple2<int, string>(-2147483648, "\u0627\u0644\u0639\u0631\u0628\u064A\u0629");
      const tuple = new Tuple3<Tuple2<int, string>, Array<int>, string>(nested, [1, 2, 3], "日本語");
      expect(tuple.length).assertEqual(3);
      expect(tuple.$0.length).assertEqual(2);
      expect(tuple.$1.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1300
     * @tc.name testTupleLength013
     * @tc.desc Verify Tuple length with null and undefined union element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string | null, string | undefined, int, boolean>(null, undefined, 42, false);
      expect(tuple.length).assertEqual(4);
      expect(tuple.$0).assertEqual(null);
      expect(tuple.$1).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1400
     * @tc.name testTupleLength014
     * @tc.desc Verify Tuple length is independent from repeated object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectValue = new Object();
      const tuple = new Tuple3<Object, Object, string>(objectValue, objectValue, "same");
      expect(tuple.length).assertEqual(3);
      expect(tuple.$0).assertEqual(tuple.$1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1500
     * @tc.name testTupleLength015
     * @tc.desc Verify Tuple10 length with mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, string, string, boolean, boolean, double, float, char, string>(
      0, -1, "\u4E2D\u6587", "<script>alert(1)</script>", true, false, 1.5, 2.5 as float, c'Z', "emoji\uD83D\uDE42"
      );
      expect(tuple.length).assertEqual(10);
      expect(tuple.$0).assertEqual(0);
      expect(tuple.$9).assertEqual("emoji\uD83D\uDE42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1600
     * @tc.name testTupleLength016
     * @tc.desc Verify Tuple length with array and nested Tuple container elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple3<int, string, boolean>(100, "inner", true);
      const tuple = new Tuple4<Array<int>, Array<string>, Tuple3<int, string, boolean>, string>(
      [0, -1, 42], ["", "English", "\u0420\u0443\u0441\u0441\u043A\u0438\u0439"], inner, "outer"
      );
      expect(tuple.length).assertEqual(4);
      expect(tuple.$0.length).assertEqual(3);
      expect(tuple.$1.length).assertEqual(3);
      expect(tuple.$2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1700
     * @tc.name testTupleLength017
     * @tc.desc Verify Tuple length remains stable after iterator traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1800
     * @tc.name testTupleLength018
     * @tc.desc Verify Tuple0 length toString returns string zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      expect(t0.length.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_1900
     * @tc.name testTupleLength019
     * @tc.desc Verify Tuple10 length toString returns string ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(2147483647, -2147483648, 0, -1, 1, 100, -100, 42, 99, -99);
      expect(t10.length.toString()).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2000
     * @tc.name testTupleLength020
     * @tc.desc Verify Tuple2 with NaN double elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<double, double>(Double.NaN, Double.NaN);
      expect(t2.length).assertEqual(2);
      expect(isNaN(t2.$0)).assertTrue();
      expect(isNaN(t2.$1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2100
     * @tc.name testTupleLength021
     * @tc.desc Verify Tuple2 with infinity double elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<double, double>(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(Double.POSITIVE_INFINITY);
      expect(t2.$1).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2200
     * @tc.name testTupleLength022
     * @tc.desc Verify Tuple2 with int boundary values stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<int, int>(2147483647, -2147483648);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(2147483647);
      expect(t2.$1).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2300
     * @tc.name testTupleLength023
     * @tc.desc Verify Tuple2 with long boundary values stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<long, long>(9223372036854775807, -9223372036854775807 - 1);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(9223372036854775807);
      expect(t2.$1).assertEqual(-9223372036854775807 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2400
     * @tc.name testTupleLength024
     * @tc.desc Verify Tuple2 with float elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<float, float>(1.5 as float, 2.5 as float);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(1.5 as float);
      expect(t2.$1).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2500
     * @tc.name testTupleLength025
     * @tc.desc Verify Tuple2 with byte and short elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t2 = new Tuple2<byte, short>(Int.toByte(1), Int.toShort(2));
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(Int.toByte(1));
      expect(t2.$1).assertEqual(Int.toShort(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2600
     * @tc.name testTupleLength026
     * @tc.desc Verify Tuple2 with very long string element stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = "a".repeat(10000);
      const t2 = new Tuple2<string, string>(big, "short");
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(big);
      expect(t2.$1).assertEqual("short");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2700
     * @tc.name testTupleLength027
     * @tc.desc Verify Tuple2 with Object elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Object();
      const obj2 = new Object();
      const t2 = new Tuple2<Object, Object>(obj1, obj2);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(obj1);
      expect(t2.$1).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2800
     * @tc.name testTupleLength028
     * @tc.desc Verify Tuple2 with array elements stores and reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int> = [1, 2];
      const arr2: Array<string> = ["a", "b"];
      const t2 = new Tuple2<Array<int>, Array<string>>(arr1, arr2);
      expect(t2.length).assertEqual(2);
      expect(t2.$0).assertEqual(arr1);
      expect(t2.$1).assertEqual(arr2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_2900
     * @tc.name testTupleLength029
     * @tc.desc Verify outer Tuple length when elements are nested Tuple2 instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Tuple2<int, int>(1, 2);
      const inner2 = new Tuple2<int, int>(3, 4);
      const outer = new Tuple2<Tuple2<int, int>, Tuple2<int, int>>(inner1, inner2);
      expect(outer.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3000
     * @tc.name testTupleLength030
     * @tc.desc Verify Tuple length when all elements share the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Object();
      const t3 = new Tuple3<Object, Object, Object>(shared, shared, shared);
      expect(t3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3100
     * @tc.name testTupleLength031
     * @tc.desc Verify two Tuple2 with different generic types have equal length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, string>(1, "a");
      const b = new Tuple2<double, double>(1.1, 2.2);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3200
     * @tc.name testTupleLength032
     * @tc.desc Verify three Tuple2 instances with distinct generics all return length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, string>(1, "a");
      const b = new Tuple2<string, boolean>("x", false);
      const c = new Tuple2<double, double>(1.1, 2.2);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
      expect(c.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3300
     * @tc.name testTupleLength033
     * @tc.desc Verify Tuple array containing Tuple0 through Tuple10 returns correct length each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3400
     * @tc.name testTupleLength034
     * @tc.desc Verify length remains constant after 100 repeated reads on the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      for (let i: int = 0; i < 100; i++) {
        expect(t5.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3500
     * @tc.name testTupleLength035
     * @tc.desc Verify multiple distinct Tuple2 instances all return length two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, int>(1, 2);
      const b = new Tuple2<int, int>(3, 4);
      const c = new Tuple2<int, int>(5, 6);
      expect(a.length).assertEqual(b.length);
      expect(b.length).assertEqual(c.length);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3600
     * @tc.name testTupleLength036
     * @tc.desc Verify Tuple10 length consistent with for-of iteration count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let count: int = 0;
      for (let item of t10) {
        count++;
      }
      expect(count).assertEqual(t10.length);
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3700
     * @tc.name testTupleLength037
     * @tc.desc Verify index-based for loop using length as upper bound on Tuple5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      let iterations: int = 0;
      for (let i: int = 0; i < t5.length; i++) {
        iterations++;
      }
      expect(iterations).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3800
     * @tc.name testTupleLength038
     * @tc.desc Verify while loop terminates when counter reaches Tuple3 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, int, int>(1, 2, 3);
      let i: int = 0;
      while (i < t3.length) {
        i++;
      }
      expect(i).assertEqual(t3.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_3900
     * @tc.name testTupleLength039
     * @tc.desc Verify length used directly inside ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t3 = new Tuple3<int, int, int>(1, 2, 3);
      let label: string = t3.length > 0 ? "non-empty" : "empty";
      expect(label).assertEqual("non-empty");
      const t0 = new Tuple0();
      let emptyLabel: string = t0.length > 0 ? "non-empty" : "empty";
      expect(emptyLabel).assertEqual("empty");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4000
     * @tc.name testTupleLength040
     * @tc.desc Verify length used directly inside if condition without temp variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4100
     * @tc.name testTupleLength041
     * @tc.desc Verify length used as switch case discriminator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4200
     * @tc.name testTupleLength042
     * @tc.desc Verify length remains unchanged after multiple element reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4300
     * @tc.name testTupleLength043
     * @tc.desc Verify each Tuple0 through Tuple10 length equals its type parameter count N
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Tuple0().length).assertEqual(0);
      expect(new Tuple1<int>(1).length).assertEqual(1);
      expect(new Tuple2<int, int>(1, 2).length).assertEqual(2);
      expect(new Tuple3<int, int, int>(1, 2, 3).length).assertEqual(3);
      expect(new Tuple4<int, int, int, int>(1, 2, 3, 4).length).assertEqual(4);
      expect(new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5).length).assertEqual(5);
      expect(new Tuple6<int, int, int, int, int, int>(1, 2, 3, 4, 5, 6).length).assertEqual(6);
      expect(new Tuple7<int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7).length).assertEqual(7);
      expect(new Tuple8<int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8).length).assertEqual(8);
      expect(new Tuple9<int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9).length).assertEqual(9);
      expect(new Tuple10<int, int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10).length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4400
     * @tc.name testTupleLength044
     * @tc.desc Verify length read through Tuple interface type matches concrete length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      let asTuple: Tuple = t5;
      expect(asTuple.length).assertEqual(t5.length);
      expect(asTuple.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4500
     * @tc.name testTupleLength045
     * @tc.desc Verify Tuple9 length boundary value just below Tuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t9 = new Tuple9<int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9);
      expect(t9.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4600
     * @tc.name testTupleLength046
     * @tc.desc Verify Tuple length stable after iterator traversal completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4700
     * @tc.name testTupleLength047
     * @tc.desc Verify Tuple length used as termination guard in cumulative array build
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4800
     * @tc.name testTupleLength048
     * @tc.desc Verify length returns int and matches positive primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(1);
      let value: int = tuple.length;
      expect(value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_4900
     * @tc.name testTupleLength049
     * @tc.desc Verify Tuple1 length minus one equals valid unsafeGet head index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(99);
      expect(tuple.length - 1).assertEqual(0);
      expect(tuple.unsafeGet(tuple.length - 1) as int).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5000
     * @tc.name testTupleLength050
     * @tc.desc Verify Tuple3 length count matches constructor argument count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(11, 22, 33);
      expect(tuple.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5100
     * @tc.name testTupleLength051
     * @tc.desc Verify length correct across Tuple1 through Tuple5 with homogeneous long double byte char string boolean Map Set element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Tuple2<long, long>(Int.toLong(1), Int.toLong(2)).length).assertEqual(2);
      expect(new Tuple4<double, double, double, double>(1.1, 2.2, 3.3, 4.4).length).assertEqual(4);
      expect(new Tuple3<byte, byte, byte>(Int.toByte(1), Int.toByte(2), Int.toByte(3)).length).assertEqual(3);
      expect(new Tuple5<char, char, char, char, char>(c'a', c'b', c'c', c'd', c'e').length).assertEqual(5);
      expect(new Tuple3<string, string, string>("x", "y", "z").length).assertEqual(3);
      expect(new Tuple4<boolean, boolean, boolean, boolean>(true, false, true, false).length).assertEqual(4);
      let map = new Map<string, int>();
      map.set("k", 1);
      expect(new Tuple1<Map<string, int>>(map).length).assertEqual(1);
      let set = new Set<int>();
      set.add(1);
      set.add(2);
      expect(new Tuple1<Set<int>>(set).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5200
     * @tc.name testTupleLength052
     * @tc.desc Verify length read from function return value works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = TupleLengthHelpers.makeTuple3();
      expect(tuple.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5300
     * @tc.name testTupleLength053
     * @tc.desc Verify length read inside helper function via parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      let observed: int = TupleLengthHelpers.readLength(tuple);
      expect(observed).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5400
     * @tc.name testTupleLength054
     * @tc.desc Verify length read when Tuple stored as class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new TupleLengthHolder074(new Tuple5<int, int, int, int, int>(10, 20, 30, 40, 50));
      expect(holder.value.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5500
     * @tc.name testTupleLength055
     * @tc.desc Verify length read when Tuple stored as Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      const map = new Map<string, Tuple3<int, int, int>>();
      map.set("a", tuple);
      let stored = map.get("a")!;
      expect(stored.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5600
     * @tc.name testTupleLength056
     * @tc.desc Verify length read when Tuple stored inside Array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuples: Array<Tuple4<int, int, int, int>> = [
        new Tuple4<int, int, int, int>(1, 2, 3, 4),
        new Tuple4<int, int, int, int>(5, 6, 7, 8)
      ];
      expect(tuples[0].length).assertEqual(4);
      expect(tuples[1].length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5700
     * @tc.name testTupleLength057
     * @tc.desc Verify outer and inner Tuple length values are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      const outer = new Tuple2<Tuple5<int, int, int, int, int>, string>(inner, "label");
      expect(outer.length).assertEqual(2);
      expect(inner.length).assertEqual(5);
      expect(outer.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5800
     * @tc.name testTupleLength058
     * @tc.desc Verify three layer nested Tuple length values are independent at each level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple1<int>(1);
      const middle = new Tuple2<Tuple1<int>, int>(inner, 2);
      const outer = new Tuple3<Tuple2<Tuple1<int>, int>, int, int>(middle, 3, 4);
      expect(inner.length).assertEqual(1);
      expect(middle.length).assertEqual(2);
      expect(outer.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_5900
     * @tc.name testTupleLength059
     * @tc.desc Verify length matches unsafeGet iteration count without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      let visited: int = 0;
      for (let i: int = 0; i < tuple.length; i++) {
        let value: int = tuple.unsafeGet(i) as int;
        expect(value).assertEqual(i + 1);
        visited++;
      }
      expect(visited).assertEqual(tuple.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6000
     * @tc.name testTupleLength060
     * @tc.desc Verify length used as unsafeGet argument always throws out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      try {
        tuple.unsafeGet(tuple.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(tuple.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6100
     * @tc.name testTupleLength061
     * @tc.desc Verify length value remains stable after a caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(7, 8, 9);
      let before: int = tuple.length;
      try {
        tuple.unsafeGet(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      let after: int = tuple.length;
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6200
     * @tc.name testTupleLength062
     * @tc.desc Verify length read inside try block matches length in catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      let inTry: int = -1;
      let inCatch: int = -1;
      try {
        inTry = tuple.length;
        tuple.unsafeGet(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
        inCatch = tuple.length;
      }
      expect(inTry).assertEqual(4);
      expect(inCatch).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6300
     * @tc.name testTupleLength063
     * @tc.desc Verify length used in descending for loop reaches index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(10, 20, 30, 40);
      let visited: int = 0;
      for (let i: int = tuple.length - 1; i >= 0; i--) {
        visited++;
      }
      expect(visited).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6400
     * @tc.name testTupleLength064
     * @tc.desc Verify nested loops use outer length and inner length independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = new Tuple3<int, int, int>(1, 2, 3);
      const inner = new Tuple2<int, int>(10, 20);
      let pairs: int = 0;
      for (let i: int = 0; i < outer.length; i++) {
        for (let j: int = 0; j < inner.length; j++) {
          pairs++;
        }
      }
      expect(pairs).assertEqual(6);
      expect(outer.length).assertEqual(3);
      expect(inner.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6500
     * @tc.name testTupleLength065
     * @tc.desc Verify Tuple10 length is 10 and can be used in int comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      );
      expect(tuple.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6600
     * @tc.name testTupleLength066
     * @tc.desc Verify length value can be used in arithmetic multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      let doubled: int = tuple.length * 2;
      expect(doubled).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6700
     * @tc.name testTupleLength067
     * @tc.desc Verify special numeric values (NaN +Inf -Inf long max/min byte/short truncation) do not affect Tuple length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Tuple1<double>(Double.NaN).length).assertEqual(1);
      expect(new Tuple1<double>(Double.POSITIVE_INFINITY).length).assertEqual(1);
      expect(new Tuple1<double>(Double.NEGATIVE_INFINITY).length).assertEqual(1);
      expect(new Tuple1<long>(9223372036854775807).length).assertEqual(1);
      expect(new Tuple1<long>(-9223372036854775807 - 1).length).assertEqual(1);
      expect(new Tuple3<byte, byte, byte>(Int.toByte(128), Int.toByte(-129), Int.toByte(0)).length).assertEqual(3);
      expect(new Tuple3<short, short, short>(Int.toShort(32768), Int.toShort(-32769), Int.toShort(0)).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6800
     * @tc.name testTupleLength068
     * @tc.desc Verify special string values (long empty surrogate CJK) do not affect Tuple1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = "x".repeat(5000);
      expect(new Tuple1<string>(big).length).assertEqual(1);
      expect(new Tuple1<string>("").length).assertEqual(1);
      expect(new Tuple1<string>("\uD83D\uDE00").length).assertEqual(1);
      expect(new Tuple1<string>("\u4E2D\u6587\u30C6\u30B9\u30C8").length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_6900
     * @tc.name testTupleLength069
     * @tc.desc Verify special container values (empty array large array) do not affect Tuple1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Tuple1<Array<int>>(new Array<int>()).length).assertEqual(1);
      let data: Array<int> = new Array<int>();
      for (let i: int = 0; i < 1000; i++) {
        data.push(i);
      }
      expect(new Tuple1<Array<int>>(data).length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7000
     * @tc.name testTupleLength070
     * @tc.desc Verify length value used as Array index expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      const arr: Array<int> = [10, 20, 30, 40, 50];
      let value: int = arr[tuple.length];
      expect(value).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7100
     * @tc.name testTupleLength071
     * @tc.desc Verify length value used in comparison with constant produces correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      expect(tuple.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7200
     * @tc.name testTupleLength072
     * @tc.desc Verify length read after mutating array element inside Tuple stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Array<int> = [1, 2, 3];
      const tuple = new Tuple2<Array<int>, string>(inner, "tag");
      inner.push(99);
      expect(tuple.length).assertEqual(2);
      expect(tuple.$0.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7300
     * @tc.name testTupleLength073
     * @tc.desc Verify Tuple length matches array of NullishType length via traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      const collected: Array<Any> = [];
      for (let i: int = 0; i < tuple.length; i++) {
        collected.push(tuple.unsafeGet(i));
      }
      expect(collected.length as int).assertEqual(tuple.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7400
     * @tc.name testTupleLength074
     * @tc.desc Verify mixed Tuple of int double string boolean returns length four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, double, string, boolean>(1, 2.5, "abc", true);
      expect(tuple.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7500
     * @tc.name testTupleLength075
     * @tc.desc Verify length used as sentinel in do-while loop terminates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      let i: int = 0;
      let visits: int = 0;
      do {
        visits++;
        i++;
      } while (i < tuple.length);
      expect(visits).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7600
     * @tc.name testTupleLength076
     * @tc.desc Verify Tuple0 length used in do-while still iterates once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple0();
      let visits: int = 0;
      let i: int = 0;
      do {
        visits++;
        i++;
      } while (i < tuple.length);
      expect(visits).assertEqual(1);
      expect(tuple.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7700
     * @tc.name testTupleLength077
     * @tc.desc Verify length ordering across Tuple0 Tuple1 Tuple10 and length stability through traversal arithmetic and exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t0 = new Tuple0();
      const t1 = new Tuple1<int>(1);
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      );
      expect(t0.length).assertEqual(0);
      expect(t1.length).assertEqual(1);
      expect(t10.length).assertEqual(10);
      expect(t10.length - t0.length).assertEqual(10);
      let initial: int = t10.length;
      let traversal: int = 0;
      for (let i: int = 0; i < t10.length; i++) {
        traversal++;
      }
      expect(traversal).assertEqual(initial);
      let doubled: int = t10.length * 2;
      expect(doubled).assertEqual(20);
      try {
        t10.unsafeGet(t10.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(t10.length).assertEqual(initial);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7800
     * @tc.name testTupleLength078
     * @tc.desc Verify length matches the explicit element count after reconstruction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple3<int, int, int>(1, 2, 3);
      const b = new Tuple3<int, int, int>(a.$0, a.$1, a.$2);
      expect(b.length).assertEqual(a.length);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_7900
     * @tc.name testTupleLength079
     * @tc.desc Verify length when Tuple holds function-style callable element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const callable: () => int = (): int => 42;
      const tuple = new Tuple2<() => int, string>(callable, "callable");
      expect(tuple.length).assertEqual(2);
      expect(tuple.$0()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_LENGTH_8000
     * @tc.name testTupleLength080
     * @tc.desc Verify length matches sum result built from element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleLength080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<int, int, int, int, int>(1, 1, 1, 1, 1);
      let sum: int = 0;
      for (let v of tuple) {
        sum += v as int;
      }
      expect(sum).assertEqual(tuple.length);
      expect(tuple.length).assertEqual(5);
    });

  });
}
