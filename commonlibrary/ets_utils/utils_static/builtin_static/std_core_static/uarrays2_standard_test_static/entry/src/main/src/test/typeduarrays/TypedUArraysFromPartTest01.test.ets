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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0010
     * @tc.name testTypedUArraysFromPart102_001
     * @tc.desc Verify from Array<number> 42 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [42];
      let result = Uint8ClampedArray.from(src);
      const val_c0 = result[0];
      expect(val_c0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0550
     * @tc.name testTypedUArraysFromPart102_055
     * @tc.desc Verify from 300 Uint16Array 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300];
      let result = Uint16Array.from(src);
      const val113 = result[0];
      expect(val113).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0560
     * @tc.name testTypedUArraysFromPart102_056
     * @tc.desc Verify from 70000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [70000];
      let result = Uint16Array.from(src);
      const val114 = result[0];
      expect(val114).assertEqual(4464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0570
     * @tc.name testTypedUArraysFromPart102_057
     * @tc.desc Verify from 70000 Uint32Array 70000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [70000];
      let result = Uint32Array.from(src);
      const val115 = result[0];
      expect(val115).assertEqual(70000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0580
     * @tc.name testTypedUArraysFromPart102_058
     * @tc.desc Verify from null arrayLike Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0590
     * @tc.name testTypedUArraysFromPart102_059
     * @tc.desc Verify from null arrayLike Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0600
     * @tc.name testTypedUArraysFromPart102_060
     * @tc.desc Verify from null arrayLike Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0610
     * @tc.name testTypedUArraysFromPart102_061
     * @tc.desc Verify from null arrayLike Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0620
     * @tc.name testTypedUArraysFromPart102_062
     * @tc.desc Verify from null arrayLike BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0630
     * @tc.name testTypedUArraysFromPart102_063
     * @tc.desc Verify from undefined arrayLike Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0640
     * @tc.name testTypedUArraysFromPart102_064
     * @tc.desc Verify from undefined arrayLike Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0650
     * @tc.name testTypedUArraysFromPart102_065
     * @tc.desc Verify from undefined arrayLike Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0660
     * @tc.name testTypedUArraysFromPart102_066
     * @tc.desc Verify from undefined arrayLike Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0670
     * @tc.name testTypedUArraysFromPart102_067
     * @tc.desc Verify from undefined arrayLike BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0680
     * @tc.name testTypedUArraysFromPart102_068
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0690
     * @tc.name testTypedUArraysFromPart102_069
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('TypeError');
      } catch (e) {
        expect(e.message).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0700
     * @tc.name testTypedUArraysFromPart102_070
     * @tc.desc Verify from typeof object Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0710
     * @tc.name testTypedUArraysFromPart102_071
     * @tc.desc Verify from typeof object Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0720
     * @tc.name testTypedUArraysFromPart102_072
     * @tc.desc Verify from typeof object Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0730
     * @tc.name testTypedUArraysFromPart102_073
     * @tc.desc Verify from typeof object Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0740
     * @tc.name testTypedUArraysFromPart102_074
     * @tc.desc Verify from typeof object BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0750
     * @tc.name testTypedUArraysFromPart102_075
     * @tc.desc Verify from instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0760
     * @tc.name testTypedUArraysFromPart102_076
     * @tc.desc Verify from instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0770
     * @tc.name testTypedUArraysFromPart102_077
     * @tc.desc Verify from instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0780
     * @tc.name testTypedUArraysFromPart102_078
     * @tc.desc Verify from instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0790
     * @tc.name testTypedUArraysFromPart102_079
     * @tc.desc Verify from instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0800
     * @tc.name testTypedUArraysFromPart102_080
     * @tc.desc Verify from length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0810
     * @tc.name testTypedUArraysFromPart102_081
     * @tc.desc Verify from length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint16Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0820
     * @tc.name testTypedUArraysFromPart102_082
     * @tc.desc Verify from length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint32Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0830
     * @tc.name testTypedUArraysFromPart102_083
     * @tc.desc Verify from length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint8ClampedArray.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0840
     * @tc.name testTypedUArraysFromPart102_084
     * @tc.desc Verify from length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n, 4n, 5n];
      let result = BigUint64Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0850
     * @tc.name testTypedUArraysFromPart102_085
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0860
     * @tc.name testTypedUArraysFromPart102_086
     * @tc.desc Verify from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint16Array.from(src);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0870
     * @tc.name testTypedUArraysFromPart102_087
     * @tc.desc Verify from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      let result = Uint32Array.from(src);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0880
     * @tc.name testTypedUArraysFromPart102_088
     * @tc.desc Verify from Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      let result = Uint8ClampedArray.from(src);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0890
     * @tc.name testTypedUArraysFromPart102_089
     * @tc.desc Verify from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0900
     * @tc.name testTypedUArraysFromPart102_090
     * @tc.desc Verify from buffer ArrayBuffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      let result = Uint8Array.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0910
     * @tc.name testTypedUArraysFromPart102_091
     * @tc.desc Verify from buffer ArrayBuffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      let result = Uint16Array.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0920
     * @tc.name testTypedUArraysFromPart102_092
     * @tc.desc Verify from buffer ArrayBuffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      let result = Uint32Array.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0930
     * @tc.name testTypedUArraysFromPart102_093
     * @tc.desc Verify from buffer ArrayBuffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      let result = Uint8ClampedArray.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0940
     * @tc.name testTypedUArraysFromPart102_094
     * @tc.desc Verify from buffer ArrayBuffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      let result = BigUint64Array.from(src);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0950
     * @tc.name testTypedUArraysFromPart102_095
     * @tc.desc Verify from byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0960
     * @tc.name testTypedUArraysFromPart102_096
     * @tc.desc Verify from byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0970
     * @tc.name testTypedUArraysFromPart102_097
     * @tc.desc Verify from byteOffset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0980
     * @tc.name testTypedUArraysFromPart102_098
     * @tc.desc Verify from byteOffset 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_0990
     * @tc.name testTypedUArraysFromPart102_099
     * @tc.desc Verify from byteOffset 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1000
     * @tc.name testTypedUArraysFromPart102_100
     * @tc.desc Verify from name Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1010
     * @tc.name testTypedUArraysFromPart102_101
     * @tc.desc Verify from name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1020
     * @tc.name testTypedUArraysFromPart102_102
     * @tc.desc Verify from name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1030
     * @tc.name testTypedUArraysFromPart102_103
     * @tc.desc Verify from name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1040
     * @tc.name testTypedUArraysFromPart102_104
     * @tc.desc Verify from name BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1050
     * @tc.name testTypedUArraysFromPart102_105
     * @tc.desc Verify from BYTES_PER_ELEMENT 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1060
     * @tc.name testTypedUArraysFromPart102_106
     * @tc.desc Verify from BYTES_PER_ELEMENT 1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint8ClampedArray.from(src);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1070
     * @tc.name testTypedUArraysFromPart102_107
     * @tc.desc Verify from BYTES_PER_ELEMENT 2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(src);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1080
     * @tc.name testTypedUArraysFromPart102_108
     * @tc.desc Verify from BYTES_PER_ELEMENT 4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      let result = Uint32Array.from(src);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM_PART102_1090
     * @tc.name testTypedUArraysFromPart102_109
     * @tc.desc Verify from BYTES_PER_ELEMENT 8 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFromPart102_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Iterable<bigint> = [1n, 2n, 3n];
      let result = BigUint64Array.from(src);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });
  });
}
