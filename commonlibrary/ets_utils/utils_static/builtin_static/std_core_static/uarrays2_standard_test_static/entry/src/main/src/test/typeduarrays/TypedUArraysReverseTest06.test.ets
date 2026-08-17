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

export default function typedUArraysReverseTest06(): void {
  describe('TypedUArraysReverseTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0100
     * @tc.name testTypedUArraysReverseTestFileF001
     * @tc.desc Verify Uint16Array reverse with sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0200
     * @tc.name testTypedUArraysReverseTestFileF002
     * @tc.desc Verify Uint16Array reverse with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-0, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0300
     * @tc.name testTypedUArraysReverseTestFileF003
     * @tc.desc Verify Uint8Array reverse with NaN Infinity -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0400
     * @tc.name testTypedUArraysReverseTestFileF004
     * @tc.desc Verify Uint16Array reverse with NaN Infinity -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0500
     * @tc.name testTypedUArraysReverseTestFileF005
     * @tc.desc Verify Uint8Array reverse with NaN Infinity -Infinity no zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0600
     * @tc.name testTypedUArraysReverseTestFileF006
     * @tc.desc Verify Uint16Array reverse with NaN Infinity -Infinity no zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0700
     * @tc.name testTypedUArraysReverseTestFileF007
     * @tc.desc Verify Uint8Array reverse with 2000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(2000);
      for (let i = 0; i < 2000; i++) {
        arr[i] = i % 256;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(1999 % 256);
      expect(arr[1999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0800
     * @tc.name testTypedUArraysReverseTestFileF008
     * @tc.desc Verify Uint8Array reverse with 500 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(500);
      for (let i = 0; i < 500; i++) {
        arr[i] = i % 256;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(499 % 256);
      expect(arr[499]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_0900
     * @tc.name testTypedUArraysReverseTestFileF009
     * @tc.desc Verify Uint16Array reverse with 500 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(500);
      for (let i = 0; i < 500; i++) {
        arr[i] = i;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(499);
      expect(arr[499]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1000
     * @tc.name testTypedUArraysReverseTestFileF010
     * @tc.desc Verify Uint8Array reverse with overflow hex 0x100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x100, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1100
     * @tc.name testTypedUArraysReverseTestFileF011
     * @tc.desc Verify Uint16Array reverse with overflow hex 0x10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10000, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1200
     * @tc.name testTypedUArraysReverseTestFileF012
     * @tc.desc Verify Uint32Array reverse with overflow hex 0x100000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000000, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1300
     * @tc.name testTypedUArraysReverseTestFileF013
     * @tc.desc Verify Uint8Array reverse with overflow decimal 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1400
     * @tc.name testTypedUArraysReverseTestFileF014
     * @tc.desc Verify Uint16Array reverse with overflow decimal 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1500
     * @tc.name testTypedUArraysReverseTestFileF015
     * @tc.desc Verify Uint32Array reverse with overflow decimal 4294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1600
     * @tc.name testTypedUArraysReverseTestFileF016
     * @tc.desc Verify Uint8Array reverse with floating point length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length = 3.9;
      const arr = new Uint8Array(length);
      for (let i = 0; i < 3; i++) {
        arr[i] = i + 1;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1700
     * @tc.name testTypedUArraysReverseTestFileF017
     * @tc.desc Verify Uint16Array reverse with floating point length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length = 3.9;
      const arr = new Uint16Array(length);
      for (let i = 0; i < 3; i++) {
        arr[i] = i + 1;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1800
     * @tc.name testTypedUArraysReverseTestFileF018
     * @tc.desc Verify Uint8Array reverse from Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.5, 2.7, 3.9];
      const arr = new Uint8Array(numbers);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_1900
     * @tc.name testTypedUArraysReverseTestFileF019
     * @tc.desc Verify Uint16Array reverse from Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Array<number> = [1.5, 2.7, 3.9];
      const arr = new Uint16Array(numbers);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2000
     * @tc.name testTypedUArraysReverseTestFileF020
     * @tc.desc Verify Uint8Array reverse with overflow hex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x101, 0x102, 0x103]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2100
     * @tc.name testTypedUArraysReverseTestFileF021
     * @tc.desc Verify Uint16Array reverse with overflow hex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10001, 0x10002, 0x10003]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2200
     * @tc.name testTypedUArraysReverseTestFileF022
     * @tc.desc Verify Uint8Array reverse with mixed overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 0x100, 2, 0x101, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2300
     * @tc.name testTypedUArraysReverseTestFileF023
     * @tc.desc Verify Uint16Array reverse with mixed overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 0x10000, 2, 0x10001, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2400
     * @tc.name testTypedUArraysReverseTestFileF024
     * @tc.desc Verify Uint8Array reverse with single 255 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      arr.reverse();
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2500
     * @tc.name testTypedUArraysReverseTestFileF025
     * @tc.desc Verify Uint16Array reverse with single 65535 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2600
     * @tc.name testTypedUArraysReverseTestFileF026
     * @tc.desc Verify Uint32Array reverse with single max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      arr.reverse();
      expect(arr[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2700
     * @tc.name testTypedUArraysReverseTestFileF027
     * @tc.desc Verify BigUint64Array reverse with single max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      arr.reverse();
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2800
     * @tc.name testTypedUArraysReverseTestFileF028
     * @tc.desc Verify Uint8Array reverse with single 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_2900
     * @tc.name testTypedUArraysReverseTestFileF029
     * @tc.desc Verify Uint16Array reverse with single 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_3000
     * @tc.name testTypedUArraysReverseTestFileF030
     * @tc.desc Verify Uint8Array reverse with single NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_3100
     * @tc.name testTypedUArraysReverseTestFileF031
     * @tc.desc Verify Uint16Array reverse with single NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_3200
     * @tc.name testTypedUArraysReverseTestFileF032
     * @tc.desc Verify Uint8Array reverse from Array<number> with float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nums: Array<number> = [1.5, 2.5, 3.5];
      const arr = new Uint8Array(nums);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_3300
     * @tc.name testTypedUArraysReverseTestFileF033
     * @tc.desc Verify Uint16Array reverse from Array<number> with float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nums: Array<number> = [1.5, 2.5, 3.5];
      const arr = new Uint16Array(nums);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_3400
     * @tc.name testTypedUArraysReverseTestFileF034
     * @tc.desc Verify Uint8Array reverse from Array<number> with larger floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nums: Array<number> = [10.9, 20.1, 30.5];
      const arr = new Uint8Array(nums);
      arr.reverse();
      expect(arr[0]).assertEqual(30);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSETEST06_3500
     * @tc.name testTypedUArraysReverseTestFileF035
     * @tc.desc Verify Uint16Array reverse from Array<number> with larger floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileF035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nums: Array<number> = [10.9, 20.1, 30.5];
      const arr = new Uint16Array(nums);
      arr.reverse();
      expect(arr[0]).assertEqual(30);
      expect(arr[2]).assertEqual(10);
    });

  });
}
