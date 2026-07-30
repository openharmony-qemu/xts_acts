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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongSubTest(): void {
  describe('LongSubTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const SUB_NEG_100: long = -100;
    const SUB_NEG_50: long = -50;
    const SUB_NEG_20: long = -20;
    const SUB_NEG_10: long = -10;
    const SUB_NEG_1: long = -1;
    const SUB_0: long = 0;
    const SUB_1: long = 1;
    const SUB_3: long = 3;
    const SUB_4: long = 4;
    const SUB_5: long = 5;
    const SUB_6: long = 6;
    const SUB_10: long = 10;
    const SUB_20: long = 20;
    const SUB_30: long = 30;
    const SUB_50: long = 50;
    const SUB_100: long = 100;
    const SUB_STR_NEG_150: string = "-150";
    const SUB_STR_NEG_5: string = "-5";
    const SUB_STR_0: string = "0";
    const SUB_STR_2: string = "2";
    const SUB_STR_10: string = "10";
    const SUB_STR_50: string = "50";
    const SUB_STR_70: string = "70";
    const SUB_STR_100: string = "100";
    const SUB_STR_150: string = "150";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0100
     * @tc.name testLongSub001
     * @tc.desc Verify basic subtraction of two positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_6).sub(new Long(SUB_4));
      expect(result.toString()).assertEqual(SUB_STR_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0200
     * @tc.name testLongSub002
     * @tc.desc Verify positive minus positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_100).sub(new Long(SUB_30));
      expect(result.toString()).assertEqual(SUB_STR_70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0300
     * @tc.name testLongSub003
     * @tc.desc Verify positive minus larger positive results in negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_5).sub(new Long(SUB_10));
      expect(result.toString()).assertEqual(SUB_STR_NEG_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0400
     * @tc.name testLongSub004
     * @tc.desc Verify positive minus negative equals addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_100).sub(new Long(SUB_NEG_50));
      expect(result.toString()).assertEqual(SUB_STR_150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0500
     * @tc.name testLongSub005
     * @tc.desc Verify negative minus positive results in more negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_NEG_100).sub(new Long(SUB_50));
      expect(result.toString()).assertEqual(SUB_STR_NEG_150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0600
     * @tc.name testLongSub006
     * @tc.desc Verify negative minus negative results in positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_NEG_10).sub(new Long(SUB_NEG_20));
      expect(result.toString()).assertEqual(SUB_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0700
     * @tc.name testLongSub007
     * @tc.desc Verify subtract zero leaves value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_100).sub(new Long(SUB_0));
      expect(result.toString()).assertEqual(SUB_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0800
     * @tc.name testLongSub008
     * @tc.desc Verify zero minus positive results in negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_0).sub(new Long(SUB_5));
      expect(result.toString()).assertEqual(SUB_STR_NEG_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_0900
     * @tc.name testLongSub009
     * @tc.desc Verify subtract itself results in zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_10).sub(new Long(SUB_10));
      expect(result.toString()).assertEqual(SUB_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1000
     * @tc.name testLongSub010
     * @tc.desc Verify sub result toLong: 10 - 3 = 7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_10).sub(new Long(SUB_3));
      expect(result.toLong()).assertEqual(SUB_10 - SUB_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1100
     * @tc.name testLongSub011
     * @tc.desc Verify sub returns a new instance, not the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Long = new Long(SUB_10);
      const result: Long = original.sub(new Long(SUB_3));
      expect(result !== original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1200
     * @tc.name testLongSub012
     * @tc.desc Verify chained sub operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_100).sub(new Long(SUB_30)).sub(new Long(SUB_20));
      expect(result.toString()).assertEqual(SUB_STR_50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1300
     * @tc.name testLongSub013
     * @tc.desc Verify default constructor Long sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long().sub(new Long(SUB_5));
      expect(result.toString()).assertEqual(SUB_STR_NEG_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1400
     * @tc.name testLongSub014
     * @tc.desc Verify MAX_VALUE - (-1) overflows to MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: Long = value.sub(new Long(SUB_NEG_1));
      expect(result.toString()).assertEqual(Long.MIN_VALUE.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1500
     * @tc.name testLongSub015
     * @tc.desc Verify MIN_VALUE - 1 underflows to MAX_VALUE (mirror of test014)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: Long = value.sub(new Long(SUB_1));
      expect(result.toString()).assertEqual(Long.MAX_VALUE.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1600
     * @tc.name testLongSub016
     * @tc.desc Verify MAX_VALUE - 1 stays in range and equals MAX_VALUE - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).sub(new Long(SUB_1));
      expect(result.toLong()).assertEqual(Long.MAX_VALUE - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1700
     * @tc.name testLongSub017
     * @tc.desc Verify MIN_VALUE - (-1) stays in range and equals MIN_VALUE + 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).sub(new Long(SUB_NEG_1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1800
     * @tc.name testLongSub018
     * @tc.desc Verify 0 - MAX_VALUE equals -MAX_VALUE which is MIN_VALUE + 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_0).sub(new Long(Long.MAX_VALUE));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_1900
     * @tc.name testLongSub019
     * @tc.desc Verify 0 - MIN_VALUE wraps back to MIN_VALUE because |MIN_VALUE| > MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(SUB_0).sub(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_SUB_2000
     * @tc.name testLongSub020
     * @tc.desc Verify MAX_VALUE - MIN_VALUE overflows by twos-complement and wraps to -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongSub020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).sub(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(SUB_NEG_1);
    });
  });
}
