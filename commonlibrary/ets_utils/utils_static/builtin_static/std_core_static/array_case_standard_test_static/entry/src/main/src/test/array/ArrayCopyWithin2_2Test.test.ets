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

class ObjWithX {
  x: int = 0;
}

class Calc218 {
  val: int;
  constructor(v: int) {
    this.val = v;
  }
  dbl(): int {
    return this.val * 2;
  }
}

class Custom268 {
  toString(): string {
    return 'custom';
  }
}

class Val269 {
  val: int;
  constructor(v: int) {
    this.val = v;
  }
  valueOf(): int {
    return this.val;
  }
}

function makeFn217(v: int): () => int {
  return (): int => v;
}

function getTarget271(): int {
  return 2;
}

interface Obj2029Data {
  data: Array<int>;
}

interface Cfg2079 {
  offset: int;
}

class Item229 {
  val: int;
  constructor(v: int) {
    this.val = v;
  }
}

function fn230a(): int {
  return 1;
}

function fn230b(): int {
  return 2;
}

function doit3060(a: Array<int>): Array<int> {
  return a.copyWithin(0, 2, 5);
}

interface Item3062 {
  a: int;
  b: int;
}

interface Item3063 {
  x: int;
}

interface Item3067Inner {
  b: int;
}

interface Item3067 {
  a: Item3067Inner;
}

interface Item3064 {
  x: int;
  y: int;
}

interface Item3068 {
  val: int;
}

interface Item3069 {
  x: int;
}

type FnInt = () => int;

interface TupleEntry {
  first: number;
  second: number;
}

export default function ArrayCopyWithin2_2Test(): void {
  describe('ArrayCopyWithin2_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0010
     * @tc.name testArrayCopywithinTwo001
     * @tc.desc Verify target=MAX_INT-1 clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2147483646, 0, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0020
     * @tc.name testArrayCopywithinTwo002
     * @tc.desc Verify target=MAX_INT, start=MIN_INT, end=MAX_INT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2147483647, -2147483648, 2147483647);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0030
     * @tc.name testArrayCopywithinTwo003
     * @tc.desc Verify start=end=MAX_INT no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2147483647, 2147483647);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0040
     * @tc.name testArrayCopywithinTwo004
     * @tc.desc Verify target=MIN_INT clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-2147483648, 0, 1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0050
     * @tc.name testArrayCopywithinTwo005
     * @tc.desc Verify start=MAX_INT-5 clamped to length-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      arr.copyWithin(0, 2147483642, 2147483647);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0060
     * @tc.name testArrayCopywithinTwo006
     * @tc.desc Verify three params all MIN_INT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const minInt = 0 - 2147483647 - 1;
      arr.copyWithin(minInt, minInt, minInt);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0070
     * @tc.name testArrayCopywithinTwo007
     * @tc.desc Verify start=end=MAX_INT no-op with target=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(1, 2147483647, 2147483647);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0080
     * @tc.name testArrayCopywithinTwo008
     * @tc.desc Verify start=MAX_INT, end=-(MAX_INT-1) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const negVal = 0 - 2147483647 + 1;
      arr.copyWithin(0, 2147483647, negVal);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0090
     * @tc.name testArrayCopywithinTwo009
     * @tc.desc Verify extreme int range returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.copyWithin(0, -2147483648, 2147483647);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0100
     * @tc.name testArrayCopywithinTwo010
     * @tc.desc Verify 3-level nested array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4));
      const inner2 = new Array<Array<int>>(new Array<int>(5, 6), new Array<int>(7, 8));
      const arr = new Array<Array<Array<int>>>(inner1, inner2);
      arr.copyWithin(0, 1, 2);
      arr[0][0][0] = 99;
      expect(arr[1][0][0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0110
     * @tc.name testArrayCopywithinTwo011
     * @tc.desc Verify 4-level nested array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l3a = new Array<Array<int>>(new Array<int>(1));
      const l3b = new Array<Array<int>>(new Array<int>(2));
      const l3c = new Array<Array<int>>(new Array<int>(3));
      const arr = new Array<Array<Array<int>>>(l3a, l3b, l3c);
      arr.copyWithin(1, 0, 2);
      arr[0][0][0] = 99;
      expect(arr[1][0][0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0120
     * @tc.name testArrayCopywithinTwo012
     * @tc.desc Verify object array with array property shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Obj2029Data = { data: new Array<int>(1, 2) };
      const obj2: Obj2029Data = { data: new Array<int>(3, 4) };
      const arr = new Array<Obj2029Data>(obj1, obj2);
      arr.copyWithin(0, 1, 2);
      arr[0].data.push(5);
      expect(arr[1].data[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0130
     * @tc.name testArrayCopywithinTwo013
     * @tc.desc Verify nested array modified before copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(a1, a2, a3);
      arr[0].push(99);
      arr.copyWithin(0, 1, 3);
      expect(arr[0][0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0140
     * @tc.name testArrayCopywithinTwo014
     * @tc.desc Verify circular reference array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1);
      const b = new Array<int>(2);
      const c = new Array<int>(3);
      const arr = new Array<Array<int>>(a, b, c);
      a[0] = 99;
      arr.copyWithin(0, 1, 3);
      expect(arr[0][0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0150
     * @tc.name testArrayCopywithinTwo015
     * @tc.desc Verify shared sub-array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = new Array<int>(1, 2);
      const arr = new Array<Array<int>>(sub, sub, sub);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0160
     * @tc.name testArrayCopywithinTwo016
     * @tc.desc Verify function array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<() => int>(makeFn217(1), makeFn217(2), makeFn217(3));
      arr.copyWithin(0, 1, 3);
      expect(arr[0]()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0170
     * @tc.name testArrayCopywithinTwo017
     * @tc.desc Verify class instance array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Calc218>(new Calc218(1), new Calc218(2));
      arr.copyWithin(0, 1, 2);
      expect(arr[0].dbl()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0180
     * @tc.name testArrayCopywithinTwo018
     * @tc.desc Verify two overlapping copies in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      arr.copyWithin(3, 0, 5);
      arr.copyWithin(5, 2, 8);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(1);
      expect(arr[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0190
     * @tc.name testArrayCopywithinTwo019
     * @tc.desc Verify int|string union type copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'a', 2, 'b');
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0200
     * @tc.name testArrayCopywithinTwo020
     * @tc.desc Verify int|string|boolean union type copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string | boolean>(1, true, 'x');
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0210
     * @tc.name testArrayCopywithinTwo021
     * @tc.desc Verify int|undefined array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3, undefined);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0220
     * @tc.name testArrayCopywithinTwo022
     * @tc.desc Verify string|undefined array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined>('a', undefined, 'c', undefined);
      arr.copyWithin(1, 2, 4);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('c');
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0230
     * @tc.name testArrayCopywithinTwo023
     * @tc.desc Verify int|double union type copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | double>(1, 2.5, 3, 4.5);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(2.5);
      expect(arr[1]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0240
     * @tc.name testArrayCopywithinTwo024
     * @tc.desc Verify int|null|undefined union type copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null | undefined>(1, null, undefined, 4);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0250
     * @tc.name testArrayCopywithinTwo025
     * @tc.desc Verify modifying source after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, 4);
      arr[1] = 99;
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0260
     * @tc.name testArrayCopywithinTwo026
     * @tc.desc Verify push between two copyWithin calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      arr.push(6, 7);
      arr.copyWithin(3, 0, 5);
      expect(arr[0]).assertEqual(3);
      expect(arr[3]).assertEqual(3);
      expect(arr[6]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0270
     * @tc.name testArrayCopywithinTwo027
     * @tc.desc Verify pop between two copyWithin calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      arr.pop();
      arr.copyWithin(1, 0, 3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0280
     * @tc.name testArrayCopywithinTwo028
     * @tc.desc Verify sort then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 3, 1, 4, 2);
      arr.sort((a: int, b: int): int => {
        return a - b;
      });
      arr.copyWithin(1, 3, 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0290
     * @tc.name testArrayCopywithinTwo029
     * @tc.desc Verify three alternating copyWithin calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      arr.copyWithin(0, 4, 8);
      arr.copyWithin(2, 0, 4);
      arr.copyWithin(4, 2, 6);
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0300
     * @tc.name testArrayCopywithinTwo030
     * @tc.desc Verify 2D row swap shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(a1, a2, a3);
      arr.copyWithin(0, 1, 3);
      expect(arr[1]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0310
     * @tc.name testArrayCopywithinTwo031
     * @tc.desc Verify modify subarray after copyWithin propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(a1, a2, a3);
      arr.copyWithin(0, 1, 3);
      arr[1].push(99);
      expect(arr[1][2]).assertEqual(99);
      expect(arr[2][2]).assertEqual(99);
      expect(arr[0][0]).assertEqual(3);
      expect(arr[0][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0320
     * @tc.name testArrayCopywithinTwo032
     * @tc.desc Verify modify copy does not affect unrelated row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(a1, a2, a3);
      arr.copyWithin(0, 1, 3);
      arr[0].push(99);
      expect(arr[2][0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0330
     * @tc.name testArrayCopywithinTwo033
     * @tc.desc Verify 3D array slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<Array<int>>(new Array<int>(1), new Array<int>(2));
      const a2 = new Array<Array<int>>(new Array<int>(3), new Array<int>(4));
      const a3 = new Array<Array<int>>(new Array<int>(5), new Array<int>(6));
      const arr = new Array<Array<Array<int>>>(a1, a2, a3);
      arr.copyWithin(1, 0, 2);
      arr[0][0][0] = 99;
      expect(arr[1][0][0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0340
     * @tc.name testArrayCopywithinTwo034
     * @tc.desc Verify 2D full copy to self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const a4 = new Array<int>(7, 8);
      const arr = new Array<Array<int>>(a1, a2, a3, a4);
      arr.copyWithin(0, 0, 4);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[3][0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0350
     * @tc.name testArrayCopywithinTwo035
     * @tc.desc Verify 2D cross-row copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const a3 = new Array<int>(5, 6);
      const a4 = new Array<int>(7, 8);
      const arr = new Array<Array<int>>(a1, a2, a3, a4);
      arr.copyWithin(1, 2, 4);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0360
     * @tc.name testArrayCopywithinTwo036
     * @tc.desc Verify 2D shallow copy reference comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1);
      const a2 = new Array<int>(2);
      const a3 = new Array<int>(3);
      const arr = new Array<Array<int>>(a1, a2, a3);
      const copy = arr.copyWithin(0, 1, 3);
      expect(copy[0]).assertEqual(arr[0]);
      expect(copy[0] !== arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0370
     * @tc.name testArrayCopywithinTwo037
     * @tc.desc Verify indexOf after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 3);
      const idx = arr.copyWithin(0, 2, 5).indexOf(3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0380
     * @tc.name testArrayCopywithinTwo038
     * @tc.desc Verify lastIndexOf after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 3);
      const idx = arr.copyWithin(0, 2, 5).lastIndexOf(3);
      expect(idx).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0390
     * @tc.name testArrayCopywithinTwo039
     * @tc.desc Verify includes after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const found = arr.copyWithin(0, 2, 5).includes(3);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0400
     * @tc.name testArrayCopywithinTwo040
     * @tc.desc Verify every after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8, 10);
      const allEven = arr.copyWithin(1, 0, 3).every((v: int): boolean => v % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0410
     * @tc.name testArrayCopywithinTwo041
     * @tc.desc Verify some after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 3, 5, 7, 8);
      const hasEven = arr.copyWithin(0, 2, 5).some((v: int): boolean => v % 2 === 0);
      expect(hasEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0420
     * @tc.name testArrayCopywithinTwo042
     * @tc.desc Verify join after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      const result = arr.copyWithin(1, 3, 5).join('-');
      expect(result).assertEqual('a-d-e-d-e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0430
     * @tc.name testArrayCopywithinTwo043
     * @tc.desc Verify toString after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.copyWithin(0, 2, 5).toString();
      expect(result).assertEqual('3,4,5,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0440
     * @tc.name testArrayCopywithinTwo044
     * @tc.desc Verify forEach multiply after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      arr.forEach((v: int, i: int): void => {
        arr[i] = v * 2;
      });
      expect(arr[0]).assertEqual(6);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0450
     * @tc.name testArrayCopywithinTwo045
     * @tc.desc Verify double copyWithin with some chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      const result = arr.copyWithin(2, 0, 4).copyWithin(0, 2, 6).some((v: int): boolean => v > 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0460
     * @tc.name testArrayCopywithinTwo046
     * @tc.desc Verify at after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const val = arr.copyWithin(0, 2, 5).at(-1);
      expect(val).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0470
     * @tc.name testArrayCopywithinTwo047
     * @tc.desc Verify Map object array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, int>();
      m1.set('a', 1);
      const m2 = new Map<string, int>();
      m2.set('b', 2);
      const arr = new Array<Map<string, int>>(m1, m2);
      arr.copyWithin(0, 1, 2);
      arr[0].set('c', 3);
      expect(arr[1].get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0480
     * @tc.name testArrayCopywithinTwo048
     * @tc.desc Verify Set object array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1 = new Set<int>();
      s1.add(1);
      const s2 = new Set<int>();
      s2.add(2);
      const arr = new Array<Set<int>>(s1, s2);
      arr.copyWithin(0, 1, 2);
      arr[0].add(3);
      expect(arr[1].has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0490
     * @tc.name testArrayCopywithinTwo049
     * @tc.desc Verify custom toString class array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Custom268>(new Custom268(), new Custom268());
      arr.copyWithin(0, 1, 2);
      expect(arr[0].toString()).assertEqual('custom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0500
     * @tc.name testArrayCopywithinTwo050
     * @tc.desc Verify custom valueOf class array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Val269>(new Val269(1), new Val269(2));
      arr.copyWithin(0, 1, 2);
      expect(arr[0].valueOf()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0510
     * @tc.name testArrayCopywithinTwo051
     * @tc.desc Verify target=end boundary exact copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(3, 0, 3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0520
     * @tc.name testArrayCopywithinTwo052
     * @tc.desc Verify function return value as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(getTarget271(), 1, 4);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0530
     * @tc.name testArrayCopywithinTwo053
     * @tc.desc Verify object property as start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const cfg: Cfg2079 = { offset: 2 };
      arr.copyWithin(0, cfg.offset, 5);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0540
     * @tc.name testArrayCopywithinTwo054
     * @tc.desc Verify array element as end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      const idx: int = 4;
      arr.copyWithin(0, 1, arr[idx]);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0550
     * @tc.name testArrayCopywithinTwo055
     * @tc.desc Verify Math.min result as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(Double.toInt(Math.min(3, 5)), 0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0560
     * @tc.name testArrayCopywithinTwo056
     * @tc.desc Verify string element array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', 'foo', 'bar');
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual('foo');
      expect(arr[1]).assertEqual('bar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0570
     * @tc.name testArrayCopywithinTwo057
     * @tc.desc Verify boolean element array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0580
     * @tc.name testArrayCopywithinTwo058
     * @tc.desc Verify null element array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null, 5);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_TWO_0590
     * @tc.name testArrayCopywithinTwo059
     * @tc.desc Verify undefined element array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3, undefined, 5);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertUndefined();
    });
