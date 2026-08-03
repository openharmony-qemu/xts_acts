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

export default function typedUArraysJoinTest06(): void {
  describe('TypedUArraysJoinTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0100
     * @tc.name testTypedUArraysJoinTestFileF001
     * @tc.desc Verify separator " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(";");
      expect(result).assertEqual("1;2;3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0200
     * @tc.name testTypedUArraysJoinTestFileF002
     * @tc.desc Verify separator " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(":");
      expect(result).assertEqual("1:2:3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0300
     * @tc.name testTypedUArraysJoinTestFileF003
     * @tc.desc Verify separator " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("()");
      expect(result).assertEqual("1()2()3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_5300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0400
     * @tc.name testTypedUArraysJoinTestFileF004
     * @tc.desc Verify separator "[]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("[]");
      expect(result).assertEqual("1[]2[]3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0500
     * @tc.name testTypedUArraysJoinTestFileF005
     * @tc.desc Verify separator "{}"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("{}");
      expect(result).assertEqual("1{}2{}3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0600
     * @tc.name testTypedUArraysJoinTestFileF006
     * @tc.desc Verify separator " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0700
     * @tc.name testTypedUArraysJoinTestFileF007
     * @tc.desc Verify separator '""'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("\"\"");
      expect(result).assertEqual("1\"\"2\"\"3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0800
     * @tc.name testTypedUArraysJoinTestFileF008
     * @tc.desc Verify separator "''"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("''");
      expect(result).assertEqual("1''2''3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_5900

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0900
     * @tc.name testTypedUArraysJoinTestFileF009
     * @tc.desc Verify separator ","
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1000
     * @tc.name testTypedUArraysJoinTestFileF010
     * @tc.desc Verify separator "."
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(".");
      expect(result).assertEqual("1.2.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_6200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1100
     * @tc.name testTypedUArraysJoinTestFileF011
     * @tc.desc Verify separator "!"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("!");
      expect(result).assertEqual("1!2!3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1200
     * @tc.name testTypedUArraysJoinTestFileF012
     * @tc.desc Verify separator "\\"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("\\");
      expect(result).assertEqual("1\\2\\3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1300
     * @tc.name testTypedUArraysJoinTestFileF013
     * @tc.desc Verify separator "|"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("|");
      expect(result).assertEqual("1|2|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1400
     * @tc.name testTypedUArraysJoinTestFileF014
     * @tc.desc Verify separator "\\|"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("\\|");
      expect(result).assertEqual("1\\|2\\|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1500
     * @tc.name testTypedUArraysJoinTestFileF015
     * @tc.desc Verify separator "/|"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("/|");
      expect(result).assertEqual("1/|2/|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1600
     * @tc.name testTypedUArraysJoinTestFileF016
     * @tc.desc Verify separator "|/"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("|/");
      expect(result).assertEqual("1|/2|/3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1700
     * @tc.name testTypedUArraysJoinTestFileF017
     * @tc.desc Verify separator ".."
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("..");
      expect(result).assertEqual("1..2..3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1800
     * @tc.name testTypedUArraysJoinTestFileF018
     * @tc.desc Verify separator "..."
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("...");
      expect(result).assertEqual("1...2...3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1900
     * @tc.name testTypedUArraysJoinTestFileF019
     * @tc.desc Verify separator "----"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("----");
      expect(result).assertEqual("1----2----3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2000
     * @tc.name testTypedUArraysJoinTestFileF020
     * @tc.desc Verify separator "=="
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("==");
      expect(result).assertEqual("1==2==3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2100
     * @tc.name testTypedUArraysJoinTestFileF021
     * @tc.desc Verify separator "++"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("++");
      expect(result).assertEqual("1++2++3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2200
     * @tc.name testTypedUArraysJoinTestFileF022
     * @tc.desc Verify separator "--"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("--");
      expect(result).assertEqual("1--2--3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2300
     * @tc.name testTypedUArraysJoinTestFileF023
     * @tc.desc Verify separator "**"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("**");
      expect(result).assertEqual("1**2**3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2400
     * @tc.name testTypedUArraysJoinTestFileF024
     * @tc.desc Verify separator "%%"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("%%");
      expect(result).assertEqual("1%%2%%3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2500
     * @tc.name testTypedUArraysJoinTestFileF025
     * @tc.desc Verify separator "$$"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("$$");
      expect(result).assertEqual("1$$2$$3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2600
     * @tc.name testTypedUArraysJoinTestFileF026
     * @tc.desc Verify separator "##"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("##");
      expect(result).assertEqual("1##2##3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2700
     * @tc.name testTypedUArraysJoinTestFileF027
     * @tc.desc Verify separator "~~"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("~~");
      expect(result).assertEqual("1~~2~~3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2800
     * @tc.name testTypedUArraysJoinTestFileF028
     * @tc.desc Verify separator "``"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("``");
      expect(result).assertEqual("1``2``3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2900
     * @tc.name testTypedUArraysJoinTestFileF029
     * @tc.desc Verify separator "__"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("__");
      expect(result).assertEqual("1__2__3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3000
     * @tc.name testTypedUArraysJoinTestFileF030
     * @tc.desc Verify Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      let result = arr.join("");
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3100
     * @tc.name testTypedUArraysJoinTestFileF031
     * @tc.desc Verify Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      let result = arr.join("");
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3200
     * @tc.name testTypedUArraysJoinTestFileF032
     * @tc.desc Verify Uint8Array 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127]);
      let result = arr.join("");
      expect(result).assertEqual("127");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3300
     * @tc.name testTypedUArraysJoinTestFileF033
     * @tc.desc Verify Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      let result = arr.join("");
      expect(result).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3400
     * @tc.name testTypedUArraysJoinTestFileF034
     * @tc.desc Verify Uint8Array 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF]);
      let result = arr.join("");
      expect(result).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_8700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_8800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3500
     * @tc.name testTypedUArraysJoinTestFileF035
     * @tc.desc Verify Uint16Array 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767]);
      let result = arr.join("");
      expect(result).assertEqual("32767");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3600
     * @tc.name testTypedUArraysJoinTestFileF036
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      let result = arr.join("");
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3700
     * @tc.name testTypedUArraysJoinTestFileF037
     * @tc.desc Verify Uint16Array 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF]);
      let result = arr.join("");
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_9200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_9300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3800
     * @tc.name testTypedUArraysJoinTestFileF038
     * @tc.desc Verify Uint32Array 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647]);
      let result = arr.join("");
      expect(result).assertEqual("2147483647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3900
     * @tc.name testTypedUArraysJoinTestFileF039
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      let result = arr.join("");
      expect(result).assertEqual("4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_4000
     * @tc.name testTypedUArraysJoinTestFileF040
     * @tc.desc Verify Uint32Array 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileF040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF]);
      let result = arr.join("");
      expect(result).assertEqual("4294967295");
    });


  });
}
