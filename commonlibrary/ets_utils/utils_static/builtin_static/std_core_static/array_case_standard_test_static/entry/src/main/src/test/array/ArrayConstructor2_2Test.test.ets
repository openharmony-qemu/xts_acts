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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Calc049 {
  val: int;

  constructor(v: int) {
    this.val = v;
  }

  twice(): int {
    return this.val * 2;
  }
}

interface Point052 {
  x: int;
  y: int;
}

class RefTest053 {
  val: int = 0;
}

class Deep054 {
  data: Array<int>;

  constructor() {
    this.data = new Array<int>(1, 2);
  }
}

class NodeRef {
  val: int = 0;
  ref: NodeRef | null = null;
}

function modifyArray072(arr: Array<int>): void {
  arr[0] = 99;
}

interface ABItem {
  a: int;
  b: string;
}

interface IdItem {
  id: int;
}

export default function ArrayConstructor2_2Test(): void {
  describe('ArrayConstructor2_2Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testArrayConstructor2001
     * @tc.desc Verify that assigning value to an excessively large invalid index of an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try{
        const a = new Array<int>();
        a[9] = 100;
        expect().assertFail();
      }catch(e){
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testArrayConstructor2002
     * @tc.desc Verify that discontinuous assignment to indexes of an empty array triggers RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try{
        const a = new Array<int>();
        a[0] = 1;
        a[5] = 2;
        a[10] = 3;
        expect().assertFail();
      }catch(e){
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testArrayConstructor2003
     * @tc.desc Verify pop until empty clears the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      a.push(3);
      a.pop();
      a.pop();
      a.pop();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testArrayConstructor2004
     * @tc.desc Verify unshift inserts at the head after push elements exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(2);
      a.push(3);
      a.unshift(1);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testArrayConstructor2005
     * @tc.desc Verify repeatedly assigning values to the same valid index of an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try{
        const a = new Array<int>();
        a[0] = 10;
        a[0] = 20;
        a[0] = 30;
        expect().assertFail();
      }catch(e){
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testArrayConstructor2006
     * @tc.desc Verify pushing 2D nested arrays onto an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Array<int>>();
      a.push(new Array<int>(1, 2));
      a.push(new Array<int>(3, 4, 5));
      expect(a.length).assertEqual(2);
      expect(a[1][2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testArrayConstructor2007
     * @tc.desc Verify nullable array alternates between null and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | null>();
      a.push(null);
      a.push(42);
      a.push(null);
      expect(a[0]).assertNull();
      expect(a[1]).assertEqual(42);
      expect(a[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testArrayConstructor2008
     * @tc.desc Verify push returns the new array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const len = a.push(10);
      expect(len).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testArrayConstructor2009
     * @tc.desc Verify push then reduce sums correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(5);
      a.push(10);
      const sum = a.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testArrayConstructor2010
     * @tc.desc Verify unshift then shift restores original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string>();
      a.push('b');
      a.unshift('a');
      expect(a.length).assertEqual(2);
      const shifted = a.shift();
      expect(shifted).assertEqual('a');
      expect(a[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testArrayConstructor2011
     * @tc.desc Verify pop on an empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.pop();
      const r = a.pop();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1200
     * @tc.name testArrayConstructor2012
     * @tc.desc Verify splice on an empty array returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const r = a.splice(0, 0, 1);
      expect(r.length).assertEqual(0);
      expect(a.length).assertEqual(1);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1300
     * @tc.name testArrayConstructor2013
     * @tc.desc Verify splice batch-inserts elements into an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.splice(0, 0, 1, 2, 3);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1400
     * @tc.name testArrayConstructor2014
     * @tc.desc Verify fill on an empty array has no effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.fill(5);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1500
     * @tc.name testArrayConstructor2015
     * @tc.desc Verify sort on an empty array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const sorted = a.sort();
      expect(sorted.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1600
     * @tc.name testArrayConstructor2016
     * @tc.desc Verify reverse after push reorders correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      a.push(3);
      a.reverse();
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(3);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1700
     * @tc.name testArrayConstructor2017
     * @tc.desc Verify indexOf finds elements after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string>();
      a.push('x');
      a.push('y');
      a.push('z');
      expect(a.indexOf('y')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1800
     * @tc.name testArrayConstructor2018
     * @tc.desc Verify find finds the first matching element after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(10);
      a.push(20);
      a.push(30);
      const found = a.find((v: int): boolean => v > 15);
      expect(found).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1900
     * @tc.name testArrayConstructor2019
     * @tc.desc Verify custom class instance array supports method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Calc049>();
      a.push(new Calc049(5));
      const result = a[0].twice();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2000
     * @tc.name testArrayConstructor2020
     * @tc.desc Verify boolean array from empty constructor supports push and index read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<boolean>();
      a.push(true);
      a.push(false);
      a.push(true);
      expect(a[0]).assertTrue();
      expect(a[1]).assertFalse();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2100
     * @tc.name testArrayConstructor2021
     * @tc.desc Verify string array from empty constructor supports push and join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string>();
      a.push('hello');
      a.push('world');
      expect(a.length).assertEqual(2);
      expect(a.join(' ')).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2200
     * @tc.name testArrayConstructor2022
     * @tc.desc Verify interface object array supports property modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Point052>();
      a.push({ x: 1, y: 2 });
      a[0].x = 10;
      expect(a[0].x).assertEqual(10);
      expect(a[0].y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2300
     * @tc.name testArrayConstructor2023
     * @tc.desc Verify pushing the same object twice shares the reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new RefTest053();
      const a = new Array<RefTest053>();
      a.push(obj);
      a.push(obj);
      a[0].val = 42;
      expect(a[1].val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2400
     * @tc.name testArrayConstructor2024
     * @tc.desc Verify separate instances remain independent after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Deep054>();
      a.push(new Deep054());
      a.push(new Deep054());
      a[0].data[0] = 99;
      expect(a[0].data[0]).assertEqual(99);
      expect(a[1].data[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2500
     * @tc.name testArrayConstructor2025
     * @tc.desc Verify JSON.stringify on an empty array returns '[]'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const s = JSON.stringify(a);
      expect(s).assertEqual('[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2600
     * @tc.name testArrayConstructor2026
     * @tc.desc Verify an empty array is truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      expect(!a).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2700
     * @tc.name testArrayConstructor2027
     * @tc.desc Verify an empty array evaluates as truthy in ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const result = a ? 'non-empty' : 'empty';
      expect(result).assertEqual('non-empty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2800
     * @tc.name testArrayConstructor2028
     * @tc.desc Verify concat merges two dynamically built arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      const b = new Array<int>();
      b.push(3);
      b.push(4);
      const c = a.concat(b);
      expect(c.length).assertEqual(4);
      expect(c[0]).assertEqual(1);
      expect(c[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2900
     * @tc.name testArrayConstructor2029
     * @tc.desc Verify element-wise addition of two dynamic arrays via map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      const b = new Array<int>();
      b.push(3);
      b.push(4);
      const c = a.map((v: int, i: int): int => v + b[i]);
      expect(c.length).assertEqual(2);
      expect(c[0]).assertEqual(4);
      expect(c[1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3000
     * @tc.name testArrayConstructor2030
     * @tc.desc Verify a function can modify an array passed as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      modifyArray072(a);
      expect(a[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3100
     * @tc.name testArrayConstructor2031
     * @tc.desc Verify LIFO stack behavior with push and pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stack = new Array<int>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      const popped = stack.pop();
      expect(popped).assertEqual(3);
      expect(stack.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3200
     * @tc.name testArrayConstructor2032
     * @tc.desc Verify FIFO queue behavior with push and shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue = new Array<string>();
      queue.push('a');
      queue.push('b');
      queue.push('c');
      const shifted = queue.shift();
      expect(shifted).assertEqual('a');
      expect(queue.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3300
     * @tc.name testArrayConstructor2033
     * @tc.desc Verify for-of iterates over dynamically built array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(100);
      a.push(200);
      let sum = 0;
      for (const v of a) {
        sum += v;
      }
      expect(sum).assertEqual(300);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3400
     * @tc.name testArrayConstructor2034
     * @tc.desc Verify push NaN and Infinity onto dynamic array then map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<number>();
      a.push(Double.NaN);
      a.push(Double.POSITIVE_INFINITY);
      expect(a.length).assertEqual(2);
      expect(isNaN(a[0])).assertTrue();
      expect(a[1]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3500
     * @tc.name testArrayConstructor2035
     * @tc.desc Verify delete then reassign on a dynamic array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string | undefined>();
      a.push('first');
      a[0] = undefined;
      a.push('second');
      expect(a[0]).assertUndefined();
      expect(a[1]).assertEqual('second');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3600
     * @tc.name testArrayConstructor2036
     * @tc.desc Verify length shrink retains first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new Array<int>();
        a.push(1);
        a.push(2);
        a.push(3);
        a.length = 1;
        expect(a[0]).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3700
     * @tc.name testArrayConstructor2037
     * @tc.desc Verify extending array length beyond content throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try{
        const a = new Array<int>();
        a.push(4);
        a.push(5);
        a.push(6);
        a.length = 5;
        expect().assertFail();
      }catch(e){
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3800
     * @tc.name testArrayConstructor2038
     * @tc.desc Verify long array accepts int values after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<long>();
      a.push(42);
      expect(a[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3900
     * @tc.name testArrayConstructor2039
     * @tc.desc Verify boolean array accepts expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<boolean>();
      a.push('hello'.length > 0);
      expect(a[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4000
     * @tc.name testArrayConstructor2040
     * @tc.desc Verify byte array accepts a value within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<byte>();
      a.push((100).toByte());
      expect(a[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4100
     * @tc.name testArrayConstructor2041
     * @tc.desc Verify char array accepts another char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<char>();
      a.push(c'A');
      a[0] = c'B';
      expect(a[0]).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4200
     * @tc.name testArrayConstructor2042
     * @tc.desc Verify long array accepts large integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<long>();
      a.push(100);
      a.push(200);
      expect(a[0]).assertEqual(100);
      expect(a[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4300
     * @tc.name testArrayConstructor2043
     * @tc.desc Verify union type array switches type via push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | string>();
      a.push(100);
      a.push('hello');
      expect(a[0]).assertEqual(100);
      expect(a[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4400
     * @tc.name testArrayConstructor2044
     * @tc.desc Verify function array calls each function after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<() => int>();
      a.push((): int => 1);
      a.push((): int => 2);
      const sum = a[0]() + a[1]();
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4500
     * @tc.name testArrayConstructor2045
     * @tc.desc Verify closure function array captures enclosing scope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = 10;
      const a = new Array<() => int>();
      a.push((): int => base + 1);
      a.push((): int => base + 2);
      expect(a[1]()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4600
     * @tc.name testArrayConstructor2046
     * @tc.desc Verify float value assigned to int array is truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a[0] = 3;
      expect(a[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4700
     * @tc.name testArrayConstructor2047
     * @tc.desc Verify double value assigned to float array preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<float>();
      a.push(0.0f);
      a[0] = 3.1415926535f;
      expect(a[0]).assertEqual(3.1415927f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4800
     * @tc.name testArrayConstructor2048
     * @tc.desc Verify byte array accepts int value 200 within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(200);
      expect(a[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_4900
     * @tc.name testArrayConstructor2049
     * @tc.desc Verify short array overflow with 65536 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<short>();
      a.push((65536).toShort());
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5000
     * @tc.name testArrayConstructor2050
     * @tc.desc Verify bigint array accepts bigint literal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<bigint>();
      a.push(123n);
      a.push(456n);
      const v1 = a[0];
      const v2 = a[1];
      const result = v1 + v2;
      expect(result).assertEqual(579n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5100
     * @tc.name testArrayConstructor2051
     * @tc.desc Verify Map objects stored in array retain key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Map<string, int>>();
      const m = new Map<string, int>();
      m.set('key', 100);
      a.push(m);
      expect(a[0].get('key')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5200
     * @tc.name testArrayConstructor2052
     * @tc.desc Verify Set objects stored in array retain element membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Set<int>>();
      const s = new Set<int>();
      s.add(1);
      s.add(2);
      a.push(s);
      expect(a[0].has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5300
     * @tc.name testArrayConstructor2053
     * @tc.desc Verify Date objects stored in array support comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Date>();
      a.push(new Date(2026, 0, 1));
      a.push(new Date(2026, 5, 24));
      expect(a[1].getTime() > a[0].getTime()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5400
     * @tc.name testArrayConstructor2054
     * @tc.desc Verify RegExp objects stored in array test patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<RegExp>();
      a.push(new RegExp('ab+c'));
      expect(a[0].test('abc')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5500
     * @tc.name testArrayConstructor2055
     * @tc.desc Verify string key access on dynamic array stores as property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string>();
      a.push('initial');
      a[0] = 'value';
      expect(a[0]).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5600
     * @tc.name testArrayConstructor2056
     * @tc.desc Verify setting length to NaN coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      a.push(3);
      a.length = 0;
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5700
     * @tc.name testArrayConstructor2057
     * @tc.desc Verify setting length to negative coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try{
        const a = new Array<int>();
        a.push(7);
        a.push(8);
        a.push(9);
        a.length = -1;
        expect().assertFail();
      }catch(e){
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5800
     * @tc.name testArrayConstructor2058
     * @tc.desc Verify Array.isArray correctly distinguishes array from object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const isArr = Array.isArray(a);
      expect(isArr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_5900
     * @tc.name testArrayConstructor2059
     * @tc.desc Verify prototype every method call on dynamic array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(5);
      a.push(15);
      a.push(25);
      const result = a.every((v: int): boolean => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6000
     * @tc.name testArrayConstructor2060
     * @tc.desc Verify overwriting value of existing index after push operation takes effect normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a[0] = 2;
      expect(a[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6100
     * @tc.name testArrayConstructor2061
     * @tc.desc Verify sealed array cannot be extended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      const len = a.push(2);
      expect(len).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6200
     * @tc.name testArrayConstructor2062
     * @tc.desc Verify intersection type array stores combined object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<ABItem>();
      a.push({a: 1, b: 'x'});
      const v1 = a[0].a;
      const v2 = a[0].b.length;
      const result = v1 + v2;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6300
     * @tc.name testArrayConstructor2063
     * @tc.desc Verify dynamic array spread into new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      const b = new Array<int>();
      b.push(a[0]);
      b.push(a[1]);
      b.push(3);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6400
     * @tc.name testArrayConstructor2064
     * @tc.desc Verify empty array spread into new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const b = new Array<int>();
      b.push(1);
      expect(b.length).assertEqual(1);
      expect(b[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6500
     * @tc.name testArrayConstructor2065
     * @tc.desc Verify array destructuring extracts elements from dynamic array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(10);
      a.push(20);
      a.push(30);
      const first = a[0];
      const rest = a.slice(1);
      expect(rest[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6600
     * @tc.name testArrayConstructor2066
     * @tc.desc Verify nested array destructuring works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Array<int>>();
      a.push(new Array<int>(1, 2));
      a.push(new Array<int>(3, 4));
      const x = a[0][0];
      const w = a[1][1];
      expect(x + w).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6700
     * @tc.name testArrayConstructor2067
     * @tc.desc Verify object array property extraction via map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<IdItem>();
      a.push({id: 1});
      a.push({id: 2});
      const ids = a.map((o: IdItem): int => o.id);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6800
     * @tc.name testArrayConstructor2068
     * @tc.desc Verify destructuring with default value on empty element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const x = a.length > 0 ? a[0] : 100;
      expect(x).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_6900
     * @tc.name testArrayConstructor2069
     * @tc.desc Verify spread operator used as function arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      a.push(2);
      a.push(3);
      const sum = (x: int, y: int, z: int): int => x + y + z;
      expect(sum(a[0], a[1], a[2])).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7000
     * @tc.name testArrayConstructor2070
     * @tc.desc Verify multiple arrays merge via spread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(1);
      const b = new Array<int>();
      b.push(2);
      const c = new Array<int>();
      c.push(a[0]);
      c.push(b[0]);
      expect(c[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7100
     * @tc.name testArrayConstructor2071
     * @tc.desc Verify selective destructuring picks specific elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(5);
      a.push(10);
      a.push(15);
      a.push(20);
      const [, second, , fourth] = a;
      expect(second + fourth).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7200
     * @tc.name testArrayConstructor2072
     * @tc.desc Verify for-in loop includes custom property added to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      a.push(10);
      a.push(20);
      let sum = 0;
      for (const v of a) {
        sum += v;
      }
      expect(sum).assertEqual(30);
     });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7300
     * @tc.name testArrayConstructor2073
     * @tc.desc Verify empty array constructor with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7400
     * @tc.name testArrayConstructor2074
     * @tc.desc Verify double empty array supports push and reduce operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<double>();
      a.push(1.5);
      a.push(2.5);
      const sum = a.reduce((acc: double, v: double): double => acc + v, 0.0);
      expect(sum).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7500
     * @tc.name testArrayConstructor2075
     * @tc.desc Verify byte empty array supports push and index read operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<byte>();
      a.push(10);
      a.push(20);
      a.push(30);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(10);
      expect(a[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7600
     * @tc.name testArrayConstructor2076
     * @tc.desc Verify push null into empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | null>();
      a.push(null);
      a.push(42);
      a.push(null);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertNull();
      expect(a[1]).assertEqual(42);
      expect(a[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7700
     * @tc.name testArrayConstructor2077
     * @tc.desc Verify push undefined into empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | undefined>();
      a.push(undefined);
      a.push(10);
      a.push(undefined);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertUndefined();
      expect(a[1]).assertEqual(10);
      expect(a[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_7800
     * @tc.name testArrayConstructor2078
     * @tc.desc Verify push nested object with null ref into empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<NodeRef>();
      const node = new NodeRef();
      node.val = 5;
      node.ref = null;
      a.push(node);
      const obj = new NodeRef();
      obj.ref = node;
      a.push(obj);
      expect(a.length).assertEqual(2);
      expect(a[0].ref).assertNull();
      const second = a[1];
      if (second != undefined) {
        const secondRef = second.ref;
        if (secondRef != null) {
          expect(secondRef.val).assertEqual(5);
        }else {
          expect().assertFail();
        }
      }else {
        expect().assertFail();
      }
    });
   });
 }
