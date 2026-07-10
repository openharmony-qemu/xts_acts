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

class ExtendPoint2 {
  x: number;
  y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

interface ObjWithX {
  x: int;
}

interface HasData {
  data: Array<int>;
}

interface SimpleObj {
  val: int;
}

class ChainNode {
  val: int = 0;
  link: ChainNode | null = null;
}

function fillFn(): int {
  return 42;
}

export default function ArrayExtendToTest2(): void {
  describe('ArrayExtendToTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0100
     * @tc.name testArrayExtendTo001
     * @tc.desc Verify negative float initial value extended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.0, 2.0);
      arr.extendTo(5, -3.14f);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[2]).assertEqual(-3.14f);
      expect(arr[4]).assertEqual(-3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0200
     * @tc.name testArrayExtendTo002
     * @tc.desc Verify empty object initial value extended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjWithX>({ x: 1 });
      arr.extendTo(4, { x: 0 });
      expect(arr.length).assertEqual(4);
      expect(arr[1] != undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0300
     * @tc.name testArrayExtendTo003
     * @tc.desc Verify shrinkTo zero then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.shrinkTo(0);
      arr.extendTo(4, 7);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0400
     * @tc.name testArrayExtendTo004
     * @tc.desc Verify shrinkTo one then extendTo large length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      arr.shrinkTo(1);
      arr.extendTo(100, 5);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(10);
      expect(arr[99]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0500
     * @tc.name testArrayExtendTo005
     * @tc.desc Verify multiple shrinkTo-extendTo cycles preserve first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.shrinkTo(2);
      arr.extendTo(4, 0);
      arr.shrinkTo(1);
      arr.extendTo(3, 9);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0600
     * @tc.name testArrayExtendTo006
     * @tc.desc Verify extendTo then shrinkTo same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      arr.shrinkTo(5);
      expect(arr.length).assertEqual(5);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0700
     * @tc.name testArrayExtendTo007
     * @tc.desc Verify complex shrink-extend cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr.extendTo(3, 2);
      arr.shrinkTo(2);
      arr.extendTo(4, 3);
      arr.shrinkTo(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0800
     * @tc.name testArrayExtendTo008
     * @tc.desc Verify empty array shrink then extend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.shrinkTo(0);
      arr.extendTo(3, 42);
      expect(arr[0]).assertEqual(42);
      expect(arr[2]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0900
     * @tc.name testArrayExtendTo009
     * @tc.desc Verify float length 4.7 truncated to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(Double.toInt(4.7), 0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1000
     * @tc.name testArrayExtendTo010
     * @tc.desc Verify float length 3.14 truncated to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr.extendTo(Double.toInt(3.14), 9);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1100
     * @tc.name testArrayExtendTo011
     * @tc.desc Verify length 0.99 truncates to 0, shrinks to empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(Double.toInt(0.99), 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1200
     * @tc.name testArrayExtendTo012
     * @tc.desc Verify negative float length throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr.extendTo(Double.toInt(-1.5), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1300
     * @tc.name testArrayExtendTo013
     * @tc.desc Verify float length 1.0 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.extendTo(Double.toInt(1.0), 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1400
     * @tc.name testArrayExtendTo014
     * @tc.desc Verify three extendTo calls with differing fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0);
      arr.extendTo(2, 1);
      arr.extendTo(4, 2);
      arr.extendTo(7, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
      expect(arr[6]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1500
     * @tc.name testArrayExtendTo015
     * @tc.desc Verify boolean then int staged fills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean | number>(true);
      arr.extendTo(3, false);
      arr.extendTo(5, 0);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1600
     * @tc.name testArrayExtendTo016
     * @tc.desc Verify typed array does not have extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array(3);
      const plain = new Array<int>(1);
      expect(typeof plain.extendTo).assertEqual('function');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1700
     * @tc.name testArrayExtendTo017
     * @tc.desc Verify plain array extendTo then assign to typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const plain = new Array<int>(1, 2);
      plain.extendTo(5, 0);
      const typed = new Int32Array(plain);
      expect(typed[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1800
     * @tc.name testArrayExtendTo018
     * @tc.desc Verify extendTo elements compatible with Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.0);
      arr.extendTo(4, 0.0);
      const ta = new Float64Array(arr);
      expect(ta.at(2)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1900
     * @tc.name testArrayExtendTo019
     * @tc.desc Verify buffer unrelated array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.extendTo(4, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2000
     * @tc.name testArrayExtendTo020
     * @tc.desc Verify splice delete then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.splice(1, 2);
      arr.extendTo(6, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2100
     * @tc.name testArrayExtendTo021
     * @tc.desc Verify splice insert then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 5);
      arr.splice(1, 0, 2, 3, 4);
      arr.extendTo(7, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[4]).assertEqual(5);
      expect(arr[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2200
     * @tc.name testArrayExtendTo022
     * @tc.desc Verify sort ascending then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 3, 1, 4, 2);
      arr.sort((a, b) => {
        return a - b;
      });
      arr.extendTo(8, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
      expect(arr[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2300
     * @tc.name testArrayExtendTo023
     * @tc.desc Verify sort descending then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.sort((a, b) => {
        return b - a;
      });
      arr.extendTo(6, 9);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2400
     * @tc.name testArrayExtendTo024
     * @tc.desc Verify reverse then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.reverse();
      arr.extendTo(6, 0);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2500
     * @tc.name testArrayExtendTo025
     * @tc.desc Verify sort identical elements then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 2, 1, 1);
      arr.sort();
      arr.extendTo(6, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2600
     * @tc.name testArrayExtendTo026
     * @tc.desc Verify splice all delete then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.splice(0, 3);
      arr.extendTo(4, 9);
      expect(arr[0]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2700
     * @tc.name testArrayExtendTo027
     * @tc.desc Verify sort reverse then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 2);
      arr.sort((a, b) => {
        return a - b;
      });
      arr.reverse();
      arr.extendTo(5, 0);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2800
     * @tc.name testArrayExtendTo028
     * @tc.desc Verify filter even then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      const filtered = arr.filter((v) => {
        return v % 2 === 0;
      });
      filtered.extendTo(5, 0);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[2]).assertEqual(6);
      expect(filtered[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2900
     * @tc.name testArrayExtendTo029
     * @tc.desc Verify filter all pass then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const filtered = arr.filter((v) => {
        return v > 0;
      });
      filtered.extendTo(6, 9);
      expect(filtered[0]).assertEqual(1);
      expect(filtered[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3000
     * @tc.name testArrayExtendTo030
     * @tc.desc Verify filter empty result then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const empty = arr.filter((v) => {
        return v > 10;
      });
      empty.extendTo(4, -1);
      expect(empty[0]).assertEqual(-1);
      expect(empty[3]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3100
     * @tc.name testArrayExtendTo031
     * @tc.desc Verify map then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const mapped = arr.map((v) => v * 10);
      mapped.extendTo(5, 0);
      expect(mapped[0]).assertEqual(10);
      expect(mapped[2]).assertEqual(30);
      expect(mapped[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3200
     * @tc.name testArrayExtendTo032
     * @tc.desc Verify map to string then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const mapped = arr.map((v) => 'num_' + v.toString());
      mapped.extendTo(4, 'fill');
      expect(mapped[0]).assertEqual('num_1');
      expect(mapped[2]).assertEqual('fill');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3300
     * @tc.name testArrayExtendTo033
     * @tc.desc Verify reduce then extendTo original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const sum = arr.reduce((a, b) => a + b, 0);
      arr.extendTo(7, 0);
      expect(sum).assertEqual(15);
      expect(arr[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3400
     * @tc.name testArrayExtendTo034
     * @tc.desc Verify map shrink then extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const mapped = arr.map((v) => v * v);
      mapped.shrinkTo(2);
      mapped.extendTo(4, -1);
      expect(mapped[0]).assertEqual(1);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3500
     * @tc.name testArrayExtendTo035
     * @tc.desc Verify filter map then extendTo chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      const result = arr.filter((v) => {
        return v > 3;
      }).map((v) => {
        return v * 2;
      });
      result.extendTo(5, 0);
      expect(result[0]).assertEqual(8);
      expect(result[2]).assertEqual(12);
      expect(result[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3600
     * @tc.name testArrayExtendTo036
     * @tc.desc Verify large string fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('start');
      const bigStr = 'x'.repeat(100);
      arr.extendTo(4, bigStr);
      expect(arr[1].length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3700
     * @tc.name testArrayExtendTo037
     * @tc.desc Verify complex object fill with nested data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigObj: HasData = { data: Array.create<int>(10, 0) };
      const arr = new Array<HasData>(bigObj);
      arr.extendTo(3, bigObj);
      expect(arr[1].data.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3800
     * @tc.name testArrayExtendTo038
     * @tc.desc Verify function reference fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(fillFn());
      arr.extendTo(4, fillFn());
      expect(arr[1]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3900
     * @tc.name testArrayExtendTo039
     * @tc.desc Verify class instance independence after extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new ExtendPoint2(1, 2);
      const arr = new Array<ExtendPoint2>(p);
      arr.extendTo(4, new ExtendPoint2(0, 0));
      arr[1].x = 999;
      expect(arr[1].x).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4000
     * @tc.name testArrayExtendTo040
     * @tc.desc Verify symbol reference fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: SimpleObj = { val: 1 };
      const arr = new Array<SimpleObj>(obj);
      arr.extendTo(3, obj);
      expect(arr[1]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4100
     * @tc.name testArrayExtendTo041
     * @tc.desc Verify union type staged fills with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number | boolean>(1);
      arr.extendTo(4, 'mixed');
      arr.extendTo(6, false);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('mixed');
      expect(arr[4]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4200
     * @tc.name testArrayExtendTo042
     * @tc.desc Verify frozen array has extendTo method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      expect(typeof arr.extendTo).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4300
     * @tc.name testArrayExtendTo043
     * @tc.desc Verify sealed array has extendTo method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      expect(typeof arr.extendTo).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4400
     * @tc.name testArrayExtendTo044
     * @tc.desc Verify non-extensible array has extendTo method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      expect(typeof arr.extendTo).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4500
     * @tc.name testArrayExtendTo045
     * @tc.desc Verify frozen array extendTo throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4600
     * @tc.name testArrayExtendTo046
     * @tc.desc Verify at positive index after extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4700
     * @tc.name testArrayExtendTo047
     * @tc.desc Verify at negative index tail after extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.at(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4800
     * @tc.name testArrayExtendTo048
     * @tc.desc Verify at negative index original element area
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.at(-4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4900
     * @tc.name testArrayExtendTo049
     * @tc.desc Verify at index out of range after extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr.extendTo(3, 0);
      try {
        arr.at(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5000
     * @tc.name testArrayExtendTo050
     * @tc.desc Verify at after multiple extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr.extendTo(3, 10);
      arr.extendTo(6, 20);
      expect(arr.at(4)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5100
     * @tc.name testArrayExtendTo051
     * @tc.desc Verify at after shrinkTo extendTo mixed access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      arr.extendTo(5, 9);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(9);
      expect(arr.at(3)).assertEqual(9);
      expect(arr.at(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5200
     * @tc.name testArrayExtendTo052
     * @tc.desc Verify frozen array extendTo throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      arr.extendTo(5, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5300
     * @tc.name testArrayExtendTo053
     * @tc.desc Verify extendTo then fill then extendTo chain works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.extendTo(7, 5);
      arr.fill(9, 0, 3);
      arr.extendTo(9, 8);
      expect(arr[0]).assertEqual(9);
      expect(arr[6]).assertEqual(5);
      expect(arr[7]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5400
     * @tc.name testArrayExtendTo054
     * @tc.desc Verify byte array extendTo with 0 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5500
     * @tc.name testArrayExtendTo055
     * @tc.desc Verify long array extendTo with 100L fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(10, 20);
      arr.extendTo(5, 100);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(100);
      expect(arr[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5600
     * @tc.name testArrayExtendTo056
     * @tc.desc Verify boolean array extendTo with false fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true);
      arr.extendTo(4, false);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[3]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5700
     * @tc.name testArrayExtendTo057
     * @tc.desc Verify Date array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr = new Array<Date>(d);
      arr.extendTo(3, d);
      expect(arr.length).assertEqual(3);
      expect(arr[0].getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5800
     * @tc.name testArrayExtendTo058
     * @tc.desc Verify short array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(10, 20);
      arr.extendTo(5, 99);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(99);
      expect(arr[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5900
     * @tc.name testArrayExtendTo059
     * @tc.desc Verify char array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b');
      arr.extendTo(4, c'z');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(c'a');
      expect(arr[2]).assertEqual(c'z');
      expect(arr[3]).assertEqual(c'z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6000
     * @tc.name testArrayExtendTo060
     * @tc.desc Verify bigint array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n);
      arr.extendTo(4, 99n);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(99n);
      expect(arr[3]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6100
     * @tc.name testArrayExtendTo061
     * @tc.desc Verify Unicode Chinese string fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('start');
      arr.extendTo(4, '\u4e2d\u6587');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('start');
      expect(arr[1]).assertEqual('\u4e2d\u6587');
      expect(arr[3]).assertEqual('\u4e2d\u6587');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6200
     * @tc.name testArrayExtendTo062
     * @tc.desc Verify empty and space string fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a');
      arr.extendTo(4, '');
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('');
      expect(arr[3]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6300
     * @tc.name testArrayExtendTo063
     * @tc.desc Verify Map element array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = new Array<Map<string, int>>(m);
      arr.extendTo(3, m);
      expect(arr.length).assertEqual(3);
      expect(arr[1].get('k')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6400
     * @tc.name testArrayExtendTo064
     * @tc.desc Verify Set element array extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2, 3));
      const arr = new Array<Set<int>>(s);
      arr.extendTo(3, s);
      expect(arr.length).assertEqual(3);
      expect(arr[2].has(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6500
     * @tc.name testArrayExtendTo065
     * @tc.desc Verify null initialValue extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1);
      arr.extendTo(4, null);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertNull();
      expect(arr[3]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6600
     * @tc.name testArrayExtendTo066
     * @tc.desc Verify undefined initialValue extendTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(1);
      arr.extendTo(4, undefined);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertUndefined();
      expect(arr[3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6700
     * @tc.name testArrayExtendTo067
     * @tc.desc Verify float arrayLength use Double.toInt (3.7 -> 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(Double.toInt(3.7), 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6800
     * @tc.name testArrayExtendTo068
     * @tc.desc Verify extendTo with null initial value for int|null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, 2);
      arr.extendTo(5, null);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertNull();
      expect(arr[4]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6900
     * @tc.name testArrayExtendTo069
     * @tc.desc Verify extendTo with undefined initial value for int|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(10, 20);
      arr.extendTo(5, undefined);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertUndefined();
      expect(arr[4]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_7000
     * @tc.name testArrayExtendTo070
     * @tc.desc Verify extendTo with ChainNode whose link is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node = new ChainNode();
      node.val = 99;
      node.link = null;
      const arr = new Array<ChainNode>();
      arr.extendTo(3, node);
      expect(arr.length).assertEqual(3);
      expect(arr[0].val).assertEqual(99);
      expect(arr[0].link).assertNull();
      expect(arr[2].link).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_7100
     * @tc.name testArrayExtendTo071
     * @tc.desc Verify extendTo with ChainNode|null type, null as fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<ChainNode | null> = new Array<ChainNode | null>(new ChainNode());
      arr.extendTo(4, null);
      expect(arr.length).assertEqual(4);
      expect(arr[0] instanceof ChainNode).assertTrue();
      expect(arr[1]).assertNull();
      expect(arr[3]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_7200
     * @tc.name testArrayExtendTo072
     * @tc.desc Verify extendTo with hex literal initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0xFF);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(255);
      expect(arr[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_7300
     * @tc.name testArrayExtendTo073
     * @tc.desc Verify extendTo with octal literal initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0o77);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(63);
      expect(arr[4]).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_7400
     * @tc.name testArrayExtendTo074
     * @tc.desc Verify extendTo with binary literal initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0b11111111);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(255);
      expect(arr[4]).assertEqual(255);
    });

  });
}
