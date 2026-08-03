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

export default function typedUArraysJoinTest01(): void {
  describe('TypedUArraysJoinTest01', (): void => {
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
     * @tc.name testTypedUArraysJoinTestFileA001
     * @tc.desc Verify - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0200
     * @tc.name testTypedUArraysJoinTestFileA002
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0300
     * @tc.name testTypedUArraysJoinTestFileA003
     * @tc.desc Verify - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("|");
      expect(result).assertEqual("1|2|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0900

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0400
     * @tc.name testTypedUArraysJoinTestFileA004
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.join("|");
      expect(result).assertEqual("1|2|3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0500
     * @tc.name testTypedUArraysJoinTestFileA005
     * @tc.desc Verify separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0600
     * @tc.name testTypedUArraysJoinTestFileA006
     * @tc.desc Verify separator "-"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("-");
      expect(result).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0700
     * @tc.name testTypedUArraysJoinTestFileA007
     * @tc.desc Verify separator " :: "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(" :: ");
      expect(result).assertEqual("1 :: 2 :: 3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0800
     * @tc.name testTypedUArraysJoinTestFileA008
     * @tc.desc Verify separator "|"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.join("|");
      expect(result).assertEqual("10|20|30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_0900
     * @tc.name testTypedUArraysJoinTestFileA009
     * @tc.desc Verify separator "\n"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("\n");
      expect(result).assertEqual("1\n2\n3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1000
     * @tc.name testTypedUArraysJoinTestFileA010
     * @tc.desc Verify separator Unicode " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("To");
      expect(result).assertEqual("1To2To3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1100
     * @tc.name testTypedUArraysJoinTestFileA011
     * @tc.desc Verify separator " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(",");
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1200
     * @tc.name testTypedUArraysJoinTestFileA012
     * @tc.desc Verify separator undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(undefined);
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1300
     * @tc.name testTypedUArraysJoinTestFileA013
     * @tc.desc Verify separator null "null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("null");
      expect(result).assertEqual("1null2null3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1400
     * @tc.name testTypedUArraysJoinTestFileA014
     * @tc.desc Verify separator 0 "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("0");
      expect(result).assertEqual("10203");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1500
     * @tc.name testTypedUArraysJoinTestFileA015
     * @tc.desc Verify separator -1 "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("-1");
      expect(result).assertEqual("1-12-13");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1600
     * @tc.name testTypedUArraysJoinTestFileA016
     * @tc.desc Verify separator true "true"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.join("true");
      expect(result).assertEqual("1true2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1700
     * @tc.name testTypedUArraysJoinTestFileA017
     * @tc.desc Verify separator false "false"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.join("false");
      expect(result).assertEqual("1false2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1800
     * @tc.name testTypedUArraysJoinTestFileA018
     * @tc.desc Verify separator "[object Object]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.join("[object Object]");
      expect(result).assertEqual("1[object Object]2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_1900
     * @tc.name testTypedUArraysJoinTestFileA019
     * @tc.desc Verify separator "1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let result = arr.join("1,2");
      expect(result).assertEqual("101,220");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2000
     * @tc.name testTypedUArraysJoinTestFileA020
     * @tc.desc Verify separator " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(" ");
      expect(result).assertEqual("1 2 3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2100
     * @tc.name testTypedUArraysJoinTestFileA021
     * @tc.desc Verify separator "."
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(".");
      expect(result).assertEqual("1.2.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2200
     * @tc.name testTypedUArraysJoinTestFileA022
     * @tc.desc Verify separator ";"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(";");
      expect(result).assertEqual("1;2;3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2300
     * @tc.name testTypedUArraysJoinTestFileA023
     * @tc.desc Verify separator "+"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("+");
      expect(result).assertEqual("1+2+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2400
     * @tc.name testTypedUArraysJoinTestFileA024
     * @tc.desc Verify separator "*"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("*");
      expect(result).assertEqual("1*2*3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2500
     * @tc.name testTypedUArraysJoinTestFileA025
     * @tc.desc Verify separator "="
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("=");
      expect(result).assertEqual("1=2=3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2600
     * @tc.name testTypedUArraysJoinTestFileA026
     * @tc.desc Verify separator ">"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(">");
      expect(result).assertEqual("1>2>3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2700
     * @tc.name testTypedUArraysJoinTestFileA027
     * @tc.desc Verify separator "<"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("<");
      expect(result).assertEqual("1<2<3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2800
     * @tc.name testTypedUArraysJoinTestFileA028
     * @tc.desc Verify separator "%"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("%");
      expect(result).assertEqual("1%2%3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_2900
     * @tc.name testTypedUArraysJoinTestFileA029
     * @tc.desc Verify separator "$"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("$");
      expect(result).assertEqual("1$2$3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3000
     * @tc.name testTypedUArraysJoinTestFileA030
     * @tc.desc Verify separator "#"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("#");
      expect(result).assertEqual("1#2#3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3100
     * @tc.name testTypedUArraysJoinTestFileA031
     * @tc.desc Verify separator "~"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("~");
      expect(result).assertEqual("1~2~3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3200
     * @tc.name testTypedUArraysJoinTestFileA032
     * @tc.desc Verify separator "`"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("`");
      expect(result).assertEqual("1`2`3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3300
     * @tc.name testTypedUArraysJoinTestFileA033
     * @tc.desc Verify separator "||"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("||");
      expect(result).assertEqual("1||2||3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3400
     * @tc.name testTypedUArraysJoinTestFileA034
     * @tc.desc Verify separator "->"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("->");
      expect(result).assertEqual("1->2->3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3500
     * @tc.name testTypedUArraysJoinTestFileA035
     * @tc.desc Verify separator "<-"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("<-");
      expect(result).assertEqual("1<-2<-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3600
     * @tc.name testTypedUArraysJoinTestFileA036
     * @tc.desc Verify separator "<=>"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("<=>");
      expect(result).assertEqual("1<=>2<=>3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3700
     * @tc.name testTypedUArraysJoinTestFileA037
     * @tc.desc Verify separator "_"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("_");
      expect(result).assertEqual("1_2_3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_4700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3800
     * @tc.name testTypedUArraysJoinTestFileA038
     * @tc.desc Verify separator ". "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(". ");
      expect(result).assertEqual("1. 2. 3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN0101_3900
     * @tc.name testTypedUArraysJoinTestFileA039
     * @tc.desc Verify separator "++"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoinTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join("++");
      expect(result).assertEqual("1++2++3");
    });

  });
}
