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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Invoke2Item {
  value: int = 0;
  label: string = '';

  constructor(v: int, l: string) {
    this.value = v;
    this.label = l;
  }
}

class Invoke2Point {
  x: int;
  y: int;

  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

class Invoke2SubArray extends Array<int> {
}

export default function ArrayInvoke2Test2(): void {
  describe('ArrayInvoke2Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0100
     * @tc.name testArrayInvoke2001
     * @tc.desc Verify single numeric arg with double value creates one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(1, 3.14);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0200
     * @tc.name testArrayInvoke2002
     * @tc.desc Verify single numeric arg with negative value creates one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0300
     * @tc.name testArrayInvoke2003
     * @tc.desc Verify single numeric arg with zero creates one-element array containing 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0400
     * @tc.name testArrayInvoke2004
     * @tc.desc Verify single numeric arg with large int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1000000);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0500
     * @tc.name testArrayInvoke2005
     * @tc.desc Verify single numeric arg with small int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 7);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(7);
      arr.pushOne(8);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0600
     * @tc.name testArrayInvoke2006
     * @tc.desc Verify two single-numeric constructions produce physically independent one-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1, 42);
      const arr2 = Array.create<int>(1, 42);
      expect(arr1 !== arr2).assertTrue();
      expect(arr1[0]).assertEqual(42);
      expect(arr2[0]).assertEqual(42);
      arr1[0] = 1;
      expect(arr1[0]).assertEqual(1);
      expect(arr2[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0700
     * @tc.name testArrayInvoke2007
     * @tc.desc Verify accessing out-of-bounds index on a single-numeric constructed array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      try {
        arr[1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0800
     * @tc.name testArrayInvoke2008
     * @tc.desc Verify single-numeric constructed array supports fill and subsequent read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 99);
      expect(arr[0]).assertEqual(99);
      arr.fill(0);
      const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0900
     * @tc.name testArrayInvoke2009
     * @tc.desc Verify single-numeric constructed array with scientific notation negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1e-1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1000
     * @tc.name testArrayInvoke2010
     * @tc.desc Verify single-numeric constructed array supports pop returning the element and length becomes zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 77);
      expect(arr.length).assertEqual(1);
      const val = arr.pop();
      expect(val).assertEqual(77);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1100
     * @tc.name testArrayInvoke2011
     * @tc.desc Verify single-numeric array element can be used in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      const doubled = arr[0] * 2;
      expect(doubled).assertEqual(20);
      arr[0] = arr[0] + 5;
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1200
     * @tc.name testArrayInvoke2012
     * @tc.desc Verify single-numeric construct with union type int | string works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | string>(1, 42);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      arr.pushOne('hello');
      expect(arr[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1300
     * @tc.name testArrayInvoke2013
     * @tc.desc Verify single-numeric array populated with push then processed via forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 100);
      arr.pushOne(200);
      arr.pushOne(300);
      let sum = 0;
      arr.forEach((v: int): void => {
        sum += v;
      });
      expect(sum).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1400
     * @tc.name testArrayInvoke2014
     * @tc.desc Verify single-numeric constructed array supports chained fill then pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 50);
      const newLen = arr.fill(-1).pushOne(200);
      expect(newLen).assertEqual(2);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1500
     * @tc.name testArrayInvoke2015
     * @tc.desc Verify single-numeric array element can be assigned to a variable and modified independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 8);
      expect(arr[0]).assertEqual(8);
      const element = arr[0];
      expect(element).assertEqual(8);
      arr[0] = 0;
      expect(arr[0]).assertEqual(0);
      expect(element).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1600
     * @tc.name testArrayInvoke2016
     * @tc.desc Verify single-numeric construction with custom class instance produces one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Invoke2Item>(1, new Invoke2Item(10, 'ten'));
      expect(arr.length).assertEqual(1);
      expect(arr[0].value).assertEqual(10);
      expect(arr[0].label).assertEqual('ten');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1700
     * @tc.name testArrayInvoke2017
     * @tc.desc Verify single interface value construction produces one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pt = new Invoke2Point(3, 4);
      const arr = Array.create<Invoke2Point>(1, pt);
      expect(arr.length).assertEqual(1);
      expect(arr[0].x).assertEqual(3);
      expect(arr[0].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1800
     * @tc.name testArrayInvoke2018
     * @tc.desc Verify that the single element array is a fresh allocation not sharing storage with any other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 65535);
      expect(arr[0]).assertEqual(65535);
      const sliced = arr.slice(0);
      expect(sliced[0]).assertEqual(65535);
      sliced[0] = 0;
      expect(arr[0]).assertEqual(65535);
      expect(sliced[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1900
     * @tc.name testArrayInvoke2019
     * @tc.desc Verify single-numeric construction with byte-sized value fits in int and is correctly stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 255);
      expect(arr[0]).assertEqual(255);
      arr[0] = 127;
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2000
     * @tc.name testArrayInvoke2020
     * @tc.desc Verify object reference as single element is shared, not copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Invoke2Item(5, 'five');
      const arr = Array.create<Invoke2Item>(1, obj);
      expect(arr[0].value).assertEqual(5);
      obj.value = 10;
      expect(arr[0].value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2100
     * @tc.name testArrayInvoke2021
     * @tc.desc Verify WeakRef wrapping of single-numeric constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 99);
      const ref = new WeakRef<Array<int>>(arr);
      const deref = ref.deref();
      if (deref !== undefined) {
        expect(deref[0]).assertEqual(99);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2200
     * @tc.name testArrayInvoke2022
     * @tc.desc Verify subclass of Array with single numeric element works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Invoke2SubArray();
      arr.pushOne(77);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2300
     * @tc.name testArrayInvoke2023
     * @tc.desc Verify same object reference passed as element five times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Invoke2Point(10, 20);
      const arr = new Array<Invoke2Point>(obj, obj, obj, obj, obj);
      expect(arr.length).assertEqual(5);
      expect(arr[0].x).assertEqual(10);
      expect(arr[4].x).assertEqual(10);
      obj.x = 99;
      expect(arr[0].x).assertEqual(99);
      expect(arr[2].x).assertEqual(99);
      expect(arr[4].x).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2400
     * @tc.name testArrayInvoke2024
     * @tc.desc Verify high-throughput create modify cycle on single-numeric arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const arr = Array.create<int>(1, i);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(i);
        arr[0] = i * 2;
        expect(arr[0]).assertEqual(i * 2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2500
     * @tc.name testArrayInvoke2025
     * @tc.desc Verify Array subclass usage does not affect base Array single-numeric construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = new Invoke2SubArray();
      sub.pushOne(1);
      sub.pushOne(2);
      expect(sub.length).assertEqual(2);

      const arr = Array.create<int>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });
  });
}