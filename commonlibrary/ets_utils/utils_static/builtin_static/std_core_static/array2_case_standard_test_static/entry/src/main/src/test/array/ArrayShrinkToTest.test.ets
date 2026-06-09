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

class ShrinkItem026 {
  value: number;

  constructor(v: number) {
    this.value = v;
  }
}

interface ShrinkPoint027 {
  x: number;
  y: number;
}

class ShrinkRefCase028 {
  value: number = 0;
}

function createRangeArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.push(i);
  }
  return arr;
}

export default function ArrayShrinkToTest(): void {
  describe('ArrayShrinkToTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0100
     * @tc.name testArrayShrinkTo001
     * @tc.desc Verify arrayLength is required to shrink the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0200
     * @tc.name testArrayShrinkTo002
     * @tc.desc Verify shrinkTo keeps the requested normal target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0300
     * @tc.name testArrayShrinkTo003
     * @tc.desc Verify shrinkTo can clear an array and allow rebuilding it with later pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(0);
      expect(arr.length).assertEqual(0);
      arr.pushOne(9);
      expect(arr.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0400
     * @tc.name testArrayShrinkTo004
     * @tc.desc Verify shrinkTo to one keeps only the first element, which can then be popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr.pop()).assertEqual(1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0500
     * @tc.name testArrayShrinkTo005
     * @tc.desc Verify shrinkTo keeps the array unchanged at the current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalLength = arr.length;
      const originalText = arr.toString();
      arr.shrinkTo(originalLength);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual(originalText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0600
     * @tc.name testArrayShrinkTo006
     * @tc.desc Verify very large target lengths do not expand the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.shrinkTo(2147483647);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0700
     * @tc.name testArrayShrinkTo007
     * @tc.desc Verify shrinkTo does not expand arrays when the target length is larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shrinkTo(10);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0800
     * @tc.name testArrayShrinkTo008
     * @tc.desc Verify negative target lengths throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.shrinkTo(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_0900
     * @tc.name testArrayShrinkTo009
     * @tc.desc Verify shrinkTo preserves prefix order for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1000
     * @tc.name testArrayShrinkTo010
     * @tc.desc Verify shrinkTo can trim object arrays while preserving the first object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ShrinkItem026(1);
      const arr = new Array<ShrinkItem026>(first, new ShrinkItem026(2), new ShrinkItem026(3));
      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1100
     * @tc.name testArrayShrinkTo011
     * @tc.desc Verify shrinkTo can reduce large generated arrays to a smaller prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(10);
      arr.shrinkTo(4);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1200
     * @tc.name testArrayShrinkTo012
     * @tc.desc Verify scientific notation values can be used as numeric lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo((2e0).toInt());
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1300
     * @tc.name testArrayShrinkTo013
     * @tc.desc Verify hexadecimal numeric values can be used as lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(0x2);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1400
     * @tc.name testArrayShrinkTo014
     * @tc.desc Verify shrinkTo can reduce interface-typed arrays while preserving leading entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ShrinkPoint027>(
        { x: 1, y: 1 },
        { x: 2, y: 2 },
        { x: 3, y: 3 }
      );
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr[1].x).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1500
     * @tc.name testArrayShrinkTo015
     * @tc.desc Verify shrinkTo returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.shrinkTo(3);
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1600
     * @tc.name testArrayShrinkTo016
     * @tc.desc Verify shrinkTo keeps the leading string prefix after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma', 'delta');
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('alpha,beta,gamma');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1700
     * @tc.name testArrayShrinkTo017
     * @tc.desc Verify out-of-range elements cannot be accessed after shrinkTo truncates the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      try {
        arr[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1800
     * @tc.name testArrayShrinkTo018
     * @tc.desc Verify multiple shrinkTo calls can progressively trim a string array while preserving order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      expect(arr.length).assertEqual(5);

      arr.shrinkTo(4);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual('a,b,c,d');

      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('a,b');

      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);
      expect(arr.toString()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_1900
     * @tc.name testArrayShrinkTo019
     * @tc.desc Verify shrinkTo supports staircase reductions with varying step sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      arr.shrinkTo(7);
      expect(arr.length).assertEqual(7);

      arr.shrinkTo(5);
      expect(arr.length).assertEqual(5);

      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2000
     * @tc.name testArrayShrinkTo020
     * @tc.desc Verify shrinkTo works together with later extendTo calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);

      arr.extendTo(5, 100);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(100);
      expect(arr[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2100
     * @tc.name testArrayShrinkTo021
     * @tc.desc Verify remaining elements can still be modified after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 300;
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2200
     * @tc.name testArrayShrinkTo022
     * @tc.desc Verify new elements can be appended after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      arr.pushOne(10);
      arr.pushOne(20);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2300
     * @tc.name testArrayShrinkTo023
     * @tc.desc Verify shrinkTo works for number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2400
     * @tc.name testArrayShrinkTo024
     * @tc.desc Verify shrinkTo works for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2500
     * @tc.name testArrayShrinkTo025
     * @tc.desc Verify shrinkTo works for boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2600
     * @tc.name testArrayShrinkTo026
     * @tc.desc Verify shrinkTo works for arrays of custom classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ShrinkItem026>(
        new ShrinkItem026(1),
        new ShrinkItem026(2),
        new ShrinkItem026(3),
        new ShrinkItem026(4)
      );
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2700
     * @tc.name testArrayShrinkTo027
     * @tc.desc Verify shrinkTo works for arrays typed by interfaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ShrinkPoint027>(
        { x: 1, y: 1 },
        { x: 2, y: 2 },
        { x: 3, y: 3 }
      );
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2800
     * @tc.name testArrayShrinkTo028
     * @tc.desc Verify shrinkTo to zero prevents later indexed access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(0);
      expect(arr.length).assertEqual(0);
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_2900
     * @tc.name testArrayShrinkTo029
     * @tc.desc Verify large arrays can be shrunk to a small boundary safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(1000);
      arr.shrinkTo(10);
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(0);
      expect(arr[9]).assertEqual(9);
      try {
        arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3000
     * @tc.name testArrayShrinkTo030
     * @tc.desc Verify shrinkTo can emulate keeping only the first N elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      arr.shrinkTo(5);
      expect(arr.length).assertEqual(5);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3100
     * @tc.name testArrayShrinkTo031
     * @tc.desc Verify shrinkTo can discard most elements to reduce retained data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(10000);
      arr.shrinkTo(10);
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3200
     * @tc.name testArrayShrinkTo032
     * @tc.desc Verify shrinkTo can enforce a maximum retained size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxItems = 5;
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      if (arr.length > maxItems) {
        arr.shrinkTo(maxItems);
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3300
     * @tc.name testArrayShrinkTo033
     * @tc.desc Verify shrinkTo and extendTo affect arrays in opposite directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4, 5);
      arr1.shrinkTo(2);
      expect(arr1.length).assertEqual(2);

      const arr2 = new Array<number>(1, 2);
      arr2.extendTo(5, 0);
      expect(arr2.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3400
     * @tc.name testArrayShrinkTo034
     * @tc.desc Verify arrays can be extended and then shrunk while preserving prefix elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.extendTo(10, 0);
      expect(arr.length).assertEqual(10);
      arr.shrinkTo(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3500
     * @tc.name testArrayShrinkTo035
     * @tc.desc Verify shrinkTo supports large one-step reductions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(100000);
      arr.shrinkTo(10);
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3600
     * @tc.name testArrayShrinkTo036
     * @tc.desc Verify repeated small shrinkTo calls can reach the same final boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(100);
      for (let i: int = 100; i > 10; i--) {
        arr.shrinkTo(i - 1);
      }
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3700
     * @tc.name testArrayShrinkTo037
     * @tc.desc Verify all accessible positions remain valid after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
      try {
        arr[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3800
     * @tc.name testArrayShrinkTo038
     * @tc.desc Verify shrinkTo preserves iteration over the retained prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      let sum = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_3900
     * @tc.name testArrayShrinkTo039
     * @tc.desc Verify lookup operations reflect the retained prefix after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.indexOf(3)).assertEqual(2);
      expect(arr.indexOf(4)).assertEqual(-1);
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(5)).assertFalse();
      expect(arr.find((v: number): boolean => v > 1)).assertEqual(2);
      expect(arr.find((v: number): boolean => v > 3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4000
     * @tc.name testArrayShrinkTo040
     * @tc.desc Verify shrinkTo returns void and therefore cannot be chained directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      arr.pushOne(6);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(6);
      expect(arr.toString()).assertEqual('1,2,3,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4100
     * @tc.name testArrayShrinkTo041
     * @tc.desc Verify shrinkTo and splice can produce the same truncated length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4, 5);
      arr1.shrinkTo(3);
      expect(arr1.length).assertEqual(3);

      const arr2 = new Array<number>(1, 2, 3, 4, 5);
      arr2.splice(3, 2);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4200
     * @tc.name testArrayShrinkTo042
     * @tc.desc Verify shrinkTo and the length setter keep the same retained prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4, 5);
      arr1.shrinkTo(3);
      expect(arr1.length).assertEqual(3);

      const arr2 = new Array<number>(1, 2, 3, 4, 5);
      arr2.length = 3;
      expect(arr2.length).assertEqual(3);

      for (let i: int = 0; i < 3; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4300
     * @tc.name testArrayShrinkTo043
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('2,3');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4400
     * @tc.name testArrayShrinkTo044
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 3, 4, 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('3,4');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4500
     * @tc.name testArrayShrinkTo045
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 4, 5, 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('4,5');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4600
     * @tc.name testArrayShrinkTo046
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 5, 6, 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('5,6');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4700
     * @tc.name testArrayShrinkTo047
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 6, 7, 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(6, 7, 8);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('6,7');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4800
     * @tc.name testArrayShrinkTo048
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 7, 8, 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('7,8');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_4900
     * @tc.name testArrayShrinkTo049
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 8, 9, 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 9, 10);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('8,9');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5000
     * @tc.name testArrayShrinkTo050
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 9, 10, 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 10, 11);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('9,10');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5100
     * @tc.name testArrayShrinkTo051
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 10, 11, 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 11, 12);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('10,11');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5200
     * @tc.name testArrayShrinkTo052
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 11, 12, 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(11, 12, 13);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('11,12');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5300
     * @tc.name testArrayShrinkTo053
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 12, 13, 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(12, 13, 14);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('12,13');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5400
     * @tc.name testArrayShrinkTo054
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 13, 14, 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(13, 14, 15);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('13,14');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5500
     * @tc.name testArrayShrinkTo055
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 14, 15, 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(14, 15, 16);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('14,15');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5600
     * @tc.name testArrayShrinkTo056
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 15, 16, 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(15, 16, 17);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('15,16');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5700
     * @tc.name testArrayShrinkTo057
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 16, 17, 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(16, 17, 18);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('16,17');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5800
     * @tc.name testArrayShrinkTo058
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 17, 18, 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(17, 18, 19);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('17,18');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_5900
     * @tc.name testArrayShrinkTo059
     * @tc.desc Verify shrinkTo can keep the leading pair from numeric triple 18, 19, 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(18, 19, 20);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('18,19');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6000
     * @tc.name testArrayShrinkTo060
     * @tc.desc Verify shrinkTo keeps the leading pair from numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6100
     * @tc.name testArrayShrinkTo061
     * @tc.desc Verify shrinkTo keeps only the requested two-element prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6200
     * @tc.name testArrayShrinkTo062
     * @tc.desc Verify shrinkTo can clear an array completely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shrinkTo(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6300
     * @tc.name testArrayShrinkTo063
     * @tc.desc Verify shrinkTo leaves an array unchanged when target equals current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.toString();
      arr.shrinkTo(3);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6400
     * @tc.name testArrayShrinkTo064
     * @tc.desc Verify shrinkTo does not expand an array when target exceeds current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shrinkTo(10);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6500
     * @tc.name testArrayShrinkTo065
     * @tc.desc Verify shrinkTo supports string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6600
     * @tc.name testArrayShrinkTo066
     * @tc.desc Verify shrinkTo supports boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6700
     * @tc.name testArrayShrinkTo067
     * @tc.desc Verify shrinkTo supports bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6800
     * @tc.name testArrayShrinkTo068
     * @tc.desc Verify shrinkTo preserves the first object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ShrinkRefCase028();
      const arr = new Array<ShrinkRefCase028>(first, new ShrinkRefCase028(), new ShrinkRefCase028());
      arr.shrinkTo(1);
      expect(arr[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_6900
     * @tc.name testArrayShrinkTo069
     * @tc.desc Verify failed negative shrinkTo keeps the original array intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.shrinkTo(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7000
     * @tc.name testArrayShrinkTo070
     * @tc.desc Verify shrinkTo can be followed by pushOne rebuilding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shrinkTo(1);
      arr.pushOne(9);
      expect(arr.toString()).assertEqual('1,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7100
     * @tc.name testArrayShrinkTo071
     * @tc.desc Verify shrinkTo can be followed by push rebuilding from empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shrinkTo(0);
      arr.push(7, 8);
      expect(arr.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7200
     * @tc.name testArrayShrinkTo072
     * @tc.desc Verify shrinkTo can be followed by unshift on the remaining prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      arr.unshift(0);
      expect(arr.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7300
     * @tc.name testArrayShrinkTo073
     * @tc.desc Verify shrinkTo can be followed by pop on the remaining prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      expect(arr.pop()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7400
     * @tc.name testArrayShrinkTo074
     * @tc.desc Verify shrinkTo can be followed by shift on the remaining prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7500
     * @tc.name testArrayShrinkTo075
     * @tc.desc Verify shrinkTo can be followed by reverse on the remaining prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7600
     * @tc.name testArrayShrinkTo076
     * @tc.desc Verify shrinkTo can be followed by sort on the remaining prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2, 9);
      arr.shrinkTo(3);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7700
     * @tc.name testArrayShrinkTo077
     * @tc.desc Verify shrinkTo works after splice changes the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.splice(1, 1, 8, 9);
      arr.shrinkTo(3);
      expect(arr.toString()).assertEqual('1,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7800
     * @tc.name testArrayShrinkTo078
     * @tc.desc Verify shrinkTo works after reverse changes order first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_7900
     * @tc.name testArrayShrinkTo079
     * @tc.desc Verify shrinkTo works after sort changes order first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 1, 3, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8000
     * @tc.name testArrayShrinkTo080
     * @tc.desc Verify shrinkTo works on arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(5, 6, 7, 8);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8100
     * @tc.name testArrayShrinkTo081
     * @tc.desc Verify shrinkTo works on arrays created by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6, 8));
      arr.shrinkTo(3);
      expect(arr.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8200
     * @tc.name testArrayShrinkTo082
     * @tc.desc Verify shrinkTo preserves duplicate values in the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2, 3);
      arr.shrinkTo(3);
      expect(arr.toString()).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8300
     * @tc.name testArrayShrinkTo083
     * @tc.desc Verify shrinkTo preserves negative and zero values in the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3, 6);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('-3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8400
     * @tc.name testArrayShrinkTo084
     * @tc.desc Verify shrinkTo works on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 15; i++) {
        arr.pushOne(i);
      }
      arr.shrinkTo(5);
      expect(arr.toString()).assertEqual('0,1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8500
     * @tc.name testArrayShrinkTo085
     * @tc.desc Verify shrinkTo leaves the array identity unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const same = arr;
      arr.shrinkTo(2);
      expect(arr === same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8600
     * @tc.name testArrayShrinkTo086
     * @tc.desc Verify shrinkTo leaves a valid Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shrinkTo(2);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8700
     * @tc.name testArrayShrinkTo087
     * @tc.desc Verify shrinkTo works after length has already been truncated once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 3;
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8800
     * @tc.name testArrayShrinkTo088
     * @tc.desc Verify shrinkTo can keep a single negative element prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-5, 1, 2);
      arr.shrinkTo(1);
      expect(arr.toString()).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_8900
     * @tc.name testArrayShrinkTo089
     * @tc.desc Verify shrinkTo can keep a single string prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      arr.shrinkTo(1);
      expect(arr.toString()).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9000
     * @tc.name testArrayShrinkTo090
     * @tc.desc Verify shrinkTo can keep a two-element prefix after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9100
     * @tc.name testArrayShrinkTo091
     * @tc.desc Verify shrinkTo can keep a prefix after with returns a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9200
     * @tc.name testArrayShrinkTo092
     * @tc.desc Verify shrinkTo can keep a prefix after toSpliced returns a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toSpliced(1, 1, 9);
      arr.shrinkTo(3);
      expect(arr.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9300
     * @tc.name testArrayShrinkTo093
     * @tc.desc Verify shrinkTo can keep a prefix after toReversed returns a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toReversed();
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9400
     * @tc.name testArrayShrinkTo094
     * @tc.desc Verify shrinkTo can keep a prefix after toSorted returns a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 1, 3, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      arr.shrinkTo(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9500
     * @tc.name testArrayShrinkTo095
     * @tc.desc Verify shrinkTo can be followed by slice for the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      expect(arr.slice(1).toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9600
     * @tc.name testArrayShrinkTo096
     * @tc.desc Verify shrinkTo can be followed by map for the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      expect(arr.map((value: number): number => value * 2).toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9700
     * @tc.name testArrayShrinkTo097
     * @tc.desc Verify shrinkTo can be followed by reduce for the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      expect(arr.reduce((acc: number, cur: number): number => acc + cur, 0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHRINKTO_9800
     * @tc.name testArrayShrinkTo098
     * @tc.desc Verify shrinkTo keeps the first element accessible by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShrinkTo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 9, 10);
      arr.shrinkTo(2);
      expect(arr[0]).assertEqual(8);
    });

  });
}

