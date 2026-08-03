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
     * @tc.name testTypedUArraysIndexOfTestFileC001
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0200
     * @tc.name testTypedUArraysIndexOfTestFileC002
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result + 1).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0300
     * @tc.name testTypedUArraysIndexOfTestFileC003
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result.toString()).assertEqual('1')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0400
     * @tc.name testTypedUArraysIndexOfTestFileC004
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(99)
      expect(result.toString()).assertEqual('-1')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0500
     * @tc.name testTypedUArraysIndexOfTestFileC005
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result | 0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0600
     * @tc.name testTypedUArraysIndexOfTestFileC006
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result || -1).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0700
     * @tc.name testTypedUArraysIndexOfTestFileC007
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.indexOf(42)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0800
     * @tc.name testTypedUArraysIndexOfTestFileC008
     * @tc.desc Verify indexOf() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(30)
      expect(result).assertEqual(arr.length - 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_0900
     * @tc.name testTypedUArraysIndexOfTestFileC009
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 10, 20])
      let result = arr.indexOf(42)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1000
     * @tc.name testTypedUArraysIndexOfTestFileC010
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50])
      let result = arr.indexOf(30)
      expect(result).assertEqual(2)
      expect(result).assertEqual(Math.floor(arr.length / 2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1100
     * @tc.name testTypedUArraysIndexOfTestFileC011
     * @tc.desc Verify indexOf() fromIndex >= fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20])
      let result = arr.indexOf(20, 2)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1200
     * @tc.name testTypedUArraysIndexOfTestFileC012
     * @tc.desc Verify indexOf() fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20])
      let result = arr.indexOf(20, -2)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1300
     * @tc.name testTypedUArraysIndexOfTestFileC013
     * @tc.desc Verify indexOf() -1 [0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(99)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0202_1400
     * @tc.name testTypedUArraysIndexOfTestFileC014
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOfTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(result).assertEqual(1)
      expect(arr[result]).assertEqual(20)
    });
  });
}
