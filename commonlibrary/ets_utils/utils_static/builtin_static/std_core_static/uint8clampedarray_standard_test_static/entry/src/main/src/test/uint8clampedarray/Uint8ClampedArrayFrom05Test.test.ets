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

export default function uint8ClampedArrayFrom05Test(): void {
  describe('uint8ClampedArrayFrom05Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FIVE_0100
     * @tc.name testUint8ClampedArrayFromFive001
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 2 for from([1, 2, 3] as Array<n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2, 3] as Array<number>, (v: number, k: number): number => v + 1);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FIVE_0200
     * @tc.name testUint8ClampedArrayFromFive002
     * @tc.desc Verify -from(Uint8ClampedArray, mapfn) k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from(new Uint8ClampedArray([10, 20, 30]), (v: number, k: number): number => v + k);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(21);
      expect(r[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FIVE_0300
     * @tc.name testUint8ClampedArrayFromFive003
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from([1, 2, 3, 4] as Arra)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2, 3, 4] as Array<number>);
      const sub = r.subarray(1, 3);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FIVE_0400
     * @tc.name testUint8ClampedArrayFromFive004
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 123 for from([0, 0, 0] as Array<n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([0, 0, 0] as Array<number>);
      r.fill(123);
      expect(r[0]).assertEqual(123);
      expect(r[2]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FIVE_0500
     * @tc.name testUint8ClampedArrayFromFive005
     * @tc.desc Verify -from byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2, 3, 4, 5] as Array<number>);
      expect(r.byteLength).assertEqual(r.length * r.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FIVE_0600
     * @tc.name testUint8ClampedArrayFromFive006
     * @tc.desc Verify Uint8ClampedArray.from yields byteLength r.length for from([1, 2, 3] as Array<n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2, 3] as Array<number>, (v: number, k: number): number => v);
      expect(r.byteLength).assertEqual(r.length);
    });
  });
}
