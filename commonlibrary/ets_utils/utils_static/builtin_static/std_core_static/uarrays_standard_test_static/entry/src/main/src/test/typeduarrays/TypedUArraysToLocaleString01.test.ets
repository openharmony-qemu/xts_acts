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

export default function typedUArraysToLocaleString01(): void {
  describe('TypedUArraysToLocaleString01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0100
     * @tc.name testTypedUArraysToLocaleString001
     * @tc.desc Verify toLocaleString 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0200
     * @tc.name testTypedUArraysToLocaleString002
     * @tc.desc Verify toLocaleString 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0300
     * @tc.name testTypedUArraysToLocaleString003
     * @tc.desc Verify toLocaleString 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0400
     * @tc.name testTypedUArraysToLocaleString004
     * @tc.desc Verify toLocaleString 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0500
     * @tc.name testTypedUArraysToLocaleString005
     * @tc.desc Verify toLocaleString 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0600
     * @tc.name testTypedUArraysToLocaleString006
     * @tc.desc Verify toLocaleString 1 locales=\"de-DE\" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1234, 5678]);
      let result = arr.toLocaleString("de-DE");
      expect(result.indexOf(",")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0700
     * @tc.name testTypedUArraysToLocaleString007
     * @tc.desc Verify toLocaleString 1 locales=\"de-DE\" Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1234, 5678]);
      let result = arr.toLocaleString("de-DE");
      expect(result.indexOf(",")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0800
     * @tc.name testTypedUArraysToLocaleString008
     * @tc.desc Verify toLocaleString 1 locales=\"de-DE\" BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1234n, 5678n]);
      let result = arr.toLocaleString("de-DE");
      expect(result.indexOf(",")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0900
     * @tc.name testTypedUArraysToLocaleString009
     * @tc.desc Verify toLocaleString 2 locales+options Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1234]);
      let result = arr.toLocaleString("en-US");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1000
     * @tc.name testTypedUArraysToLocaleString010
     * @tc.desc Verify toLocaleString 2 locales+options BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1234n]);
      let result = arr.toLocaleString("en-US");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1100
     * @tc.name testTypedUArraysToLocaleString011
     * @tc.desc Verify toLocaleString locales=\"en-US\" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([232]);
      let result = arr.toLocaleString("en-US");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1200
     * @tc.name testTypedUArraysToLocaleString012
     * @tc.desc Verify toLocaleString locales=\"de-DE\" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([232]);
      let result = arr.toLocaleString("de-DE");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1300
     * @tc.name testTypedUArraysToLocaleString013
     * @tc.desc Verify toLocaleString locales=\"en-US\" Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10000]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("10")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1400
     * @tc.name testTypedUArraysToLocaleString014
     * @tc.desc Verify toLocaleString locales=\"de-DE\" Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10000]);
      let result = arr.toLocaleString("de-DE");
      expect(result.indexOf("10")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1500
     * @tc.name testTypedUArraysToLocaleString015
     * @tc.desc Verify toLocaleString locales=\"en-US\" Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100000]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("100")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1600
     * @tc.name testTypedUArraysToLocaleString016
     * @tc.desc Verify toLocaleString locales=\"en-US\" BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100000n]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("100")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1700
     * @tc.name testTypedUArraysToLocaleString017
     * @tc.desc Verify toLocaleString locales=[\"en-US\"] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([200]);
      let result = arr.toLocaleString(["en-US"]);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1800
     * @tc.name testTypedUArraysToLocaleString018
     * @tc.desc Verify toLocaleString locales=[\"de-DE\"] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000n]);
      let result = arr.toLocaleString(["de-DE"]);
      expect(result.indexOf("1")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_1900
     * @tc.name testTypedUArraysToLocaleString019
     * @tc.desc Verify toLocaleString locales=\"zh-CN\" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([12345]);
      let result = arr.toLocaleString("zh-CN");
      expect(typeof result).assertEqual("string");
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2000
     * @tc.name testTypedUArraysToLocaleString020
     * @tc.desc Verify toLocaleString locales=\"ja-JP\" Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([12345]);
      let result = arr.toLocaleString("ja-JP");
      expect(typeof result).assertEqual("string");
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2100
     * @tc.name testTypedUArraysToLocaleString021
     * @tc.desc Verify toLocaleString locales=\"fr-FR\" Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([12345]);
      let result = arr.toLocaleString("fr-FR");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2200
     * @tc.name testTypedUArraysToLocaleString022
     * @tc.desc Verify toLocaleString locales=\"en-GB\" Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([12345]);
      let result = arr.toLocaleString("en-GB");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2300
     * @tc.name testTypedUArraysToLocaleString023
     * @tc.desc Verify toLocaleString options Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5]);
      let result = arr.toLocaleString("en-US");
      expect(result).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2400
     * @tc.name testTypedUArraysToLocaleString024
     * @tc.desc Verify toLocaleString options Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5]);
      let result = arr.toLocaleString("en-US");
      expect(result).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2500
     * @tc.name testTypedUArraysToLocaleString025
     * @tc.desc Verify toLocaleString options BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n]);
      let result = arr.toLocaleString("en-US");
      expect(result).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2600
     * @tc.name testTypedUArraysToLocaleString026
     * @tc.desc Verify toLocaleString options Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10000]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("10")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2700
     * @tc.name testTypedUArraysToLocaleString027
     * @tc.desc Verify toLocaleString options Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([16]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf(",")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2800
     * @tc.name testTypedUArraysToLocaleString028
     * @tc.desc Verify toLocaleString options BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([9999n]);
      let result = arr.toLocaleString("en-US");
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_2900
     * @tc.name testTypedUArraysToLocaleString029
     * @tc.desc Verify toLocaleString options style=decimal Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([123]);
      let result = arr.toLocaleString("en-US");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3000
     * @tc.name testTypedUArraysToLocaleString030
     * @tc.desc Verify toLocaleString options style=decimal BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([123n]);
      let result = arr.toLocaleString("en-US");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3100
     * @tc.name testTypedUArraysToLocaleString031
     * @tc.desc Verify toLocaleString options Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([123]);
      let result = arr.toLocaleString("en-US");
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3300
     * @tc.name testTypedUArraysToLocaleString033
     * @tc.desc Verify toLocaleString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(result.indexOf("1")).assertLarger(-1);
      expect(result.indexOf("2")).assertLarger(-1);
      expect(result.indexOf("3")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3400
     * @tc.name testTypedUArraysToLocaleString034
     * @tc.desc Verify toLocaleString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.toLocaleString();
      expect(result.indexOf(",")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3500
     * @tc.name testTypedUArraysToLocaleString035
     * @tc.desc Verify toLocaleString Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200]);
      let result = arr.toLocaleString();
      expect(result.indexOf("100")).assertLarger(-1);
      expect(result.indexOf("200")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3600
     * @tc.name testTypedUArraysToLocaleString036
     * @tc.desc Verify toLocaleString Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000]);
      let result = arr.toLocaleString();
      expect(result.indexOf("1")).assertLarger(-1);
      expect(result.indexOf("2")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3700
     * @tc.name testTypedUArraysToLocaleString037
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n]);
      let result = arr.toLocaleString();
      expect(result.indexOf("100")).assertLarger(-1);
      expect(result.indexOf("200")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3800
     * @tc.name testTypedUArraysToLocaleString038
     * @tc.desc Verify toLocaleString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_3900
     * @tc.name testTypedUArraysToLocaleString039
     * @tc.desc Verify toLocaleString Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4000
     * @tc.name testTypedUArraysToLocaleString040
     * @tc.desc Verify toLocaleString Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4100
     * @tc.name testTypedUArraysToLocaleString041
     * @tc.desc Verify toLocaleString Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4200
     * @tc.name testTypedUArraysToLocaleString042
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

  });
}
