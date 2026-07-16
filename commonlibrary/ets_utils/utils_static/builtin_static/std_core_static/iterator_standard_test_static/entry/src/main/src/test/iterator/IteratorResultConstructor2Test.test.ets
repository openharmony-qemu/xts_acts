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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';


export default function IteratorResultConstructor2Test(): void {
  describe('IteratorResultConstructor2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0100
     * @tc.name testIteratorResultConstructor2001
     * @tc.desc Verify two-arg constructor with both done and value parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(true, "hello");
      expect(result.done).assertTrue();
      expect(result.value).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0200
     * @tc.name testIteratorResultConstructor2002
     * @tc.desc Verify two-arg constructor uses done and value parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "hello");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0300
     * @tc.name testIteratorResultConstructor2003
     * @tc.desc Verify two-arg constructor can represent completed iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | undefined>(true, undefined);
      expect(result.done).assertTrue();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0400
     * @tc.name testIteratorResultConstructor2004
     * @tc.desc Verify two-arg constructor uses the valid two-parameter call form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 1);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0500
     * @tc.name testIteratorResultConstructor2005
     * @tc.desc Verify done=false sets incomplete state correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "value");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0600
     * @tc.name testIteratorResultConstructor2006
     * @tc.desc Verify done parameter is boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | undefined>(true, undefined);
      expect(result.done).assertTrue();
      expect(typeof result.done === "boolean").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0700
     * @tc.name testIteratorResultConstructor2007
     * @tc.desc Verify done parameter is boolean false with undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | undefined>(false, undefined);
      expect(result.done).assertFalse();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0800
     * @tc.name testIteratorResultConstructor2008
     * @tc.desc Verify done=false stores numeric zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 0);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_0900
     * @tc.name testIteratorResultConstructor2009
     * @tc.desc Verify done=true stores numeric one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(true, 1);
      expect(result.done).assertTrue();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1000
     * @tc.name testIteratorResultConstructor2010
     * @tc.desc Verify done=false stores empty string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1100
     * @tc.name testIteratorResultConstructor2011
     * @tc.desc Verify done=true stores string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(true, "true");
      expect(result.done).assertTrue();
      expect(result.value).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1200
     * @tc.name testIteratorResultConstructor2012
     * @tc.desc Verify done=false stores object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { "a": 1 } as Record<string, number>;
      let result = new IteratorResult<Record<string, number>>(false, obj);
      expect(result.value === obj).assertTrue();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1300
     * @tc.name testIteratorResultConstructor2013
     * @tc.desc Verify done=false stores array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      let result = new IteratorResult<number[]>(false, arr);
      expect(result.value === arr).assertTrue();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1400
     * @tc.name testIteratorResultConstructor2014
     * @tc.desc Verify value is a normal string for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "hello world");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1500
     * @tc.name testIteratorResultConstructor2015
     * @tc.desc Verify value is a long string for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let result = new IteratorResult<string>(false, longStr);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1600
     * @tc.name testIteratorResultConstructor2016
     * @tc.desc Verify value with special characters for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "\\n\\t\\r\\0\\b\\f");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("\\n\\t\\r\\0\\b\\f");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1700
     * @tc.name testIteratorResultConstructor2017
     * @tc.desc Verify value is Unicode string for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "你好世界🌍");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("你好世界🌍");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1800
     * @tc.name testIteratorResultConstructor2018
     * @tc.desc Verify value is a positive number for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 42);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_1900
     * @tc.name testIteratorResultConstructor2019
     * @tc.desc Verify value is a negative number for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, -42);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2000
     * @tc.name testIteratorResultConstructor2020
     * @tc.desc Verify value is a decimal number for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 3.14);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2100
     * @tc.name testIteratorResultConstructor2021
     * @tc.desc Verify value is NaN for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: number = Number.NaN;
      let result = new IteratorResult<number>(false, nanValue);
      expect(Number.isNaN(result.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2200
     * @tc.name testIteratorResultConstructor2022
     * @tc.desc Verify value is Infinity for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infinityValue: number = Number.POSITIVE_INFINITY;
      let result = new IteratorResult<number>(false, infinityValue);
      expect(result.value).assertEqual(infinityValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2300
     * @tc.name testIteratorResultConstructor2023
     * @tc.desc Verify value is Number.MAX_VALUE for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, Number.MAX_VALUE);
      expect(result.value).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2400
     * @tc.name testIteratorResultConstructor2024
     * @tc.desc Verify value is Number.MIN_VALUE for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, Number.MIN_VALUE);
      expect(result.value).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2500
     * @tc.name testIteratorResultConstructor2025
     * @tc.desc Verify value is true for boolean generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false, true);
      expect(result.value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2600
     * @tc.name testIteratorResultConstructor2026
     * @tc.desc Verify value is false for boolean generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false, false);
      expect(result.value).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2700
     * @tc.name testIteratorResultConstructor2027
     * @tc.desc Verify value is a normal object for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { "name": "test" } as Record<string, string>;
      let result = new IteratorResult<Record<string, string>>(false, obj);
      expect(result.value!["name"]!).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2800
     * @tc.name testIteratorResultConstructor2028
     * @tc.desc Verify value is a nested object for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerObj: Record<string, number> = { "b": 1 } as Record<string, number>;
      let outerObj: Record<string, Record<string, number>> = { "a": innerObj } as Record<string, Record<string, number>>;
      let result = new IteratorResult<Record<string, Record<string, number>>>(false, outerObj);
      expect(result.value!["a"]!["b"]!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_2900
     * @tc.name testIteratorResultConstructor2029
     * @tc.desc Verify value is a normal array for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expected: number[] = [1, 2, 3];
      let result = new IteratorResult<number[]>(false, expected);
      expect(result.value).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3000
     * @tc.name testIteratorResultConstructor2030
     * @tc.desc Verify value is an empty array for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>(false, []);
      expect(result.value!.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3100
     * @tc.name testIteratorResultConstructor2031
     * @tc.desc Verify value is a multi-dimensional array for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[][]>(false, [[1, 2], [3, 4]]);
      expect(result.value!.length).assertEqual(2);
      expect(result.value![0][0]).assertEqual(1);
      expect(result.value![1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3200
     * @tc.name testIteratorResultConstructor2032
     * @tc.desc Verify nullable value type can store null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | null>(false, null);
      expect(result.done).assertFalse();
      expect(result.value === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3300
     * @tc.name testIteratorResultConstructor2033
     * @tc.desc Verify two-arg constructor value matches generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "valid");
      expect(result.done).assertFalse();
      expect(typeof result.value === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3400
     * @tc.name testIteratorResultConstructor2034
     * @tc.desc Verify T=object creates IteratorResult with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { "key": "value" } as Record<string, string>;
      let result = new IteratorResult<Record<string, string>>(false, obj);
      expect(result.value === obj).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3500
     * @tc.name testIteratorResultConstructor2035
     * @tc.desc Verify T=array creates IteratorResult with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let result = new IteratorResult<number[]>(false, arr);
      expect(result.value === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3600
     * @tc.name testIteratorResultConstructor2036
     * @tc.desc Verify done=true with valid value is allowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(true, "last_value");
      expect(result.done).assertTrue();
      expect(result.value).assertEqual("last_value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3700
     * @tc.name testIteratorResultConstructor2037
     * @tc.desc Verify value property type matches generic T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 42);
      expect(typeof result.value === "number").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3800
     * @tc.name testIteratorResultConstructor2038
     * @tc.desc Verify -Number.MAX_VALUE is stored correctly without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, -Number.MAX_VALUE);
      expect(result.value).assertEqual(-Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_3900
     * @tc.name testIteratorResultConstructor2039
     * @tc.desc Verify long string (100000 chars) is stored without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "x".repeat(100000);
      let result = new IteratorResult<string>(false, longStr);
      expect(result.value!.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_4000
     * @tc.name testIteratorResultConstructor2040
     * @tc.desc Verify large array (10000 elements) is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigArr: number[] = [];
      for (let idx: number = 0; idx < 10000; idx++) {
        bigArr.push(0);
      }
      let result = new IteratorResult<number[]>(false, bigArr);
      expect(result.value!.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_4100
     * @tc.name testIteratorResultConstructor2041
     * @tc.desc Verify done=false stores number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 58);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(58);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_4200
     * @tc.name testIteratorResultConstructor2042
     * @tc.desc Verify value type matches T=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "value");
      expect(result.done).assertFalse();
      expect(typeof result.value === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_4300
     * @tc.name testIteratorResultConstructor2043
     * @tc.desc Verify value type matches T=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 62);
      expect(result.done).assertFalse();
      expect(typeof result.value === "number").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_4400
     * @tc.name testIteratorResultConstructor2044
     * @tc.desc Verify value type matches object generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { "id": 63 } as Record<string, number>;
      let result = new IteratorResult<Record<string, number>>(false, obj);
      expect(result.value === obj).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_CONSTRUCTOR2_4500
     * @tc.name testIteratorResultConstructor2045
     * @tc.desc Verify multiple instances created by two-arg constructor are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResultConstructor2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new IteratorResult<number>(false, 42);
      let r2 = new IteratorResult<number>(true, 0);
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(42);
      expect(r2.done).assertTrue();
      expect(r2.value).assertEqual(0);
    });
  });
}
