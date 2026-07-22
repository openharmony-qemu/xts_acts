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

export default function typedUArraysToLocaleString02(): void {
  describe('TypedUArraysToLocaleString02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4500
     * @tc.name testTypedUArraysToLocaleString045
     * @tc.desc Verify toLocaleString Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4600
     * @tc.name testTypedUArraysToLocaleString046
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4700
     * @tc.name testTypedUArraysToLocaleString047
     * @tc.desc Verify toLocaleString Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.toLocaleString();
      const parts = result.split(",");
      expect(parts.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4800
     * @tc.name testTypedUArraysToLocaleString048
     * @tc.desc Verify toLocaleString locales Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        let result = arr.toLocaleString("invalid_locale_xxx");
        expect(typeof result).assertEqual("string");
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_4900
     * @tc.name testTypedUArraysToLocaleString049
     * @tc.desc Verify toLocaleString locales BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysToLocaleString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      try {
        let result = arr.toLocaleString("invalid_locale_xxx");
        expect(typeof result).assertEqual("string");
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5100
     * @tc.name testTypedUArraysToLocaleString051
     * @tc.desc Verify toLocaleString locales=undefined Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.toLocaleString(undefined);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5300
     * @tc.name testTypedUArraysToLocaleString053
     * @tc.desc Verify toLocaleString locales= Uint8Array locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysToLocaleString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        let result = arr.toLocaleString("");
        expect(typeof result).assertEqual("string");
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5400
     * @tc.name testTypedUArraysToLocaleString054
     * @tc.desc Verify toLocaleString locales Uint8Array locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toLocaleString([] as string[]);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5500
     * @tc.name testTypedUArraysToLocaleString055
     * @tc.desc Verify toLocaleString options=null Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysToLocaleString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toLocaleString("en-US", undefined);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5600
     * @tc.name testTypedUArraysToLocaleString056
     * @tc.desc Verify toLocaleString Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 255]);
      let result = arr.toLocaleString();
      expect(result.indexOf("255")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5700
     * @tc.name testTypedUArraysToLocaleString057
     * @tc.desc Verify toLocaleString Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5800
     * @tc.name testTypedUArraysToLocaleString058
     * @tc.desc Verify toLocaleString Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      let result = arr.toLocaleString();
      expect(result.indexOf("65")).assertLarger(-1);
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_5900
     * @tc.name testTypedUArraysToLocaleString059
     * @tc.desc Verify toLocaleString Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6000
     * @tc.name testTypedUArraysToLocaleString060
     * @tc.desc Verify toLocaleString Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      let result = arr.toLocaleString();
      expect(result.indexOf("4")).assertLarger(-1);
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6100
     * @tc.name testTypedUArraysToLocaleString061
     * @tc.desc Verify toLocaleString Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6200
     * @tc.name testTypedUArraysToLocaleString062
     * @tc.desc Verify toLocaleString Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      let result = arr.toLocaleString();
      expect(result.indexOf("255")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6300
     * @tc.name testTypedUArraysToLocaleString063
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual("string");
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6400
     * @tc.name testTypedUArraysToLocaleString064
     * @tc.desc Verify toLocaleString BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6500
     * @tc.name testTypedUArraysToLocaleString065
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000000000000n]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf(",")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6600
     * @tc.name testTypedUArraysToLocaleString066
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000000000000n]);
      let result = arr.toLocaleString("de-DE");
      expect(result.indexOf(".")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6700
     * @tc.name testTypedUArraysToLocaleString067
     * @tc.desc Verify toLocaleString Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = arr.toLocaleString();
      const parts = result.split(",");
      expect(parts.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6800
     * @tc.name testTypedUArraysToLocaleString068
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.toLocaleString();
      const parts = result.split(",");
      expect(parts.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_6900
     * @tc.name testTypedUArraysToLocaleString069
     * @tc.desc Verify toLocaleString Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10000, 20000]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("10")).assertLarger(-1);
      expect(result.indexOf("20")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7000
     * @tc.name testTypedUArraysToLocaleString070
     * @tc.desc Verify toLocaleString Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100000, 200000]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("100")).assertLarger(-1);
      expect(result.indexOf("200")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7100
     * @tc.name testTypedUArraysToLocaleString071
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("5")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7200
     * @tc.name testTypedUArraysToLocaleString072
     * @tc.desc Verify toLocaleString Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      let result = arr.toLocaleString();
      expect(result.indexOf("0")).assertLarger(-1);
      expect(result.indexOf("128")).assertLarger(-1);
      expect(result.indexOf("255")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7300
     * @tc.name testTypedUArraysToLocaleString073
     * @tc.desc Verify toLocaleString BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7400
     * @tc.name testTypedUArraysToLocaleString074
     * @tc.desc Verify toLocaleString Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128]);
      let result = arr.toLocaleString();
      expect(result).assertEqual("128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7500
     * @tc.name testTypedUArraysToLocaleString075
     * @tc.desc Verify toLocaleString locales="en-US" Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      let result = arr.toLocaleString("en-US");
      expect(result).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7600
     * @tc.name testTypedUArraysToLocaleString076
     * @tc.desc Verify toLocaleString locales="fr-FR" Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([12345]);
      let result = arr.toLocaleString("fr-FR");
      expect(result.indexOf(" ") > -1 || result.indexOf(" ") > -1 || result.indexOf(",") > -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7700
     * @tc.name testTypedUArraysToLocaleString077
     * @tc.desc Verify toLocaleString locales="en-US" options minimumFractionDigits Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([123]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("123")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_7900
     * @tc.name testTypedUArraysToLocaleString079
     * @tc.desc Verify toLocaleString locales="en-US" Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([12345]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("12")).assertLarger(-1);
      expect(result.indexOf("345")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8000
     * @tc.name testTypedUArraysToLocaleString080
     * @tc.desc Verify toLocaleString locales="zh-CN" Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([12345]);
      let result = arr.toLocaleString("zh-CN");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8100
     * @tc.name testTypedUArraysToLocaleString081
     * @tc.desc Verify toLocaleString locales="ko-KR" BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([12345n]);
      let result = arr.toLocaleString("ko-KR");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8200
     * @tc.name testTypedUArraysToLocaleString082
     * @tc.desc Verify toLocaleString locales="ar-SA" Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1234]);
      let result = arr.toLocaleString("ar-SA");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8300
     * @tc.name testTypedUArraysToLocaleString083
     * @tc.desc Verify toLocaleString locales="ja-JP" options Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([16]);
      let result = arr.toLocaleString("ja-JP");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8500
     * @tc.name testTypedUArraysToLocaleString085
     * @tc.desc Verify toLocaleString locales="en-US" Uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000000]);
      let result = arr.toLocaleString("en-US");
      expect(result.indexOf("1")).assertLarger(-1);
      expect(result.indexOf("000")).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8600
     * @tc.name testTypedUArraysToLocaleString086
     * @tc.desc Verify toLocaleString locales="de-DE" Uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000000]);
      let result = arr.toLocaleString("de-DE");
      expect(typeof result).assertEqual("string");
      expect(result.indexOf(",")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_8700
     * @tc.name testTypedUArraysToLocaleString087
     * @tc.desc Verify toLocaleString locales="en-US" BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      let result = arr.toLocaleString("en-US");
      expect(result.length).assertLarger(0);
    });

  });
}
