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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysFromPartTest01(): void {
  describe('TypedUArraysFromPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0100
     * @tc.name testTypedUArraysFromPartTestFileA001
     * @tc.desc Verify from Array<number> 42 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [42];
      let result = Uint8ClampedArray.from(src);
      const valC0 = result[0];
      expect(valC0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0200
     * @tc.name testTypedUArraysFromPartTestFileA002
     * @tc.desc Verify from 300 Uint16Array 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300];
      let result = Uint16Array.from(src);
      const val113 = result[0];
      expect(val113).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0300
     * @tc.name testTypedUArraysFromPartTestFileA003
     * @tc.desc Verify from 70000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [70000];
      let result = Uint16Array.from(src);
      const val114 = result[0];
      expect(val114).assertEqual(4464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0400
     * @tc.name testTypedUArraysFromPartTestFileA004
     * @tc.desc Verify from 70000 Uint32Array 70000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [70000];
      let result = Uint32Array.from(src);
      const val115 = result[0];
      expect(val115).assertEqual(70000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0500
     * @tc.name testTypedUArraysFromPartTestFileA005
     * @tc.desc Verify from empty array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0600
     * @tc.name testTypedUArraysFromPartTestFileA006
     * @tc.desc Verify from empty array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = Uint16Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0700
     * @tc.name testTypedUArraysFromPartTestFileA007
     * @tc.desc Verify from empty array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = Uint32Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0800
     * @tc.name testTypedUArraysFromPartTestFileA008
     * @tc.desc Verify from empty array Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_0900
     * @tc.name testTypedUArraysFromPartTestFileA009
     * @tc.desc Verify from empty iterable BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [];
      const result = BigUint64Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1000
     * @tc.name testTypedUArraysFromPartTestFileA010
     * @tc.desc Verify from mapfn index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: Array<number> = [];
      const result = Uint8Array.from([10, 10], (value, index) => {
        indices.push(index);
        return value;
      });
      expect(result.length).assertEqual(2);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1100
     * @tc.name testTypedUArraysFromPartTestFileA011
     * @tc.desc Verify from mapfn index Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: Array<number> = [];
      const result = Uint16Array.from([10, 10], (value, index) => {
        indices.push(index);
        return value;
      });
      expect(result.length).assertEqual(2);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1200
     * @tc.name testTypedUArraysFromPartTestFileA012
     * @tc.desc Verify from mapfn index Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: Array<number> = [];
      const result = Uint32Array.from([10, 10], (value, index) => {
        indices.push(index);
        return value;
      });
      expect(result.length).assertEqual(2);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1300
     * @tc.name testTypedUArraysFromPartTestFileA013
     * @tc.desc Verify from mapfn index Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: Array<number> = [];
      const result = Uint8ClampedArray.from([10, 10], (value, index) => {
        indices.push(index);
        return value;
      });
      expect(result.length).assertEqual(2);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1400
     * @tc.name testTypedUArraysFromPartTestFileA014
     * @tc.desc Verify from mapfn index BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: Array<number> = [];
      const src: Iterable<bigint> = [10n, 10n];
      const result = BigUint64Array.from(src, (value, index) => {
        indices.push(index);
        return value;
      });
      expect(result.length).assertEqual(2);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1500
     * @tc.name testTypedUArraysFromPartTestFileA015
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const result = Uint8Array.from(src);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1600
     * @tc.name testTypedUArraysFromPartTestFileA016
     * @tc.desc Verify from creates an independent Uint8Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const result = Uint8Array.from(src);
      src[0] = 9;
      expect(result[0]).assertEqual(1);
      expect(result).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1700
     * @tc.name testTypedUArraysFromPartTestFileA017
     * @tc.desc Verify from typeof object Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(src[0]);
      expect(result[2]).assertEqual(src[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1800
     * @tc.name testTypedUArraysFromPartTestFileA018
     * @tc.desc Verify from typeof object Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(src[0]);
      expect(result[2]).assertEqual(src[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_1900
     * @tc.name testTypedUArraysFromPartTestFileA019
     * @tc.desc Verify from typeof object Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(src[0]);
      expect(result[2]).assertEqual(src[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2000
     * @tc.name testTypedUArraysFromPartTestFileA020
     * @tc.desc Verify from typeof object Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(src[0]);
      expect(result[2]).assertEqual(src[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2100
     * @tc.name testTypedUArraysFromPartTestFileA021
     * @tc.desc Verify from typeof object BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1n);
      expect(result[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2200
     * @tc.name testTypedUArraysFromPartTestFileA022
     * @tc.desc Verify from length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2300
     * @tc.name testTypedUArraysFromPartTestFileA023
     * @tc.desc Verify from length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2400
     * @tc.name testTypedUArraysFromPartTestFileA024
     * @tc.desc Verify from length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2500
     * @tc.name testTypedUArraysFromPartTestFileA025
     * @tc.desc Verify from length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2600
     * @tc.name testTypedUArraysFromPartTestFileA026
     * @tc.desc Verify from length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n, 4n, 5n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2700
     * @tc.name testTypedUArraysFromPartTestFileA027
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2800
     * @tc.name testTypedUArraysFromPartTestFileA028
     * @tc.desc Verify from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint16Array.from(src);
      expect(result).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_2900
     * @tc.name testTypedUArraysFromPartTestFileA029
     * @tc.desc Verify from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      let result = Uint32Array.from(src);
      expect(result).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3000
     * @tc.name testTypedUArraysFromPartTestFileA030
     * @tc.desc Verify from Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      let result = Uint8ClampedArray.from(src);
      expect(result).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3100
     * @tc.name testTypedUArraysFromPartTestFileA031
     * @tc.desc Verify from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3200
     * @tc.name testTypedUArraysFromPartTestFileA032
     * @tc.desc Verify from buffer ArrayBuffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3300
     * @tc.name testTypedUArraysFromPartTestFileA033
     * @tc.desc Verify from buffer ArrayBuffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint16Array.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3400
     * @tc.name testTypedUArraysFromPartTestFileA034
     * @tc.desc Verify from buffer ArrayBuffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      let result = Uint32Array.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3500
     * @tc.name testTypedUArraysFromPartTestFileA035
     * @tc.desc Verify from buffer ArrayBuffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      let result = Uint8ClampedArray.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3600
     * @tc.name testTypedUArraysFromPartTestFileA036
     * @tc.desc Verify from buffer ArrayBuffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3700
     * @tc.name testTypedUArraysFromPartTestFileA037
     * @tc.desc Verify from byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3800
     * @tc.name testTypedUArraysFromPartTestFileA038
     * @tc.desc Verify from byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_3900
     * @tc.name testTypedUArraysFromPartTestFileA039
     * @tc.desc Verify from byteOffset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4000
     * @tc.name testTypedUArraysFromPartTestFileA040
     * @tc.desc Verify from byteOffset 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4100
     * @tc.name testTypedUArraysFromPartTestFileA041
     * @tc.desc Verify from byteOffset 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4200
     * @tc.name testTypedUArraysFromPartTestFileA042
     * @tc.desc Verify from name Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4300
     * @tc.name testTypedUArraysFromPartTestFileA043
     * @tc.desc Verify from name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4400
     * @tc.name testTypedUArraysFromPartTestFileA044
     * @tc.desc Verify from name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4500
     * @tc.name testTypedUArraysFromPartTestFileA045
     * @tc.desc Verify from name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4600
     * @tc.name testTypedUArraysFromPartTestFileA046
     * @tc.desc Verify from name BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4700
     * @tc.name testTypedUArraysFromPartTestFileA047
     * @tc.desc Verify from BYTES_PER_ELEMENT 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4800
     * @tc.name testTypedUArraysFromPartTestFileA048
     * @tc.desc Verify from BYTES_PER_ELEMENT 1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_4900
     * @tc.name testTypedUArraysFromPartTestFileA049
     * @tc.desc Verify from BYTES_PER_ELEMENT 2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_5000
     * @tc.name testTypedUArraysFromPartTestFileA050
     * @tc.desc Verify from BYTES_PER_ELEMENT 4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROMPARTTEST01_5100
     * @tc.name testTypedUArraysFromPartTestFileA051
     * @tc.desc Verify from BYTES_PER_ELEMENT 8 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPartTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });
  });
}
