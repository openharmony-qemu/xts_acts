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

export default function typedUArraysReduceTest03(): void {
  describe('TypedUArraysReduceTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0100
     * @tc.name testTypedUArraysReducePart2_001
     * @tc.desc Verify reduce typeof Double - Uint8Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0200
     * @tc.name testTypedUArraysReducePart2_002
     * @tc.desc Verify reduce typeof Double - Uint16Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0300
     * @tc.name testTypedUArraysReducePart2_003
     * @tc.desc Verify reduce typeof Double - Uint32Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0400
     * @tc.name testTypedUArraysReducePart2_004
     * @tc.desc Verify reduce typeof BigInt - BigUint64Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0500
     * @tc.name testTypedUArraysReducePart2_005
     * @tc.desc Verify reduce typeof Double - Uint8ClampedArray initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0001
     * @tc.name testTypedUArraysReducePart2_006
     * @tc.desc Verify reduce typeof Double - Uint16Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0700
     * @tc.name testTypedUArraysReducePart2_007
     * @tc.desc Verify reduce typeof Double - Uint32Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0900

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0800
     * @tc.name testTypedUArraysReducePart2_008
     * @tc.desc Verify reduce typeof Double - Uint8ClampedArray initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0002
     * @tc.name testTypedUArraysReducePart2_009
     * @tc.desc Verify reduceRight typeof Double - Uint8Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1000
     * @tc.name testTypedUArraysReducePart2_010
     * @tc.desc Verify reduceRight typeof Double - Uint16Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0003
     * @tc.name testTypedUArraysReducePart2_011
     * @tc.desc Verify reduceRight typeof Double - Uint32Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_0004
     * @tc.name testTypedUArraysReducePart2_012
     * @tc.desc Verify reduceRight typeof BigInt - BigUint64Array initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1300
     * @tc.name testTypedUArraysReducePart2_013
     * @tc.desc Verify reduceRight typeof Double - Uint8ClampedArray initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1400
     * @tc.name testTypedUArraysReducePart2_014
     * @tc.desc Verify join typeof string - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1500
     * @tc.name testTypedUArraysReducePart2_015
     * @tc.desc Verify join typeof string - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.join();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1600
     * @tc.name testTypedUArraysReducePart2_016
     * @tc.desc Verify join typeof string - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.join();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1700
     * @tc.name testTypedUArraysReducePart2_017
     * @tc.desc Verify join typeof string - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.join();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1800
     * @tc.name testTypedUArraysReducePart2_018
     * @tc.desc Verify toString typeof string - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_1900
     * @tc.name testTypedUArraysReducePart2_019
     * @tc.desc Verify toString typeof string - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART2_2000
     * @tc.name testTypedUArraysReducePart2_020
     * @tc.desc Verify toLocaleString typeof string - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
    });

  });
}



