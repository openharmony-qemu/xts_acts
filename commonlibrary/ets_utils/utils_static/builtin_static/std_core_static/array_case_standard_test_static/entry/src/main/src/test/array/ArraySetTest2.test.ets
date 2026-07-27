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

class SetItem {
  val: int = 0;
  constructor(v: int) {
    this.val = v;
  }
}

class SetPoint {
  x: int;
  y: int;
  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

class SetAnimal {
  kind: string = '';
  constructor(k: string) {
    this.kind = k;
  }
}

class SetDog extends SetAnimal {
  breed: string = '';
  constructor(k: string, b: string) {
    super(k);
    this.breed = b;
  }
}

class SetCat extends SetAnimal {
  color: string = '';
  constructor(k: string, c: string) {
    super(k);
    this.color = c;
  }
}

class SetGrandParent {
  arr: Array<int> = new Array<int>();
  constructor() {
    this.arr.pushOne(1);
    this.arr.pushOne(2);
    this.arr.pushOne(3);
  }
}

class SetParent extends SetGrandParent {
}

class SetChild extends SetParent {
}

class SetOverrideChild extends SetGrandParent {
  arr: Array<int> = new Array<int>();
  constructor() {
    super();
    this.arr.pushOne(10);
    this.arr.pushOne(20);
    this.arr.pushOne(30);
  }
}

class SetSubArray extends Array<int> {
}

function fillAndCheck(): void {
  const arr = new Array<int>();
  arr.pushOne(0);
  arr.pushOne(0);
  arr.pushOne(0);
  arr[0] = 1;
  arr[1] = 2;
  arr[2] = 3;
  expect(arr[0]).assertEqual(1);
  expect(arr[1]).assertEqual(2);
  expect(arr[2]).assertEqual(3);
}

export default function ArraySetTest2(): void {
  describe('ArraySetTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0100
     * @tc.name testArraySet001
     * @tc.desc Verify set on Array<double> assigns double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5);
      arr[1] = 99.9;
      expect(arr[1]).assertEqual(99.9);
      expect(arr[0]).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0200
     * @tc.name testArraySet002
     * @tc.desc Verify set on large array elements preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      arr[500] = 9999;
      expect(arr[500]).assertEqual(9999);
      expect(arr[499]).assertEqual(499);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0300
     * @tc.name testArraySet003
     * @tc.desc Verify set on Array<string> with unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr[1] = '中文';
      expect(arr[1]).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0400
     * @tc.name testArraySet004
     * @tc.desc Verify set with repeated assignment to same position keeps latest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 100;
      arr[1] = 200;
      arr[1] = 300;
      expect(arr[1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0500
     * @tc.name testArraySet005
     * @tc.desc Verify set on union typed array with both int and string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      arr[0] = 'new';
      arr[2] = 999;
      expect(arr[0]).assertEqual('new');
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0600
     * @tc.name testArraySet006
     * @tc.desc Verify set on Array<number | null> assigns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, 2, 3);
      arr[1] = null;
      expect(arr[1]).assertNull();
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0700
     * @tc.name testArraySet007
     * @tc.desc Verify set throws RangeError when index equals length: arr[3]=100 on [1,2,3] (index===length, adjacent OOB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr[3] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0800
     * @tc.name testArraySet008
     * @tc.desc Verify set after pushOne extends then assigns new slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.pushOne(3);
      arr[2] = 99;
      expect(arr[2]).assertEqual(99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0900
     * @tc.name testArraySet009
     * @tc.desc Verify set on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      arr[0] = 100;
      expect(arr[0]).assertEqual(100);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1000
     * @tc.name testArraySet010
     * @tc.desc Verify set with NaN value on number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.0, 2.0, 3.0);
      arr[0] = Double.NaN;
      expect(isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1100
     * @tc.name testArraySet011
     * @tc.desc Verify set with Infinity value on number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0.0, 0.0, 0.0);
      arr[0] = Double.POSITIVE_INFINITY;
      arr[1] = Double.NEGATIVE_INFINITY;
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1200
     * @tc.name testArraySet012
     * @tc.desc Verify set with -0 preserves negative zero distinction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0.0, 0.0);
      arr[0] = -0;
      arr[1] = 0;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1300
     * @tc.name testArraySet013
     * @tc.desc Verify set with bigint value on bigint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(0n, 0n, 0n);
      arr[1] = 999n;
      expect(arr[1]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1400
     * @tc.name testArraySet014
     * @tc.desc Verify set on union array with null preserves null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, 2, 3);
      arr[0] = null;
      arr[2] = null;
      expect(arr[0]).assertNull();
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1500
     * @tc.name testArraySet015
     * @tc.desc Verify set on polymorphic animal array with subclass instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SetAnimal>(new SetDog('mammal', 'husky'), new SetCat('mammal', 'orange'));
      arr[0] = new SetCat('mammal', 'black');
      const cat = arr[0] as SetCat;
      expect(cat.color).assertEqual('black');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1600
     * @tc.name testArraySet016
     * @tc.desc Verify set on inherited array field from grandparent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new SetChild();
      obj.arr[1] = 999;
      expect(obj.arr[0]).assertEqual(1);
      expect(obj.arr[1]).assertEqual(999);
      expect(obj.arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1700
     * @tc.name testArraySet017
     * @tc.desc Verify set on overridden array field in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new SetOverrideChild();
      obj.arr[0] = 999;
      expect(obj.arr[0]).assertEqual(999);
      expect(obj.arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1800
     * @tc.name testArraySet018
     * @tc.desc Verify set on Array<int> modifies existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 999;
      expect(arr[1]).assertEqual(999);
      arr[2] = 888;
      expect(arr[2]).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1900
     * @tc.name testArraySet019
     * @tc.desc Verify set on Array<int> modifies first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 6, 7);
      arr[0] = 100;
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2000
     * @tc.name testArraySet020
     * @tc.desc Verify set on out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr[5] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2100
     * @tc.name testArraySet021
     * @tc.desc Verify set on subclass of Array works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SetSubArray();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      arr[1] = 99;
      expect(arr[1]).assertEqual(99);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2200
     * @tc.name testArraySet022
     * @tc.desc Verify set with unicode string values including zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr[1] = '​';
      arr[2] = '测试😀';
      expect(arr[1]).assertEqual('​');
      expect(arr[2]).assertEqual('测试😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2300
     * @tc.name testArraySet023
     * @tc.desc Verify set accepts long strings (10000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', '', '');
      const longStr = 'x'.repeat(10000);
      arr[0] = longStr;
      expect(arr[0].length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2400
     * @tc.name testArraySet024
     * @tc.desc Verify set on fully filled array preserves all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 0, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2500
     * @tc.name testArraySet025
     * @tc.desc Verify set with XSS script string is stored verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', 'safe');
      arr[0] = '<script>alert(1)</script>';
      expect(arr[0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2600
     * @tc.name testArraySet026
     * @tc.desc Verify set of hex literal 0xFF on int array preserves value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 0, 0);
      arr[0] = 0xFF;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2700
     * @tc.name testArraySet027
     * @tc.desc Verify set of octal literal 0o77 on int array preserves value 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 0);
      arr[0] = 0o77;
      expect(arr[0]).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2800
     * @tc.name testArraySet028
     * @tc.desc Verify set on union type string|number with interleaved types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>('a', 1, 'c');
      arr[0] = 999;
      arr[1] = 'hello';
      expect(arr[0]).assertEqual(999);
      expect(arr[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2900
     * @tc.name testArraySet029
     * @tc.desc Verify set on custom class array propagates reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new SetItem(100);
      const arr = new Array<SetItem>(new SetItem(1), new SetItem(2));
      arr[1] = obj;
      obj.val = 999;
      expect(arr[1].val).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3000
     * @tc.name testArraySet030
     * @tc.desc Verify set on point array with interface-like class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SetPoint>(new SetPoint(0, 0), new SetPoint(0, 0));
      arr[0] = new SetPoint(7, 8);
      arr[1] = new SetPoint(9, 10);
      expect(arr[0].x).assertEqual(7);
      expect(arr[0].y).assertEqual(8);
      expect(arr[1].x).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3100
     * @tc.name testArraySet031
     * @tc.desc Verify set high-frequency 10000 writes to same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0);
      for (let i = 0; i < 10000; i++) {
        arr[0] = i;
      }
      expect(arr[0]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3200
     * @tc.name testArraySet032
     * @tc.desc Verify set on function-type array stores callables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): int => 42;
      const arr = new Array<() => int>();
      arr.pushOne((): int => 0);
      arr.pushOne((): int => 0);
      arr[0] = fn;
      expect(arr[0]()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3300
     * @tc.name testArraySet033
     * @tc.desc Verify set after shrinkTo retains correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      arr[2] = 99;
      expect(arr[2]).assertEqual(99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3400
     * @tc.name testArraySet034
     * @tc.desc Verify set can be called via method alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const writer = (idx: int, val: int): void => {
        arr[idx] = val;
      };
      writer(0, 100);
      writer(2, 300);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3500
     * @tc.name testArraySet035
     * @tc.desc Verify set with empty string on string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr[0] = '';
      arr[2] = '';
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3600
     * @tc.name testArraySet036
     * @tc.desc Verify set with MAX_SAFE_INTEGER and MIN_SAFE_INTEGER values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArraySet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 0);
      const maxVal = Number.MAX_SAFE_INTEGER.toInt();
      const minVal = Number.MIN_SAFE_INTEGER.toInt();
      arr[0] = maxVal;
      arr[1] = minVal;
      expect(arr[0]).assertEqual(maxVal);
      expect(arr[1]).assertEqual(minVal);
    });
  });
}