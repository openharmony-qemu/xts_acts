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


export default function IteratorResultConstructor3Test(): void {
  describe('IteratorResultConstructor3Test',(): void => {
    beforeAll((): void => {
    });
    beforeEach(async():Promise<void> =>{
      await Utils.msSleep(30);
    });
    afterEach(():void =>{
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0100
     * @tc.name testIteratorResultConstructor3001
     * @tc.desc Verify single-arg constructor with one value creates IteratorResult with done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("hello");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0200
     * @tc.name testIteratorResultConstructor3002
     * @tc.desc Verify single-arg constructor uses one value argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(42);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0300
     * @tc.name testIteratorResultConstructor3003
     * @tc.desc Verify single-arg constructor with normal string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("hello world");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0400
     * @tc.name testIteratorResultConstructor3004
     * @tc.desc Verify single-arg constructor with empty string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0500
     * @tc.name testIteratorResultConstructor3005
     * @tc.desc Verify single-arg constructor with long string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let result = new IteratorResult<string>(longStr);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0600
     * @tc.name testIteratorResultConstructor3006
     * @tc.desc Verify single-arg constructor with special characters string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("hello\n\t\r\\\"\'world");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello\n\t\r\\\"\'world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0700
     * @tc.name testIteratorResultConstructor3007
     * @tc.desc Verify single-arg constructor with Unicode string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("你好世界🌍🎉");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("你好世界🌍🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0800
     * @tc.name testIteratorResultConstructor3008
     * @tc.desc Verify single-arg constructor with zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("hello​world");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello​world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_0900
     * @tc.name testIteratorResultConstructor3009
     * @tc.desc Verify single-arg constructor with XSS string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("<script>alert('xss')</script>");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("<script>alert('xss')</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1000
     * @tc.name testIteratorResultConstructor3010
     * @tc.desc Verify single-arg constructor with template string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "world";
      let result = new IteratorResult<string>("hello " + name);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1100
     * @tc.name testIteratorResultConstructor3011
     * @tc.desc Verify single-arg constructor with negative number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(-42);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1200
     * @tc.name testIteratorResultConstructor3012
     * @tc.desc Verify single-arg constructor with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(0);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1300
     * @tc.name testIteratorResultConstructor3013
     * @tc.desc Verify single-arg constructor with decimal number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(3.14159);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1400
     * @tc.name testIteratorResultConstructor3014
     * @tc.desc Verify single-arg constructor with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: number = Number.NaN;
      let result = new IteratorResult<number>(nanValue);
      expect(result.done).assertFalse();
      expect(Number.isNaN(result.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1500
     * @tc.name testIteratorResultConstructor3015
     * @tc.desc Verify single-arg constructor with Infinity and -Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinity: number = Number.POSITIVE_INFINITY;
      let negativeInfinity: number = Number.NEGATIVE_INFINITY;
      let result1 = new IteratorResult<number>(positiveInfinity);
      expect(result1.done).assertFalse();
      expect(result1.value).assertEqual(positiveInfinity);
      let result2 = new IteratorResult<number>(negativeInfinity);
      expect(result2.done).assertFalse();
      expect(result2.value).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1600
     * @tc.name testIteratorResultConstructor3016
     * @tc.desc Verify single-arg constructor with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(Number.MAX_VALUE);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1700
     * @tc.name testIteratorResultConstructor3017
     * @tc.desc Verify single-arg constructor with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(Number.MIN_VALUE);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1800
     * @tc.name testIteratorResultConstructor3018
     * @tc.desc Verify single-arg constructor with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(-0);
      expect(result.done).assertFalse();
      let v = result.value as number;
      expect(1 / v === Number.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_1900
     * @tc.name testIteratorResultConstructor3019
     * @tc.desc Verify single-arg constructor with number value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(255);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2000
     * @tc.name testIteratorResultConstructor3020
     * @tc.desc Verify single-arg constructor with number value 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(63);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2100
     * @tc.name testIteratorResultConstructor3021
     * @tc.desc Verify single-arg constructor with scientific notation number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(1.5e10);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(1.5e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2200
     * @tc.name testIteratorResultConstructor3022
     * @tc.desc Verify single-arg constructor with boolean true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(true);
      expect(result.done).assertFalse();
      expect(result.value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2300
     * @tc.name testIteratorResultConstructor3023
     * @tc.desc Verify single-arg constructor with boolean false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false);
      expect(result.done).assertFalse();
      expect(result.value).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2400
     * @tc.name testIteratorResultConstructor3024
     * @tc.desc Verify single-arg constructor with object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object> = { "name": "test" as Object, "age": 20 as Object };
      let result = new IteratorResult<Record<string, Object>>(obj);
      expect(result.done).assertFalse();
      expect(result.value!).assertEqual(obj);
    });

     /**
      * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2500
      * @tc.name testIteratorResultConstructor3025
      * @tc.desc Verify single-arg constructor with nested object preserves reference semantics (mutation visible through result.value)
      * @tc.size MediumTest
      * @tc.type Function
      * @tc.level Level 2
      */
     it('testIteratorResultConstructor3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       let nestedInner: Record<string, number> = { "c": 123 };
       let nestedMid: Record<string, Record<string, number>> = { "b": nestedInner };
       let nested: Record<string, Record<string, Record<string, number>>> = { "a": nestedMid };
       let result = new IteratorResult<Record<string, Record<string, Record<string, number>>>>(nested);
       expect(result.done).assertFalse();
       expect(result.value!["a"]!["b"]!["c"]!).assertEqual(123);
       nestedInner["c"] = 456;
       expect(result.value!["a"]!["b"]!["c"]!).assertEqual(456);
       nestedMid["d"] = { "e": 789 } as Record<string, number>;
       expect(result.value!["a"]!["d"]!["e"]!).assertEqual(789);
     });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2600
     * @tc.name testIteratorResultConstructor3026
     * @tc.desc Verify single-arg constructor with object containing undefined property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object | undefined> = { "name": undefined } as Record<string, Object | undefined>;
      let result = new IteratorResult<Record<string, Object | undefined>>(obj);
      expect(result.done).assertFalse();
      let v = result.value;
      expect(v !== undefined).assertTrue();
      if (v !== undefined) {
        expect(v["name"] === undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2700
     * @tc.name testIteratorResultConstructor3027
     * @tc.desc Verify single-arg constructor with array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result = new IteratorResult<number[]>(arr);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2800
     * @tc.name testIteratorResultConstructor3028
     * @tc.desc Verify single-arg constructor with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>([]);
      expect(result.done).assertFalse();
      expect(result.value!.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_2900
     * @tc.name testIteratorResultConstructor3029
     * @tc.desc Verify single-arg constructor with multi-dimensional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      let result = new IteratorResult<number[][]>(arr);
      expect(result.done).assertFalse();
      expect(result.value!.length).assertEqual(3);
      expect(result.value![0][0]).assertEqual(1);
      expect(result.value![2][1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3000
     * @tc.name testIteratorResultConstructor3030
     * @tc.desc Verify single-arg constructor with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigArr: number[] = [];
      for (let idx: number = 0; idx < 10000; idx++) {
        bigArr.push(idx);
      }
      let result = new IteratorResult<number[]>(bigArr);
      expect(result.done).assertFalse();
      expect(result.value!.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3100
     * @tc.name testIteratorResultConstructor3031
     * @tc.desc Verify single-arg constructor supports nullable value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | null>(null);
      expect(result.done).assertFalse();
      expect(result.value === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3200
     * @tc.name testIteratorResultConstructor3032
     * @tc.desc Verify single-arg constructor supports undefined value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | undefined>(undefined);
      expect(result.done).assertFalse();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3300
     * @tc.name testIteratorResultConstructor3033
     * @tc.desc Verify single-arg constructor value matches generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("valid");
      expect(result.done).assertFalse();
      expect(typeof result.value === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3400
     * @tc.name testIteratorResultConstructor3034
     * @tc.desc Verify single-arg constructor returns IteratorResult with correct properties for number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(100);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3500
     * @tc.name testIteratorResultConstructor3035
     * @tc.desc Verify single-arg constructor returns IteratorResult with correct properties for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let result = new IteratorResult<number[]>(arr);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3600
     * @tc.name testIteratorResultConstructor3036
     * @tc.desc Verify done property is always false for single-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new IteratorResult<string>("a");
      let r2 = new IteratorResult<number>(0);
      let r3 = new IteratorResult<boolean>(false);
      let r4 = new IteratorResult<string>("");
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r3.done).assertFalse();
      expect(r4.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3700
     * @tc.name testIteratorResultConstructor3037
     * @tc.desc Verify value equals passed argument for single-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "testValue";
      let result = new IteratorResult<string>(val);
      expect(result.value).assertEqual(val);
      expect(result.value === val).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3800
     * @tc.name testIteratorResultConstructor3038
     * @tc.desc Verify empty string value gives done=false and value is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("");
      let v = result.value;
      expect(v !== undefined).assertTrue();
      if (v !== undefined) {
        expect(v.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_3900
     * @tc.name testIteratorResultConstructor3039
     * @tc.desc Verify zero value gives done=false and value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(0);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(0);
      expect(result.value === 0).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4000
     * @tc.name testIteratorResultConstructor3040
     * @tc.desc Verify returned object is IteratorResult instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("test");
      expect(result instanceof IteratorResult).assertTrue();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4100
     * @tc.name testIteratorResultConstructor3041
     * @tc.desc Verify done property is boolean and false for single-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(42);
      expect(typeof result.done === "boolean").assertTrue();
      expect(result.done === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4200
     * @tc.name testIteratorResultConstructor3042
     * @tc.desc Verify value property type matches generic T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strResult = new IteratorResult<string>("hello");
      expect(typeof strResult.value === "string").assertTrue();
      let numResult = new IteratorResult<number>(42);
      expect(typeof numResult.value === "number").assertTrue();
      let boolResult = new IteratorResult<boolean>(true);
      expect(typeof boolResult.value === "boolean").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4300
     * @tc.name testIteratorResultConstructor3043
     * @tc.desc Verify -Number.MAX_VALUE is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(-Number.MAX_VALUE);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(-Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4400
     * @tc.name testIteratorResultConstructor3044
     * @tc.desc Verify long string (100000 chars) is stored correctly without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let superLongStr: string = "x".repeat(100000);
      let result = new IteratorResult<string>(superLongStr);
      expect(result.done).assertFalse();
      let v = result.value;
      expect(v !== undefined).assertTrue();
      if (v !== undefined) {
        expect(v.length).assertEqual(100000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4500
     * @tc.name testIteratorResultConstructor3045
     * @tc.desc Verify large array (100000 elements) is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigArr: number[] = [];
      for (let idx: number = 0; idx < 100000; idx++) {
        bigArr.push(idx);
      }
      let result = new IteratorResult<number[]>(bigArr);
      expect(result.done).assertFalse();
      expect(result.value!.length).assertEqual(100000);
      expect(result.value![99999]).assertEqual(99999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4600
     * @tc.name testIteratorResultConstructor3046
     * @tc.desc Verify reference type values maintain reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object> = { "key": "value" as Object };
      let result = new IteratorResult<Record<string, Object>>(obj);
      expect(result.value! === obj).assertTrue();
      let arr: number[] = [1, 2, 3];
      let result2 = new IteratorResult<number[]>(arr);
      expect(result2.value === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4700
     * @tc.name testIteratorResultConstructor3047
     * @tc.desc Verify modifying original reference affects value (reference semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object> = { "key": "original" as Object };
      let result = new IteratorResult<Record<string, Object>>(obj);
      obj["key"] = "modified" as Object;
      expect(result.value!["key"]!).assertEqual("modified" as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR3_4800
     * @tc.name testIteratorResultConstructor3048
     * @tc.desc Verify multiple instances created by single-arg constructor are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor3048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new IteratorResult<string>("hello");
      let r2 = new IteratorResult<number>(42);
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual("hello");
      expect(r2.done).assertFalse();
      expect(r2.value).assertEqual(42);
    });
  });
}