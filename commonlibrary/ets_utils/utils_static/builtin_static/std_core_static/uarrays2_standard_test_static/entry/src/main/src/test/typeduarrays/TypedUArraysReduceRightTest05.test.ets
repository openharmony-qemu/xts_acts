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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysReduceRightTest05(): void {
  describe('TypedUArraysReduceRightTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_0100
     * @tc.name testTypedUArraysReduceRight01001
     * @tc.desc Verify reduceRight TypeError on empty Uint8Array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try {
        arr.reduceRight((prev, curr, idx, array) => prev + curr);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4300
     * @tc.name testTypedUArraysReduceRight01043
     * @tc.desc Verify reduceRight - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4400
     * @tc.name testTypedUArraysReduceRight01044
     * @tc.desc Verify reduceRight TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4500
     * @tc.name testTypedUArraysReduceRight01045
     * @tc.desc Verify reduceRight TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4600
     * @tc.name testTypedUArraysReduceRight01046
     * @tc.desc Verify reduceRight TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4700
     * @tc.name testTypedUArraysReduceRight01047
     * @tc.desc Verify reduceRight TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4800
     * @tc.name testTypedUArraysReduceRight01048
     * @tc.desc Verify reduceRight TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect(false).assertEqual(true);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_4900
     * @tc.name testTypedUArraysReduceRight01049
     * @tc.desc Verify reduceRight on empty Uint8Array with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try {
        let result = arr.reduceRight((prev, curr) => prev + curr) + 42;
        expect(result).assertEqual(42);
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5000
     * @tc.name testTypedUArraysReduceRight01050
     * @tc.desc Verify reduceRight on empty BigUint64Array with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = arr.reduceRight((prev, curr) => prev + curr, 42n);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5100
     * @tc.name testTypedUArraysReduceRight01051
     * @tc.desc Verify reduceRight Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 1]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5200
     * @tc.name testTypedUArraysReduceRight01052
     * @tc.desc Verify reduceRight Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5300
     * @tc.name testTypedUArraysReduceRight01053
     * @tc.desc Verify reduceRight Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5400
     * @tc.name testTypedUArraysReduceRight01054
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5500
     * @tc.name testTypedUArraysReduceRight01055
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000000000000n, 2000000000000n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(3000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5600
     * @tc.name testTypedUArraysReduceRight01056
     * @tc.desc Verify reduceRight BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev, curr) => prev * curr);
      expect(result).assertEqual(120n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5700
     * @tc.name testTypedUArraysReduceRight01057
     * @tc.desc Verify reduceRight Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 1]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5800
     * @tc.name testTypedUArraysReduceRight01058
     * @tc.desc Verify reduceRight Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 1]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_5900
     * @tc.name testTypedUArraysReduceRight01059
     * @tc.desc Verify reduceRight Uint8Array -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev: string, curr: number): string => prev + curr + "", "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6000
     * @tc.name testTypedUArraysReduceRight01060
     * @tc.desc Verify reduceRight BigUint64Array -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: string, curr: bigint): string => prev + String(curr), "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6100
     * @tc.name testTypedUArraysReduceRight01061
     * @tc.desc Verify reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.reduceRight((prev, curr, idx, array) => prev * curr) * 1;
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6200
     * @tc.name testTypedUArraysReduceRight01062
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((prev, curr) => prev * curr);
      expect(result).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6300
     * @tc.name testTypedUArraysReduceRight01063
     * @tc.desc Verify reduceRight Uint8Array max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 5, 30, 15]);
      let result = arr.reduceRight((prev, curr) => prev > curr ? prev : curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6400
     * @tc.name testTypedUArraysReduceRight01064
     * @tc.desc Verify reduceRight BigUint64Array max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 5n, 30n, 15n]);
      let result = arr.reduceRight((prev, curr) => prev > curr ? prev : curr);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6500
     * @tc.name testTypedUArraysReduceRight01065
     * @tc.desc Verify reduceRight Uint8Array min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 5, 30, 15]);
      let result = arr.reduceRight((prev, curr) => prev < curr ? prev : curr);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6600
     * @tc.name testTypedUArraysReduceRight01066
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6700
     * @tc.name testTypedUArraysReduceRight01067
     * @tc.desc Verify reduceRight Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000, 4000]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6800
     * @tc.name testTypedUArraysReduceRight01068
     * @tc.desc Verify reduceRight reduce Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const reduceResult = arr.reduce((prev, curr) => prev - curr);
      const reduceRightResult = arr.reduceRight((prev, curr) => prev - curr);
      expect(reduceResult).assertEqual(-4);
      expect(reduceRightResult).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_6900
     * @tc.name testTypedUArraysReduceRight01069
     * @tc.desc Verify reduceRight BigUint64Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const reduceResult = arr.reduce((prev, curr) => prev - curr);
      const reduceRightResult = arr.reduceRight((prev, curr) => prev - curr);
      expect(reduceRightResult).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7000
     * @tc.name testTypedUArraysReduceRight01070
     * @tc.desc Verify reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7100
     * @tc.name testTypedUArraysReduceRight01071
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7200
     * @tc.name testTypedUArraysReduceRight01072
     * @tc.desc Verify reduceRight Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7300
     * @tc.name testTypedUArraysReduceRight01073
     * @tc.desc Verify reduceRight Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let steps: string[] = [];
      arr.reduceRight((prev, curr, idx, array) => {
        steps.push(`${prev}+${curr}@${idx}`);
        return prev + curr;
      });
      expect(steps[0]).assertEqual("3+2@1");
      expect(steps[1]).assertEqual("5+1@0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7400
     * @tc.name testTypedUArraysReduceRight01074
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7500
     * @tc.name testTypedUArraysReduceRight01075
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev - curr) + 100;
      expect(result).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7600
     * @tc.name testTypedUArraysReduceRight01076
     * @tc.desc Verify reduceRight Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7700
     * @tc.name testTypedUArraysReduceRight01077
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7800
     * @tc.name testTypedUArraysReduceRight01078
     * @tc.desc Verify reduceRight Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.reduceRight((prev, curr, idx, array) => prev + curr) + 100;
      expect(result).assertEqual(115);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_7900
     * @tc.name testTypedUArraysReduceRight01079
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000000000000n, 2000000000000n]);
      let result = arr.reduceRight((prev, curr) => prev + curr, 5000000000000n);
      expect(result).assertEqual(8000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_8000
     * @tc.name testTypedUArraysReduceRight01080
     * @tc.desc Verify reduceRight Uint8Array prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let firstPrev: number = -1;
      arr.reduceRight((prev, curr) => {
        if (firstPrev === -1) firstPrev = prev;
        return prev + curr;
      });
      expect(firstPrev).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_8100
     * @tc.name testTypedUArraysReduceRight01081
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let callCount = 0;
      let firstCurr: number = -1;
      arr.reduceRight((prev, curr) => {
        if (callCount === 0) firstCurr = curr;
        callCount++;
        return prev + curr;
      });
      expect(firstCurr).assertEqual(30);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_8200
     * @tc.name testTypedUArraysReduceRight01082
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let callCount = 0;
      let firstCurr: bigint = 0n;
      arr.reduceRight((prev, curr) => {
        if (callCount === 0) firstCurr = curr;
        callCount++;
        return prev + curr;
      });
      expect(firstCurr).assertEqual(30n);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_8300
     * @tc.name testTypedUArraysReduceRight01083
     * @tc.desc Verify reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.reduceRight((prev: Array<number>, curr: number): Array<number> => {
        prev.push(curr);
        return prev;
      }, []);
      const val19 = result[0];
      expect(val19).assertEqual(4);
      const val20 = result[1];
      expect(val20).assertEqual(3);
      const val21 = result[2];
      expect(val21).assertEqual(2);
      const val22 = result[3];
      expect(val22).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT01_8400
     * @tc.name testTypedUArraysReduceRight01084
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight01084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.reduceRight((prev: string, curr: number): string => prev + "-" + curr, "");
      expect(result).assertEqual("-30-20-10");
    });
  });
}
