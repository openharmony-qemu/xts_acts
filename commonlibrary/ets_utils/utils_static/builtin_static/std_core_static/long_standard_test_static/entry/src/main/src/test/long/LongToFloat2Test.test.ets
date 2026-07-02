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

export default function LongToFloat2Test(): void {
  describe('LongToFloat2Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TF2_NEG_100: long = -100;
    const TF2_NEG_1: long = -1;
    const TF2_0: long = 0;
    const TF2_1: long = 1;
    const TF2_9: long = 9;
    const TF2_100: long = 100;
    const TF2_12345: long = 12345;
    const TF2_FLOAT_EXACT_BOUNDARY: long = 16777216;
    const TF2_FLOAT_PRECISION_LOSS: long = 16777217;
    const TF2_FLOAT_16777216: float = 16777216.0 as float;
    const TF2_1000000: long = 1000000;
    const TF2_NEG_1000000: long = -1000000;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0100
     * @tc.name testLongToFloat2001
     * @tc.desc Verify Long.toFloat(TF2_9) returns 9.0 (doc example)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_9);
      expect(result).assertEqual(TF2_9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0200
     * @tc.name testLongToFloat2002
     * @tc.desc Verify Long.toFloat(TF2_0) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_0);
      expect(result).assertEqual(TF2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0300
     * @tc.name testLongToFloat2003
     * @tc.desc Verify Long.toFloat(TF2_100) returns 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_100);
      expect(result).assertEqual(TF2_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0400
     * @tc.name testLongToFloat2004
     * @tc.desc Verify Long.toFloat(TF2_NEG_100) returns -100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_NEG_100);
      expect(result).assertEqual(TF2_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0500
     * @tc.name testLongToFloat2005
     * @tc.desc Verify Long.toFloat(TF2_1) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_1);
      expect(result).assertEqual(TF2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0600
     * @tc.name testLongToFloat2006
     * @tc.desc Verify Long.toFloat(TF2_NEG_1) returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_NEG_1);
      expect(result).assertEqual(TF2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0700
     * @tc.name testLongToFloat2007
     * @tc.desc Verify Long.toFloat(TF2_FLOAT_EXACT_BOUNDARY) exact at 2^24 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_FLOAT_EXACT_BOUNDARY);
      expect(result).assertEqual(TF2_FLOAT_16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0800
     * @tc.name testLongToFloat2008
     * @tc.desc Verify Long.toFloat(TF2_FLOAT_PRECISION_LOSS) precision loss returns float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_FLOAT_PRECISION_LOSS);
      expect(result).assertEqual(TF2_FLOAT_16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_0900
     * @tc.name testLongToFloat2009
     * @tc.desc Verify Long.toFloat(TF2_12345) small value no precision loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_12345);
      expect(result).assertEqual(TF2_12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_1000
     * @tc.name testLongToFloat2010
     * @tc.desc Verify Long.toFloat result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_12345);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_1100
     * @tc.name testLongToFloat2011
     * @tc.desc Verify Long.toFloat(TF2_1000000) large positive value conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_1000000);
      expect(result).assertEqual(TF2_1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_1200
     * @tc.name testLongToFloat2012
     * @tc.desc Verify Long.toFloat(TF2_NEG_1000000) large negative value conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(TF2_NEG_1000000);
      expect(result).assertEqual(TF2_NEG_1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_1300
     * @tc.name testLongToFloat2013
     * @tc.desc Verify Long.toFloat(Long.MAX_VALUE) returns float (precision loss expected)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(Long.MAX_VALUE);
      expect(typeof result).assertEqual('float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT2_1400
     * @tc.name testLongToFloat2014
     * @tc.desc Verify Long.toFloat(Long.MIN_VALUE) returns float (precision loss expected)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(Long.MIN_VALUE);
      expect(typeof result).assertEqual('float');
    });
  });
}

