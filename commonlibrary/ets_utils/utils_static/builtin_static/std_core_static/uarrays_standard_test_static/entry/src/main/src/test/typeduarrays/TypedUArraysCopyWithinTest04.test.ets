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

export default function typedUArraysCopyWithinTest04(): void {
  describe('TypedUArraysCopyWithinTest04', (): void => {
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
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0100
     * @tc.name testTypedUArraysCopyWithinPart202_001
     * @tc.desc Verify copyWithin(target=-1, start=-2, end=-1) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, -2, -1);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0200
     * @tc.name testTypedUArraysCopyWithinPart202_002
     * @tc.desc Verify copyWithin(target=-1) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, 0);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0300
     * @tc.name testTypedUArraysCopyWithinPart202_003
     * @tc.desc Verify copyWithin(target=-1, start=-2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, -2);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0400
     * @tc.name testTypedUArraysCopyWithinPart202_004
     * @tc.desc Verify copyWithin(target=-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(-1, 0).copyWithin(0, 1);
      expect(ret).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0500
     * @tc.name testTypedUArraysCopyWithinPart202_005
     * @tc.desc Verify copyWithin(target=length) typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(5, 0);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0600
     * @tc.name testTypedUArraysCopyWithinPart202_006
     * @tc.desc Verify copyWithin(target=length+1) instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(6, 0);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0700
     * @tc.name testTypedUArraysCopyWithinPart202_007
     * @tc.desc Verify copyWithin(target=length, start=length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(5, 5);
      expect(ret).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0800
     * @tc.name testTypedUArraysCopyWithinPart202_008
     * @tc.desc Verify copyWithin(target=length, start=0, end=2) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(5, 0, 2);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_0900
     * @tc.name testTypedUArraysCopyWithinPart202_009
     * @tc.desc Verify copyWithin(target=length) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(5, 0);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1000
     * @tc.name testTypedUArraysCopyWithinPart202_010
     * @tc.desc Verify copyWithin(target=length, start=0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(5, 0);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1100
     * @tc.name testTypedUArraysCopyWithinPart202_011
     * @tc.desc Verify copyWithin(target=length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(5, 0).copyWithin(0, 1);
      expect(ret).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1200
     * @tc.name testTypedUArraysCopyWithinPart202_012
     * @tc.desc Verify copyWithin(target= ) typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1300
     * @tc.name testTypedUArraysCopyWithinPart202_013
     * @tc.desc Verify copyWithin(target= ) instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1400
     * @tc.name testTypedUArraysCopyWithinPart202_014
     * @tc.desc Verify copyWithin(target= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0);
      expect(ret).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1500
     * @tc.name testTypedUArraysCopyWithinPart202_015
     * @tc.desc Verify copyWithin(target= ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0);
      expect(ret.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1600
     * @tc.name testTypedUArraysCopyWithinPart202_016
     * @tc.desc Verify copyWithin(target= ) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0);
      expect(ret.byteLength).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1700
     * @tc.name testTypedUArraysCopyWithinPart202_017
     * @tc.desc Verify copyWithin(target= ) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0);
      expect(ret.buffer).assertEqual(arr.buffer);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1800
     * @tc.name testTypedUArraysCopyWithinPart202_018
     * @tc.desc Verify copyWithin(target= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(1000000, 0).copyWithin(0, 1);
      expect(ret).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_1900
     * @tc.name testTypedUArraysCopyWithinPart202_019
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      const val0 = ret[0];
      expect(val0).assertEqual(arr[0]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2000
     * @tc.name testTypedUArraysCopyWithinPart202_020
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      const val1 = ret[0];
      expect(val1).assertEqual(arr[0]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2100
     * @tc.name testTypedUArraysCopyWithinPart202_021
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      const val2 = ret[0];
      expect(val2).assertEqual(arr[0]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2200
     * @tc.name testTypedUArraysCopyWithinPart202_022
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      const val3 = ret[0];
      expect(val3).assertEqual(arr[0]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2300
     * @tc.name testTypedUArraysCopyWithinPart202_023
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      const val4 = ret[0];
      expect(val4).assertEqual(arr[0]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2400
     * @tc.name testTypedUArraysCopyWithinPart202_024
     * @tc.desc Verify copyWithin Array.isArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2500
     * @tc.name testTypedUArraysCopyWithinPart202_025
     * @tc.desc Verify copyWithin Array.isArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2600
     * @tc.name testTypedUArraysCopyWithinPart202_026
     * @tc.desc Verify copyWithin Array.isArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2700
     * @tc.name testTypedUArraysCopyWithinPart202_027
     * @tc.desc Verify copyWithin Array.isArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2800
     * @tc.name testTypedUArraysCopyWithinPart202_028
     * @tc.desc Verify copyWithin Array.isArray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_2900
     * @tc.name testTypedUArraysCopyWithinPart202_029
     * @tc.desc Verify copyWithin ArrayBuffer.isView Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_3000
     * @tc.name testTypedUArraysCopyWithinPart202_030
     * @tc.desc Verify copyWithin ArrayBuffer.isView Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_3100
     * @tc.name testTypedUArraysCopyWithinPart202_031
     * @tc.desc Verify copyWithin ArrayBuffer.isView Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_3200
     * @tc.name testTypedUArraysCopyWithinPart202_032
     * @tc.desc Verify copyWithin ArrayBuffer.isView Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 1);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART202_3300
     * @tc.name testTypedUArraysCopyWithinPart202_033
     * @tc.desc Verify copyWithin ArrayBuffer.isView BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.copyWithin(0, 1);
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

  });
}
