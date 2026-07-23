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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0100
     * @tc.name testUint16ArrayJoinTwo001
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 22, 333);
      const result = arr.join();
      expect(result).assertEqual("1,22,333");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0200
     * @tc.name testUint16ArrayJoinTwo002
     * @tc.desc Verify join("")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join("");
      expect(result).assertEqual("102030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0300
     * @tc.name testUint16ArrayJoinTwo003
     * @tc.desc Verify join() toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual("10,20,30");
      expect(toStringResult).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0400
     * @tc.name testUint16ArrayJoinTwo004
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(99);
      const result = arr.join("|");
      expect(result).assertEqual("99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0500
     * @tc.name testUint16ArrayJoinTwo005
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const before = arr.join();
      const after = arr.join();
      expect(before).assertEqual("1,2,3");
      expect(after).assertEqual("1,2,3");
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0600
     * @tc.name testUint16ArrayJoinTwo006
     * @tc.desc Verify empty array join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0700
     * @tc.name testUint16ArrayJoinTwo007
     * @tc.desc Verify single element 0 join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0800
     * @tc.name testUint16ArrayJoinTwo008
     * @tc.desc Verify single element 65535 join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_0900
     * @tc.name testUint16ArrayJoinTwo009
     * @tc.desc Verify all elements equal 65535 join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535, 65535);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("65535,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_1000
     * @tc.name testUint16ArrayJoinTwo010
     * @tc.desc Verify boundary values (0, 32768, 65535) join() and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 32768, 65535);
      const joinResult = arr.join();
      const toStringResult = arr.toString();
      expect(joinResult).assertEqual(toStringResult);
      expect(joinResult).assertEqual("0,32768,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_1100
     * @tc.name testUint16ArrayJoinTwo011
     * @tc.desc Verify custom separator "-" and toString() equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const joinResultComma = arr.join();
      const toStringResult = arr.toString();
      const joinResultDash = arr.join("-");
      expect(joinResultComma).assertEqual(toStringResult);
      expect(joinResultDash).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_1200
     * @tc.name testUint16ArrayJoinTwo012
     * @tc.desc Verify custom separator " " (space) and toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const joinResultSpace = arr.join(" ");
      const joinResultComma = arr.join();
      const toStringResult = arr.toString();
      expect(joinResultComma).assertEqual(toStringResult);
      expect(joinResultSpace).assertEqual("10 20 30 40 50");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN_TWO_1300
     * @tc.name testUint16ArrayJoinTwo013
     * @tc.desc Verify join reads current values only from a shared nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoinTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 1, 2, 3, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      let alias: Uint16Array = new Uint16Array(backing.buffer);
      alias[2] = 7;
      expect(view.join('-')).assertEqual('1-7-3');
    });

  });
}
