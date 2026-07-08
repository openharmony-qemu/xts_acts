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

class TupleUnsafeGetItem091 {
  id: int = 0;
  name: string = "";
  constructor(id: int, name: string) {
    this.id = id;
    this.name = name;
  }
}

type Tuple10Int = Tuple10<int, int, int, int, int, int, int, int, int, int>;
export default function TupleUnsafeGetTest(): void {
  describe('TupleUnsafeGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0010
     * @tc.name testTupleUnsafeGet001
     * @tc.desc Verify unsafeGet reads int value at index 0 of Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      expect(pair.unsafeGet(0) as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0020
     * @tc.name testTupleUnsafeGet002
     * @tc.desc Verify unsafeGet reads string value at index 1 of Tuple3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const triple = new Tuple3<int, string, boolean>(1, "one", true);
      expect(triple.unsafeGet(1) as string).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0030
     * @tc.name testTupleUnsafeGet003
     * @tc.desc Verify unsafeGet reads int value at index 2 of Tuple5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple5<int, int, int, int, int>(10, 20, 30, 40, 50);
      expect(t.unsafeGet(2) as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0040
     * @tc.name testTupleUnsafeGet004
     * @tc.desc Verify unsafeGet reads int value at index 0 of Tuple1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<int>(42);
      expect(single.unsafeGet(0) as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0050
     * @tc.name testTupleUnsafeGet005
     * @tc.desc Verify unsafeGet reads int value at last index of Tuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple10Int(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      expect(t.unsafeGet(9) as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0060
     * @tc.name testTupleUnsafeGet006
     * @tc.desc Verify unsafeGet throws Error on min int negative out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      try {
        pair.unsafeGet(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0070
     * @tc.name testTupleUnsafeGet007
     * @tc.desc Verify unsafeGet reads string value at index 1 of Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "world");
      expect(pair.unsafeGet(1) as string).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0080
     * @tc.name testTupleUnsafeGet008
     * @tc.desc Verify unsafeGet reads boolean true value at index 0 of Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<boolean, int>(true, 1);
      expect(t.unsafeGet(0) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0090
     * @tc.name testTupleUnsafeGet009
     * @tc.desc Verify unsafeGet reads double value at index 0 of Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<double, string>(3.14, "pi");
      expect(t.unsafeGet(0) as double).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0100
     * @tc.name testTupleUnsafeGet010
     * @tc.desc Verify unsafeGet reads char value at index 0 of Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<char, int>(c'A', 65);
      expect(t.unsafeGet(0) as char).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0110
     * @tc.name testTupleUnsafeGet011
     * @tc.desc Verify unsafeGet reads nested Tuple2 values by chained unsafeGet calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple2<int, int>(1, 2);
      const outer = new Tuple2<string, Tuple2<int, int>>("pair", inner);
      let val = outer.unsafeGet(1) as Tuple2<int, int>;
      expect(val.unsafeGet(0) as int).assertEqual(1);
      expect(val.unsafeGet(1) as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0120
     * @tc.name testTupleUnsafeGet012
     * @tc.desc Verify unsafeGet reads empty string value with zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple1<string>("");
      let val = t.unsafeGet(0) as string;
      expect(val).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0130
     * @tc.name testTupleUnsafeGet013
     * @tc.desc Verify unsafeGet reads boolean false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple1<boolean>(false);
      expect(t.unsafeGet(0) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0140
     * @tc.name testTupleUnsafeGet014
     * @tc.desc Verify unsafeGet reads negative int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple1<int>(-100);
      expect(t.unsafeGet(0) as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0150
     * @tc.name testTupleUnsafeGet015
     * @tc.desc Verify unsafeGet reads int max and min boundary values from Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<int, int>(2147483647, -2147483648);
      expect(t.unsafeGet(0) as int).assertEqual(2147483647);
      expect(t.unsafeGet(1) as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0160
     * @tc.name testTupleUnsafeGet016
     * @tc.desc Verify unsafeGet result assigned to Any variable retains int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      let val: Any = pair.unsafeGet(0);
      let intVal: int = val as int;
      expect(intVal).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0170
     * @tc.name testTupleUnsafeGet017
     * @tc.desc Verify unsafeGet reads all three values from Tuple3 by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple3<int, string, boolean>(1, "one", true);
      expect(t.unsafeGet(0) as int).assertEqual(1);
      expect(t.unsafeGet(1) as string).assertEqual("one");
      expect(t.unsafeGet(2) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0180
     * @tc.name testTupleUnsafeGet018
     * @tc.desc Verify unsafeGet reads single string value from Tuple1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<string>("only");
      expect(single.unsafeGet(0) as string).assertEqual("only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0190
     * @tc.name testTupleUnsafeGet019
     * @tc.desc Verify unsafeGet iterates all Tuple10 indexes matching values 0 through 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple10Int(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      let sum: int = 0;
      for (let i: int = 0; i < 10; i++) {
        let val: int = t.unsafeGet(i) as int;
        expect(val).assertEqual(i);
        sum += val;
      }
      expect(sum).assertEqual(45);
      expect(t.unsafeGet(0) as int).assertEqual(0);
      expect(t.unsafeGet(9) as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0200
     * @tc.name testTupleUnsafeGet020
     * @tc.desc Verify unsafeGet repeated reads at same index return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      let v1 = pair.unsafeGet(0) as int;
      let v2 = pair.unsafeGet(0) as int;
      expect(v1).assertEqual(1);
      expect(v2).assertEqual(v1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0210
     * @tc.name testTupleUnsafeGet021
     * @tc.desc Verify unsafeGet throws Error on out-of-bounds index 3 of Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      try {
        pair.unsafeGet(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0220
     * @tc.name testTupleUnsafeGet022
     * @tc.desc Verify Tuple0 unsafeGet throws Error on out-of-bounds index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Tuple0();
      try {
        empty.unsafeGet(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0230
     * @tc.name testTupleUnsafeGet023
     * @tc.desc Verify Tuple5 unsafeGet throws Error on max int out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      try {
        t5.unsafeGet(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0240
     * @tc.name testTupleUnsafeGet024
     * @tc.desc Verify Tuple1 unsafeGet throws Error on out-of-bounds index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<int>(42);
      try {
        single.unsafeGet(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0250
     * @tc.name testTupleUnsafeGet025
     * @tc.desc Verify Tuple3 unsafeGet throws Error on out-of-bounds index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const triple = new Tuple3<int, string, boolean>(1, "one", true);
      try {
        triple.unsafeGet(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0260
     * @tc.name testTupleUnsafeGet026
     * @tc.desc Verify Tuple10 unsafeGet throws Error on out-of-bounds index 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple10Int(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      try {
        t.unsafeGet(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0270
     * @tc.name testTupleUnsafeGet027
     * @tc.desc Verify unsafeGet reads multilingual string values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("\u65E5\u672C\u8A9E", "emoji\uD83D\uDE42", "<script>");
      let first = tuple.unsafeGet(0) as string;
      let second = tuple.unsafeGet(1) as string;
      let third = tuple.unsafeGet(2) as string;
      expect(first).assertEqual("\u65E5\u672C\u8A9E");
      expect(second).assertEqual("emoji\uD83D\uDE42");
      expect(third).assertEqual("<script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0280
     * @tc.name testTupleUnsafeGet028
     * @tc.desc Verify unsafeGet repeated access returns stable boundary int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, int>(2147483647, -2147483648);
      let firstRead = tuple.unsafeGet(0) as int;
      let secondRead = tuple.unsafeGet(0) as int;
      let minRead = tuple.unsafeGet(1) as int;
      expect(firstRead).assertEqual(2147483647);
      expect(secondRead).assertEqual(firstRead);
      expect(minRead).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0290
     * @tc.name testTupleUnsafeGet029
     * @tc.desc Verify unsafeGet preserves object reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectValue = new Object();
      const tuple = new Tuple2<Object, Object>(objectValue, objectValue);
      let first = tuple.unsafeGet(0) as Object;
      let second = tuple.unsafeGet(1) as Object;
      expect(first).assertEqual(objectValue);
      expect(second).assertEqual(objectValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0300
     * @tc.name testTupleUnsafeGet030
     * @tc.desc Verify unsafeGet reads null and undefined union values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string | null, string | undefined, int>(null, undefined, 42);
      let first = tuple.unsafeGet(0) as string | null;
      let second = tuple.unsafeGet(1) as string | undefined;
      let third = tuple.unsafeGet(2) as int;
      expect(first).assertEqual(null);
      expect(second).assertEqual(undefined);
      expect(third).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0310
     * @tc.name testTupleUnsafeGet031
     * @tc.desc Verify unsafeGet reads array values without changing contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<Array<int>, Array<string>>([0, -1, 42], ["", "English", "\u0420\u0443\u0441\u0441\u043A\u0438\u0439"]);
      let intValues = tuple.unsafeGet(0) as Array<int>;
      let stringValues = tuple.unsafeGet(1) as Array<string>;
      expect(intValues.length).assertEqual(3);
      expect(intValues[1]).assertEqual(-1);
      expect(stringValues[0]).assertEqual("");
      expect(stringValues[2]).assertEqual("\u0420\u0443\u0441\u0441\u043A\u0438\u0439");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0320
     * @tc.name testTupleUnsafeGet032
     * @tc.desc Verify unsafeGet reads nested Tuple and accesses inner fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple3<int, string, boolean>(100, "inner", true);
      const tuple = new Tuple2<Tuple3<int, string, boolean>, string>(inner, "outer");
      let nested = tuple.unsafeGet(0) as Tuple3<int, string, boolean>;
      let label = tuple.unsafeGet(1) as string;
      expect(nested.length).assertEqual(3);
      expect(nested.$0).assertEqual(100);
      expect(nested.$2).assertTrue();
      expect(label).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0330
     * @tc.name testTupleUnsafeGet033
     * @tc.desc Verify unsafeGet reads Tuple10 mixed boundary values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, string, string, boolean, boolean, double, float, char, string>(
      0, -1, "\u4E2D\u6587", "<script>alert(1)</script>", true, false, 1.5, 2.5 as float, c'Z', "emoji\uD83D\uDE42"
      );
      expect(tuple.unsafeGet(0) as int).assertEqual(0);
      expect(tuple.unsafeGet(1) as int).assertEqual(-1);
      expect(tuple.unsafeGet(2) as string).assertEqual("\u4E2D\u6587");
      expect(tuple.unsafeGet(3) as string).assertEqual("<script>alert(1)</script>");
      expect(tuple.unsafeGet(4) as boolean).assertTrue();
      expect(tuple.unsafeGet(5) as boolean).assertFalse();
      expect(tuple.unsafeGet(9) as string).assertEqual("emoji\uD83D\uDE42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0340
     * @tc.name testTupleUnsafeGet034
     * @tc.desc Verify unsafeGet reads float double and char values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<float, double, char>(2.5 as float, 3.1415926, c'Q');
      let floatValue = tuple.unsafeGet(0) as float;
      let doubleValue = tuple.unsafeGet(1) as double;
      let charValue = tuple.unsafeGet(2) as char;
      expect(floatValue).assertEqual(2.5 as float);
      expect(doubleValue).assertEqual(3.1415926);
      expect(charValue).assertEqual(c'Q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0350
     * @tc.name testTupleUnsafeGet035
     * @tc.desc Verify unsafeGet index range matches Tuple length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(10, 20, 30, 40);
      let sum: int = 0;
      for (let index: int = 0; index < tuple.length; index++) {
        sum += tuple.unsafeGet(index) as int;
      }
      expect(tuple.length).assertEqual(4);
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0360
     * @tc.name testTupleUnsafeGet036
     * @tc.desc Verify unsafeGet values match for-of traversal order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(3, 4, 5);
      let iteratorSum: int = 0;
      let expected: int = 3;
      let count: int = 0;
      for (let item of tuple) {
        let val: int = item as int;
        expect(val).assertEqual(expected);
        iteratorSum += val;
        count++;
        expected++;
      }
      expect(count).assertEqual(3);
      let unsafeSum: int = (tuple.unsafeGet(0) as int) + (tuple.unsafeGet(1) as int) + (tuple.unsafeGet(2) as int);
      expect(iteratorSum).assertEqual(12);
      expect(unsafeSum).assertEqual(iteratorSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0370
     * @tc.name testTupleUnsafeGet037
     * @tc.desc Verify Tuple0 unsafeGet failure does not create accessible value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple0();
      try {
        tuple.unsafeGet(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(tuple.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0380
     * @tc.name testTupleUnsafeGet038
     * @tc.desc Verify unsafeGet reads mixed object array and primitive values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectValue = new Object();
      const tuple = new Tuple4<Object, Array<int>, string, boolean>(objectValue, [1, 2, 3], "value", false);
      let first = tuple.unsafeGet(0) as Object;
      let second = tuple.unsafeGet(1) as Array<int>;
      let third = tuple.unsafeGet(2) as string;
      let fourth = tuple.unsafeGet(3) as boolean;
      expect(first).assertEqual(objectValue);
      expect(second.length).assertEqual(3);
      expect(second[2]).assertEqual(3);
      expect(third).assertEqual("value");
      expect(fourth).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0390
     * @tc.name testTupleUnsafeGet039
     * @tc.desc Verify unsafeGet reads negative int empty string and boolean combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, string, boolean>(-1, "", false);
      let v0: int = tuple.unsafeGet(0) as int;
      let v1: string = tuple.unsafeGet(1) as string;
      let v2: boolean = tuple.unsafeGet(2) as boolean;
      expect(v0).assertEqual(-1);
      expect(v1).assertEqual("");
      expect(v2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0400
     * @tc.name testTupleUnsafeGet040
     * @tc.desc Verify unsafeGet repeated reads on different indexes stay stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, string, boolean>(100, "repeat", true);
      let firstInt = tuple.unsafeGet(0) as int;
      let firstString = tuple.unsafeGet(1) as string;
      let secondInt = tuple.unsafeGet(0) as int;
      let firstBoolean = tuple.unsafeGet(2) as boolean;
      let secondString = tuple.unsafeGet(1) as string;
      expect(firstInt).assertEqual(secondInt);
      expect(firstString).assertEqual(secondString);
      expect(firstBoolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0410
     * @tc.name testTupleUnsafeGet041
     * @tc.desc Verify unsafeGet reads nested array container values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<Array<Array<int>>, string>([[1, 2], [3, 4]], "matrix");
      let matrix = tuple.unsafeGet(0) as Array<Array<int>>;
      let label = tuple.unsafeGet(1) as string;
      expect(matrix.length).assertEqual(2);
      expect(matrix[0][1]).assertEqual(2);
      expect(matrix[1][0]).assertEqual(3);
      expect(label).assertEqual("matrix");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0420
     * @tc.name testTupleUnsafeGet042
     * @tc.desc Verify repeated out-of-bounds unsafeGet calls keep throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(1);
      try {
        tuple.unsafeGet(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      try {
        tuple.unsafeGet(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(tuple.unsafeGet(0) as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0430
     * @tc.name testTupleUnsafeGet043
     * @tc.desc Verify unsafeGet reads first and last legal indexes of Tuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10Int(
      10, 18, 20, 23, 24, 27, 31, 33, 39, 46
      );
      let first = tuple.unsafeGet(0) as int;
      let last = tuple.unsafeGet(tuple.length - 1) as int;
      expect(first).assertEqual(10);
      expect(last).assertEqual(46);
      expect(tuple.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0440
     * @tc.name testTupleUnsafeGet044
     * @tc.desc Verify unsafeGet reads Chinese Arabic and Russian strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("\u4E2D\u6587", "\u0645\u0631\u062D\u0628\u0627", "\u041F\u0440\u0438\u0432\u0435\u0442");
      expect(tuple.unsafeGet(0) as string).assertEqual("\u4E2D\u6587");
      expect(tuple.unsafeGet(1) as string).assertEqual("\u0645\u0631\u062D\u0628\u0627");
      expect(tuple.unsafeGet(2) as string).assertEqual("\u041F\u0440\u0438\u0432\u0435\u0442");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0450
     * @tc.name testTupleUnsafeGet045
     * @tc.desc Verify unsafeGet reads undefined null and string union values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string | undefined, string | null, string>(undefined, null, "tail");
      let first = tuple.unsafeGet(0) as string | undefined;
      let second = tuple.unsafeGet(1) as string | null;
      let third = tuple.unsafeGet(2) as string;
      expect(first).assertUndefined();
      expect(second).assertNull();
      expect(third).assertEqual("tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0460
     * @tc.name testTupleUnsafeGet046
     * @tc.desc Verify unsafeGet preserves array reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberArray: Array<int> = [5, 6, 7];
      const tuple = new Tuple2<Array<int>, int>(numberArray, 3);
      let returnedArray = tuple.unsafeGet(0) as Array<int>;
      returnedArray[1] = 60;
      expect(returnedArray).assertEqual(numberArray);
      expect(numberArray[1]).assertEqual(60);
      expect(tuple.unsafeGet(1) as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0470
     * @tc.name testTupleUnsafeGet047
     * @tc.desc Verify unsafeGet negative index throws and legal index remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(8, "ok");
      try {
        tuple.unsafeGet(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(tuple.unsafeGet(0) as int).assertEqual(8);
      expect(tuple.unsafeGet(1) as string).assertEqual("ok");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0480
     * @tc.name testTupleUnsafeGet048
     * @tc.desc Verify unsafeGet reads middle indexes of Tuple5 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<string, int, boolean, double, char>("head", 22, true, 4.5, c'Z');
      let second = tuple.unsafeGet(1) as int;
      let third = tuple.unsafeGet(2) as boolean;
      let fourth = tuple.unsafeGet(3) as double;
      expect(second).assertEqual(22);
      expect(third).assertTrue();
      expect(fourth).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0490
     * @tc.name testTupleUnsafeGet049
     * @tc.desc Verify unsafeGet reads all four positions of Tuple4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(11, 12, 13, 14);
      expect(tuple.unsafeGet(0) as int).assertEqual(11);
      expect(tuple.unsafeGet(1) as int).assertEqual(12);
      expect(tuple.unsafeGet(2) as int).assertEqual(13);
      expect(tuple.unsafeGet(3) as int).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0500
     * @tc.name testTupleUnsafeGet050
     * @tc.desc Verify unsafeGet reads Tuple6 head string and tail positions in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple6<int, string, boolean, double, float, char>(1, "a", true, 3.14, 2.5 as float, c'X');
      expect(tuple.unsafeGet(0) as int).assertEqual(1);
      expect(tuple.unsafeGet(1) as string).assertEqual("a");
      expect(tuple.unsafeGet(3) as double).assertEqual(3.14);
      expect(tuple.unsafeGet(4) as float).assertEqual(2.5 as float);
      expect(tuple.unsafeGet(5) as char).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0510
     * @tc.name testTupleUnsafeGet051
     * @tc.desc Verify unsafeGet reads Tuple7 head middle and tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple7<int, string, boolean, double, float, char, int>(7, "b", false, 1.25, 1.5 as float, c'Y', 77);
      expect(tuple.unsafeGet(0) as int).assertEqual(7);
      expect(tuple.unsafeGet(5) as char).assertEqual(c'Y');
      expect(tuple.unsafeGet(6) as int).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0520
     * @tc.name testTupleUnsafeGet052
     * @tc.desc Verify unsafeGet reads Tuple8 head middle and tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple8<int, string, boolean, double, float, char, int, string>(8, "c", true, 2.5, 3.5 as float, c'Z', 88, "tail");
      expect(tuple.unsafeGet(0) as int).assertEqual(8);
      expect(tuple.unsafeGet(6) as int).assertEqual(88);
      expect(tuple.unsafeGet(7) as string).assertEqual("tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0530
     * @tc.name testTupleUnsafeGet053
     * @tc.desc Verify unsafeGet reads Tuple9 tail three positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple9<int, string, boolean, double, float, char, int, string, boolean>(
      9, "d", true, 4.5, 5.5 as float, c'W', 99, "nine", false
      );
      expect(tuple.unsafeGet(6) as int).assertEqual(99);
      expect(tuple.unsafeGet(7) as string).assertEqual("nine");
      expect(tuple.unsafeGet(8) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0540
     * @tc.name testTupleUnsafeGet054
     * @tc.desc Verify unsafeGet reads Tuple10 first middle and tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10Int(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      expect(tuple.unsafeGet(0) as int).assertEqual(0);
      expect(tuple.unsafeGet(5) as int).assertEqual(5);
      expect(tuple.unsafeGet(9) as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0550
     * @tc.name testTupleUnsafeGet055
     * @tc.desc Verify unsafeGet reads long min value in Tuple1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<long>(-9223372036854775807 - 1);
      expect(tuple.unsafeGet(0) as long).assertEqual(-9223372036854775807 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0560
     * @tc.name testTupleUnsafeGet056
     * @tc.desc Verify unsafeGet reads long zero value in Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<long, string>(Int.toLong(0), "zero");
      expect(tuple.unsafeGet(0) as long).assertEqual(Int.toLong(0));
      expect(tuple.unsafeGet(1) as string).assertEqual("zero");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0570
     * @tc.name testTupleUnsafeGet057
     * @tc.desc Verify unsafeGet reads double positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(Double.POSITIVE_INFINITY);
      let value = tuple.unsafeGet(0) as double;
      expect(isFinite(value)).assertFalse();
      expect(value).assertPosUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0580
     * @tc.name testTupleUnsafeGet058
     * @tc.desc Verify unsafeGet reads double negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(Double.NEGATIVE_INFINITY);
      let value = tuple.unsafeGet(0) as double;
      expect(isFinite(value)).assertFalse();
      expect(value).assertNegUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0590
     * @tc.name testTupleUnsafeGet059
     * @tc.desc Verify unsafeGet reads double NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(Double.NaN);
      let value = tuple.unsafeGet(0) as double;
      expect(isNaN(value)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0600
     * @tc.name testTupleUnsafeGet060
     * @tc.desc Verify unsafeGet reads double max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(Double.MAX_VALUE);
      expect(tuple.unsafeGet(0) as double).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0610
     * @tc.name testTupleUnsafeGet061
     * @tc.desc Verify unsafeGet reads float NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<float>(Float.NaN);
      let value = tuple.unsafeGet(0) as float;
      expect(isNaN(Float.toDouble(value))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0620
     * @tc.name testTupleUnsafeGet062
     * @tc.desc Verify unsafeGet reads float positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<float>(Float.POSITIVE_INFINITY);
      let value = tuple.unsafeGet(0) as float;
      expect(isFinite(Float.toDouble(value))).assertFalse();
      expect(Float.toDouble(value) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0630
     * @tc.name testTupleUnsafeGet063
     * @tc.desc Verify unsafeGet reads double zero with positive sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(0.0);
      expect(tuple.unsafeGet(0) as double).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0640
     * @tc.name testTupleUnsafeGet064
     * @tc.desc Verify unsafeGet reads double negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(-0.0);
      let value = tuple.unsafeGet(0) as double;
      expect(value).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0650
     * @tc.name testTupleUnsafeGet065
     * @tc.desc Verify unsafeGet reads octal int literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(0o777);
      expect(tuple.unsafeGet(0) as int).assertEqual(0o777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0660
     * @tc.name testTupleUnsafeGet066
     * @tc.desc Verify unsafeGet reads binary int literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(0b1010);
      expect(tuple.unsafeGet(0) as int).assertEqual(0b1010);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0670
     * @tc.name testTupleUnsafeGet067
     * @tc.desc Verify unsafeGet reads hexadecimal int literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(0x7FFFFFFF);
      expect(tuple.unsafeGet(0) as int).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0680
     * @tc.name testTupleUnsafeGet068
     * @tc.desc Verify unsafeGet reads scientific notation double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<double>(1.5e10);
      expect(tuple.unsafeGet(0) as double).assertEqual(1.5e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0690
     * @tc.name testTupleUnsafeGet069
     * @tc.desc Verify unsafeGet reads byte truncated boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<byte>(Int.toByte(127));
      expect(tuple.unsafeGet(0) as byte).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0700
     * @tc.name testTupleUnsafeGet070
     * @tc.desc Verify unsafeGet reads short value at single index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<short>(Int.toShort(32767));
      expect(tuple.unsafeGet(0) as short).assertEqual(Int.toShort(32767));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0710
     * @tc.name testTupleUnsafeGet071
     * @tc.desc Verify unsafeGet reads long string of one thousand chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(1000);
      const tuple = new Tuple1<string>(longStr);
      let value = tuple.unsafeGet(0) as string;
      expect(value.length).assertEqual(1000);
      expect(value).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0720
     * @tc.name testTupleUnsafeGet072
     * @tc.desc Verify unsafeGet reads string with whitespace only chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<string>("   \t\n  ");
      let value = tuple.unsafeGet(0) as string;
      expect(value).assertEqual("   \t\n  ");
      expect(value.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0730
     * @tc.name testTupleUnsafeGet073
     * @tc.desc Verify unsafeGet reads empty array as element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: Array<int> = new Array<int>();
      const tuple = new Tuple1<Array<int>>(emptyArray);
      let value = tuple.unsafeGet(0) as Array<int>;
      expect(value.length).assertEqual(0);
      expect(value).assertEqual(emptyArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0740
     * @tc.name testTupleUnsafeGet074
     * @tc.desc Verify unsafeGet reads three layer nested Tuple value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerMost = new Tuple1<int>(42);
      const middle = new Tuple1<Tuple1<int>>(innerMost);
      const outer = new Tuple1<Tuple1<Tuple1<int>>>(middle);
      let level1 = outer.unsafeGet(0) as Tuple1<Tuple1<int>>;
      let level2 = level1.unsafeGet(0) as Tuple1<int>;
      let level3 = level2.unsafeGet(0) as int;
      expect(level3).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0750
     * @tc.name testTupleUnsafeGet075
     * @tc.desc Verify unsafeGet reads tuple containing self defined class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new TupleUnsafeGetItem091(99, "label");
      const tuple = new Tuple1<TupleUnsafeGetItem091>(item);
      let value = tuple.unsafeGet(0) as TupleUnsafeGetItem091;
      expect(value).assertEqual(item);
      expect(value.id).assertEqual(99);
      expect(value.name).assertEqual("label");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0760
     * @tc.name testTupleUnsafeGet076
     * @tc.desc Verify unsafeGet reads single quote and double quote characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<char, char>(c'\'', c'\"');
      expect(tuple.unsafeGet(0) as char).assertEqual(c'\'');
      expect(tuple.unsafeGet(1) as char).assertEqual(c'\"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0770
     * @tc.name testTupleUnsafeGet077
     * @tc.desc Verify unsafeGet reads escape characters in string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<string>("line1\nline2\tend");
      let value = tuple.unsafeGet(0) as string;
      expect(value).assertEqual("line1\nline2\tend");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0780
     * @tc.name testTupleUnsafeGet078
     * @tc.desc Verify unsafeGet result type cast to Any keeps value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(123, "abc");
      let raw0: Any = tuple.unsafeGet(0);
      let raw1: Any = tuple.unsafeGet(1);
      expect(raw0 as int).assertEqual(123);
      expect(raw1 as string).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0790
     * @tc.name testTupleUnsafeGet079
     * @tc.desc Verify unsafeGet result keeps original boolean true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<boolean, boolean, boolean>(true, true, true);
      expect(tuple.unsafeGet(0) as boolean).assertTrue();
      expect(tuple.unsafeGet(1) as boolean).assertTrue();
      expect(tuple.unsafeGet(2) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0800
     * @tc.name testTupleUnsafeGet080
     * @tc.desc Verify unsafeGet result keeps original boolean false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<boolean, boolean, boolean>(false, false, false);
      let b0: boolean = tuple.unsafeGet(0) as boolean;
      let b1: boolean = tuple.unsafeGet(1) as boolean;
      let b2: boolean = tuple.unsafeGet(2) as boolean;
      expect(b0).assertFalse();
      expect(b1).assertEqual(b0);
      expect(b2).assertEqual(b0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0810
     * @tc.name testTupleUnsafeGet081
     * @tc.desc Verify unsafeGet throws when index equals Tuple4 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(1, 2, 3, 4);
      try {
        tuple.unsafeGet(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0820
     * @tc.name testTupleUnsafeGet082
     * @tc.desc Verify unsafeGet throws when index is negative two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      try {
        tuple.unsafeGet(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0830
     * @tc.name testTupleUnsafeGet083
     * @tc.desc Verify unsafeGet throws when Tuple0 receives negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple0();
      try {
        tuple.unsafeGet(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0840
     * @tc.name testTupleUnsafeGet084
     * @tc.desc Verify unsafeGet still works on valid index after exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(10, "abc");
      try {
        tuple.unsafeGet(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(tuple.unsafeGet(0) as int).assertEqual(10);
      expect(tuple.unsafeGet(1) as string).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0850
     * @tc.name testTupleUnsafeGet085
     * @tc.desc Verify unsafeGet throws multiple sequential out of range errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(5);
      let errorCount: int = 0;
      let badIndexes: Array<int> = [-1, 1, 100, -100];
      for (let i: int = 0; i < badIndexes.length; i++) {
        try {
          tuple.unsafeGet(badIndexes[i]);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('IndexOutOfBoundsError');
          errorCount++;
        }
      }
      expect(errorCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0860
     * @tc.name testTupleUnsafeGet086
     * @tc.desc Verify unsafeGet matches $0 field access on Tuple1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(101);
      let viaField: int = tuple.$0;
      let viaUnsafe = tuple.unsafeGet(0) as int;
      expect(viaUnsafe).assertEqual(viaField);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0870
     * @tc.name testTupleUnsafeGet087
     * @tc.desc Verify unsafeGet matches $0 and $1 fields on Tuple2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(102, "x");
      expect(tuple.unsafeGet(0) as int).assertEqual(tuple.$0);
      expect(tuple.unsafeGet(1) as string).assertEqual(tuple.$1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0880
     * @tc.name testTupleUnsafeGet088
     * @tc.desc Verify unsafeGet matches dollar fields on Tuple5 all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<int, int, int, int, int>(10, 20, 30, 40, 50);
      expect(tuple.unsafeGet(0) as int).assertEqual(tuple.$0);
      expect(tuple.unsafeGet(1) as int).assertEqual(tuple.$1);
      expect(tuple.unsafeGet(2) as int).assertEqual(tuple.$2);
      expect(tuple.unsafeGet(3) as int).assertEqual(tuple.$3);
      expect(tuple.unsafeGet(4) as int).assertEqual(tuple.$4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0890
     * @tc.name testTupleUnsafeGet089
     * @tc.desc Verify unsafeGet preserves Map reference and entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set("k1", 11);
      map.set("k2", 22);
      const tuple = new Tuple1<Map<string, int>>(map);
      let result = tuple.unsafeGet(0) as Map<string, int>;
      expect(result).assertEqual(map);
      expect(result.size).assertEqual(2);
      expect(result.get("k1")).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0900
     * @tc.name testTupleUnsafeGet090
     * @tc.desc Verify unsafeGet preserves Set reference and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(1);
      set.add(2);
      set.add(3);
      const tuple = new Tuple1<Set<int>>(set);
      let result = tuple.unsafeGet(0) as Set<int>;
      expect(result).assertEqual(set);
      expect(result.size).assertEqual(3);
      expect(result.has(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0910
     * @tc.name testTupleUnsafeGet091
     * @tc.desc Verify unsafeGet returns same value on hundred repeated reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(777);
      for (let i: int = 0; i < 100; i++) {
        expect(tuple.unsafeGet(0) as int).assertEqual(777);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0920
     * @tc.name testTupleUnsafeGet092
     * @tc.desc Verify unsafeGet across all elements equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10Int(
      3, 7, 1, 9, 4, 6, 2, 8, 5, 0
      );
      let maxVal: int = -1;
      let minVal: int = 999;
      for (let i: int = 0; i < tuple.length; i++) {
        let val: int = tuple.unsafeGet(i) as int;
        if (val > maxVal) { maxVal = val; }
        if (val < minVal) { minVal = val; }
      }
      expect(maxVal).assertEqual(9);
      expect(minVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0930
     * @tc.name testTupleUnsafeGet093
     * @tc.desc Verify unsafeGet on Tuple containing Array of Tuple2 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<Tuple2<int, string>> = [
        new Tuple2<int, string>(1, "first"),
        new Tuple2<int, string>(2, "second")
      ];
      const tuple = new Tuple1<Array<Tuple2<int, string>>>(entries);
      let result = tuple.unsafeGet(0) as Array<Tuple2<int, string>>;
      expect(result.length).assertEqual(2);
      expect(result[0].unsafeGet(1) as string).assertEqual("first");
      expect(result[1].unsafeGet(0) as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0940
     * @tc.name testTupleUnsafeGet094
     * @tc.desc Verify unsafeGet reflects reassigning of array element via tuple field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<int> = [10, 20, 30];
      const tuple = new Tuple1<Array<int>>(numbers);
      numbers[1] = 200;
      let result = tuple.unsafeGet(0) as Array<int>;
      expect(result[1]).assertEqual(200);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0950
     * @tc.name testTupleUnsafeGet095
     * @tc.desc Verify unsafeGet returns string with surrogate pair characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<string>("\uD83D\uDE00");
      let value = tuple.unsafeGet(0) as string;
      expect(value).assertEqual("\uD83D\uDE00");
      expect(value.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0960
     * @tc.name testTupleUnsafeGet096
     * @tc.desc Verify unsafeGet reads zero length string at every index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("", "", "");
      expect(tuple.unsafeGet(0) as string).assertEqual("");
      expect(tuple.unsafeGet(1) as string).assertEqual("");
      expect(tuple.unsafeGet(2) as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0970
     * @tc.name testTupleUnsafeGet097
     * @tc.desc Verify unsafeGet handles mixed null undefined and primitives in Tuple4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int | null, string | undefined, int, string>(null, undefined, 0, "");
      expect(tuple.unsafeGet(0) as int | null).assertEqual(null);
      expect(tuple.unsafeGet(1) as string | undefined).assertEqual(undefined);
      expect(tuple.unsafeGet(2) as int).assertEqual(0);
      expect(tuple.unsafeGet(3) as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0980
     * @tc.name testTupleUnsafeGet098
     * @tc.desc Verify unsafeGet returns correct value at each index in Tuple9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple9<int, int, int, int, int, int, int, int, int>(
      11, 12, 13, 14, 15, 16, 17, 18, 19
      );
      expect(tuple.length).assertEqual(9);
      let allMatch: boolean = true;
      for (let i: int = 0; i < tuple.length; i++) {
        if ((tuple.unsafeGet(i) as int) !== 11 + i) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0990
     * @tc.name testTupleUnsafeGet099
     * @tc.desc Verify unsafeGet works on Tuple2 with duplicate int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, int>(7, 7);
      let v0: int = tuple.unsafeGet(0) as int;
      let v1: int = tuple.unsafeGet(1) as int;
      expect(v0).assertEqual(7);
      expect(v1).assertEqual(7);
      expect(v0 === v1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1000
     * @tc.name testTupleUnsafeGet100
     * @tc.desc Verify unsafeGet preserves field order on mixed type Tuple4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string, int, boolean, double>("k", 1, false, 9.9);
      let s: string = tuple.unsafeGet(0) as string;
      let n: int = tuple.unsafeGet(1) as int;
      let b: boolean = tuple.unsafeGet(2) as boolean;
      let d: double = tuple.unsafeGet(3) as double;
      expect(s).assertEqual("k");
      expect(n).assertEqual(1);
      expect(b).assertFalse();
      expect(d).assertEqual(9.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1010
     * @tc.name testTupleUnsafeGet101
     * @tc.desc Verify unsafeGet returns reusable boolean value across multiple reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<boolean>(true);
      let v1 = tuple.unsafeGet(0) as boolean;
      let v2 = tuple.unsafeGet(0) as boolean;
      let v3 = tuple.unsafeGet(0) as boolean;
      expect(v1).assertTrue();
      expect(v2).assertEqual(v1);
      expect(v3).assertEqual(v1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1020
     * @tc.name testTupleUnsafeGet102
     * @tc.desc Verify unsafeGet returns identical reference for shared instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new TupleUnsafeGetItem091(7, "shared");
      const tuple = new Tuple3<TupleUnsafeGetItem091, TupleUnsafeGetItem091, TupleUnsafeGetItem091>(shared, shared, shared);
      let a = tuple.unsafeGet(0) as TupleUnsafeGetItem091;
      let b = tuple.unsafeGet(1) as TupleUnsafeGetItem091;
      let c = tuple.unsafeGet(2) as TupleUnsafeGetItem091;
      expect(a).assertEqual(b);
      expect(b).assertEqual(c);
      expect(a.name).assertEqual("shared");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1030
     * @tc.name testTupleUnsafeGet103
     * @tc.desc Verify unsafeGet reads consecutive primitive and reference values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [9, 8, 7];
      const tuple = new Tuple5<int, Array<int>, string, boolean, double>(1, data, "y", true, 0.5);
      expect(tuple.unsafeGet(0) as int).assertEqual(1);
      expect((tuple.unsafeGet(1) as Array<int>)[0]).assertEqual(9);
      expect(tuple.unsafeGet(2) as string).assertEqual("y");
      expect(tuple.unsafeGet(3) as boolean).assertTrue();
      expect(tuple.unsafeGet(4) as double).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1040
     * @tc.name testTupleUnsafeGet104
     * @tc.desc Verify unsafeGet integration combining boundary length traversal and exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10Int(
      9, 8, 7, 6, 5, 4, 3, 2, 1, 0
      );
      expect(tuple.length).assertEqual(10);
      let firstValue = tuple.unsafeGet(0) as int;
      let lastValue = tuple.unsafeGet(tuple.length - 1) as int;
      expect(firstValue).assertEqual(9);
      expect(lastValue).assertEqual(0);
      let descending: int = 0;
      for (let i: int = 0; i < tuple.length; i++) {
        descending += tuple.unsafeGet(i) as int;
      }
      expect(descending).assertEqual(45);
      try {
        tuple.unsafeGet(tuple.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
