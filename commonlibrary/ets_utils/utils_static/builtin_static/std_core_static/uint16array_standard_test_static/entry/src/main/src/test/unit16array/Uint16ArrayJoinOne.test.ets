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

export default function uint16ArrayJoin01Test(): void {
  describe('Uint16ArrayJoin01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0001
     * @tc.name testUint16ArrayJoinOne001
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0002
     * @tc.name testUint16ArrayJoinOne002
     * @tc.desc Verify join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join(",");
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0003
     * @tc.name testUint16ArrayJoinOne003
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.join();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0004
     * @tc.name testUint16ArrayJoinOne004
     * @tc.desc Verify length 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const result = arr.join();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0005
     * @tc.name testUint16ArrayJoinOne005
     * @tc.desc Verify join() "65535"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0006
     * @tc.name testUint16ArrayJoinOne006
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join();
      expect(result).assertEqual("1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0007
     * @tc.name testUint16ArrayJoinOne007
     * @tc.desc Verify join("")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join("");
      expect(result).assertEqual("12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0008
     * @tc.name testUint16ArrayJoinOne008
     * @tc.desc Verify join("|")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join("|");
      expect(result).assertEqual("1|2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0009
     * @tc.name testUint16ArrayJoinOne009
     * @tc.desc Verify join(" ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join(" ");
      expect(result).assertEqual("1 2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0010
     * @tc.name testUint16ArrayJoinOne010
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join();
      expect(result).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0011
     * @tc.name testUint16ArrayJoinOne011
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join();
      expect(result).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0012
     * @tc.name testUint16ArrayJoinOne012
     * @tc.desc Verify join with an empty separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join("");
      expect(result).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0013
     * @tc.name testUint16ArrayJoinOne013
     * @tc.desc Verify join with a vertical bar separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join("|");
      expect(result).assertEqual("1|2|3|4|5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0014
     * @tc.name testUint16ArrayJoinOne014
     * @tc.desc Verify join with a space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join(" ");
      expect(result).assertEqual("1 2 3 4 5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0015
     * @tc.name testUint16ArrayJoinOne015
     * @tc.desc Verify join with a hyphen separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join("-");
      expect(result).assertEqual("1-2-3-4-5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0016
     * @tc.name testUint16ArrayJoinOne016
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.join();
      expect(result).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0017
     * @tc.name testUint16ArrayJoinOne017
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535);
      const result = arr.join();
      expect(result).assertEqual("65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0018
     * @tc.name testUint16ArrayJoinOne018
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 32768);
      const result = arr.join();
      expect(result).assertEqual("0,65535,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0019
     * @tc.name testUint16ArrayJoinOne019
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7);
      const result = arr.join();
      expect(result).assertEqual("7,7,7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0020
     * @tc.name testUint16ArrayJoinOne020
     * @tc.desc Verify join repeats a separator between equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7);
      const result = arr.join("|");
      expect(result).assertEqual("7|7|7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0021
     * @tc.name testUint16ArrayJoinOne021
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0, 0, 0);
      const result = arr.join();
      expect(result).assertEqual("0,0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0022
     * @tc.name testUint16ArrayJoinOne022
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535, 65535);
      const result = arr.join();
      expect(result).assertEqual("65535,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0023
     * @tc.name testUint16ArrayJoinOne023
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(32768, 32768, 32768);
      const result = arr.join();
      expect(result).assertEqual("32768,32768,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0024
     * @tc.name testUint16ArrayJoinOne024
     * @tc.desc Verify join formats minimum and maximum values with a hyphen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 65535);
      const result = arr.join("-");
      expect(result).assertEqual("1-65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0025
     * @tc.name testUint16ArrayJoinOne025
     * @tc.desc Verify join formats boundary values with a colon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 32768, 65535);
      const result = arr.join(":");
      expect(result).assertEqual("0:32768:65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0026
     * @tc.name testUint16ArrayJoinOne026
     * @tc.desc Verify join formats alternating maximum and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0, 65535);
      const result = arr.join("|");
      expect(result).assertEqual("65535|0|65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0027
     * @tc.name testUint16ArrayJoinOne027
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65534, 65535, 0, 1);
      const result = arr.join();
      expect(result).assertEqual("65534,65535,0,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0028
     * @tc.name testUint16ArrayJoinOne028
     * @tc.desc Verify join formats two zero values with a vertical bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0);
      const result = arr.join("|");
      expect(result).assertEqual("0|0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0029
     * @tc.name testUint16ArrayJoinOne029
     * @tc.desc Verify join formats two maximum values with a vertical bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535);
      const result = arr.join("|");
      expect(result).assertEqual("65535|65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0030
     * @tc.name testUint16ArrayJoinOne030
     * @tc.desc Verify join formats zero and maximum with a vertical bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535);
      const result = arr.join("|");
      expect(result).assertEqual("0|65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0031
     * @tc.name testUint16ArrayJoinOne031
     * @tc.desc Verify 65536 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0032
     * @tc.name testUint16ArrayJoinOne032
     * @tc.desc Verify -1 65535 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-1);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0033
     * @tc.name testUint16ArrayJoinOne033
     * @tc.desc Verify -2 65534 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-2);
      const result = arr.join();
      expect(result).assertEqual("65534");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0034
     * @tc.name testUint16ArrayJoinOne034
     * @tc.desc Verify 3.14 3 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(3.14);
      const result = arr.join();
      expect(result).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0035
     * @tc.name testUint16ArrayJoinOne035
     * @tc.desc Verify 65535.9 65535 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535.9);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0036
     * @tc.name testUint16ArrayJoinOne036
     * @tc.desc Verify -0.5 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-0.5);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0037
     * @tc.name testUint16ArrayJoinOne037
     * @tc.desc Verify NaN 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(Number.NaN);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0038
     * @tc.name testUint16ArrayJoinOne038
     * @tc.desc Verify Infinity 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0039
     * @tc.name testUint16ArrayJoinOne039
     * @tc.desc Verify -Infinity 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0040
     * @tc.name testUint16ArrayJoinOne040
     * @tc.desc Verify 65536*2 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536 * 2);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0041
     * @tc.name testUint16ArrayJoinOne041
     * @tc.desc Verify 65536+1 1 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536 + 1);
      const result = arr.join();
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0042
     * @tc.name testUint16ArrayJoinOne042
     * @tc.desc Verify 65536+65535 65535 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536 + 65535);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0043
     * @tc.name testUint16ArrayJoinOne043
     * @tc.desc Verify -65536 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-65536);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0044
     * @tc.name testUint16ArrayJoinOne044
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536, -1, 3.14, Number.NaN, Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual("0,65535,3,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0045
     * @tc.name testUint16ArrayJoinOne045
     * @tc.desc Verify 1.999 1 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1.999);
      const result = arr.join();
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0046
     * @tc.name testUint16ArrayJoinOne046
     * @tc.desc Verify 10 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.join();
      expect(result).assertEqual("0,1,2,3,4,5,6,7,8,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0047
     * @tc.name testUint16ArrayJoinOne047
     * @tc.desc Verify 10 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.join("");
      expect(result).assertEqual("0123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0048
     * @tc.name testUint16ArrayJoinOne048
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.join("|");
      expect(result).assertEqual("0|1|2|3|4|5|6|7|8|9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0049
     * @tc.name testUint16ArrayJoinOne049
     * @tc.desc Verify 100 1 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr.fill(1);
      const result = arr.join();
      const expected = "1" + ",1".repeat(99);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0050
     * @tc.name testUint16ArrayJoinOne050
     * @tc.desc Verify 100 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr.fill(1);
      const result = arr.join("|");
      const expected = "1" + "|1".repeat(99);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0051
     * @tc.name testUint16ArrayJoinOne051
     * @tc.desc Verify 100 500join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300, 400, 500);
      const result = arr.join();
      expect(result).assertEqual("100,200,300,400,500");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0052
     * @tc.name testUint16ArrayJoinOne052
     * @tc.desc Verify new Uint16Array(FixedArray) join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: FixedArray<int> = [1, 2, 3];
      const arr = new Uint16Array(src);
      const result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0053
     * @tc.name testUint16ArrayJoinOne053
     * @tc.desc Verify new Uint16Array(length) join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      const result = arr.join();
      expect(result).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0054
     * @tc.name testUint16ArrayJoinOne054
     * @tc.desc Verify Uint16Array.from() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.from([1, 2, 3]);
      const result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_ONE_0055
     * @tc.name testUint16ArrayJoinOne055
     * @tc.desc Verify Uint16Array.from() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.from([1, 2, 3]);
      const result = arr.join("|");
      expect(result).assertEqual("1|2|3");
    });

  });
}
