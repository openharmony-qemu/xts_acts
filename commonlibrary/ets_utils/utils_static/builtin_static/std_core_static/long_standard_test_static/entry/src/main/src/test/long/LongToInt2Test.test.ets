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

export default function LongToInt2Test(): void {
  describe('LongToInt2Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TI2_OVERFLOW_BELOW_MIN: long = -2147483649;
    const TI2_INT_MIN: long = -2147483648;
    const TI2_NEG_512: long = -512;
    const TI2_NEG_1: long = -1;
    const TI2_0: long = 0;
    const TI2_1: long = 1;
    const TI2_1024: long = 1024;
    const TI2_INT_MAX: long = 2147483647;
    const TI2_OVERFLOW_ABOVE_MAX: long = 2147483648;
    const TI2_LARGE_POS: long = 4294967296;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0100
     * @tc.name testLongToInt2001
     * @tc.desc Verify Long.toInt(TI2_1024) basic → 1024
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_1024);
      expect(result).assertEqual(TI2_1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0200
     * @tc.name testLongToInt2002
     * @tc.desc Verify Long.toInt(TI2_0) → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_0);
      expect(result).assertEqual(TI2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0300
     * @tc.name testLongToInt2003
     * @tc.desc Verify Long.toInt(TI2_NEG_512) negative → -512
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_NEG_512);
      expect(result).assertEqual(TI2_NEG_512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0400
     * @tc.name testLongToInt2004
     * @tc.desc Verify Long.toInt(TI2_1) → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_1);
      expect(result).assertEqual(TI2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0500
     * @tc.name testLongToInt2005
     * @tc.desc Verify Long.toInt(TI2_NEG_1) → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_NEG_1);
      expect(result).assertEqual(TI2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0600
     * @tc.name testLongToInt2006
     * @tc.desc Verify Long.toInt(TI2_INT_MAX) int max → 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_INT_MAX);
      expect(result).assertEqual(TI2_INT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0700
     * @tc.name testLongToInt2007
     * @tc.desc Verify Long.toInt(TI2_INT_MIN) int min → -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_INT_MIN);
      expect(result).assertEqual(TI2_INT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0800
     * @tc.name testLongToInt2008
     * @tc.desc Verify Long.toInt(TI2_OVERFLOW_ABOVE_MAX) out of range → truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_OVERFLOW_ABOVE_MAX);
      expect(result).assertEqual(TI2_INT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_0900
     * @tc.name testLongToInt2009
     * @tc.desc Verify Long.toInt(TI2_OVERFLOW_BELOW_MIN) out of range negative → truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_OVERFLOW_BELOW_MIN);
      expect(result).assertEqual(TI2_INT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_1000
     * @tc.name testLongToInt2010
     * @tc.desc Verify Long.toInt(TI2_LARGE_POS) large value → truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(TI2_LARGE_POS);
      expect(result !== TI2_LARGE_POS).assertTrue();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_1100
     * @tc.name testLongToInt2011
     * @tc.desc Verify Long.toInt(Long.MAX_VALUE) → TI2_NEG_1 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(Long.MAX_VALUE);
      expect(result).assertEqual(TI2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT2_1200
     * @tc.name testLongToInt2012
     * @tc.desc Verify Long.toInt(Long.MIN_VALUE) → TI2_0 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(Long.MIN_VALUE);
      expect(result).assertEqual(TI2_0);
    });
  });
}

