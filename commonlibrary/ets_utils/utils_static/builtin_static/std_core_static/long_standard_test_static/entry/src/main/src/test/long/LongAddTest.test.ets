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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongAddTest(): void {
  describe('LongAddTest', () => {
    beforeEach(async () => { await Utils.msSleep(30); });

    const ADD_NEG_200: long = -200;
    const ADD_NEG_50: long = -50;
    const ADD_0: long = 0;
    const ADD_1: long = 1;
    const ADD_2: long = 2;
    const ADD_3: long = 3;
    const ADD_4: long = 4;
    const ADD_5: long = 5;
    const ADD_6: long = 6;
    const ADD_7: long = 7;
    const ADD_10: long = 10;
    const ADD_100: long = 100;
    const ADD_200: long = 200;
    const ADD_STR_NEG_300: string = "-300";
    const ADD_STR_NEG_1: string = "-1";
    const ADD_STR_0: string = "0";
    const ADD_STR_6: string = "6";
    const ADD_STR_10: string = "10";
    const ADD_STR_14: string = "14";
    const ADD_STR_50: string = "50";
    const ADD_STR_100: string = "100";
    const ADD_STR_300: string = "300";
    const ADD_STR_MAX_VALUE: string = "9223372036854775807";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0100
     * @tc.name testLongAdd001
     * @tc.desc Verify basic add with small single-digit Long values and carry-over
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_6).add(new Long(ADD_4));
      expect(result.toString()).assertEqual(ADD_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0200
     * @tc.name testLongAdd002
     * @tc.desc Verify multi-digit positive plus positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_100).add(new Long(ADD_200));
      expect(result.toString()).assertEqual(ADD_STR_300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0300
     * @tc.name testLongAdd003
     * @tc.desc Verify positive plus negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_100).add(new Long(ADD_NEG_50));
      expect(result.toString()).assertEqual(ADD_STR_50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0400
     * @tc.name testLongAdd004
     * @tc.desc Verify negative plus negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(-ADD_100).add(new Long(ADD_NEG_200));
      expect(result.toString()).assertEqual(ADD_STR_NEG_300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0500
     * @tc.name testLongAdd005
     * @tc.desc Verify add with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_100).add(new Long(ADD_0));
      expect(result.toString()).assertEqual(ADD_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0600
     * @tc.name testLongAdd006
     * @tc.desc Verify add of equal positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_5).add(new Long(ADD_5));
      expect(result.toString()).assertEqual(ADD_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0700
     * @tc.name testLongAdd007
     * @tc.desc Verify add of inverse values results in zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_5).add(new Long(-ADD_5));
      expect(result.toString()).assertEqual(ADD_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0800
     * @tc.name testLongAdd008
     * @tc.desc Verify MIN_VALUE plus -1 overflows to MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MIN_VALUE);
      const result = value.add(new Long(-ADD_1));
      expect(result.toString()).assertEqual(ADD_STR_MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_0900
     * @tc.name testLongAdd009
     * @tc.desc Verify MAX_VALUE plus MIN_VALUE equals -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).add(new Long(Long.MIN_VALUE));
      expect(result.toString()).assertEqual(ADD_STR_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1000
     * @tc.name testLongAdd010
     * @tc.desc Verify chained add operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_1).add(new Long(ADD_2)).add(new Long(ADD_3));
      expect(result.toString()).assertEqual(ADD_STR_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1100
     * @tc.name testLongAdd011
     * @tc.desc Verify add returns a Long instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_3).add(new Long(ADD_7));
      expect(result instanceof Long).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1200
     * @tc.name testLongAdd012
     * @tc.desc Verify add returns a new instance, not the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Long(ADD_5);
      const result = original.add(new Long(ADD_3));
      expect(result !== original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1300
     * @tc.name testLongAdd013
     * @tc.desc Verify default constructor Long add
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long().add(new Long(ADD_10));
      expect(result.toString()).assertEqual(ADD_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1400
     * @tc.name testLongAdd014
     * @tc.desc Verify add with itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(ADD_7);
      const result = value.add(value);
      expect(result.toString()).assertEqual(ADD_STR_14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ADD_1500
     * @tc.name testLongAdd015
     * @tc.desc Verify zero plus zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(ADD_0).add(new Long(ADD_0));
      expect(result.toString()).assertEqual(ADD_STR_0);
    });
  });
}
