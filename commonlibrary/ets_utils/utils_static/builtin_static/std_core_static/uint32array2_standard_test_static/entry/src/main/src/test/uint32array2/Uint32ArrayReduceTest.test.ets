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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError";
  }
}

export default function uint32ArrayReduceOneTest(): void {
  describe('Uint32ArrayReduceOneTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0100
     * @tc.name testUint32ArrayReduceOne001
     * @tc.desc Verify arity-0 callback returning constant returns that constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduce<number>((): number => 100, 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0200
     * @tc.name testUint32ArrayReduceOne002
     * @tc.desc Verify arity-1 callback receives previousValue equal to initialValue and returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 10, 15);
      const r = arr.reduce<number>((prev: number): number => prev, 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0300
     * @tc.name testUint32ArrayReduceOne003
     * @tc.desc Verify arity-2 previousValue + currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduce<number>((prev: number, cur: number): number => prev - cur, 0);
      expect(r).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0400
     * @tc.name testUint32ArrayReduceOne004
     * @tc.desc Verify arity-3 callback receives currentIndex and computes weighted sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduce<number>((prev: number, cur: number, index: int): number => prev + cur * index, 0);
      expect(r).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0500
     * @tc.name testUint32ArrayReduceOne005
     * @tc.desc Verify arity-4 callback receives array parameter equal to the receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + array.$_get(index),
        0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0600
     * @tc.name testUint32ArrayReduceOne006
     * @tc.desc Verify reduce() with initialValue 0 sums only elements greater than 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur > 15) {
          return prev + cur;
        }
        return prev;
      }, 0);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0700
     * @tc.name testUint32ArrayReduceOne007
     * @tc.desc Verify reduce() callback receives previousValue from previous iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let secondPrev: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (index === 1) {
          secondPrev = prev;
        }
        return prev + cur;
      }, 0);
      expect(secondPrev).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0800
     * @tc.name testUint32ArrayReduceOne008
     * @tc.desc Verify previousValue number U=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        10);
      expect(r).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_0900
     * @tc.name testUint32ArrayReduceOne009
     * @tc.desc Verify previousValue string U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduce<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur,
        "S");
      expect(r).assertEqual("S123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1000
     * @tc.name testUint32ArrayReduceOne010
     * @tc.desc Verify reduce() callback receives previousValue from previous iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let thirdPrev: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (index === 2) {
          thirdPrev = prev;
        }
        return prev + cur;
      }, 0);
      expect(thirdPrev).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1100
     * @tc.name testUint32ArrayReduceOne011
     * @tc.desc Verify previousValue init=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev - cur,
        0);
      expect(r).assertEqual(-300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1200
     * @tc.name testUint32ArrayReduceOne012
     * @tc.desc Verify callback returning currentValue makes reduce yield last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => cur, 0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1300
     * @tc.name testUint32ArrayReduceOne013
     * @tc.desc Verify previousValue init=uint32 MAX uint32 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        4294967295);
      expect(r).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1400
     * @tc.name testUint32ArrayReduceOne014
     * @tc.desc Verify currentValue arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33);
      let firstCur: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (index === 0) {
          firstCur = cur;
        }
        return prev + cur;
      }, 0);
      expect(firstCur).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1500
     * @tc.name testUint32ArrayReduceOne015
     * @tc.desc Verify currentValue arr[length-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33);
      let lastCur: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (index === array.length - 1) {
          lastCur = cur;
        }
        return prev + cur;
      }, 0);
      expect(lastCur).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1600
     * @tc.name testUint32ArrayReduceOne016
     * @tc.desc Verify currentValue = 0 uint32 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1700
     * @tc.name testUint32ArrayReduceOne017
     * @tc.desc Verify currentValue = 4294967295 uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      let captured: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured = cur;
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1800
     * @tc.name testUint32ArrayReduceOne018
     * @tc.desc Verify currentValue = 2147483647 int32 MAX uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      let captured: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured = cur;
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_1900
     * @tc.name testUint32ArrayReduceOne019
     * @tc.desc Verify currentValue = 2147483648 int32 MAX+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648);
      let captured: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured = cur;
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2000
     * @tc.name testUint32ArrayReduceOne020
     * @tc.desc Verify NaN currentValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.NaN);
      let captured: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured = cur;
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2100
     * @tc.name testUint32ArrayReduceOne021
     * @tc.desc Verify reduce() currentValue is int-truncated to 3 for source 3.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3.99);
      let captured: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured = cur;
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2200
     * @tc.name testUint32ArrayReduceOne022
     * @tc.desc Verify reduce all equal values with initialValue returns constant sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 7, 7, 7);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2300
     * @tc.name testUint32ArrayReduceOne023
     * @tc.desc Verify currentIndex 0 1 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev * 10 + index,
        0);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2400
     * @tc.name testUint32ArrayReduceOne024
     * @tc.desc Verify currentIndex === length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let lastIdx: int = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        lastIdx = index;
        return prev + cur;
      }, 0);
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2500
     * @tc.name testUint32ArrayReduceOne025
     * @tc.desc Verify reduce() first callback receives currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let minIdx: int = 999;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (index < minIdx) {
          minIdx = index;
        }
        return prev + cur;
      }, 0);
      expect(minIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2600
     * @tc.name testUint32ArrayReduceOne026
     * @tc.desc Verify + initialValue index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let called: boolean = false;
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        called = true;
        return prev + cur;
      }, 5);
      expect(called).assertFalse();
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2700
     * @tc.name testUint32ArrayReduceOne027
     * @tc.desc Verify array === Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let sameRef: boolean = false;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        sameRef = array === arr;
        return prev + cur;
      }, 0);
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2800
     * @tc.name testUint32ArrayReduceOne028
     * @tc.desc Verify reduce() callback receives array parameter with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6, 7);
      let capturedLen: int = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        capturedLen = array.length;
        return prev + cur;
      }, 0);
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_2900
     * @tc.name testUint32ArrayReduceOne029
     * @tc.desc Verify array.$_get(currentIndex) === currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33);
      let consistent: boolean = true;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (array.$_get(index) !== cur) {
          consistent = false;
        }
        return prev + cur;
      }, 0);
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3000
     * @tc.name testUint32ArrayReduceOne030
     * @tc.desc Verify array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let capturedByteLen: int = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        capturedByteLen = array.byteLength;
        return prev + cur;
      }, 0);
      expect(capturedByteLen).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3100
     * @tc.name testUint32ArrayReduceOne031
     * @tc.desc Verify reduce() callback receives the invoking Uint32Array as fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.$_set(0, 99);
      let captured: number = -1;
      arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (index === 0) {
          captured = array.$_get(0);
        }
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3200
     * @tc.name testUint32ArrayReduceOne032
     * @tc.desc Verify U=number initialValue=4294967295 uint32 MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        4294967295);
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3300
     * @tc.name testUint32ArrayReduceOne033
     * @tc.desc Verify U=number initialValue=-1 init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3400
     * @tc.name testUint32ArrayReduceOne034
     * @tc.desc Verify U=number initialValue=4294967296 U=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        4294967296);
      expect(r).assertEqual(4294967297);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3500
     * @tc.name testUint32ArrayReduceOne035
     * @tc.desc Verify U=number initialValue=3.14 init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        3.14);
      expect(Math.abs(r - 4.14) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3600
     * @tc.name testUint32ArrayReduceOne036
     * @tc.desc Verify U=number initialValue=NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3700
     * @tc.name testUint32ArrayReduceOne037
     * @tc.desc Verify U=number initialValue=9007199254740991 MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        9007199254740991);
      expect(r).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3800
     * @tc.name testUint32ArrayReduceOne038
     * @tc.desc Verify U=number initialValue=-9007199254740991 MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        -9007199254740991);
      expect(r).assertEqual(-9007199254740990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_3900
     * @tc.name testUint32ArrayReduceOne039
     * @tc.desc Verify U=number initialValue=0.5 init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0.5);
      expect(r).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4000
     * @tc.name testUint32ArrayReduceOne040
     * @tc.desc Verify U=number initialValue=2147483648 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        2147483648);
      expect(r).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4100
     * @tc.name testUint32ArrayReduceOne041
     * @tc.desc Verify U=string initialValue=' ' emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const r = arr.reduce<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur,
        "😀");
      expect(r).assertEqual("😀12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4200
     * @tc.name testUint32ArrayReduceOne042
     * @tc.desc Verify U=string initialValue='|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduce<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur + "|",
        "|");
      expect(r).assertEqual("|1|2|3|");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4300
     * @tc.name testUint32ArrayReduceOne043
     * @tc.desc Verify reduce<string> + initialValue init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let called: boolean = false;
      const r = arr.reduce<string>((prev: string, cur: number, index: int, array: Uint32Array): string => {
        called = true;
        return prev + cur;
      }, "empty");
      expect(called).assertFalse();
      expect(r).assertEqual("empty");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4400
     * @tc.name testUint32ArrayReduceOne044
     * @tc.desc Verify reduce<number> + initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      let count: int = 0;
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        count = count + 1;
        return prev + cur;
      }, 10);
      expect(count).assertEqual(1);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4500
     * @tc.name testUint32ArrayReduceOne045
     * @tc.desc Verify reduce returns sum with initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4600
     * @tc.name testUint32ArrayReduceOne046
     * @tc.desc Verify reduce() propagates Error thrown from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      try {
        arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          throw new Error("boom");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4700
     * @tc.name testUint32ArrayReduceOne047
     * @tc.desc Verify RangeError name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      try {
        arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          throw new RangeError("range");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4800
     * @tc.name testUint32ArrayReduceOne048
     * @tc.desc Verify reduce stops iteration when callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count: int = 0;
      try {
        arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          count = count + 1;
          if (index === 1) {
            throw new Error("second");
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_4900
     * @tc.name testUint32ArrayReduceOne049
     * @tc.desc Verify reduce() propagates Error thrown from callback with name preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      try {
        arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          throw new CustomError("custom");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("CustomError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5000
     * @tc.name testUint32ArrayReduceOne050
     * @tc.desc Verify -1 reduce init=10 = 10 + 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        10);
      expect(r).assertEqual(4294967305);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5100
     * @tc.name testUint32ArrayReduceOne051
     * @tc.desc Verify 4294967296 reduce init=5 = 5 + 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967296);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        5);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5200
     * @tc.name testUint32ArrayReduceOne052
     * @tc.desc Verify NaN 1 reduce = 0 + 1 = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.NaN, 1);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5300
     * @tc.name testUint32ArrayReduceOne053
     * @tc.desc Verify Infinity reduce init=100 = 100 + 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.POSITIVE_INFINITY);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        100);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5400
     * @tc.name testUint32ArrayReduceOne054
     * @tc.desc Verify uint32 MAX uint32 number 8589934590
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(8589934590);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5500
     * @tc.name testUint32ArrayReduceOne055
     * @tc.desc Verify -2147483648 reduce init=0 = 0 + 2147483648 int32 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-2147483648);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5600
     * @tc.name testUint32ArrayReduceOne056
     * @tc.desc Verify uint32 number 1*2*3=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 3);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev * cur,
        1);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5700
     * @tc.name testUint32ArrayReduceOne057
     * @tc.desc Verify reduce with previous sum as initialValue accumulates twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const s1 = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      const s2 = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        s1);
      expect(s2).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5800
     * @tc.name testUint32ArrayReduceOne058
     * @tc.desc Verify reduce subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const sub = arr.subarray(1, 3);
      const r = sub.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_5900
     * @tc.name testUint32ArrayReduceOne059
     * @tc.desc Verify reduce() over fill(5) array produces expected accumulated sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.fill(5, 0, 3);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6000
     * @tc.name testUint32ArrayReduceOne060
     * @tc.desc Verify reverse reduce prev*10+cur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.reverse();
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev * 10 + cur,
        0);
      expect(r).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6100
     * @tc.name testUint32ArrayReduceOne061
     * @tc.desc Verify sort reduce prev*10+cur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 1, 2);
      arr.sort();
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev * 10 + cur,
        0);
      expect(r).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6200
     * @tc.name testUint32ArrayReduceOne062
     * @tc.desc Verify reduce() chained after map() sees mapped values as currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur * cur,
        0);
      expect(r).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6300
     * @tc.name testUint32ArrayReduceOne063
     * @tc.desc Verify reduce() with initialValue accumulates elements left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 1, 4, 1, 5);
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur > prev) {
          return cur;
        }
        return prev;
      }, 0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6400
     * @tc.name testUint32ArrayReduceOne064
     * @tc.desc Verify reduce init=uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 1, 4, 1, 5);
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur < prev) {
          return cur;
        }
        return prev;
      }, 4294967295);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6500
     * @tc.name testUint32ArrayReduceOne065
     * @tc.desc Verify reduce() with initialValue 0 counts elements greater than 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 1, 4, 1, 5);
      const r = arr.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur > 2) {
          return prev + 1;
        }
        return prev;
      }, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6600
     * @tc.name testUint32ArrayReduceOne066
     * @tc.desc Verify reduce() callback returning division computes ratio accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const sum = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      const avg = sum / arr.length;
      expect(avg).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6700
     * @tc.name testUint32ArrayReduceOne067
     * @tc.desc Verify reduce Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const result = new Uint32Array(1);
      const s = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      result.$_set(0, s);
      expect(result.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6800
     * @tc.name testUint32ArrayReduceOne068
     * @tc.desc Verify subarray buffer reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const sub = arr.subarray(0, 2);
      arr.$_set(0, 99);
      const r = sub.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_6900
     * @tc.name testUint32ArrayReduceOne069
     * @tc.desc Verify reduce() over slice() view produces same result as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const sl = arr.slice(0, 2);
      arr.$_set(0, 99);
      const r = sl.reduce<number>((prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_7000
     * @tc.name testUint32ArrayReduceOne070
     * @tc.desc Verify reduce() reflects value written via $_set before invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.$_set(1, 99);
      const r = arr.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCE_7100
     * @tc.name testUint32ArrayReduceOne071
     * @tc.desc Verify reduce() over array containing 65535 produces correct sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      big.fill(1, 0, 65535);
      const r = big.reduce<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(65535);
    });

  });
}
