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

export default function typedUArraysSubarrayTest05(): void {
  describe('TypedUArraysSubarrayTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4100
     * @tc.name testTypedUArraysSubarray02041
     * @tc.desc Verify subarray 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4200
     * @tc.name testTypedUArraysSubarray02042
     * @tc.desc Verify subarray begin=-3 end=-1 begin end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(-3, -1);
      expect(result.length).assertEqual(2);
      const val28 = result[0];
      expect(val28).assertEqual(3);
      const val29 = result[1];
      expect(val29).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4300
     * @tc.name testTypedUArraysSubarray02043
     * @tc.desc Verify subarray begin=-3 end=-1 begin end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(-3, -1);
      expect(result.length).assertEqual(2);
      const val30 = result[0];
      expect(val30).assertEqual(3n);
      const val31 = result[1];
      expect(val31).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4400
     * @tc.name testTypedUArraysSubarray02044
     * @tc.desc Verify subarray TypedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0, 2);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(Uint8Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4500
     * @tc.name testTypedUArraysSubarray02045
     * @tc.desc Verify subarray TypedArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.subarray(1, 3);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(Uint16Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4600
     * @tc.name testTypedUArraysSubarray02046
     * @tc.desc Verify subarray TypedArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      let result = arr.subarray(0, 2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(Uint32Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4700
     * @tc.name testTypedUArraysSubarray02047
     * @tc.desc Verify subarray TypedArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.subarray(0, 2);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(Uint8ClampedArray.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4800
     * @tc.name testTypedUArraysSubarray02048
     * @tc.desc Verify subarray TypedArray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.subarray(1, 3);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(BigUint64Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_4900
     * @tc.name testTypedUArraysSubarray02049
     * @tc.desc Verify subarray begin=1 end=3 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(1, 3);
      expect(result.length).assertEqual(2);
      const val32 = result[0];
      expect(val32).assertEqual(2);
      const val33 = result[1];
      expect(val33).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5000
     * @tc.name testTypedUArraysSubarray02050
     * @tc.desc Verify subarray begin=2 end=5 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.subarray(2, 5);
      expect(result.length).assertEqual(3);
      const val34 = result[0];
      expect(val34).assertEqual(300);
      const val35 = result[2];
      expect(val35).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5100
     * @tc.name testTypedUArraysSubarray02051
     * @tc.desc Verify subarray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const val36 = arr[1] ;
      expect(val36).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5200
     * @tc.name testTypedUArraysSubarray02052
     * @tc.desc Verify subarray - subarray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(0, 3);
      const val37 = arr[1] ;
      expect(val37).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5300
     * @tc.name testTypedUArraysSubarray02053
     * @tc.desc Verify subarray - subarray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(2, 5);
      const val38 = sub[1];
      expect(val38).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5400
     * @tc.name testTypedUArraysSubarray02054
     * @tc.desc Verify subarray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub = arr.subarray(1, 4);
      const val39 = arr[1] ;
      expect(val39).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5500
     * @tc.name testTypedUArraysSubarray02055
     * @tc.desc Verify subarray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      const sub = arr.subarray(0, 3);
      const val40 = arr[2] ;
      expect(val40).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5600
     * @tc.name testTypedUArraysSubarray02056
     * @tc.desc Verify subarray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      const sub = arr.subarray(1, 4);
      const val41 = arr[1] ;
      expect(val41).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5700
     * @tc.name testTypedUArraysSubarray02057
     * @tc.desc Verify subarray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(2, 5);
      const val42 = arr[3] ;
      expect(val42).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5800
     * @tc.name testTypedUArraysSubarray02058
     * @tc.desc Verify subarray begin=NaN 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_5900
     * @tc.name testTypedUArraysSubarray02059
     * @tc.desc Verify subarray end=NaN 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6000
     * @tc.name testTypedUArraysSubarray02060
     * @tc.desc Verify subarray begin=undefined 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6100
     * @tc.name testTypedUArraysSubarray02061
     * @tc.desc Verify subarray end=undefined BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.subarray(1, 3);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6200
     * @tc.name testTypedUArraysSubarray02062
     * @tc.desc Verify subarray begin=null 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6300
     * @tc.name testTypedUArraysSubarray02063
     * @tc.desc Verify subarray begin>end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6400
     * @tc.name testTypedUArraysSubarray02064
     * @tc.desc Verify subarray begin>end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(4, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6500
     * @tc.name testTypedUArraysSubarray02065
     * @tc.desc Verify subarray begin>end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.subarray(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6600
     * @tc.name testTypedUArraysSubarray02066
     * @tc.desc Verify subarray begin>end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(4, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6700
     * @tc.name testTypedUArraysSubarray02067
     * @tc.desc Verify subarray begin>end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6800
     * @tc.name testTypedUArraysSubarray02068
     * @tc.desc Verify subarray begin=end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_6900
     * @tc.name testTypedUArraysSubarray02069
     * @tc.desc Verify subarray begin=end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.subarray(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7000
     * @tc.name testTypedUArraysSubarray02070
     * @tc.desc Verify subarray begin=end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(3, 3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7100
     * @tc.name testTypedUArraysSubarray02071
     * @tc.desc Verify subarray end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.subarray(0, 100);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7200
     * @tc.name testTypedUArraysSubarray02072
     * @tc.desc Verify subarray end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      let result = arr.subarray(0, 100);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7300
     * @tc.name testTypedUArraysSubarray02073
     * @tc.desc Verify subarray begin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7400
     * @tc.name testTypedUArraysSubarray02074
     * @tc.desc Verify subarray begin=0 end=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7500
     * @tc.name testTypedUArraysSubarray02075
     * @tc.desc Verify subarray begin=0 end=-0 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0, -0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7600
     * @tc.name testTypedUArraysSubarray02076
     * @tc.desc Verify subarray begin=1.5 begin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(1, 4);
      expect(result.length).assertEqual(3);
      const val43 = result[0];
      expect(val43).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7700
     * @tc.name testTypedUArraysSubarray02077
     * @tc.desc Verify subarray end=3.7 end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7800
     * @tc.name testTypedUArraysSubarray02078
     * @tc.desc Verify subarray begin=0 end=0 subarray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0, 0);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(Uint8Array.BYTES_PER_ELEMENT);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_7900
     * @tc.name testTypedUArraysSubarray02079
     * @tc.desc Verify subarray subarray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub1 = arr.subarray(1, 4);
      const sub2 = sub1.subarray(1, 3);
      const val44 = arr[2] ;
      expect(val44).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8000
     * @tc.name testTypedUArraysSubarray02080
     * @tc.desc Verify subarray subarray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub1 = arr.subarray(1, 4);
      const sub2 = sub1.subarray(1, 3);
      const val45 = arr[2] ;
      expect(val45).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8100
     * @tc.name testTypedUArraysSubarray02081
     * @tc.desc Verify subarray map Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.map(x => x * 2);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8200
     * @tc.name testTypedUArraysSubarray02082
     * @tc.desc Verify subarray map Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.map(x => x + 100);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(110);
      expect(result[1]).assertEqual(120);
      expect(result[2]).assertEqual(130);
      expect(result[3]).assertEqual(140);
      expect(result[4]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8300
     * @tc.name testTypedUArraysSubarray02083
     * @tc.desc Verify subarray map BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.map(x => x + 10n);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(11n);
      expect(result[1]).assertEqual(12n);
      expect(result[2]).assertEqual(13n);
      expect(result[3]).assertEqual(14n);
      expect(result[4]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8400
     * @tc.name testTypedUArraysSubarray02084
     * @tc.desc Verify subarray filter Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.filter(x => x > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8500
     * @tc.name testTypedUArraysSubarray02085
     * @tc.desc Verify subarray filter Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.filter(x => x >= 300);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(300);
      expect(result[1]).assertEqual(400);
      expect(result[2]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8600
     * @tc.name testTypedUArraysSubarray02086
     * @tc.desc Verify subarray filter BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.filter(x => x != 3n);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(4n);
      expect(result[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8700
     * @tc.name testTypedUArraysSubarray02087
     * @tc.desc Verify subarray reduce sum Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sum = sum + arr[i];
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8800
     * @tc.name testTypedUArraysSubarray02088
     * @tc.desc Verify subarray reduce Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let sum: number = 100;
      for (let i = 0; i < arr.length; i++) {
        sum = sum + arr[i];
      }
      expect(sum).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_8900
     * @tc.name testTypedUArraysSubarray02089
     * @tc.desc Verify subarray reduce sum BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sum: bigint = 0n;
      for (let i = 0; i < arr.length; i++) {
        sum = sum + arr[i];
      }
      expect(sum).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9000
     * @tc.name testTypedUArraysSubarray02090
     * @tc.desc Verify subarray reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      for (let i = arr.length - 1; i >= 0; i--) {
        sum = sum + arr[i];
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9100
     * @tc.name testTypedUArraysSubarray02091
     * @tc.desc Verify subarray reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sum: bigint = 0n;
      for (let i = arr.length - 1; i >= 0; i--) {
        sum = sum + arr[i];
      }
      expect(sum).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9200
     * @tc.name testTypedUArraysSubarray02092
     * @tc.desc Verify subarray join Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.join();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9300
     * @tc.name testTypedUArraysSubarray02093
     * @tc.desc Verify subarray join Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.join('-');
      expect(result).assertEqual('10-20-30-40-50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9400
     * @tc.name testTypedUArraysSubarray02094
     * @tc.desc Verify subarray join BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.join();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9500
     * @tc.name testTypedUArraysSubarray02095
     * @tc.desc Verify subarray toString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.toString();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY02_9600
     * @tc.name testTypedUArraysSubarray02096
     * @tc.desc Verify subarray toString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarray02096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.toString();
      expect(result).assertEqual('1,2,3,4,5');
    });

  });
}
