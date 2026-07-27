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

export default function typedUArraysIndexOfTest03(): void {
  describe('TypedUArraysIndexOfTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0100
     * @tc.name testTypedUArraysIndexOf0202_001
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0200
     * @tc.name testTypedUArraysIndexOf0202_002
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(99)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0300
     * @tc.name testTypedUArraysIndexOf0202_003
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result + 1).assertEqual(2)
    });

    /**

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0400
     * @tc.name testTypedUArraysIndexOf0202_004
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result.toString()).assertEqual('1')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0500
     * @tc.name testTypedUArraysIndexOf0202_005
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(99)
      expect(result.toString()).assertEqual('-1')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0600
     * @tc.name testTypedUArraysIndexOf0202_006
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result | 0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0700
     * @tc.name testTypedUArraysIndexOf0202_007
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result || -1).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0800
     * @tc.name testTypedUArraysIndexOf0202_008
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.indexOf(42)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0900
     * @tc.name testTypedUArraysIndexOf0202_009
     * @tc.desc Verify indexOf() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(30)
      expect(result).assertEqual(arr.length - 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1000
     * @tc.name testTypedUArraysIndexOf0202_010
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 10, 20])
      let result = arr.indexOf(42)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1100
     * @tc.name testTypedUArraysIndexOf0202_011
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50])
      let result = arr.indexOf(30)
      expect(result).assertEqual(2)
      expect(result).assertEqual(Math.floor(arr.length / 2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1200
     * @tc.name testTypedUArraysIndexOf0202_012
     * @tc.desc Verify indexOf() fromIndex >= fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20])
      let result = arr.indexOf(20, 2)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1300
     * @tc.name testTypedUArraysIndexOf0202_013
     * @tc.desc Verify indexOf() fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20])
      let result = arr.indexOf(20, -2)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1400
     * @tc.name testTypedUArraysIndexOf0202_014
     * @tc.desc Verify indexOf() -1 [0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(99)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1500
     * @tc.name testTypedUArraysIndexOf0202_015
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result).assertEqual(1)
      expect(arr[result]).assertEqual(20)
    });

  });
}
