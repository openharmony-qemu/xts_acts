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

export default function uint16ArrayJoin02Test(): void {
  describe('Uint16ArrayJoin02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0100
     * @tc.name testUint16ArrayJoin02_001
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 22, 333);
      const result = arr.join();
      expect(result).assertEqual("1,22,333");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0200
     * @tc.name testUint16ArrayJoin02_002
     * @tc.desc Verify join("")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join("");
      expect(result).assertEqual("102030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0300
     * @tc.name testUint16ArrayJoin02_003
     * @tc.desc Verify join() toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual("10,20,30");
      expect(toStringResult).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0400
     * @tc.name testUint16ArrayJoin02_004
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(99);
      const result = arr.join("|");
      expect(result).assertEqual("99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0500
     * @tc.name testUint16ArrayJoin02_005
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const before = arr.join();
      const after = arr.join();
      expect(before).assertEqual("1,2,3");
      expect(after).assertEqual("1,2,3");
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0600
     * @tc.name testUint16ArrayJoin02_006
     * @tc.desc Verify empty array join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0700
     * @tc.name testUint16ArrayJoin02_007
     * @tc.desc Verify single element 0 join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0800
     * @tc.name testUint16ArrayJoin02_008
     * @tc.desc Verify single element 65535 join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_0900
     * @tc.name testUint16ArrayJoin02_009
     * @tc.desc Verify all elements equal 65535 join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535, 65535);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("65535,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_1000
     * @tc.name testUint16ArrayJoin02_010
     * @tc.desc Verify boundary values (0, 32768, 65535) join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 32768, 65535);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("0,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_1100
     * @tc.name testUint16ArrayJoin02_011
     * @tc.desc Verify custom separator "-" and toString() equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const joinResultComma = arr.join();
      const toStringResult = arr.toString();
      const joinResultDash = arr.join("-");
      expect(joinResultComma).assertEqual(toStringResult);
      expect(joinResultDash).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_1200
     * @tc.name testUint16ArrayJoin02_012
     * @tc.desc Verify custom separator " " (space) and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const joinResultSpace = arr.join(" ");
      const joinResultComma = arr.join();
      const toStringResult = arr.toString();
      expect(joinResultComma).assertEqual(toStringResult);
      expect(joinResultSpace).assertEqual("10 20 30 40 50");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN02_1300
     * @tc.name testUint16ArrayJoin02_013
     * @tc.desc Verify join reads current values only from a shared nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 1, 2, 3, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      let alias: Uint16Array = new Uint16Array(backing.buffer);
      alias[2] = 7;
      expect(view.join('-')).assertEqual('1-7-3');
    });

  });
}
