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

export default function Tuple0ToTuple10Test(): void {
  describe('Tuple0ToTuple10Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0040
     * @tc.name testTuple0ToTuple10004
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t3 = new Tuple3<int, string, boolean>(1, "a", true);
      expect(t3.length).assertEqual(3);
      expect(t3.$0).assertEqual(1);
      expect(t3.$1).assertEqual("a");
      expect(t3.$2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0050
     * @tc.name testTuple0ToTuple10005
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t4 = new Tuple4<int, string, boolean, double>(1, "a", true, 3.14);
      expect(t4.length).assertEqual(4);
      expect(t4.$0).assertEqual(1);
      expect(t4.$1).assertEqual("a");
      expect(t4.$2).assertTrue();
      expect(t4.$3).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0060
     * @tc.name testTuple0ToTuple10006
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t5 = new Tuple5<int, string, boolean, double, float>(1, "a", true, 3.14, 2.5 as float);
      expect(t5.length).assertEqual(5);
      expect(t5.$0).assertEqual(1);
      expect(t5.$3).assertEqual(3.14);
      expect(t5.$4).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0070
     * @tc.name testTuple0ToTuple10007
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t6 = new Tuple6<int, string, boolean, double, float, char>(1, "a", true, 3.14, 2.5 as float, c'X');
      expect(t6.length).assertEqual(6);
      expect(t6.$0).assertEqual(1);
      expect(t6.$5).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0080
     * @tc.name testTuple0ToTuple10008
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t7 = new Tuple7<int, string, boolean, double, float, char, int>(
      1, "a", true, 3.14, 2.5 as float, c'X', 99
      );
      expect(t7.length).assertEqual(7);
      expect(t7.$5).assertEqual(c'X');
      expect(t7.$6).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0090
     * @tc.name testTuple0ToTuple10009
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t8 = new Tuple8<int, string, boolean, double, float, char, int, string>(
      1, "a", true, 3.14, 2.5 as float, c'X', 99, "end"
      );
      expect(t8.length).assertEqual(8);
      expect(t8.$6).assertEqual(99);
      expect(t8.$7).assertEqual("end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0100
     * @tc.name testTuple0ToTuple10010
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t9 = new Tuple9<int, string, boolean, double, float, char, int, string, boolean>(
      1, "a", true, 3.14, 2.5 as float, c'X', 99, "s", false
      );
      expect(t9.length).assertEqual(9);
      expect(t9.$7).assertEqual("s");
      expect(t9.$8).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0110
     * @tc.name testTuple0ToTuple10011
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t10 = new Tuple10<int, string, boolean, double, float, char, int, string, boolean, int>(
      1, "a", true, 3.14, 2.5, c'X', 99, "s", false, 0
      );
      expect(t10.length).assertEqual(10);
      expect(t10.$7).assertEqual("s");
      expect(t10.$8).assertFalse();
      expect(t10.$9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0120
     * @tc.name testTuple0ToTuple10012
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string>("only");
      expect(t.length).assertEqual(1);
      expect(t.$0).assertEqual("only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0130
     * @tc.name testTuple0ToTuple10013
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tMin = new Tuple1<int>(-2147483648);
      let tMax = new Tuple1<int>(2147483647);
      let tZero = new Tuple1<int>(0);
      expect(tMin.$0).assertEqual(-2147483648);
      expect(tMax.$0).assertEqual(2147483647);
      expect(tZero.$0).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0140
     * @tc.name testTuple0ToTuple10014
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string>("hello");
      expect(t.$0).assertEqual("hello");
      expect(t.$0.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0150
     * @tc.name testTuple0ToTuple10015
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tEmpty = new Tuple1<string>("");
      let tLong = new Tuple1<string>("a".repeat(1000));
      let tUnicode = new Tuple1<string>("你好世界");
      expect(tEmpty.$0).assertEqual("");
      expect(tEmpty.$0.length).assertEqual(0);
      expect(tLong.$0.length).assertEqual(1000);
      expect(tUnicode.$0).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0160
     * @tc.name testTuple0ToTuple10016
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tTrue = new Tuple1<boolean>(true);
      let tFalse = new Tuple1<boolean>(false);
      expect(tTrue.$0).assertTrue();
      expect(tFalse.$0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0170
     * @tc.name testTuple0ToTuple10017
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(3.14159265358979);
      expect(t.$0).assertEqual(3.14159265358979);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0180
     * @tc.name testTuple0ToTuple10018
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tMax = new Tuple1<double>(1.7976931348623157e+308);
      let tMin = new Tuple1<double>(-1.7976931348623157e+308);
      let tZero = new Tuple1<double>(0.0);
      let tNegZero = new Tuple1<double>(-0.0);
      expect(tMax.$0).assertEqual(1.7976931348623157e+308);
      expect(tMin.$0).assertEqual(-1.7976931348623157e+308);
      expect(tZero.$0).assertEqual(0.0);
      expect(tNegZero.$0).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0190
     * @tc.name testTuple0ToTuple10019
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<float>(2.5 as float);
      expect(t.$0).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0200
     * @tc.name testTuple0ToTuple10020
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<char>(c'A');
      expect(t.$0).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0210
     * @tc.name testTuple0ToTuple10021
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tDigit = new Tuple1<char>(c'0');
      let tSpace = new Tuple1<char>(c' ');
      let tUnicode = new Tuple1<char>(c'A');
      expect(tDigit.$0).assertEqual(c'0');
      expect(tSpace.$0).assertEqual(c' ');
      expect(tUnicode.$0).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0220
     * @tc.name testTuple0ToTuple10022
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<Array<int>>([1, 2, 3]);
      expect(t.$0.length).assertEqual(3);
      expect(t.$0[0]).assertEqual(1);
      expect(t.$0[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0230
     * @tc.name testTuple0ToTuple10023
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<Array<string>, Array<boolean>>(["a", "b"], [true, false]);
      expect(t.$0.length).assertEqual(2);
      expect(t.$0[1]).assertEqual("b");
      expect(t.$1.length).assertEqual(2);
      expect(t.$1[0]).assertTrue();
      expect(t.$1[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0240
     * @tc.name testTuple0ToTuple10024
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<Array<int>>([]);
      expect(t.$0.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0250
     * @tc.name testTuple0ToTuple10025
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Tuple2<int, string>(1, "inner");
      let t = new Tuple1<Tuple2<int, string>>(inner);
      expect(t.$0.$0).assertEqual(1);
      expect(t.$0.$1).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0260
     * @tc.name testTuple0ToTuple10026
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<Tuple1<int>, Tuple1<string>>(
      new Tuple1<int>(42),
      new Tuple1<string>("nested")
      );
      expect(t.$0.$0).assertEqual(42);
      expect(t.$1.$0).assertEqual("nested");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0270
     * @tc.name testTuple0ToTuple10027
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<Tuple1<Tuple1<int>>>(
      new Tuple1<Tuple1<int>>(new Tuple1<int>(99))
      );
      expect(t.$0.$0.$0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0280
     * @tc.name testTuple0ToTuple10028
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t3 = new Tuple3<int, int, int>(1, 2, 3);
      let t5 = new Tuple5<string, string, string, string, string>("a", "b", "c", "d", "e");
      expect(t3.$0).assertEqual(1);
      expect(t3.$2).assertEqual(3);
      expect(t5.$0).assertEqual("a");
      expect(t5.$4).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0290
     * @tc.name testTuple0ToTuple10029
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string|null>(null);
      expect(t.$0).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0300
     * @tc.name testTuple0ToTuple10030
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<string|null, int>(null, 42);
      expect(t.$0).assertEqual(null);
      expect(t.$1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0310
     * @tc.name testTuple0ToTuple10031
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string|undefined>(undefined);
      expect(t.$0).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0320
     * @tc.name testTuple0ToTuple10032
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(Double.POSITIVE_INFINITY);
      expect(isFinite(t.$0)).assertFalse();
      expect(t.$0 > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0330
     * @tc.name testTuple0ToTuple10033
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(Double.NEGATIVE_INFINITY);
      expect(isFinite(t.$0)).assertFalse();
      expect(t.$0 < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0340
     * @tc.name testTuple0ToTuple10034
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(Double.NaN);
      expect(isNaN(t.$0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0350
     * @tc.name testTuple0ToTuple10035
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<int>(42);
      let val: int = t.$0;
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0360
     * @tc.name testTuple0ToTuple10036
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tStr = new Tuple1<string>("hello");
      let s: string = tStr.$0;
      expect(s).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0370
     * @tc.name testTuple0ToTuple10037
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(1, "two");
      let val: string = t.$1;
      expect(val).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0380
     * @tc.name testTuple0ToTuple10038
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3<int, string, boolean>(1, "a", true);
      let val: boolean = t.$2;
      expect(val).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0390
     * @tc.name testTuple0ToTuple10039
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple4<int, string, boolean, double>(1, "a", true, 3.14);
      let val: double = t.$3;
      expect(val).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0400
     * @tc.name testTuple0ToTuple10040
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5<int, string, boolean, double, float>(1, "a", true, 3.14, 2.5 as float);
      let val: float = t.$4;
      expect(val).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0410
     * @tc.name testTuple0ToTuple10041
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple6<int, string, boolean, double, float, char>(1, "a", true, 3.14, 2.5 as float, c'X');
      let val: char = t.$5;
      expect(val).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0420
     * @tc.name testTuple0ToTuple10042
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple7<int, string, boolean, double, float, char, int>(
      1, "a", true, 3.14, 2.5 as float, c'X', 77
      );
      let val: int = t.$6;
      expect(val).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0430
     * @tc.name testTuple0ToTuple10043
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple8<int, string, boolean, double, float, char, int, string>(
      1, "a", true, 3.14, 2.5 as float, c'X', 77, "end"
      );
      let val: string = t.$7;
      expect(val).assertEqual("end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0440
     * @tc.name testTuple0ToTuple10044
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple9<int, string, boolean, double, float, char, int, string, boolean>(
      1, "a", true, 3.14, 2.5 as float, c'X', 77, "s", false
      );
      let val: boolean = t.$8;
      expect(val).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0450
     * @tc.name testTuple0ToTuple10045
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10<int, string, boolean, double, float, char, int, string, boolean, int>(
      1, "a", true, 3.14, 2.5, c'X', 77, "s", false, 999
      );
      let val: int = t.$9;
      expect(val).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0460
     * @tc.name testTuple0ToTuple10046
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(42, "hello");
      let v0: int = t.$0;
      let v1: string = t.$1;
      expect(v0).assertEqual(42);
      expect(v1).assertEqual("hello");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0470
     * @tc.name testTuple0ToTuple10047
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5<int, string, boolean, double, float>(10, "x", false, 1.1, 2.2 as float);
      expect(t.$0).assertEqual(10);
      expect(t.$1).assertEqual("x");
      expect(t.$2).assertFalse();
      expect(t.$3).assertEqual(1.1);
      expect(t.$4).assertEqual(2.2 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0480
     * @tc.name testTuple0ToTuple10048
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      expect(t.length).assertEqual(10);
      let sum: int = 0;
      for (let i: int = 0; i <= 9; i++) {
        sum += t.unsafeGet(i) as int;
      }
      expect(sum).assertEqual(45);
      expect(t.$0).assertEqual(0);
      expect(t.$9).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0490
     * @tc.name testTuple0ToTuple10049
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple6<int, string, boolean, double, float, char>(
      1, "a", true, 3.14, 2.5 as float, c'Z'
      );
      let v0: int = t.$0;
      let v1: string = t.$1;
      let v2: boolean = t.$2;
      let v3: double = t.$3;
      let v4: float = t.$4;
      let v5: char = t.$5;
      expect(v0).assertEqual(1);
      expect(v1).assertEqual("a");
      expect(v2).assertTrue();
      expect(v3).assertEqual(3.14);
      expect(v4).assertEqual(2.5 as float);
      expect(v5).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0500
     * @tc.name testTuple0ToTuple10050
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<int>(42);
      let s: string = t.toString();
      expect(s).assertContain("42");
      expect(s.length).assertLarger(0);
      expect(t.$0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0510
     * @tc.name testTuple0ToTuple10051
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(1, "one");
      let s: string = t.toString();
      expect(s).assertContain("1");
      expect(s).assertContain("one");
      expect(s.length).assertLarger(0);
      expect(t.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0520
     * @tc.name testTuple0ToTuple10052
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5<int, string, boolean, double, float>(1, "a", true, 3.14, 2.5 as float);
      let s: string = t.toString();
      expect(s).assertContain("1");
      expect(s).assertContain("a");
      expect(s).assertContain("true");
      expect(s).assertContain("3.14");
      expect(s.length).assertLarger(0);
      expect(t.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0530
     * @tc.name testTuple0ToTuple10053
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      let s: string = t.toString();
      expect(s).assertContain("0");
      expect(s).assertContain("5");
      expect(s).assertContain("9");
      expect(s.length).assertLarger(0);
      expect(t.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0540
     * @tc.name testTuple0ToTuple10054
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      10, 20, 30, 40, 50, 60, 70, 80, 90, 100
      );
      expect(t.$0).assertEqual(10);
      expect(t.$5).assertEqual(60);
      expect(t.$9).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0550
     * @tc.name testTuple0ToTuple10055
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple7<int, string, boolean, double, float, char, int>(
      1, "a", true, 2.0, 3.0 as float, c'Z', 99
      );
      expect(t.$0).assertEqual(1);
      expect(t.$1).assertEqual("a");
      expect(t.$2).assertTrue();
      expect(t.$6).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0560
     * @tc.name testTuple0ToTuple10056
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new Tuple2<int, string>(1, "a");
      let t2 = new Tuple2<int, string>(1, "a");
      expect(t1 !== t2).assertTrue();
      expect(t1.$0).assertEqual(t2.$0);
      expect(t1.$1).assertEqual(t2.$1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0570
     * @tc.name testTuple0ToTuple10057
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t3 = new Tuple3<int, string, boolean>(1, "a", true);
      let t5 = new Tuple5<int, string, boolean, double, float>(1, "a", true, 1.0, 2.0 as float);
      expect(t3 !== t5).assertTrue();
      expect(t3.$0).assertEqual(t5.$0);
      expect(t3.$1).assertEqual(t5.$1);
      expect(t3.$2).assertEqual(t5.$2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0580
     * @tc.name testTuple0ToTuple10058
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3<int, string, boolean>(1, "a", true);
      expect(t.unsafeGet(0) as int).assertEqual(1);
      expect(t.unsafeGet(1) as string).assertEqual("a");
      expect(t.unsafeGet(2) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0590
     * @tc.name testTuple0ToTuple10059
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple0();
      expect(t.length).assertEqual(0);
      let caught: boolean = false;
      try {
        t.unsafeGet(0);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0600
     * @tc.name testTuple0ToTuple10060
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(1, "a");
      expect(t.length).assertEqual(2);
      let caught: boolean = false;
      try {
        t.unsafeGet(-1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0610
     * @tc.name testTuple0ToTuple10061
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3<int, string, boolean>(1, "a", true);
      expect(t.length).assertEqual(3);
      let caught: boolean = false;
      try {
        t.unsafeGet(3);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0620
     * @tc.name testTuple0ToTuple10062
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(42, "hello");
      expect(t.unsafeGet(0) as int).assertEqual(t.$0);
      expect(t.unsafeGet(1) as string).assertEqual(t.$1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0630
     * @tc.name testTuple0ToTuple10063
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<int>(42);
      expect(t.$0).assertEqual(42);
      let caught: boolean = false;
      try {
        t.unsafeGet(-1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0640
     * @tc.name testTuple0ToTuple10064
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(1, "a");
      expect(t.length).assertEqual(2);
      let caught: boolean = false;
      try {
        t.unsafeGet(2);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0650
     * @tc.name testTuple0ToTuple10065
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple0();
      expect(t.length).assertEqual(0);
      let caught: boolean = false;
      try {
        t.unsafeGet(-1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0660
     * @tc.name testTuple0ToTuple10066
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5<int, string, boolean, double, float>(1, "a", true, 3.14, 2.5 as float);
      expect(t.length).assertEqual(5);
      let caught: boolean = false;
      try {
        t.unsafeGet(2147483647);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0670
     * @tc.name testTuple0ToTuple10067
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3<int, string, boolean>(1, "a", true);
      expect(t.length).assertEqual(3);
      let caught: boolean = false;
      try {
        t.unsafeGet(-2147483648);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0680
     * @tc.name testTuple0ToTuple10068
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<int, string>(1, "v20");
      let s: string = t.toString();
      expect(s).assertContain("1");
      expect(s).assertContain("v20");
      expect(s.length).assertLarger(0);
      expect(t.$0).assertEqual(1);
      expect(t.$1).assertEqual("v20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0690
     * @tc.name testTuple0ToTuple10069
     * @tc.desc Verify Tuple0ToTuple10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t0 = new Tuple0();
      let t1 = new Tuple1<int>(1);
      let t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      expect(t0.length).assertEqual(0);
      expect(t1.length).assertEqual(1);
      expect(t10.length).assertEqual(10);
      expect(t1.$0).assertEqual(1);
      expect(t10.$9).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0710
     * @tc.name testTuple0ToTuple10071
     * @tc.desc Verify nested Tuple values remain accessible through fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Tuple3<int, string, boolean>(42, "中文", true);
      let tuple = new Tuple2<Tuple3<int, string, boolean>, string>(inner, "outer");
      expect(tuple.$0.$0).assertEqual(42);
      expect(tuple.$0.$1).assertEqual("中文");
      expect(tuple.$0.$2).assertTrue();
      expect(tuple.$1).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0720
     * @tc.name testTuple0ToTuple10072
     * @tc.desc Verify Tuple2 stores max and min int boundary values together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple = new Tuple2<int, int>(2147483647, -2147483648);
      expect(tuple.$0).assertEqual(2147483647);
      expect(tuple.$1).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0730
     * @tc.name testTuple0ToTuple10073
     * @tc.desc Verify Tuple3 stores escaped and multilingual strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple = new Tuple3<string, string, string>("line\\nbreak", "日本語", "<" + "script>alert(1)<" + "/script>");
      expect(tuple.$0).assertEqual("line\\nbreak");
      expect(tuple.$1).assertEqual("日本語");
      expect(tuple.$2).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0750
     * @tc.name testTuple0ToTuple10075
     * @tc.desc Verify Tuple2 preserves object reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objectValue = new Object();
      let tuple = new Tuple2<Object, Object>(objectValue, objectValue);
      expect(tuple.$0 === objectValue).assertTrue();
      expect(tuple.$1 === objectValue).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0760
     * @tc.name testTuple0ToTuple10076
     * @tc.desc Verify Tuple2 stores arrays with different element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple = new Tuple2<Array<int>, Array<string>>([0, -1, 42], ["", "English", "العربية"]);
      expect(tuple.$0.length).assertEqual(3);
      expect(tuple.$0[1]).assertEqual(-1);
      expect(tuple.$1[0]).assertEqual("");
      expect(tuple.$1[2]).assertEqual("العربية");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0770
     * @tc.name testTuple0ToTuple10077
     * @tc.desc Verify Tuple5 combines nested Tuple, array, object, boolean and char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Tuple2<int, string>(100, "inner");
      let objectValue = new Object();
      let tuple = new Tuple5<Tuple2<int, string>, Array<int>, Object, boolean, char>(
      inner, [1, 2, 3], objectValue, true, c'Y'
      );
      expect(tuple.$0.$0).assertEqual(100);
      expect(tuple.$0.$1).assertEqual("inner");
      expect(tuple.$1.length).assertEqual(3);
      expect(tuple.$2).assertEqual(objectValue);
      expect(tuple.$3).assertTrue();
      expect(tuple.$4).assertEqual(c'Y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0780
     * @tc.name testTuple0ToTuple10078
     * @tc.desc Verify Tuple4 unsafeGet throws on out-of-bounds index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple4<int, string, boolean, double>(1, "a", true, 3.14);
      expect(t.length).assertEqual(4);
      let caught: boolean = false;
      try {
        t.unsafeGet(4);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0790
     * @tc.name testTuple0ToTuple10079
     * @tc.desc Verify Tuple6 unsafeGet throws on out-of-bounds index 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple6<int, string, boolean, double, float, char>(
      1, "a", true, 3.14, 2.5 as float, c'X'
      );
      expect(t.length).assertEqual(6);
      let caught: boolean = false;
      try {
        t.unsafeGet(6);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0800
     * @tc.name testTuple0ToTuple10080
     * @tc.desc Verify Tuple7 unsafeGet throws on negative out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple7<int, string, boolean, double, float, char, int>(
      1, "a", true, 3.14, 2.5 as float, c'X', 77
      );
      expect(t.length).assertEqual(7);
      let caught: boolean = false;
      try {
        t.unsafeGet(-1);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0810
     * @tc.name testTuple0ToTuple10081
     * @tc.desc Verify Tuple8 unsafeGet throws on out-of-bounds index 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple8<int, string, boolean, double, float, char, int, string>(
      1, "a", true, 3.14, 2.5 as float, c'X', 77, "end"
      );
      expect(t.length).assertEqual(8);
      let caught: boolean = false;
      try {
        t.unsafeGet(8);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0820
     * @tc.name testTuple0ToTuple10082
     * @tc.desc Verify Tuple9 unsafeGet throws on out-of-bounds max int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple10082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple9<int, string, boolean, double, float, char, int, string, boolean>(
      1, "a", true, 3.14, 2.5 as float, c'X', 77, "s", false
      );
      expect(t.length).assertEqual(9);
      let caught: boolean = false;
      try {
        t.unsafeGet(2147483647);
      } catch (e) {
        caught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(caught).assertTrue();
    });
  });
}
