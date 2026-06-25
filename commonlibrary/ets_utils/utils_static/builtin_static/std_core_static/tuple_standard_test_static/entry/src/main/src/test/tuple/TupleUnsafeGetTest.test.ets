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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0100
     * @tc.name testTupleUnsafeGet001
     * @tc.desc Verify TupleUnsafeGet scenario 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      expect(pair.unsafeGet(0) as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0200
     * @tc.name testTupleUnsafeGet002
     * @tc.desc Verify TupleUnsafeGet scenario 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const triple = new Tuple3<int, string, boolean>(1, "one", true);
      expect(triple.unsafeGet(1) as string).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0300
     * @tc.name testTupleUnsafeGet003
     * @tc.desc Verify TupleUnsafeGet scenario 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple5<int, int, int, int, int>(10, 20, 30, 40, 50);
      expect(t.unsafeGet(2) as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0400
     * @tc.name testTupleUnsafeGet004
     * @tc.desc Verify TupleUnsafeGet scenario 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<int>(42);
      expect(single.unsafeGet(0) as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0500
     * @tc.name testTupleUnsafeGet005
     * @tc.desc Verify TupleUnsafeGet scenario 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple10<int, int, int, int, int, int, int, int, int, int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      expect(t.unsafeGet(9) as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0600
     * @tc.name testTupleUnsafeGet006
     * @tc.desc Verify TupleUnsafeGet scenario 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      let caught: boolean = false;
      try {
        pair.unsafeGet(-2147483648);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0700
     * @tc.name testTupleUnsafeGet007
     * @tc.desc Verify TupleUnsafeGet scenario 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "world");
      expect(pair.unsafeGet(1) as string).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0800
     * @tc.name testTupleUnsafeGet008
     * @tc.desc Verify TupleUnsafeGet scenario 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<boolean, int>(true, 1);
      expect(t.unsafeGet(0) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_0900
     * @tc.name testTupleUnsafeGet009
     * @tc.desc Verify TupleUnsafeGet scenario 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<double, string>(3.14, "pi");
      expect(t.unsafeGet(0) as double).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1000
     * @tc.name testTupleUnsafeGet010
     * @tc.desc Verify TupleUnsafeGet scenario 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple2<char, int>(c'A', 65);
      expect(t.unsafeGet(0) as char).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1100
     * @tc.name testTupleUnsafeGet011
     * @tc.desc Verify TupleUnsafeGet scenario 17
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1200
     * @tc.name testTupleUnsafeGet012
     * @tc.desc Verify TupleUnsafeGet scenario 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple1<string>("");
      let val = t.unsafeGet(0) as string;
      expect(val).assertEqual("");
      expect(val.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1300
     * @tc.name testTupleUnsafeGet013
     * @tc.desc Verify TupleUnsafeGet scenario 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple1<boolean>(false);
      expect(t.unsafeGet(0) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1400
     * @tc.name testTupleUnsafeGet014
     * @tc.desc Verify TupleUnsafeGet scenario 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple1<int>(-100);
      expect(t.unsafeGet(0) as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1500
     * @tc.name testTupleUnsafeGet015
     * @tc.desc Verify TupleUnsafeGet scenario 22
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1600
     * @tc.name testTupleUnsafeGet016
     * @tc.desc Verify TupleUnsafeGet scenario 23
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1700
     * @tc.name testTupleUnsafeGet017
     * @tc.desc Verify TupleUnsafeGet scenario 25
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1800
     * @tc.name testTupleUnsafeGet018
     * @tc.desc Verify TupleUnsafeGet scenario 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<string>("only");
      expect(single.unsafeGet(0) as string).assertEqual("only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_1900
     * @tc.name testTupleUnsafeGet019
     * @tc.desc Verify TupleUnsafeGet scenario 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2000
     * @tc.name testTupleUnsafeGet020
     * @tc.desc Verify TupleUnsafeGet scenario 28
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2100
     * @tc.name testTupleUnsafeGet021
     * @tc.desc Verify TupleUnsafeGet scenario 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      let caught: boolean = false;
      try {
        pair.unsafeGet(3);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2200
     * @tc.name testTupleUnsafeGet022
     * @tc.desc Verify TupleUnsafeGet scenario 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Tuple0();
      let caught: boolean = false;
      try {
        empty.unsafeGet(1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2300
     * @tc.name testTupleUnsafeGet023
     * @tc.desc Verify TupleUnsafeGet scenario 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      let caught: boolean = false;
      try {
        t5.unsafeGet(2147483647);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2400
     * @tc.name testTupleUnsafeGet024
     * @tc.desc Verify TupleUnsafeGet scenario 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<int>(42);
      let caught: boolean = false;
      try {
        single.unsafeGet(1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2500
     * @tc.name testTupleUnsafeGet025
     * @tc.desc Verify TupleUnsafeGet scenario 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const triple = new Tuple3<int, string, boolean>(1, "one", true);
      let caught: boolean = false;
      try {
        triple.unsafeGet(3);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2600
     * @tc.name testTupleUnsafeGet026
     * @tc.desc Verify TupleUnsafeGet scenario 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      let caught: boolean = false;
      try {
        t.unsafeGet(10);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2700
     * @tc.name testTupleUnsafeGet027
     * @tc.desc Verify unsafeGet reads multilingual string values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("日本語", "emoji馃檪", "<script>");
      let first = tuple.unsafeGet(0) as string;
      let second = tuple.unsafeGet(1) as string;
      let third = tuple.unsafeGet(2) as string;
      expect(first).assertEqual("日本語");
      expect(second).assertEqual("emoji馃檪");
      expect(third).assertEqual("<script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_2900
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
      expect(first === objectValue).assertTrue();
      expect(second === objectValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3100
     * @tc.name testTupleUnsafeGet031
     * @tc.desc Verify unsafeGet reads array values without changing contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<Array<int>, Array<string>>([0, -1, 42], ["", "English", "袪褍褋褋泻懈泄"]);
      let intValues = tuple.unsafeGet(0) as Array<int>;
      let stringValues = tuple.unsafeGet(1) as Array<string>;
      expect(intValues.length).assertEqual(3);
      expect(intValues[1]).assertEqual(-1);
      expect(stringValues[0]).assertEqual("");
      expect(stringValues[2]).assertEqual("袪褍褋褋泻懈泄");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3300
     * @tc.name testTupleUnsafeGet033
     * @tc.desc Verify unsafeGet reads Tuple10 mixed boundary values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, string, string, boolean, boolean, double, float, char, string>(
      0, -1, "涓枃", "<script>alert(1)</script>", true, false, 1.5, 2.5 as float, c'Z', "emoji馃檪"
      );
      expect(tuple.unsafeGet(0) as int).assertEqual(0);
      expect(tuple.unsafeGet(1) as int).assertEqual(-1);
      expect(tuple.unsafeGet(2) as string).assertEqual("涓枃");
      expect(tuple.unsafeGet(3) as string).assertEqual("<script>alert(1)</script>");
      expect(tuple.unsafeGet(4) as boolean).assertTrue();
      expect(tuple.unsafeGet(5) as boolean).assertFalse();
      expect(tuple.unsafeGet(9) as string).assertEqual("emoji馃檪");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3700
     * @tc.name testTupleUnsafeGet037
     * @tc.desc Verify Tuple0 unsafeGet failure does not create accessible value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple0();
      let caught: boolean = false;
      try {
        tuple.unsafeGet(0);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(tuple.length).assertEqual(0);
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3800
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
      expect(first === objectValue).assertTrue();
      expect(second.length).assertEqual(3);
      expect(second[2]).assertEqual(3);
      expect(third).assertEqual("value");
      expect(fourth).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_3900
     * @tc.name testTupleUnsafeGet039
     * @tc.desc Verify unsafeGet reads negative int empty string and boolean combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, string, boolean>(-1, "", false);
      expect(tuple.unsafeGet(0) as int).assertEqual(-1);
      expect(tuple.unsafeGet(1) as string).assertEqual("");
      expect(tuple.unsafeGet(2) as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4200
     * @tc.name testTupleUnsafeGet042
     * @tc.desc Verify repeated out-of-bounds unsafeGet calls keep throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(1);
      let firstCaught: boolean = false;
      let secondCaught: boolean = false;
      try {
        tuple.unsafeGet(1);
      } catch (e) {
        firstCaught = true;
      }
      try {
        tuple.unsafeGet(2);
      } catch (e) {
        secondCaught = true;
      }
      expect(firstCaught).assertTrue();
      expect(secondCaught).assertTrue();
      expect(tuple.unsafeGet(0) as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4300
     * @tc.name testTupleUnsafeGet043
     * @tc.desc Verify unsafeGet reads first and last legal indexes of Tuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      10, 11, 12, 13, 14, 15, 16, 17, 18, 19
      );
      let first = tuple.unsafeGet(0) as int;
      let last = tuple.unsafeGet(tuple.length - 1) as int;
      expect(first).assertEqual(10);
      expect(last).assertEqual(19);
      expect(tuple.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4400
     * @tc.name testTupleUnsafeGet044
     * @tc.desc Verify unsafeGet reads Chinese Arabic and Russian strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("涓枃", "賲乇丨亘丕", "袩褉懈胁械褌");
      expect(tuple.unsafeGet(0) as string).assertEqual("涓枃");
      expect(tuple.unsafeGet(1) as string).assertEqual("賲乇丨亘丕");
      expect(tuple.unsafeGet(2) as string).assertEqual("袩褉懈胁械褌");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4500
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
      expect(first === undefined).assertTrue();
      expect(second === null).assertTrue();
      expect(third).assertEqual("tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4600
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
      expect(returnedArray === numberArray).assertTrue();
      expect(numberArray[1]).assertEqual(60);
      expect(tuple.unsafeGet(1) as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4700
     * @tc.name testTupleUnsafeGet047
     * @tc.desc Verify unsafeGet negative index throws and legal index remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleUnsafeGet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(8, "ok");
      let caught: boolean = false;
      try {
        tuple.unsafeGet(-1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
      expect(tuple.unsafeGet(0) as int).assertEqual(8);
      expect(tuple.unsafeGet(1) as string).assertEqual("ok");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_UNSAFE_GET_4800
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
  });
}
