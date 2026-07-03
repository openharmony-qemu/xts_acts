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

type Tuple2IS = Tuple2<int, string>;
type Tuple3ISB = Tuple3<int, string, boolean>;
type Tuple4ISBD = Tuple4<int, string, boolean, double>;
type Tuple5ISBDF = Tuple5<int, string, boolean, double, float>;
type Tuple6ISBDFC = Tuple6<int, string, boolean, double, float, char>;
type Tuple7ISBDFCI = Tuple7<int, string, boolean, double, float, char, int>;
type Tuple8ISBDFCIS = Tuple8<int, string, boolean, double, float, char, int, string>;
type Tuple9ISBDFCISB = Tuple9<int, string, boolean, double, float, char, int, string, boolean>;
type Tuple10Int = Tuple10<int, int, int, int, int, int, int, int, int, int>;
type Tuple10ISBDFCISBI = Tuple10<int, string, boolean, double, float, char, int, string, boolean, int>;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0100
     * @tc.name testTuple0ToTuple001
     * @tc.desc Verify Tuple3 stores int string and boolean values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t3 = new Tuple3ISB(1, "a", true);
      expect(t3.length).assertEqual(3);
      expect(t3.$0).assertEqual(1);
      expect(t3.$1).assertEqual("a");
      expect(t3.$2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0200
     * @tc.name testTuple0ToTuple002
     * @tc.desc Verify Tuple4 stores int string boolean and double values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t4 = new Tuple4ISBD(1, "a", true, 3.14);
      expect(t4.length).assertEqual(4);
      expect(t4.$0).assertEqual(1);
      expect(t4.$1).assertEqual("a");
      expect(t4.$2).assertTrue();
      expect(t4.$3).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0300
     * @tc.name testTuple0ToTuple003
     * @tc.desc Verify Tuple5 stores int string boolean double and float values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t5 = new Tuple5ISBDF(10, "hello", false, 6.28, 1.5 as float);
      expect(t5.length).assertEqual(5);
      expect(t5.$0).assertEqual(10);
      expect(t5.$1).assertEqual("hello");
      expect(t5.$2).assertFalse();
      expect(t5.$3).assertEqual(6.28);
      expect(t5.$4).assertEqual(1.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0400
     * @tc.name testTuple0ToTuple004
     * @tc.desc Verify Tuple6 stores int string boolean double float and char values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t6 = new Tuple6ISBDFC(1, "a", true, 3.14, 2.5 as float, c'X');
      expect(t6.length).assertEqual(6);
      expect(t6.$0).assertEqual(1);
      expect(t6.$5).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0500
     * @tc.name testTuple0ToTuple005
     * @tc.desc Verify Tuple7 stores seven mixed-type values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t7 = new Tuple7ISBDFCI(
      1, "a", true, 3.14, 2.5 as float, c'X', 99
      );
      expect(t7.length).assertEqual(7);
      expect(t7.$5).assertEqual(c'X');
      expect(t7.$6).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0600
     * @tc.name testTuple0ToTuple006
     * @tc.desc Verify Tuple8 stores eight mixed-type values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t8 = new Tuple8ISBDFCIS(
      1, "a", true, 3.14, 2.5 as float, c'X', 99, "end"
      );
      expect(t8.length).assertEqual(8);
      expect(t8.$6).assertEqual(99);
      expect(t8.$7).assertEqual("end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0700
     * @tc.name testTuple0ToTuple007
     * @tc.desc Verify Tuple9 stores nine mixed-type values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t9 = new Tuple9ISBDFCISB(
      1, "a", true, 3.14, 2.5 as float, c'X', 99, "s", false
      );
      expect(t9.length).assertEqual(9);
      expect(t9.$7).assertEqual("s");
      expect(t9.$8).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0800
     * @tc.name testTuple0ToTuple008
     * @tc.desc Verify Tuple10 stores ten mixed-type values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t10 = new Tuple10ISBDFCISBI(
      1, "a", true, 3.14, 2.5, c'X', 99, "s", false, 0
      );
      expect(t10.length).assertEqual(10);
      expect(t10.$7).assertEqual("s");
      expect(t10.$8).assertFalse();
      expect(t10.$9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_0900
     * @tc.name testTuple0ToTuple009
     * @tc.desc Verify Tuple1 stores a single string value accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string>("only");
      expect(t.length).assertEqual(1);
      expect(t.$0).assertEqual("only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1000
     * @tc.name testTuple0ToTuple010
     * @tc.desc Verify Tuple1 stores int min max and zero boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tMin = new Tuple1<int>(-2147483648);
      let tMax = new Tuple1<int>(2147483647);
      let tZero = new Tuple1<int>(0);
      expect(tMin.$0).assertEqual(-2147483648);
      expect(tMax.$0).assertEqual(2147483647);
      expect(tZero.$0).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1100
     * @tc.name testTuple0ToTuple011
     * @tc.desc Verify Tuple1 stores string value and string length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string>("hello");
      expect(t.$0).assertEqual("hello");
      expect(t.$0.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1200
     * @tc.name testTuple0ToTuple012
     * @tc.desc Verify Tuple1 stores empty long and unicode string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tEmpty = new Tuple1<string>("");
      let tLong = new Tuple1<string>("a".repeat(1000));
      let tUnicode = new Tuple1<string>("你好世界");
      expect(tEmpty.$0).assertEqual("");
      expect(tEmpty.$0.length).assertEqual(0);
      expect(tLong.$0.length).assertEqual(1000);
      expect(tUnicode.$0).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1300
     * @tc.name testTuple0ToTuple013
     * @tc.desc Verify Tuple1 stores boolean true and false values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tTrue = new Tuple1<boolean>(true);
      let tFalse = new Tuple1<boolean>(false);
      expect(tTrue.$0).assertTrue();
      expect(tFalse.$0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1400
     * @tc.name testTuple0ToTuple014
     * @tc.desc Verify Tuple1 stores high-precision double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(3.14159265358979);
      expect(t.$0).assertEqual(3.14159265358979);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1500
     * @tc.name testTuple0ToTuple015
     * @tc.desc Verify Tuple1 stores double max min zero and negative zero boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1600
     * @tc.name testTuple0ToTuple016
     * @tc.desc Verify Tuple1 stores float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<float>(2.5 as float);
      expect(t.$0).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1700
     * @tc.name testTuple0ToTuple017
     * @tc.desc Verify Tuple1 stores char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<char>(c'A');
      expect(t.$0).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1800
     * @tc.name testTuple0ToTuple018
     * @tc.desc Verify Tuple1 stores digit space and letter char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tDigit = new Tuple1<char>(c'0');
      let tSpace = new Tuple1<char>(c' ');
      let tUnicode = new Tuple1<char>(c'A');
      expect(tDigit.$0).assertEqual(c'0');
      expect(tSpace.$0).assertEqual(c' ');
      expect(tUnicode.$0).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_1900
     * @tc.name testTuple0ToTuple019
     * @tc.desc Verify Tuple1 stores array of int values accessible by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<Array<int>>([1, 2, 3]);
      expect(t.$0.length).assertEqual(3);
      expect(t.$0[0]).assertEqual(1);
      expect(t.$0[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2000
     * @tc.name testTuple0ToTuple020
     * @tc.desc Verify Tuple2 stores arrays of string and boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<Array<string>, Array<boolean>>(["a", "b"], [true, false]);
      expect(t.$0.length).assertEqual(2);
      expect(t.$0[1]).assertEqual("b");
      expect(t.$1.length).assertEqual(2);
      expect(t.$1[0]).assertTrue();
      expect(t.$1[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2100
     * @tc.name testTuple0ToTuple021
     * @tc.desc Verify Tuple1 stores empty array with zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<Array<int>>([]);
      expect(t.$0.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2200
     * @tc.name testTuple0ToTuple022
     * @tc.desc Verify Tuple1 stores nested Tuple2 as element accessible by chained field access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Tuple2IS(1, "inner");
      let t = new Tuple1<Tuple2IS>(inner);
      expect(t.$0.$0).assertEqual(1);
      expect(t.$0.$1).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2300
     * @tc.name testTuple0ToTuple023
     * @tc.desc Verify Tuple2 stores nested Tuple1 elements accessible by chained field access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<Tuple1<int>, Tuple1<string>>(
      new Tuple1<int>(42),
      new Tuple1<string>("nested")
      );
      expect(t.$0.$0).assertEqual(42);
      expect(t.$1.$0).assertEqual("nested");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2400
     * @tc.name testTuple0ToTuple024
     * @tc.desc Verify Tuple1 stores three-layer nested Tuple accessible by triple chained field access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<Tuple1<Tuple1<int>>>(
      new Tuple1<Tuple1<int>>(new Tuple1<int>(99))
      );
      expect(t.$0.$0.$0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2500
     * @tc.name testTuple0ToTuple025
     * @tc.desc Verify Tuple3 and Tuple5 with same-type elements store and read values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t3 = new Tuple3<int, int, int>(1, 2, 3);
      let t5 = new Tuple5<string, string, string, string, string>("a", "b", "c", "d", "e");
      expect(t3.$0).assertEqual(1);
      expect(t3.$2).assertEqual(3);
      expect(t5.$0).assertEqual("a");
      expect(t5.$4).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2600
     * @tc.name testTuple0ToTuple026
     * @tc.desc Verify Tuple1 stores null value in nullable string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string|null>(null);
      expect(t.$0).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2700
     * @tc.name testTuple0ToTuple027
     * @tc.desc Verify Tuple2 stores null and int values together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2<string|null, int>(null, 42);
      expect(t.$0).assertEqual(null);
      expect(t.$1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2800
     * @tc.name testTuple0ToTuple028
     * @tc.desc Verify Tuple1 stores undefined value in nullable string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<string|undefined>(undefined);
      expect(t.$0).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_2900
     * @tc.name testTuple0ToTuple029
     * @tc.desc Verify Tuple1 stores positive infinity double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(Double.POSITIVE_INFINITY);
      expect(isFinite(t.$0)).assertFalse();
      expect(t.$0).assertPosUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3000
     * @tc.name testTuple0ToTuple030
     * @tc.desc Verify Tuple1 stores negative infinity double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(Double.NEGATIVE_INFINITY);
      expect(isFinite(t.$0)).assertFalse();
      expect(t.$0).assertNegUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3100
     * @tc.name testTuple0ToTuple031
     * @tc.desc Verify Tuple1 stores NaN double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<double>(Double.NaN);
      expect(isNaN(t.$0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3200
     * @tc.name testTuple0ToTuple032
     * @tc.desc Verify field access returns correct typed value from each Tuple1 through Tuple10 position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
   it('testTuple0ToTuple032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1i: int = new Tuple1<int>(42).$0;
      expect(s1i).assertEqual(42);
      let s1: string = new Tuple1<string>("hello").$0;
      expect(s1).assertEqual("hello");
      let s2: string = new Tuple2IS(1, "two").$1;
      expect(s2).assertEqual("two");
      let s3: boolean = new Tuple3ISB(100, "beta", false).$2;
      expect(s3).assertFalse();
      let s4: double = new Tuple4ISBD(200, "gamma", true, 2.71).$3;
      expect(s4).assertEqual(2.71);
      let s6: char = new Tuple6ISBDFC(20, "world", false, 2.71, 3.5 as float, c'Z').$5;
      expect(s6).assertEqual(c'Z');
      let s7: int = new Tuple7ISBDFCI(20, "world", false, 2.71, 3.5 as float, c'Z', 88).$6;
      expect(s7).assertEqual(88);
      let s8: string = new Tuple8ISBDFCIS(20, "world", false, 2.71, 3.5 as float, c'Z', 88, "done").$7;
      expect(s8).assertEqual("done");
      let s9: boolean = new Tuple9ISBDFCISB(20, "world", false, 2.71, 3.5 as float, c'Z', 88, "done", true).$8;
      expect(s9).assertTrue();
      let s10: int = new Tuple10ISBDFCISBI(20, "world", false, 2.71, 3.5, c'Z', 88, "done", true, 999).$9;
      expect(s10).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3300
     * @tc.name testTuple0ToTuple033
     * @tc.desc Verify Tuple2 field access returns int and string values assigned to separate variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2IS(42, "hello");
      let v0: int = t.$0;
      let v1: string = t.$1;
      expect(v0).assertEqual(42);
      expect(v1).assertEqual("hello");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3400
     * @tc.name testTuple0ToTuple034
     * @tc.desc Verify Tuple5 stores and reads five mixed-type values by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5ISBDF(10, "x", false, 1.1, 2.2 as float);
      expect(t.$0).assertEqual(10);
      expect(t.$1).assertEqual("x");
      expect(t.$2).assertFalse();
      expect(t.$3).assertEqual(1.1);
      expect(t.$4).assertEqual(2.2 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3500
     * @tc.name testTuple0ToTuple035
     * @tc.desc Verify Tuple10 unsafeGet iteration sums all int values to 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10Int(
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3600
     * @tc.name testTuple0ToTuple036
     * @tc.desc Verify Tuple6 field access returns all six mixed-type values assigned to variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple6ISBDFC(
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3700
     * @tc.name testTuple0ToTuple037
     * @tc.desc Verify Tuple1 toString output contains the stored int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<int>(42);
      let s: string = t.toString();
      expect(s).assertContain("42");
      expect(t.$0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3800
     * @tc.name testTuple0ToTuple038
     * @tc.desc Verify Tuple2 toString output contains both stored values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2IS(1, "one");
      let s: string = t.toString();
      expect(s).assertContain("1");
      expect(s).assertContain("one");
      expect(t.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_3900
     * @tc.name testTuple0ToTuple039
     * @tc.desc Verify Tuple5 toString output contains all five stored values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5ISBDF(5, "hello", false, 2.71, 1.5 as float);
      let s: string = t.toString();
      expect(s).assertContain("5");
      expect(s).assertContain("hello");
      expect(s).assertContain("2.71");
      expect(t.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4000
     * @tc.name testTuple0ToTuple040
     * @tc.desc Verify Tuple10 toString output contains all stored int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10Int(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      let s: string = t.toString();
      expect(s).assertContain("0");
      expect(s).assertContain("5");
      expect(s).assertContain("9");
      expect(t.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4100
     * @tc.name testTuple0ToTuple041
     * @tc.desc Verify Tuple10 stores int values at first middle and last positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple10Int(
      10, 20, 30, 40, 50, 60, 70, 80, 90, 100
      );
      expect(t.$0).assertEqual(10);
      expect(t.$5).assertEqual(60);
      expect(t.$9).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4200
     * @tc.name testTuple0ToTuple042
     * @tc.desc Verify Tuple7 stores and reads seven mixed-type values by field index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple7ISBDFCI(
      1, "a", true, 2.0, 3.0 as float, c'Z', 99
      );
      expect(t.$0).assertEqual(1);
      expect(t.$1).assertEqual("a");
      expect(t.$2).assertTrue();
      expect(t.$6).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4300
     * @tc.name testTuple0ToTuple043
     * @tc.desc Verify two separately constructed Tuple2 instances with equal field values; reference independence is guaranteed by separate construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new Tuple2IS(1, "a");
      let t2 = new Tuple2IS(1, "a");
      expect(t1.$0).assertEqual(t2.$0);
      expect(t1.$1).assertEqual(t2.$1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4400
     * @tc.name testTuple0ToTuple044
     * @tc.desc Verify Tuple3 and Tuple5 with overlapping leading types have equal leading fields; reference independence is guaranteed by separate construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t3 = new Tuple3ISB(1, "a", true);
      let t5 = new Tuple5ISBDF(1, "a", true, 1.0, 2.0 as float);
      expect(t3.$0).assertEqual(t5.$0);
      expect(t3.$1).assertEqual(t5.$1);
      expect(t3.$2).assertEqual(t5.$2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4500
     * @tc.name testTuple0ToTuple045
     * @tc.desc Verify Tuple3 unsafeGet returns int string and boolean values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3ISB(1, "a", true);
      expect(t.unsafeGet(0) as int).assertEqual(1);
      expect(t.unsafeGet(1) as string).assertEqual("a");
      expect(t.unsafeGet(2) as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4600
     * @tc.name testTuple0ToTuple046
     * @tc.desc Verify Tuple2 unsafeGet throws Error on negative out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2IS(1, "a");
      expect(t.length).assertEqual(2);
      try {
        t.unsafeGet(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4700
     * @tc.name testTuple0ToTuple047
     * @tc.desc Verify Tuple3 unsafeGet throws Error on out-of-bounds index equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3ISB(1, "a", true);
      expect(t.length).assertEqual(3);
      try {
        t.unsafeGet(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4800
     * @tc.name testTuple0ToTuple048
     * @tc.desc Verify Tuple2 unsafeGet values match field access values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2IS(42, "hello");
      expect(t.unsafeGet(0) as int).assertEqual(t.$0);
      expect(t.unsafeGet(1) as string).assertEqual(t.$1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_4900
     * @tc.name testTuple0ToTuple049
     * @tc.desc Verify Tuple1 unsafeGet throws on negative index after successful field access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple1<int>(42);
      expect(t.$0).assertEqual(42);
      try {
        t.unsafeGet(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5000
     * @tc.name testTuple0ToTuple050
     * @tc.desc Verify Tuple2 unsafeGet throws on out-of-bounds index equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2IS(1, "a");
      expect(t.length).assertEqual(2);
      try {
        t.unsafeGet(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5100
     * @tc.name testTuple0ToTuple051
     * @tc.desc Verify Tuple0 unsafeGet throws on negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple0();
      expect(t.length).assertEqual(0);
      try {
        t.unsafeGet(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5200
     * @tc.name testTuple0ToTuple052
     * @tc.desc Verify Tuple5 unsafeGet throws on max int out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple5ISBDF(0, "", false, 0.0, 0.0 as float);
      expect(t.length).assertEqual(5);
      try {
        t.unsafeGet(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5300
     * @tc.name testTuple0ToTuple053
     * @tc.desc Verify Tuple3 unsafeGet throws on min int negative out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple3ISB(1, "a", true);
      expect(t.length).assertEqual(3);
      try {
        t.unsafeGet(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5400
     * @tc.name testTuple0ToTuple054
     * @tc.desc Verify Tuple2 toString output contains both stored values with non-default string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple2IS(1, "v20");
      let s: string = t.toString();
      expect(s).assertContain("1");
      expect(s).assertContain("v20");
      expect(t.$0).assertEqual(1);
      expect(t.$1).assertEqual("v20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5500
     * @tc.name testTuple0ToTuple055
     * @tc.desc Verify Tuple0 Tuple1 and Tuple10 store correct length and field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t0 = new Tuple0();
      let t1 = new Tuple1<int>(1);
      let t10 = new Tuple10Int(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9
      );
      expect(t0.length).assertEqual(0);
      expect(t1.length).assertEqual(1);
      expect(t10.length).assertEqual(10);
      expect(t1.$0).assertEqual(1);
      expect(t10.$9).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5600
     * @tc.name testTuple0ToTuple056
     * @tc.desc Verify nested Tuple values remain accessible through fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Tuple3ISB(42, "中文", true);
      let tuple = new Tuple2<Tuple3ISB, string>(inner, "outer");
      expect(tuple.$0.$0).assertEqual(42);
      expect(tuple.$0.$1).assertEqual("中文");
      expect(tuple.$0.$2).assertTrue();
      expect(tuple.$1).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5700
     * @tc.name testTuple0ToTuple057
     * @tc.desc Verify Tuple2 stores max and min int boundary values together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple = new Tuple2<int, int>(2147483647, -2147483648);
      expect(tuple.$0).assertEqual(2147483647);
      expect(tuple.$1).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5800
     * @tc.name testTuple0ToTuple058
     * @tc.desc Verify Tuple3 stores escaped and multilingual strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple = new Tuple3<string, string, string>("line\\nbreak", "日本語", "<" + "script>alert(1)<" + "/script>");
      expect(tuple.$0).assertEqual("line\\nbreak");
      expect(tuple.$1).assertEqual("日本語");
      expect(tuple.$2).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_5900
     * @tc.name testTuple0ToTuple059
     * @tc.desc Verify Tuple2 preserves object reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objectValue = new Object();
      let tuple = new Tuple2<Object, Object>(objectValue, objectValue);
      expect(tuple.$0).assertEqual(objectValue);
      expect(tuple.$1).assertEqual(objectValue);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_6000
     * @tc.name testTuple0ToTuple060
     * @tc.desc Verify Tuple2 stores arrays with different element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple = new Tuple2<Array<int>, Array<string>>([0, -1, 42], ["", "English", "العربية"]);
      expect(tuple.$0.length).assertEqual(3);
      expect(tuple.$0[1]).assertEqual(-1);
      expect(tuple.$1[0]).assertEqual("");
      expect(tuple.$1[2]).assertEqual("العربية");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_6100
     * @tc.name testTuple0ToTuple061
     * @tc.desc Verify Tuple5 combines nested Tuple, array, object, boolean and char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Tuple2IS(100, "inner");
      let objectValue = new Object();
      let tuple = new Tuple5<Tuple2IS, Array<int>, Object, boolean, char>(
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE0_TO_TUPLE10_6200
     * @tc.name testTuple0ToTuple062
     * @tc.desc Verify Tuple4 unsafeGet throws on out-of-bounds index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTuple0ToTuple062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = new Tuple4ISBD(1, "a", true, 3.14);
      expect(t.length).assertEqual(4);
      try {
        t.unsafeGet(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });


  });
}
