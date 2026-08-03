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

export default function uint16ArrayToReversedTest(): void {
  describe('Uint16ArrayToReversedTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0100
     * @tc.name testUint16ArrayToReversed001
      * @tc.desc Verify reversing an empty array returns an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      let result: Uint16Array = arr.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0200
     * @tc.name testUint16ArrayToReversed002
      * @tc.desc Verify reversing a single zero preserves its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0300
     * @tc.name testUint16ArrayToReversed003
      * @tc.desc Verify reversing a single maximum Uint16 value preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0400
     * @tc.name testUint16ArrayToReversed004
      * @tc.desc Verify reversing a single ordinary value preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0500
     * @tc.name testUint16ArrayToReversed005
      * @tc.desc Verify reversing a single midpoint Uint16 value preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0600
     * @tc.name testUint16ArrayToReversed006
      * @tc.desc Verify reversing a single sentinel value preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0700
     * @tc.name testUint16ArrayToReversed007
      * @tc.desc Verify a reversed single-element result retains length one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(99);
      let result: Uint16Array = arr.toReversed();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0800
     * @tc.name testUint16ArrayToReversed008
     * @tc.desc Verify [0, 1] toReversed [1, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_0900
     * @tc.name testUint16ArrayToReversed009
     * @tc.desc Verify [1, 0] toReversed [0, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 0);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1000
     * @tc.name testUint16ArrayToReversed010
     * @tc.desc Verify [65535, 0] toReversed [0, 65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1100
     * @tc.name testUint16ArrayToReversed011
     * @tc.desc Verify [0, 65535] toReversed [65535, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1200
     * @tc.name testUint16ArrayToReversed012
     * @tc.desc Verify [100, 200] toReversed [200, 100]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(200);
      expect(result[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1300
     * @tc.name testUint16ArrayToReversed013
     * @tc.desc Verify [32768, 65535] toReversed [65535, 32768]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768, 65535);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1400
     * @tc.name testUint16ArrayToReversed014
     * @tc.desc Verify [1, 2, 3] toReversed [3, 2, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1500
     * @tc.name testUint16ArrayToReversed015
     * @tc.desc Verify [3, 2, 1] toReversed [1, 2, 3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1600
     * @tc.name testUint16ArrayToReversed016
     * @tc.desc Verify [0, 0, 0] toReversed [0, 0, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1700
     * @tc.name testUint16ArrayToReversed017
     * @tc.desc Verify 65535 toReversed 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(65535);
      expect(result[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1800
     * @tc.name testUint16ArrayToReversed018
     * @tc.desc Verify [0, 65535, 0] toReversed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 0);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(65535);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_1900
     * @tc.name testUint16ArrayToReversed019
     * @tc.desc Verify [1, 2, 1] toReversed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2000
     * @tc.name testUint16ArrayToReversed020
     * @tc.desc Verify [1, 2, 3, 4] toReversed [4, 3, 2, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2100
     * @tc.name testUint16ArrayToReversed021
     * @tc.desc Verify [4, 3, 2, 1] toReversed [1, 2, 3, 4]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 3, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2200
     * @tc.name testUint16ArrayToReversed022
     * @tc.desc Verify [0, 1, 2, 3] toReversed [3, 2, 1, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 2, 3);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2300
     * @tc.name testUint16ArrayToReversed023
     * @tc.desc Verify [100, 200, 300, 400] toReversed [400, 300, 200, 100]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300, 400);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(400);
      expect(result[1]).assertEqual(300);
      expect(result[2]).assertEqual(200);
      expect(result[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2400
     * @tc.name testUint16ArrayToReversed024
     * @tc.desc Verify [1, 2, 2, 1] toReversed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2500
     * @tc.name testUint16ArrayToReversed025
     * @tc.desc Verify [1, 2, 3, 4, 5] toReversed [5, 4, 3, 2, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2600
     * @tc.name testUint16ArrayToReversed026
     * @tc.desc Verify [5, 4, 3, 2, 1] toReversed [1, 2, 3, 4, 5]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 4, 3, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2700
     * @tc.name testUint16ArrayToReversed027
     * @tc.desc Verify [0, 1, 2, 3, 4] toReversed [4, 3, 2, 1, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 2, 3, 4);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2800
     * @tc.name testUint16ArrayToReversed028
     * @tc.desc Verify [10, 20, 30, 40, 50] toReversed [50, 40, 30, 20, 10]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(50);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(30);
      expect(result[3]).assertEqual(20);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_2900
     * @tc.name testUint16ArrayToReversed029
     * @tc.desc Verify [1, 2, 3, 2, 1] toReversed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3000
     * @tc.name testUint16ArrayToReversed030
     * @tc.desc Verify [1, 1, 2, 2, 3, 3] toReversed [3, 3, 2, 2, 1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 1, 2, 2, 3, 3);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
      expect(result[5]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3100
     * @tc.name testUint16ArrayToReversed031
     * @tc.desc Verify [0, 0, 0, 1, 1, 1] toReversed [1, 1, 1, 0, 0, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0, 1, 1, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(result[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3200
     * @tc.name testUint16ArrayToReversed032
     * @tc.desc Verify [6, 5, 4, 3, 2, 1] toReversed [1, 2, 3, 4, 5, 6]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(6, 5, 4, 3, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3300
     * @tc.name testUint16ArrayToReversed033
     * @tc.desc Verify [1, 2, 3, 4, 5, 6] toReversed [6, 5, 4, 3, 2, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(2);
      expect(result[5]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3400
     * @tc.name testUint16ArrayToReversed034
     * @tc.desc Verify [10, 20, 30, 40, 50, 60, 70, 80] toReversed [80, 70, 60, 50, 40, 30, 20, 10]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(80);
      expect(result[1]).assertEqual(70);
      expect(result[2]).assertEqual(60);
      expect(result[3]).assertEqual(50);
      expect(result[4]).assertEqual(40);
      expect(result[5]).assertEqual(30);
      expect(result[6]).assertEqual(20);
      expect(result[7]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3500
     * @tc.name testUint16ArrayToReversed035
     * @tc.desc Verify [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] toReversed [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertEqual(8);
      expect(result[3]).assertEqual(7);
      expect(result[4]).assertEqual(6);
      expect(result[5]).assertEqual(5);
      expect(result[6]).assertEqual(4);
      expect(result[7]).assertEqual(3);
      expect(result[8]).assertEqual(2);
      expect(result[9]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3600
     * @tc.name testUint16ArrayToReversed036
      * @tc.desc Verify reversing three values returns reversed content without mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3700
     * @tc.name testUint16ArrayToReversed037
     * @tc.desc Verify toReversed with irregular three element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: Uint16Array = arr.toReversed();
      expect(result).not().assertEqual(arr);
      expect(result.join(',')).assertEqual('3,2,1');
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3800
     * @tc.name testUint16ArrayToReversed038
      * @tc.desc Verify the reversed result retains the source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: Uint16Array = arr.toReversed();
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_3900
     * @tc.name testUint16ArrayToReversed039
      * @tc.desc Verify reversing preserves the source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let originalLength: number = arr.length;
      let result: Uint16Array = arr.toReversed();
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4000
     * @tc.name testUint16ArrayToReversed040
      * @tc.desc Verify reversing preserves the source first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let first: number = arr[0];
      let result: Uint16Array = arr.toReversed();
      expect(arr[0]).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4100
     * @tc.name testUint16ArrayToReversed041
      * @tc.desc Verify reversing preserves the source final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let last: number = arr[arr.length - 1];
      let result: Uint16Array = arr.toReversed();
      expect(arr[arr.length - 1]).assertEqual(last);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4200
     * @tc.name testUint16ArrayToReversed042
      * @tc.desc Verify reversing leaves every source element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let snapshot: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let result: Uint16Array = arr.toReversed();
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(snapshot[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4300
     * @tc.name testUint16ArrayToReversed043
      * @tc.desc Verify a descending source produces an independent ascending result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 4, 3, 2, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result.join(',')).assertEqual('1,2,3,4,5');
      expect(result).not().assertEqual(arr);
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4400
     * @tc.name testUint16ArrayToReversed044
      * @tc.desc Verify reversing twice restores a five-element sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let reversed: Uint16Array = arr.toReversed();
      let doubleReversed: Uint16Array = reversed.toReversed();
      expect(doubleReversed[0]).assertEqual(1);
      expect(doubleReversed[1]).assertEqual(2);
      expect(doubleReversed[2]).assertEqual(3);
      expect(doubleReversed[3]).assertEqual(4);
      expect(doubleReversed[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4500
     * @tc.name testUint16ArrayToReversed045
      * @tc.desc Verify reversing twice preserves the original length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      let reversed: Uint16Array = arr.toReversed();
      let doubleReversed: Uint16Array = reversed.toReversed();
      expect(doubleReversed.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4600
     * @tc.name testUint16ArrayToReversed046
      * @tc.desc Verify each reversal produces a distinct independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let reversed: Uint16Array = arr.toReversed();
      let doubleReversed: Uint16Array = reversed.toReversed();
      expect(reversed).not().assertEqual(arr);
      expect(doubleReversed).not().assertEqual(reversed);
      expect(reversed.join(',')).assertEqual('3,2,1');
      expect(doubleReversed.join(',')).assertEqual('1,2,3');
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4700
     * @tc.name testUint16ArrayToReversed047
      * @tc.desc Verify reversing irregular values preserves source content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(17, 4096, 65535, 802);
      let result: Uint16Array = arr.toReversed();
      expect(result).not().assertEqual(arr);
      expect(result.join(',')).assertEqual('802,65535,4096,17');
      expect(arr.join(',')).assertEqual('17,4096,65535,802');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4800
     * @tc.name testUint16ArrayToReversed048
      * @tc.desc Verify reversing five ascending values returns an independent descending copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300, 400, 500);
      let result: Uint16Array = arr.toReversed();
      expect(result).not().assertEqual(arr);
      expect(result.join(',')).assertEqual('500,400,300,200,100');
      expect(arr.join(',')).assertEqual('100,200,300,400,500');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_4900
     * @tc.name testUint16ArrayToReversed049
     * @tc.desc Verify toReversed with non-monotonic six element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(54321, 9, 1200, 77, 30005, 2);
      let result: Uint16Array = arr.toReversed();
      expect(result).not().assertEqual(arr);
      expect(result.join(',')).assertEqual('2,30005,77,1200,9,54321');
      expect(arr.join(',')).assertEqual('54321,9,1200,77,30005,2');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5000
     * @tc.name testUint16ArrayToReversed050
     * @tc.desc Verify toReversed with alternating low and high values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 60000, 23, 45001, 999);
      let result: Uint16Array = arr.toReversed();
      expect(result).not().assertEqual(arr);
      expect(result.join(',')).assertEqual('999,45001,23,60000,1');
      expect(arr.join(',')).assertEqual('1,60000,23,45001,999');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5100
     * @tc.name testUint16ArrayToReversed051
      * @tc.desc Verify an array created by of reverses all three values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5200
     * @tc.name testUint16ArrayToReversed052
      * @tc.desc Verify an array-like constructor result reverses in value order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [10, 20, 30];
      let arr: Uint16Array = new Uint16Array(src);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5300
     * @tc.name testUint16ArrayToReversed053
      * @tc.desc Verify a length-constructed and populated array reverses correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(4);
      arr[0] = 7;
      arr[1] = 8;
      arr[2] = 9;
      arr[3] = 10;
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertEqual(8);
      expect(result[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5400
     * @tc.name testUint16ArrayToReversed054
      * @tc.desc Verify a copied typed array reverses its copied values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Uint16Array = Uint16Array.of(5, 15, 25);
      let arr: Uint16Array = new Uint16Array(original);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(25);
      expect(result[1]).assertEqual(15);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5500
     * @tc.name testUint16ArrayToReversed055
     * @tc.desc Verify [0, 0, 0, 0, 0] toReversed [0, 0, 0, 0, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0, 0, 0);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5600
     * @tc.name testUint16ArrayToReversed056
     * @tc.desc Verify [65535, 65535, 65535, 65535] toReversed 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535, 65535, 65535);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(65535);
      expect(result[2]).assertEqual(65535);
      expect(result[3]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5700
     * @tc.name testUint16ArrayToReversed057
     * @tc.desc Verify [0, 65535, 32768, 1] toReversed [1, 32768, 65535, 0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768, 1);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(32768);
      expect(result[2]).assertEqual(65535);
      expect(result[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5800
     * @tc.name testUint16ArrayToReversed058
     * @tc.desc Verify [65535, 0, 1, 65535] toReversed [65535, 1, 0, 65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 1, 65535);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_5900
     * @tc.name testUint16ArrayToReversed059
     * @tc.desc Verify [42, 42, 42, 42] toReversed [42, 42, 42, 42]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42, 42, 42, 42);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(42);
      expect(result[1]).assertEqual(42);
      expect(result[2]).assertEqual(42);
      expect(result[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6000
     * @tc.name testUint16ArrayToReversed060
     * @tc.desc Verify [16384, 32768, 49152] toReversed [49152, 32768, 16384]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(16384, 32768, 49152);
      let result: Uint16Array = arr.toReversed();
      expect(result[0]).assertEqual(49152);
      expect(result[1]).assertEqual(32768);
      expect(result[2]).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6100
     * @tc.name testUint16ArrayToReversed061
     * @tc.desc Verify toReversed returns complete reversed content for empty input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = new Uint16Array();
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('');
      expect(s.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6200
     * @tc.name testUint16ArrayToReversed062
     * @tc.desc Verify toReversed returns complete reversed content for single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(42);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('42');
      expect(s.join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6300
     * @tc.name testUint16ArrayToReversed063
     * @tc.desc Verify toReversed returns complete reversed content for even length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('4,3,2,1');
      expect(s.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6400
     * @tc.name testUint16ArrayToReversed064
     * @tc.desc Verify toReversed returns complete reversed content for odd length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('5,4,3,2,1');
      expect(s.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6500
     * @tc.name testUint16ArrayToReversed065
     * @tc.desc Verify toReversed returns complete reversed content for boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(0, 32768, 65535);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('65535,32768,0');
      expect(s.join(',')).assertEqual('0,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6600
     * @tc.name testUint16ArrayToReversed066
     * @tc.desc Verify toReversed returns complete reversed content for converted values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = new Uint16Array([-1, 65536, 65537]);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('1,0,65535');
      expect(s.join(',')).assertEqual('65535,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6700
     * @tc.name testUint16ArrayToReversed067
     * @tc.desc Verify toReversed returns complete reversed content for repeated groups
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(2, 2, 3, 3, 4);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('4,3,3,2,2');
      expect(s.join(',')).assertEqual('2,2,3,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6800
     * @tc.name testUint16ArrayToReversed068
     * @tc.desc Verify toReversed result mutation does not affect source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(10, 20, 30);
       const r: Uint16Array = s.toReversed();
       r[0] = 99;
      expect(r.join(',')).assertEqual('99,20,10');
      expect(s.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_6900
     * @tc.name testUint16ArrayToReversed069
     * @tc.desc Verify toReversed source mutation does not affect result snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(10, 20, 30);
       const r: Uint16Array = s.toReversed();
       s[2] = 77;
      expect(r.join(',')).assertEqual('30,20,10');
      expect(s.join(',')).assertEqual('10,20,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7000
     * @tc.name testUint16ArrayToReversed070
     * @tc.desc Verify toReversed reverses only a nonzero view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(10);
       const all: Uint16Array = new Uint16Array(b);
       all.set(Uint16Array.of(9, 1, 2, 3, 8));
       const v: Uint16Array = new Uint16Array(b, 2, 3);
       const r: Uint16Array = v.toReversed();
      expect(r.join(',')).assertEqual('3,2,1');
      expect(all.join(',')).assertEqual('9,1,2,3,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7100
     * @tc.name testUint16ArrayToReversed071
     * @tc.desc Verify toReversed allocates an independent buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(4, 5, 6);
       const r: Uint16Array = s.toReversed();
      expect(r.buffer).not().assertEqual(s.buffer);
      expect(r.join(',')).assertEqual('6,5,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7200
     * @tc.name testUint16ArrayToReversed072
     * @tc.desc Verify toReversed applied twice restores content in independent arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(6, 7, 8, 9);
       const a: Uint16Array = s.toReversed();
       const b: Uint16Array = a.toReversed();
      expect(a.join(',')).assertEqual('9,8,7,6');
      expect(b.join(',')).assertEqual('6,7,8,9');
      expect(s.join(',')).assertEqual('6,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7300
     * @tc.name testUint16ArrayToReversed073
     * @tc.desc Verify toReversed snapshots a shared subarray at call time
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const base: Uint16Array = Uint16Array.of(9, 2, 4, 6, 8);
       const v: Uint16Array = base.subarray(1, 4);
       const r: Uint16Array = v.toReversed();
       base[2] = 44;
      expect(r.join(',')).assertEqual('6,4,2');
      expect(v.join(',')).assertEqual('2,44,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7400
     * @tc.name testUint16ArrayToReversed074
     * @tc.desc Verify toReversed preserves the center element of an odd sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('50,40,30,20,10');
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7500
     * @tc.name testUint16ArrayToReversed075
     * @tc.desc Verify toReversed preserves multiplicity across alternating values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(1, 2, 1, 2, 1, 2);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('2,1,2,1,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7600
     * @tc.name testUint16ArrayToReversed076
     * @tc.desc Verify toReversed returns a zero-offset copy from a nonzero view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(12);
       const v: Uint16Array = new Uint16Array(b, 4, 3);
       v.set(Uint16Array.of(3, 2, 1));
       const r: Uint16Array = v.toReversed();
      expect(r.byteOffset).assertEqual(0);
      expect(r.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7700
     * @tc.name testUint16ArrayToReversed077
     * @tc.desc Verify toReversed result remains stable after backing buffer changes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(6);
       const s: Uint16Array = new Uint16Array(b);
       s.set(Uint16Array.of(1, 2, 3));
       const r: Uint16Array = s.toReversed();
       new Uint16Array(b)[0] = 9;
      expect(r.join(',')).assertEqual('3,2,1');
      expect(s.join(',')).assertEqual('9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7800
     * @tc.name testUint16ArrayToReversed078
     * @tc.desc Verify toReversed handles a copied source independently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const original: Uint16Array = Uint16Array.of(1, 2, 3);
       const copy: Uint16Array = new Uint16Array(original);
       copy[0] = 9;
       const r: Uint16Array = copy.toReversed();
      expect(r.join(',')).assertEqual('3,2,9');
      expect(original.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOREVERSED_7900
     * @tc.name testUint16ArrayToReversed079
     * @tc.desc Verify toReversed preserves exact decimal boundary ordering
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToReversed079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const s: Uint16Array = Uint16Array.of(1, 10, 100, 1000, 10000);
       const r: Uint16Array = s.toReversed();
      expect(r.join(',')).assertEqual('10000,1000,100,10,1');
    });

  });
}
