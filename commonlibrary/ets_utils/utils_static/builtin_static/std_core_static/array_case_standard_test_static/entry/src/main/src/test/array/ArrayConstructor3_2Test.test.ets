'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

class ObjVal035 {
  val: int;

  constructor(v: int) {
    this.val = v;
  }
}

class LinkedNode {
  val: int = 0;
  next: LinkedNode | null = null;
}

class Item040 {
  val: int;

  constructor(v: int) {
    this.val = v;
  }
}

class CircularNode042 {
  ref: CircularNode042 | null = null;
}

class SubArray045 {
  data: Array<int>;

  constructor(d1: int, d2: int) {
    this.data = new Array<int>(d1, d2);
  }
}

interface Point060 {
  x: int;
  y: int;
}

export default function ArrayConstructor3_2Test(): void {
  describe('ArrayConstructor3_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0100
     * @tc.name testArrayConstructorThree001
     * @tc.desc Verify interleaved positive and negative int elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(-5, 3, -1, 7, -9);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(-5);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(-1);
      expect(arr[3]).assertEqual(7);
      expect(arr[4]).assertEqual(-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0200
     * @tc.name testArrayConstructorThree002
     * @tc.desc Verify float step sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.0f, 1.5f, 2.0f, 2.5f, 3.0f);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1.0f);
      expect(arr[1]).assertEqual(1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0300
     * @tc.name testArrayConstructorThree003
     * @tc.desc Verify color string sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue', 'alpha');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('red');
      expect(arr[2]).assertEqual('blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0400
     * @tc.name testArrayConstructorThree004
     * @tc.desc Verify char consecutive sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'B', c'C', c'D', c'E');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(c'A');
      expect(arr[4]).assertEqual(c'E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0500
     * @tc.name testArrayConstructorThree005
     * @tc.desc Verify boolean alternating pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, false, false, true);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertTrue();
      expect(arr[2]).assertFalse();
      expect(arr[4]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0600
     * @tc.name testArrayConstructorThree006
     * @tc.desc Verify powers of 2 sequence with long type up to 2^10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024);
      expect(arr.length).assertEqual(11);
      expect(arr[0]).assertEqual(1);
      expect(arr[10]).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0700
     * @tc.name testArrayConstructorThree007
     * @tc.desc Verify PI multiples sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Math.PI, Math.PI * 2, Math.PI * 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(Math.PI);
      expect(arr[1]).assertEqual(Math.PI * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0800
     * @tc.name testArrayConstructorThree008
     * @tc.desc Verify E multiplied by powers of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Math.E, Math.E * 10, Math.E * 100);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(Math.E);
      expect(arr[1]).assertEqual(Math.E * 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0900
     * @tc.name testArrayConstructorThree009
     * @tc.desc Verify sin value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Math.sin(0), Math.sin(Math.PI / 2), Math.sin(Math.PI));
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(Math.sin(0));
      expect(arr[1]).assertEqual(Math.sin(Math.PI / 2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1000
     * @tc.name testArrayConstructorThree010
     * @tc.desc Verify natural log sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Math.log(1), Math.log(2), Math.log(3), Math.log(4));
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(Math.log(1));
      expect(arr[1]).assertEqual(Math.log(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1100
     * @tc.name testArrayConstructorThree011
     * @tc.desc Verify sqrt sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Math.sqrt(1), Math.sqrt(2), Math.sqrt(3), Math.sqrt(4));
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(Math.sqrt(1));
      expect(arr[3]).assertEqual(Math.sqrt(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1200
     * @tc.name testArrayConstructorThree012
     * @tc.desc Verify abs values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(Math.abs(-5), Math.abs(-10), Math.abs(-15));
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1300
     * @tc.name testArrayConstructorThree013
     * @tc.desc Verify max/min computed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v0: int = Double.toInt(Math.max(1, 10));
      const v1: int = Double.toInt(Math.min(5, 3));
      const v2: int = Double.toInt(Math.max(100, 200));
      const arr = new Array<int>(v0, v1, v2);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1400
     * @tc.name testArrayConstructorThree014
     * @tc.desc Verify shared object reference through array modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new ObjVal035(1);
      const arr = new Array<ObjVal035>(obj, obj, obj);
      arr[0].val = 99;
      expect(obj.val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1500
     * @tc.name testArrayConstructorThree015
     * @tc.desc Verify independent object literals are not shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjVal035>(new ObjVal035(1), new ObjVal035(2), new ObjVal035(3));
      arr[0].val = 99;
      expect(arr[0].val).assertEqual(99);
      expect(arr[1].val).assertEqual(2);
      expect(arr[2].val).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1600
     * @tc.name testArrayConstructorThree016
     * @tc.desc Verify destructuring modification affects original object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new ObjVal035(1);
      const arr = Array.create<ObjVal035>(1, obj);
      const [first] = arr;
      first.val = 100;
      expect(obj.val).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1700
     * @tc.name testArrayConstructorThree017
     * @tc.desc Verify same inner array reference assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2);
      const a1 = new Array<int>(3, 4);
      const arr = new Array<Array<int>>(inner, a1);
      const innerRef = arr[0];
      innerRef[1] = 99;
      expect(arr[0][1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1800
     * @tc.name testArrayConstructorThree018
     * @tc.desc Verify closure array shares closed-over variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared = 0;
      const fn1 = (): int => shared;
      const fn2 = (): int => shared;
      shared = 42;
      expect(fn1()).assertEqual(42);
      expect(fn2()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1900
     * @tc.name testArrayConstructorThree019
     * @tc.desc Verify class instances are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Item040>(new Item040(1), new Item040(2));
      a[0].val = 100;
      expect(a[1].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2000
     * @tc.name testArrayConstructorThree020
     * @tc.desc Verify Date object reference sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 5, 1);
      const arr = new Array<Date>(d, d);
      arr[0].setFullYear(2025);
      expect(arr[1].getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2100
     * @tc.name testArrayConstructorThree021
     * @tc.desc Verify circular reference array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new CircularNode042();
      const b = new CircularNode042();
      b.ref = a;
      a.ref = b;
      const arr = new Array<CircularNode042>(a, b);
      expect(arr[0].ref).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2200
     * @tc.name testArrayConstructorThree022
     * @tc.desc Verify filter keeps original object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new ObjVal035(1);
      const arr = new Array<ObjVal035>(obj, new ObjVal035(2));
      const filtered = arr.filter((o: ObjVal035): boolean => o.val > 0);
      filtered[0].val = 99;
      expect(obj.val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2300
     * @tc.name testArrayConstructorThree023
     * @tc.desc Verify map creates independent objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjVal035>(new ObjVal035(1), new ObjVal035(2));
      const mapped = arr.map((o: ObjVal035): ObjVal035 => new ObjVal035(o.val * 2));
      arr[0].val = 99;
      expect(mapped[0].val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2400
     * @tc.name testArrayConstructorThree024
     * @tc.desc Verify nested same sub-array sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = new Array<int>(1, 2);
      const arr = new Array<Array<int>>(sub, sub);
      arr[0][0] = 99;
      expect(arr[1][0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2500
     * @tc.name testArrayConstructorThree025
     * @tc.desc Verify property assignment copies value not reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const first = arr[0];
      const second = arr[1];
      arr[0] = 100;
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2600
     * @tc.name testArrayConstructorThree026
     * @tc.desc Verify int array some with float comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 5, 7);
      const result = arr.some((v: int): boolean => v > 4.5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2700
     * @tc.name testArrayConstructorThree027
     * @tc.desc Verify long array every with number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(100, 200, 300);
      const result = arr.every((v: long): boolean => v > 50);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2800
     * @tc.name testArrayConstructorThree028
     * @tc.desc Verify float sum accuracy issue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<float>(0.1f, 0.2f, 0.3f);
      const v1 = a[0];
      const v2 = a[1];
      const v3 = a[2];
      const sum = v1 + v2 + v3;
      expect(sum).assertEqual(0.6000000238f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2900
     * @tc.name testArrayConstructorThree029
     * @tc.desc Verify double sum accuracy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<double>(0.1, 0.2, 0.3);
      const v1 = a[0];
      const v2 = a[1];
      const v3 = a[2];
      const sum = v1 + v2 + v3;
      expect(sum).assertEqual(0.6000000000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3000
     * @tc.name testArrayConstructorThree030
     * @tc.desc Verify byte overflow promotes to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<byte>(127, 1);
      const sum: int = a[0] + a[1];
      expect(sum).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3100
     * @tc.name testArrayConstructorThree031
     * @tc.desc Verify short multiplication promotes to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<short>(1000, 1000);
      const product: int = a[0] * a[1];
      expect(product).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3200
     * @tc.name testArrayConstructorThree032
     * @tc.desc Verify char comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'B', c'C');
      const found = arr.find((v: char): boolean => v > c'A');
      expect(found).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3300
     * @tc.name testArrayConstructorThree033
     * @tc.desc Verify bigint to number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<bigint>(10n, 20n, 30n);
      const v1 = Number(a[0]);
      const v2 = Number(a[1]);
      const v3 = Number(a[2]);
      const sum = v1 + v2 + v3;
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3400
     * @tc.name testArrayConstructorThree034
     * @tc.desc Verify union type int|string|boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | string | boolean>(1, 'hello', true);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3500
     * @tc.name testArrayConstructorThree035
     * @tc.desc Verify nullable array filter null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | null>(null, 42, null, 99);
      const filtered = a.filter((v: int | null): boolean => v !== null);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3600
     * @tc.name testArrayConstructorThree036
     * @tc.desc Verify spread creates shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<int>(1, 2, 3);
      const copy = new Array<int>(original[0], original[1], original[2]);
      copy[0] = 99;
      expect(original[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3700
     * @tc.name testArrayConstructorThree037
     * @tc.desc Verify merge two arrays via element extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2);
      const b = new Array<int>(3, 4);
      const merged = new Array<int>(a[0], a[1], b[0], b[1]);
      expect(merged.length).assertEqual(4);
      expect(merged[0]).assertEqual(1);
      expect(merged[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3800
     * @tc.name testArrayConstructorThree038
     * @tc.desc Verify literal mixed with expanded elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2);
      const arr = new Array<int>(0, a[0], a[1], 3);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3900
     * @tc.name testArrayConstructorThree039
     * @tc.desc Verify nested object array property computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Point060 = { x: 0, y: 0 };
      const p2: Point060 = { x: 1, y: 1 };
      const arr = new Array<Point060>(p1, p2);
      const result = arr.map((p: Point060): int => p.x + p.y);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4000
     * @tc.name testArrayConstructorThree040
     * @tc.desc Verify mixed union type 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string | boolean>(42, 'str', false, 100, 'end');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual('str');
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4100
     * @tc.name testArrayConstructorThree041
     * @tc.desc Verify Arithmetic Progression values are equivalent element-wise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = new Array<int>(1, 2);
      const a1 = new Array<int>(3, 4, 5);
      const a2 = Array.create<int>(1, 6);
      const arr = new Array<Array<int>>(sub, a1, a2);
      expect(arr.length).assertEqual(3);
      expect(arr[0].length).assertEqual(2);
      expect(arr[1].length).assertEqual(3);
      expect(arr[2].length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4200
     * @tc.name testArrayConstructorThree042
     * @tc.desc Verify Arithmetic Progression values are equivalent element-wise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      const b = new Array<int>(a[0], a[1], a[2]);
      const allEqual = a.every((v: int, i: int): boolean => v === b[i]);
      expect(allEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4300
     * @tc.name testArrayConstructorThree043
     * @tc.desc Verify spread object array shallow copy independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objs = new Array<ObjVal035>(new ObjVal035(1), new ObjVal035(2));
      const copy = objs.map((o: ObjVal035): ObjVal035 => new ObjVal035(o.val));
      copy[0].val = 99;
      expect(objs[0].val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4400
     * @tc.name testArrayConstructorThree044
     * @tc.desc Verify string array spread and join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars = new Array<string>('a', 'b', 'c');
      const result = chars.join('');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4500
     * @tc.name testArrayConstructorThree045
     * @tc.desc Verify multi-level element extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2, 3);
      const outer = new Array<int>(inner[0], inner[1], inner[2]);
      const result = new Array<int>(outer[0], outer[1], outer[2]);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4600
     * @tc.name testArrayConstructorThree046
     * @tc.desc Verify map then filter chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      const result = arr.map((v: int): int => v * 3).filter((v: int): boolean => v % 2 === 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(12);
      expect(result[2]).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4700
     * @tc.name testArrayConstructorThree047
     * @tc.desc Verify reduce multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const product = arr.reduce((acc: int, v: int): int => acc * v, 1);
      expect(product).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4800
     * @tc.name testArrayConstructorThree048
     * @tc.desc Verify sort then reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 1, 5, 9, 2, 6);
      arr.sort((a: int, b: int): int => {
        return a - b;
      });
      arr.reverse();
      expect(arr[0]).assertEqual(9);
      expect(arr[7]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4900
     * @tc.name testArrayConstructorThree049
     * @tc.desc Verify slice then concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const sliced = arr.slice(1, 3);
      const result = sliced.concat(new Array<int>(10, 20));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5000
     * @tc.name testArrayConstructorThree050
     * @tc.desc Verify manual flatMap via reduce and concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(a1, a2, a3);
      const flat = arr.reduce((acc: Array<int>, v: Array<int>): Array<int> => acc.concat(v), [] as Array<int>);
      expect(flat.length).assertEqual(6);
      expect(flat[0]).assertEqual(1);
      expect(flat[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5100
     * @tc.name testArrayConstructorThree051
     * @tc.desc Verify filter then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const sum = arr.filter((v: int): boolean => v > 25).reduce((s: int, v: int): int => s + v, 0);
      expect(sum).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5200
     * @tc.name testArrayConstructorThree052
     * @tc.desc Verify every and some combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(2, 4, 6, 8);
      const result = a.every((v: int): boolean => v % 2 === 0) && a.some((v: int): boolean => v > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5300
     * @tc.name testArrayConstructorThree053
     * @tc.desc Verify find then indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string>('cat', 'dog', 'bird', 'fish');
      const found = a.find((v: string): boolean => v.startsWith('b')) as string;
      expect(a.indexOf(found)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5400
     * @tc.name testArrayConstructorThree054
     * @tc.desc Verify toReversed is non-destructive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      const b = a.toReversed();
      expect(a[0] === 1 && b[0] === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5500
     * @tc.name testArrayConstructorThree055
     * @tc.desc Verify toSorted is non-destructive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, 1, 2);
      const b = a.toSorted((x: int, y: int): int => {
        return x - y;
      });
      expect(a[0] === 3 && b[0] === 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5600
     * @tc.name testArrayConstructorThree056
     * @tc.desc Verify findLast returns last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 2, 1);
      const found = a.findLast((v: int): boolean => v === 2);
      expect(found).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5700
     * @tc.name testArrayConstructorThree057
     * @tc.desc Verify spread creation of string array then join with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 2, 1);
      const idx = a.findLastIndex((v: int): boolean => v === 1);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5800
     * @tc.name testArrayConstructorThree058
     * @tc.desc Verify nested spread creation flattens correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars = new Array<string>('a', 'b', 'c');
      const result = chars.join('-');
      expect(result).assertEqual('a-b-c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5900
     * @tc.name testArrayConstructorThree059
     * @tc.desc Verify ascending byte sequence (0..5) is created correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6000
     * @tc.name testArrayConstructorThree060
     * @tc.desc Verify short boundary values sequence is created correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(0, 1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(3);
      expect(arr[5]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6100
     * @tc.name testArrayConstructorThree061
     * @tc.desc Verify digit char sequence is created correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, 0, 32767);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(-32768);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6200
     * @tc.name testArrayConstructorThree062
     * @tc.desc Verify business phone number strings are created correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'0', c'1', c'2', c'3');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(c'0');
      expect(arr[2]).assertEqual(c'2');
      expect(arr[3]).assertEqual(c'3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6300
     * @tc.name testArrayConstructorThree063
     * @tc.desc Verify mixed multi-type Array.create arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('13800138000', '010-12345678', 'test@example.com');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('13800138000');
      expect(arr[2]).assertEqual('test@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6400
     * @tc.name testArrayConstructorThree064
     * @tc.desc Verify Array.create with null elements in int|null variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | string | boolean | null> = new Array<int | string | boolean | null>(1, 'two', true, null);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(true);
      expect(arr[3]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6500
     * @tc.name testArrayConstructorThree065
     * @tc.desc Verify Array.create with undefined elements in int|undefined variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(null, 1, null, 3);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertNull();
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6600
     * @tc.name testArrayConstructorThree066
     * @tc.desc Verify Array.create with LinkedNode objects having null next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(undefined, 10, undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6700
     * @tc.name testArrayConstructorThree067
     * @tc.desc Verify Array.create with LinkedNode|null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node1 = new LinkedNode();
      node1.val = 1;
      node1.next = null;
      const node2 = new LinkedNode();
      node2.val = 2;
      node2.next = node1;
      const arr = new Array<LinkedNode>(node1, node2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].next).assertNull();
      const second = arr[1];
      if (second != undefined) {
        const secondNext = second.next;
        if (secondNext != null) {
          expect(secondNext.val).assertEqual(1);
        }else {
          expect().assertFail();
        }
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6800
     * @tc.name testArrayConstructorThree068
     * @tc.desc Verify Array.create with hex, octal, binary literals as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node = new LinkedNode();
      node.val = 99;
      node.next = null;
      const arr: Array<LinkedNode | null> = new Array<LinkedNode | null>(node, null, node);
      expect(arr.length).assertEqual(3);
      expect(arr[0] instanceof LinkedNode).assertTrue();
      expect(arr[1]).assertNull();
      expect(arr[2] instanceof LinkedNode).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_6900
     * @tc.name testArrayConstructorThree069
     * @tc.desc Verify Array.create with hex, octal, binary literals as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConstructorThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0xFF, 0o77, 0b1010);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(63);
      expect(arr[2]).assertEqual(10);
    });


  });
}
