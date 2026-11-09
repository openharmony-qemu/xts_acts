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
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';

import Utils from './../Util.test';

export default function Int16ArrayToReversedTest(): void {
  describe('Int16ArrayToReversedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0100
     * @tc.name testToReversedGeneral001
     * @tc.desc Verify toReversed reverses normal Int16Array element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(0);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(42);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-1);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(0);
        let expectedValue2: int = 30;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array([5, 15, 25]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: boolean = result === arr;
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.byteOffset;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 20;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-100, 200]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 200;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0200
     * @tc.name testToReversedGeneral002
     * @tc.desc Verify toReversed reverses normal Int16Array element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedGeneral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([32767]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.byteLength;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([50, 40, 30, 20, 10]);
        let _result: Int16Array = arr.toReversed();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 50;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let result: Int16Array = arr.toReversed();
        result.fill(0);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(0);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: number = arr.length;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.byteOffset;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.byteOffset;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(3);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(7, 7, 7, 7, 7);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(4);
        let expectedValue2: int = 7;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(-3, -3, -3, -3);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(3);
        let expectedValue2: int = -3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0300
     * @tc.name testToReversedGeneral003
     * @tc.desc Verify toReversed reverses normal Int16Array element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedGeneral003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(-1, 2, 3, 4);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(3);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(0, 5, 10);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, Double.NEGATIVE_INFINITY, 3);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(1);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(Double.NaN, 32768, -32769, Double.POSITIVE_INFINITY);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(3);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 20;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(1);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(2);
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(1);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = result.$_get(3);
        let expectedValue4: int = 1;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 55;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = 33;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(4);
        let expectedValue3: int = 11;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9, 11);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = 7;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(5);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 70;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(3);
        let expectedValue2: int = 40;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(6);
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0400
     * @tc.name testToReversedGeneral004
     * @tc.desc Verify toReversed reverses normal Int16Array element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedGeneral004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 9;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(9);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let source: int[] = [];
        for (let i = 0; i < 50; i++) {
          source.push(i);
        }
        let arr: Int16Array = Int16Array.of(...source);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 49;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(49);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, -2, 3, -4, 5, -6);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -6;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(1);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(5);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(-30, -20, -10, 0, 10, 20);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 20;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(5);
        let expectedValue2: int = -30;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 50, 0, -50, -100);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(4);
        let expectedValue2: int = 100;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(8, 16, 24, 32);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 8;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 16;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 24;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: int = 32;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(1);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(0, 100, 0, 200);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 200;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(2);
        let expectedValue3: int = 100;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = result.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0500
     * @tc.name testToReversedView001
     * @tc.desc Verify toReversed on ArrayBuffer views and subarrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf, 0, 3);
        arr.$_set(0, 5);
        arr.$_set(1, 15);
        arr.$_set(2, 25);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 25;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        arr.$_set(0, 11);
        arr.$_set(1, 22);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 22;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(2);
        let arr: Int16Array = new Int16Array(buf, 0, 1);
        arr.$_set(0, 99);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf, 0, 3);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        let result: Int16Array = arr.toReversed();
        arr.$_set(0, 999);
        let resultValue1: number = result.$_get(2 as int);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf, 0, 2);
        arr.$_set(0, 33);
        arr.$_set(1, 66);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(1 as int);
        let expectedValue1: int = 33;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 11);
        arr.$_set(1, 22);
        arr.$_set(2, 33);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 33;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        let sub: Int16Array = arr.subarray(0, 3);
        let result: Int16Array = sub.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: number = sub.length;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view: Int16Array = new Int16Array(buf, 2, 3);
        let result: Int16Array = view.toReversed();
        let resultValue1: int = result.byteOffset;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0600
     * @tc.name testToReversedImmunity001
     * @tc.desc Verify toReversed result is independent from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedImmunity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.toReversed();
        result.$_set(0, 999);
        let resultValue1: number = arr.$_get(2 as int);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([11, 22, 33]);
        let _result: Int16Array = arr.toReversed();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-1, -2, -3]);
        let _result: Int16Array = arr.toReversed();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: Int16Array = arr.toReversed();
        result.$_set(0, 999);
        let resultValue1: number = arr.$_get(2);
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([7, 14, 21]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: boolean = result.buffer === arr.buffer;
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([3, 6, 9]);
        let result: Int16Array = arr.toReversed();
        result.$_set(0, 100);
        result.$_set(1, 200);
        result.$_set(2, 300);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let result: Int16Array = arr.toReversed();
        let resultValue1: boolean = result === arr;
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let result: Int16Array = arr.toReversed();
        let resultValue1: boolean = result.buffer === arr.buffer;
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = Int16Array.of(77);
        let result: Int16Array = arr.toReversed();
        arr.$_set(0, 88);
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 77;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(9, 9, 9, 9);
        let result: Int16Array = arr.toReversed();
        arr.$_set(0, 1);
        let resultValue1: number = result.$_get(3);
        let expectedValue1: int = 9;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0700
     * @tc.name testToReversedImmunity002
     * @tc.desc Verify toReversed result is independent from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedImmunity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let result: Int16Array = arr.toReversed();
        arr.$_set(0, 0);
        arr.$_set(1, 0);
        arr.$_set(2, 0);
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 33;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = 11;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(44, 55, 66);
        let result: Int16Array = arr.toReversed();
        result.$_set(0, 1);
        result.$_set(1, 1);
        result.$_set(2, 1);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 44;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(2);
        let expectedValue2: int = 66;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let r1: Int16Array = arr.toReversed();
        let r2: Int16Array = arr.toReversed();
        let resultValue1: number = r1.$_get(0);
        let expectedValue1: number = r2.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = r1.$_get(2);
        let expectedValue2: number = r2.$_get(2);
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view: Int16Array = new Int16Array(buf);
        view.$_set(0, 100);
        view.$_set(1, 200);
        view.$_set(2, 300);
        let result: Int16Array = view.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 300;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: boolean = result.buffer === buf;
        expect(resultValue2).assertFalse();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view: Int16Array = new Int16Array(buf);
        view.$_set(0, 50);
        view.$_set(1, 60);
        let result: Int16Array = view.toReversed();
        let view2: Int16Array = new Int16Array(buf);
        view2.$_set(0, 999);
        let resultValue1: number = result.$_get(1);
        let expectedValue1: int = 50;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let sub: Int16Array = arr.subarray(1, 4);
        let result: Int16Array = sub.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(0);
        let expectedValue2: int = 40;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Int16Array = new Int16Array(buf);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let result: Int16Array = arr.toReversed();
        let newView: Int16Array = new Int16Array(result.buffer);
        let resultValue1: number = newView.$_get(0);
        let expectedValue1: int = 15;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0800
     * @tc.name testToReversedChain001
     * @tc.desc Verify repeated toReversed calls restore or keep reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedChain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let result: Int16Array = arr.toReversed().toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.toReversed().toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-999);
        let result: Int16Array = arr.toReversed().toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -999;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        arr.$_set(0, 50);
        arr.$_set(1, 60);
        let result: Int16Array = arr.toReversed().toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 50;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let resultValue1: number = arr.toReversed().toReversed().$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let triple: Int16Array = arr.toReversed().toReversed().toReversed();
        let single: Int16Array = arr.toReversed();
        let resultValue1: number = triple.$_get(0);
        let expectedValue1: number = single.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let result: Int16Array = arr.toReversed().toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(4);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7);
        let result: Int16Array = arr.toReversed().toReversed();
        for (let i = 0; i < arr.length; i++) {
          let resultValue1: number = result.$_get(i);
          let expectedValue1: number = arr.$_get(i);
          expect(resultValue1).assertEqual(expectedValue1);
        }

      }
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let once: Int16Array = arr.toReversed();
        let thrice: Int16Array = arr.toReversed().toReversed().toReversed();
        let resultValue1: number = thrice.$_get(0);
        let expectedValue1: number = once.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = thrice.$_get(3);
        let expectedValue2: number = once.$_get(3);
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let result: Int16Array = arr.toReversed().toReversed().toReversed().toReversed();
        for (let i = 0; i < arr.length; i++) {
          let resultValue1: number = result.$_get(i);
          let expectedValue1: number = arr.$_get(i);
          expect(resultValue1).assertEqual(expectedValue1);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_0900
     * @tc.name testToReversedEmpty001
     * @tc.desc Verify toReversed on empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.toReversed();
        let resultValue1: Number | undefined = result.at(0 as int);
        expect(resultValue1).assertUndefined();

      }
      {
        let emptySource: int[] = [];
        let arr: Int16Array = Int16Array.from(emptySource);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.toReversed();
        let resultValue1: int = result.byteLength;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_1000
     * @tc.name testToReversedBoundary001
     * @tc.desc Verify toReversed with Int16 boundary and wrapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(-32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 1);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 0, -32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(32767, 0, 1);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 0, 32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(32767, 0, -32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, -32769);
        arr.$_set(1, 0);
        arr.$_set(2, 1);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 32768);
        arr.$_set(1, 0);
        arr.$_set(2, 1);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_1100
     * @tc.name testToReversedBoundary002
     * @tc.desc Verify toReversed with Int16 boundary and wrapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(32767, 0, 0, -32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, -1, 0, 1, 32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 32767, -32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, -32768, 32767, -32768, -32768]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(2 as int);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 10);
        arr.$_set(1, 32768);
        arr.$_set(2, 30);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(1 as int);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 32767]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 32767]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(1);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, 0, -32768]);
        let _result: Int16Array = arr.toReversed();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, 0, -32768]);
        let _result: Int16Array = arr.toReversed();
        let resultValue1: number = arr.$_get(2);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOREVERSED_1200
     * @tc.name testToReversedBoundary003
     * @tc.desc Verify toReversed with Int16 boundary and wrapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToReversedBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(-32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, -32768, -32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300, -32768);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(50, 60, 70, 32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
        let result: Int16Array = arr.toReversed();
        let resultValue1: number = result.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(2);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

  });
}
