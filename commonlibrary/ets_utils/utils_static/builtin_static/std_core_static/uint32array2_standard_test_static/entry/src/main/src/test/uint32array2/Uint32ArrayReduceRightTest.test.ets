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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError";
  }
}

export default function uint32ArrayReduceRightOneTest(): void {
  describe('Uint32ArrayReduceRightOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0100
     * @tc.name testUint32ArrayReduceRightOne001
     * @tc.desc Verify 1 callbackfn + initialValue U=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0200
     * @tc.name testUint32ArrayReduceRightOne002
     * @tc.desc Verify arity-0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduceRight<number>((): number => 100, 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0300
     * @tc.name testUint32ArrayReduceRightOne003
     * @tc.desc Verify arity-1 previousValue prev initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 10, 15);
      const r = arr.reduceRight<number>((prev: number): number => prev, 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0400
     * @tc.name testUint32ArrayReduceRightOne004
     * @tc.desc Verify arity-2 previousValue + currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<number>((prev: number, cur: number): number => prev - cur, 0);
      expect(r).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0500
     * @tc.name testUint32ArrayReduceRightOne005
     * @tc.desc Verify arity-3 + currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduceRight<number>((prev: number, cur: number, index: int): number => prev + cur * index, 0);
      expect(r).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0600
     * @tc.name testUint32ArrayReduceRightOne006
     * @tc.desc Verify arity-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + array.$_get(index),
        0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0700
     * @tc.name testUint32ArrayReduceRightOne007
     * @tc.desc Verify const callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const cb = (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur;
      const r = arr.reduceRight<number>(cb, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0800
     * @tc.name testUint32ArrayReduceRightOne008
     * @tc.desc Verify 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur > 15) {
          return prev + cur;
        }
        return prev;
      }, 0);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_0900
     * @tc.name testUint32ArrayReduceRightOne009
     * @tc.desc Verify previousValue initialValue U=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      let captured: number = -1;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured = prev;
        return prev + cur;
      }, 42);
      expect(captured).assertEqual(242);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1000
     * @tc.name testUint32ArrayReduceRightOne010
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const seq: number[] = [];
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        seq.push(prev);
        return prev + cur;
      }, 0);
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(3);
      expect(seq[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1100
     * @tc.name testUint32ArrayReduceRightOne011
     * @tc.desc Verify U=string previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur,
        "");
      expect(r).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1200
     * @tc.name testUint32ArrayReduceRightOne012
     * @tc.desc Verify U=int prev+1 cur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.reduceRight<int>((prev: int, cur: number, index: int, array: Uint32Array): int => prev + 1, 0);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1300
     * @tc.name testUint32ArrayReduceRightOne013
     * @tc.desc Verify U=double prev + 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<double>(
        (prev: double, cur: number, index: int, array: Uint32Array): double => prev + 0.5,
        0.0);
      expect(r).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1400
     * @tc.name testUint32ArrayReduceRightOne014
     * @tc.desc Verify U=boolean 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 5, 0);
      const r = arr.reduceRight<boolean>(
        (prev: boolean, cur: number, index: int, array: Uint32Array): boolean => prev || cur > 0,
        false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1500
     * @tc.name testUint32ArrayReduceRightOne015
     * @tc.desc Verify currentValue = uint32 MAX (4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1600
     * @tc.name testUint32ArrayReduceRightOne016
     * @tc.desc Verify currentValue = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        10);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1700
     * @tc.name testUint32ArrayReduceRightOne017
     * @tc.desc Verify currentValue = 0xFFFFFFFF 16 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFFFFFFFF);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        1);
      expect(r).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1800
     * @tc.name testUint32ArrayReduceRightOne018
     * @tc.desc Verify currentValue = 0x80000000 2147483648 int32 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x80000000);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_1900
     * @tc.name testUint32ArrayReduceRightOne019
     * @tc.desc Verify currentValue = 2147483647 int32 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2000
     * @tc.name testUint32ArrayReduceRightOne020
     * @tc.desc Verify currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33);
      const seq: number[] = [];
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        seq.push(cur);
        return prev + cur;
      }, 0);
      expect(seq[0]).assertEqual(33);
      expect(seq[1]).assertEqual(22);
      expect(seq[2]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2100
     * @tc.name testUint32ArrayReduceRightOne021
     * @tc.desc Verify currentIndex = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(99);
      let capturedIdx: int = -1;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        capturedIdx = index;
        return prev + cur;
      }, 0);
      expect(capturedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2200
     * @tc.name testUint32ArrayReduceRightOne022
     * @tc.desc Verify currentIndex [1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 9);
      const seq: int[] = [];
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        seq.push(index);
        return prev + cur;
      }, 0);
      expect(seq[0]).assertEqual(1);
      expect(seq[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2300
     * @tc.name testUint32ArrayReduceRightOne023
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6, 7);
      let capturedLen: int = -1;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        capturedLen = array.length;
        return prev + cur;
      }, 0);
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2400
     * @tc.name testUint32ArrayReduceRightOne024
     * @tc.desc Verify array.$_get(currentIndex) === currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33);
      let consistent: boolean = true;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (array.$_get(index) !== cur) {
          consistent = false;
        }
        return prev + cur;
      }, 0);
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2500
     * @tc.name testUint32ArrayReduceRightOne025
     * @tc.desc Verify array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let capturedByteLen: int = -1;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        capturedByteLen = array.byteLength;
        return prev + cur;
      }, 0);
      expect(capturedByteLen).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2600
     * @tc.name testUint32ArrayReduceRightOne026
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let allSame: boolean = true;
      let count: int = 0;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (array !== arr) {
          allSame = false;
        }
        count = count + 1;
        return prev + cur;
      }, 0);
      expect(allSame).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2700
     * @tc.name testUint32ArrayReduceRightOne027
     * @tc.desc Verify U=number, initialValue = uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        4294967295);
      expect(r).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2800
     * @tc.name testUint32ArrayReduceRightOne028
     * @tc.desc Verify U=number, initialValue = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        -1);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_2900
     * @tc.name testUint32ArrayReduceRightOne029
     * @tc.desc Verify U=string, initialValue = ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      const r = arr.reduceRight<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur,
        "");
      expect(r).assertEqual("87");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3000
     * @tc.name testUint32ArrayReduceRightOne030
     * @tc.desc Verify U=string, initialValue = "base:"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const r = arr.reduceRight<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur,
        "base:");
      expect(r).assertEqual("base:21");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3100
     * @tc.name testUint32ArrayReduceRightOne031
     * @tc.desc Verify U=double, initialValue = 0.0 0.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const r = arr.reduceRight<double>(
        (prev: double, cur: number, index: int, array: Uint32Array): double => prev + 0.25,
        0.0);
      expect(r).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3200
     * @tc.name testUint32ArrayReduceRightOne032
     * @tc.desc Verify U=boolean, initialValue = false 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      const r = arr.reduceRight<boolean>(
        (prev: boolean, cur: number, index: int, array: Uint32Array): boolean => prev || cur > 0,
        false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3300
     * @tc.name testUint32ArrayReduceRightOne033
     * @tc.desc Verify U=boolean, initialValue = true 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0);
      const r = arr.reduceRight<boolean>(
        (prev: boolean, cur: number, index: int, array: Uint32Array): boolean => prev && cur > 0,
        true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3400
     * @tc.name testUint32ArrayReduceRightOne034
     * @tc.desc Verify U=number, initialValue = 1e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        1e6);
      expect(r).assertEqual(1000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3500
     * @tc.name testUint32ArrayReduceRightOne035
     * @tc.desc Verify U=number, initialValue = 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev - cur,
        100);
      expect(r).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3600
     * @tc.name testUint32ArrayReduceRightOne036
     * @tc.desc Verify <number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev * cur,
        1);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3700
     * @tc.name testUint32ArrayReduceRightOne037
     * @tc.desc Verify <string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 5, 7);
      const r = arr.reduceRight<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + "|" + cur,
        "");
      expect(r).assertEqual("|7|5|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3800
     * @tc.name testUint32ArrayReduceRightOne038
     * @tc.desc Verify <int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0, 0, 0);
      const r = arr.reduceRight<int>((prev: int, cur: number, index: int, array: Uint32Array): int => prev + 1, 0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_3900
     * @tc.name testUint32ArrayReduceRightOne039
     * @tc.desc Verify U initialValue string cur.toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + cur.toString(),
        "sum:");
      expect(r).assertEqual("sum:321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4000
     * @tc.name testUint32ArrayReduceRightOne040
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 4, 6, 8);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        100);
      expect(r).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4100
     * @tc.name testUint32ArrayReduceRightOne041
     * @tc.desc Verify = callback(initialValue, element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        8);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4200
     * @tc.name testUint32ArrayReduceRightOne042
     * @tc.desc Verify = initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let called: boolean = false;
      const r = arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        called = true;
        return prev + cur;
      }, 99);
      expect(r).assertEqual(99);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4300
     * @tc.name testUint32ArrayReduceRightOne043
     * @tc.desc Verify reduceRight applies callback right-to-left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 7);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev - cur,
        0);
      expect(r).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4400
     * @tc.name testUint32ArrayReduceRightOne044
     * @tc.desc Verify f(f(f(init, c), b), a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => (prev + cur) * 2,
        1);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4500
     * @tc.name testUint32ArrayReduceRightOne045
     * @tc.desc Verify U=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000000, 2000000, 3000000);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(6000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4600
     * @tc.name testUint32ArrayReduceRightOne046
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        30);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4700
     * @tc.name testUint32ArrayReduceRightOne047
     * @tc.desc Verify reduceRight reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const first = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      const second = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + first,
        0);
      expect(second).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4800
     * @tc.name testUint32ArrayReduceRightOne048
     * @tc.desc Verify RangeError name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      try {
        arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          throw new RangeError("range");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_4900
     * @tc.name testUint32ArrayReduceRightOne049
     * @tc.desc Verify Error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      try {
        arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          throw new CustomError("custom");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("CustomError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5000
     * @tc.name testUint32ArrayReduceRightOne050
     * @tc.desc Verify reduceRight stops at first element when callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count: int = 0;
      try {
        arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          count = count + 1;
          throw new Error("first");
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5100
     * @tc.name testUint32ArrayReduceRightOne051
     * @tc.desc Verify index === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count: int = 0;
      try {
        arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          count = count + 1;
          if (index === 0) {
            throw new Error("last");
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5200
     * @tc.name testUint32ArrayReduceRightOne052
     * @tc.desc Verify index === 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let count: int = 0;
      try {
        arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
          count = count + 1;
          if (index === 2) {
            throw new Error("middle");
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5300
     * @tc.name testUint32ArrayReduceRightOne053
     * @tc.desc Verify uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(8589934590);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5400
     * @tc.name testUint32ArrayReduceRightOne054
     * @tc.desc Verify 0x100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, 0x100000000);
      arr.$_set(1, 5);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5500
     * @tc.name testUint32ArrayReduceRightOne055
     * @tc.desc Verify -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, 10);
      arr.$_set(1, -1);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(4294967305);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5600
     * @tc.name testUint32ArrayReduceRightOne056
     * @tc.desc Verify NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, 7);
      arr.$_set(1, Number.NaN);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5700
     * @tc.name testUint32ArrayReduceRightOne057
     * @tc.desc Verify Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, 3);
      arr.$_set(1, Number.POSITIVE_INFINITY);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5800
     * @tc.name testUint32ArrayReduceRightOne058
     * @tc.desc Verify 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, 3);
      arr.$_set(1, 3.14);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_5900
     * @tc.name testUint32ArrayReduceRightOne059
     * @tc.desc Verify subarray reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const sub = arr.subarray(1, 4);
      const r = sub.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6000
     * @tc.name testUint32ArrayReduceRightOne060
     * @tc.desc Verify subarray reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const sub = arr.subarray(0, 2);
      arr.$_set(0, 999);
      const r = sub.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(1019);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6100
     * @tc.name testUint32ArrayReduceRightOne061
     * @tc.desc Verify reduceRight subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const sub = arr.subarray(0, 3);
      arr.$_set(2, 100);
      const r = sub.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6200
     * @tc.name testUint32ArrayReduceRightOne062
     * @tc.desc Verify 100 1 reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, 1);
      }
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6300
     * @tc.name testUint32ArrayReduceRightOne063
     * @tc.desc Verify MAX reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295, 4294967295);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(12884901885);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6400
     * @tc.name testUint32ArrayReduceRightOne064
     * @tc.desc Verify 0 MAX reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295, 0);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6500
     * @tc.name testUint32ArrayReduceRightOne065
     * @tc.desc Verify reduceRight reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const other = Uint32Array.of(10, 20);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number =>
          prev + other.reduceRight<number>(
            (p: number, c: number, i: int, a: Uint32Array): number => p + c, 0),
        0);
      expect(r).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6600
     * @tc.name testUint32ArrayReduceRightOne066
     * @tc.desc Verify reduceRight reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const init = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      const arr2 = Uint32Array.of(10, 20);
      const r = arr2.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        init);
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6700
     * @tc.name testUint32ArrayReduceRightOne067
     * @tc.desc Verify reduceRight fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.fill(7, 0, 3);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        0);
      expect(r).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6800
     * @tc.name testUint32ArrayReduceRightOne068
     * @tc.desc Verify reduceRight reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.reverse();
      const seq: number[] = [];
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        seq.push(cur);
        return prev + cur;
      }, 0);
      expect(seq[0]).assertEqual(1);
      expect(seq[1]).assertEqual(2);
      expect(seq[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_6900
     * @tc.name testUint32ArrayReduceRightOne069
     * @tc.desc Verify multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let multiplier: number = 10;
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur * multiplier,
        0);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7000
     * @tc.name testUint32ArrayReduceRightOne070
     * @tc.desc Verify total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let total: number = 0;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        total = total + cur;
        return prev + cur;
      }, 0);
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7100
     * @tc.name testUint32ArrayReduceRightOne071
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      const captured: int[] = [];
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        captured.push(index);
        return prev + cur;
      }, 0);
      expect(captured.length).assertEqual(4);
      expect(captured[0]).assertEqual(3);
      expect(captured[1]).assertEqual(2);
      expect(captured[2]).assertEqual(1);
      expect(captured[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7200
     * @tc.name testUint32ArrayReduceRightOne072
     * @tc.desc Verify reduceRight invokes callback once per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let count: int = 0;
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        count = count + 1;
        return prev + cur;
      }, 0);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7300
     * @tc.name testUint32ArrayReduceRightOne073
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur, 0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7400
     * @tc.name testUint32ArrayReduceRightOne074
     * @tc.desc Verify reduceRight byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur, 0);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7500
     * @tc.name testUint32ArrayReduceRightOne075
     * @tc.desc Verify U=number, initialValue = NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        Number.NaN);
      expect(Number.isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7600
     * @tc.name testUint32ArrayReduceRightOne076
     * @tc.desc Verify U=boolean, reduceRight 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<boolean>(
        (prev: boolean, cur: number, index: int, array: Uint32Array): boolean => prev && cur > 0,
        true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7700
     * @tc.name testUint32ArrayReduceRightOne077
     * @tc.desc Verify U=boolean, reduceRight false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 3, 5);
      const r = arr.reduceRight<boolean>(
        (prev: boolean, cur: number, index: int, array: Uint32Array): boolean => prev || cur % 2 === 0,
        false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7800
     * @tc.name testUint32ArrayReduceRightOne078
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => 50, 0);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_7900
     * @tc.name testUint32ArrayReduceRightOne079
     * @tc.desc Verify initialValue cur init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur,
        30);
      expect(r).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_8000
     * @tc.name testUint32ArrayReduceRightOne080
     * @tc.desc Verify array reduceRight max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 7, 2, 9, 4);
      const r = arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur > prev) {
          return cur;
        }
        return prev;
      }, 0);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_8100
     * @tc.name testUint32ArrayReduceRightOne081
     * @tc.desc Verify array reduceRight min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(8, 3, 6, 1, 5);
      const r = arr.reduceRight<number>((prev: number, cur: number, index: int, array: Uint32Array): number => {
        if (cur < prev) {
          return cur;
        }
        return prev;
      }, 999);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_8200
     * @tc.name testUint32ArrayReduceRightOne082
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 10, 10);
      const r = arr.reduceRight<number>(
        (prev: number, cur: number, index: int, array: Uint32Array): number => prev + cur * index,
        0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_8300
     * @tc.name testUint32ArrayReduceRightOne083
     * @tc.desc Verify U=string currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.reduceRight<string>(
        (prev: string, cur: number, index: int, array: Uint32Array): string => prev + index,
        "");
      expect(r).assertEqual("210");
    });

  });
}
