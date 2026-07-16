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



interface IteratorResultNameRecord1 {
  name: string;
}

class IteratorResultBox1<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
}

class IteratorResultCounter1 {
  count: number;
  constructor(count: number) {
    this.count = count;
  }
}

class IteratorResultNumberIterator1 implements Iterator<number> {
  private values: number[];
  private index: int = 0;
  constructor(values: number[]) {
    this.values = values;
  }
  next(): IteratorResult<number> {
    if (this.index < this.values.length) {
      let current: number = this.values[this.index];
      this.index = this.index + 1;
      return new IteratorResult<number>(current);
    }
    return new IteratorResult<number>();
  }
}

class IteratorResultStringIterator1 implements Iterator<string> {
  private values: string[];
  private index: int = 0;
  constructor(values: string[]) {
    this.values = values;
  }
  next(): IteratorResult<string> {
    if (this.index < this.values.length) {
      let current: string = this.values[this.index];
      this.index = this.index + 1;
      return new IteratorResult<string>(current);
    }
    return new IteratorResult<string>();
  }
}

export default function IteratorResultTest(): void {
  describe('IteratorResultTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0100
     * @tc.name testIteratorResult001
     * @tc.desc Verify IteratorResult instantiation with number generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(42);
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0200
     * @tc.name testIteratorResult002
     * @tc.desc Verify IteratorResult instantiation with boolean generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(true);
      expect(result.value).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0300
     * @tc.name testIteratorResult003
     * @tc.desc Verify IteratorResult instantiation with object generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<Record<string, number>>({ "a": 1 } as Record<string, number>);
      let rv = result.value as Record<string, number>;
      expect(rv["a"]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0400
     * @tc.name testIteratorResult004
     * @tc.desc Verify IteratorResult instantiation with array generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>([1, 2, 3]);
      let v = result.value as number[];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0500
     * @tc.name testIteratorResult005
     * @tc.desc Verify IteratorResult instantiation with nested generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new Map<string, number>();
      m.set("k", 1);
      let result = new IteratorResult<Map<string, number>>(m);
      let mv = result.value as Map<string, number>;
      expect(mv.get("k")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0600
     * @tc.name testIteratorResult006
     * @tc.desc Verify value property read after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("test");
      expect(result.value).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0700
     * @tc.name testIteratorResult007
     * @tc.desc Verify done property read after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("test");
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0800
     * @tc.name testIteratorResult008
     * @tc.desc Verify IteratorResult properties keep constructor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("immutable");
      expect(result.value).assertEqual("immutable");
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_0900
     * @tc.name testIteratorResult009
     * @tc.desc Verify different generic types all return done=true for no-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new IteratorResult<string>();
      let r2 = new IteratorResult<number>();
      let r3 = new IteratorResult<boolean>();
      expect(r1.done).assertEqual(true);
      expect(r2.done).assertEqual(true);
      expect(r3.done).assertEqual(true);
      expect(r1.value === undefined).assertTrue();
      expect(r2.value === undefined).assertTrue();
      expect(r3.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1000
     * @tc.name testIteratorResult010
     * @tc.desc Verify multiple no-arg instances are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new IteratorResult<string>();
      let r2 = new IteratorResult<string>();
      expect(r1.done).assertEqual(true);
      expect(r2.done).assertEqual(true);
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1100
     * @tc.name testIteratorResult011
     * @tc.desc Verify two-arg constructor uses the valid two-parameter call form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 20);
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1200
     * @tc.name testIteratorResult012
     * @tc.desc Verify value is undefined when explicitly passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | undefined>(false, undefined);
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1300
     * @tc.name testIteratorResult013
     * @tc.desc Verify value is empty string for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "");
      expect(result.value).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1400
     * @tc.name testIteratorResult014
     * @tc.desc Verify T=number with value for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 100);
      expect(result.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1500
     * @tc.name testIteratorResult015
     * @tc.desc Verify value is 0 for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 0);
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1600
     * @tc.name testIteratorResult016
     * @tc.desc Verify value is negative number for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, -1);
      expect(result.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1700
     * @tc.name testIteratorResult017
     * @tc.desc Verify value is NaN for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: number = Number.NaN;
      let result = new IteratorResult<number>(false, nanValue);
      let v = result.value as number;
      expect(Number.isNaN(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1800
     * @tc.name testIteratorResult018
     * @tc.desc Verify value is -Infinity for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInfinity: number = Number.NEGATIVE_INFINITY;
      let result = new IteratorResult<number>(false, negativeInfinity);
      expect(result.value).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_1900
     * @tc.name testIteratorResult019
     * @tc.desc Verify T=boolean with value true for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false, true);
      expect(result.value).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2000
     * @tc.name testIteratorResult020
     * @tc.desc Verify T=boolean with value false for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false, false);
      expect(result.value).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2100
     * @tc.name testIteratorResult021
     * @tc.desc Verify T=object with value for single-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<Record<string, number>>({ "x": 42 } as Record<string, number>);
      let rv2 = result.value as Record<string, number>;
      expect(rv2["x"]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2200
     * @tc.name testIteratorResult022
     * @tc.desc Verify T=array with value for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>(false, [1, 2, 3]);
      let v = result.value as number[];
      expect(v.length).assertEqual(3);
      expect(v[0]).assertEqual(1);
      expect(v[1]).assertEqual(2);
      expect(v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2300
     * @tc.name testIteratorResult023
     * @tc.desc Verify value is empty array for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>(false, []);
      let v = result.value as number[];
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2400
     * @tc.name testIteratorResult024
     * @tc.desc Verify value is long string for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let result = new IteratorResult<string>(false, longStr);
      let v = result.value as string;
      expect(v.length).assertEqual(10000);
      expect(v.substring(0, 1)).assertEqual("a");
      expect(v.substring(5000, 5001)).assertEqual("a");
      expect(v.substring(9999, 10000)).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2500
     * @tc.name testIteratorResult025
     * @tc.desc Verify value is Number.MAX_SAFE_INTEGER for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, Number.MAX_SAFE_INTEGER);
      expect(result.value).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2600
     * @tc.name testIteratorResult026
     * @tc.desc Verify value is Number.MIN_SAFE_INTEGER for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, Number.MIN_SAFE_INTEGER);
      expect(result.value).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2700
     * @tc.name testIteratorResult027
     * @tc.desc Verify done=true with valid value (semantic contradiction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(true, "value");
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2800
     * @tc.name testIteratorResult028
     * @tc.desc Verify done=false and value=undefined combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | undefined>(false, undefined);
      expect(result.done).assertEqual(false);
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_2900
     * @tc.name testIteratorResult029
     * @tc.desc Verify T=number value type is correct for two-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(false, 42);
      expect(typeof result.value === "number").assertTrue();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3000
     * @tc.name testIteratorResult030
     * @tc.desc Verify T=object value reference equality for single-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { "a": 1 } as Record<string, number>;
      let result = new IteratorResult<Record<string, number>>(obj);
      expect(result.value).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3100
     * @tc.name testIteratorResult031
     * @tc.desc Verify done property is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(true, "done");
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3200
     * @tc.name testIteratorResult032
     * @tc.desc Verify value type matches generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>(false, "typed");
      expect(result.done).assertFalse();
      expect(typeof result.value === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3300
     * @tc.name testIteratorResult033
     * @tc.desc Verify single-arg constructor with one value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("hello");
      expect(result.done).assertEqual(false);
      expect(result.value).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3400
     * @tc.name testIteratorResult034
     * @tc.desc Verify single-arg constructor with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("");
      expect(result.value).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3500
     * @tc.name testIteratorResult035
     * @tc.desc Verify single-arg constructor with Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("你好世界");
      expect(result.value).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3600
     * @tc.name testIteratorResult036
     * @tc.desc Verify single-arg constructor with emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("😀🎉");
      expect(result.value).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3700
     * @tc.name testIteratorResult037
     * @tc.desc Verify single-arg constructor with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(123);
      expect(result.value).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3800
     * @tc.name testIteratorResult038
     * @tc.desc Verify single-arg constructor with 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(0);
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_3900
     * @tc.name testIteratorResult039
     * @tc.desc Verify single-arg constructor with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(-99);
      expect(result.value).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4000
     * @tc.name testIteratorResult040
     * @tc.desc Verify single-arg constructor with decimal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(3.14);
      expect(result.value).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4100
     * @tc.name testIteratorResult041
     * @tc.desc Verify single-arg constructor with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: number = Number.NaN;
      let result = new IteratorResult<number>(nanValue);
      let nv = result.value as number;
      expect(Number.isNaN(nv)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4200
     * @tc.name testIteratorResult042
     * @tc.desc Verify single-arg constructor with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infinityValue: number = Number.POSITIVE_INFINITY;
      let result = new IteratorResult<number>(infinityValue);
      expect(result.value).assertEqual(infinityValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4300
     * @tc.name testIteratorResult043
     * @tc.desc Verify single-arg constructor with boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false);
      expect(result.value).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4400
     * @tc.name testIteratorResult044
     * @tc.desc Verify single-arg constructor with nested object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerRec: Record<string, number> = { "v": 42 } as Record<string, number>;
      let result = new IteratorResult<Record<string, Record<string, number>>>({ "inner": innerRec } as Record<string, Record<string, number>>);
      let val = result.value as Record<string, Record<string, number>>;
      let innerVal = val["inner"] as Record<string, number>;
      expect(innerVal["v"]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4500
     * @tc.name testIteratorResult045
     * @tc.desc Verify single-arg constructor with array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>([1, 2, 3]);
      let v = result.value as number[];
      expect(v.length).assertEqual(3);
      expect(v[0]).assertEqual(1);
      expect(v[1]).assertEqual(2);
      expect(v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4600
     * @tc.name testIteratorResult046
     * @tc.desc Verify single-arg constructor with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number[]>([]);
      let v = result.value as number[];
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4700
     * @tc.name testIteratorResult047
     * @tc.desc Verify single-arg constructor with mixed type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<(string | number)[]>([1, "a", 2]);
      let v = result.value as (string | number)[];
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4800
     * @tc.name testIteratorResult048
     * @tc.desc Verify single-arg constructor returns IteratorResult instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(42);
      expect(result instanceof IteratorResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_4900
     * @tc.name testIteratorResult049
     * @tc.desc Verify single-arg constructor value type for string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("abc");
      expect(typeof result.value === "string").assertTrue();
      expect(result.value).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5000
     * @tc.name testIteratorResult050
     * @tc.desc Verify single-arg constructor value type for number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(42);
      expect(typeof result.value === "number").assertTrue();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5100
     * @tc.name testIteratorResult051
     * @tc.desc Verify single-arg constructor object reference consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { "x": 1 } as Record<string, number>;
      let result = new IteratorResult<Record<string, number>>(obj);
      expect(result.value === obj).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5200
     * @tc.name testIteratorResult052
     * @tc.desc Verify single-arg constructor array reference consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2];
      let result = new IteratorResult<number[]>(arr);
      expect(result.value === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5300
     * @tc.name testIteratorResult053
     * @tc.desc Verify single-arg constructor with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(Number.MAX_VALUE);
      expect(result.value).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5400
     * @tc.name testIteratorResult054
     * @tc.desc Verify single-arg constructor with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(Number.MIN_VALUE);
      expect(result.value).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5500
     * @tc.name testIteratorResult055
     * @tc.desc Verify single-arg constructor with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigArr: number[] = [];
      for (let idx: number = 0; idx < 1000; idx++) {
        bigArr.push(0);
      }
      let result = new IteratorResult<number[]>(bigArr);
      let v = result.value as number[];
      expect(v.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5600
     * @tc.name testIteratorResult056
     * @tc.desc Verify single-arg constructor value matches generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<number>(85);
      expect(result.done).assertFalse();
      expect(typeof result.value === "number").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5700
     * @tc.name testIteratorResult057
     * @tc.desc Verify single-arg constructor with boolean true sets done=false and value=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new IteratorResult<boolean>(true);
      expect(r1.done).assertEqual(false);
      expect(r1.value).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5800
     * @tc.name testIteratorResult058
     * @tc.desc Verify single-arg constructor preserves union T (string | number) holding a string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | number>("unionString");
      expect(result.done).assertFalse();
      expect(result.value).assertEqual("unionString");
      expect(typeof result.value === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_5900
     * @tc.name testIteratorResult059
     * @tc.desc Verify two-arg constructor allows done=true paired with explicit null value (semantic boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string | null>(true, null);
      expect(result.done).assertTrue();
      expect(result.value === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_RESULT_6000
     * @tc.name testIteratorResult060
     * @tc.desc Verify single-arg constructor preserves multi-dimensional array structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorResult060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: number[][] = [[1, 2], [3, 4], [5, 6]];
      let result = new IteratorResult<number[][]>(nested);
      expect(result.done).assertFalse();
      let value: number[][] = result.value as number[][];
      expect(value.length).assertEqual(3);
      expect(value[0][1]).assertEqual(2);
      expect(value[2][0]).assertEqual(5);
    });

  });
}
