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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function LongToDouble2Test(): void {
  describe('LongToDouble2Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TD2_LARGE_NEG: long = -999999999999;
    const TD2_NEG_100: long = -100;
    const TD2_NEG_1: long = -1;
    const TD2_0: long = 0;
    const TD2_1: long = 1;
    const TD2_9: long = 9;
    const TD2_42: long = 42;
    const TD2_100: long = 100;
    const TD2_LARGE: long = 999999999999;
    const TD2_DOUBLE_EXACT_BOUNDARY: long = 9007199254740992;
    const TD2_DOUBLE_PRECISION_LOSS: long = 9007199254740993;
    const TD2_DOUBLE_EXACT_BOUNDARY_VAL: double = 9007199254740992.0;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0100
     * @tc.name testLongToDouble2001
     * @tc.desc Verify Long.toDouble(TD2_9) returns 9.0 (doc example)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_9);
      expect(result).assertEqual(TD2_9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0200
     * @tc.name testLongToDouble2002
     * @tc.desc Verify Long.toDouble(TD2_0) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_0);
      expect(result).assertEqual(TD2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0300
     * @tc.name testLongToDouble2003
     * @tc.desc Verify Long.toDouble(TD2_100) returns 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_100);
      expect(result).assertEqual(TD2_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0400
     * @tc.name testLongToDouble2004
     * @tc.desc Verify Long.toDouble(TD2_NEG_100) returns -100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_NEG_100);
      expect(result).assertEqual(TD2_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0500
     * @tc.name testLongToDouble2005
     * @tc.desc Verify Long.toDouble(TD2_1) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_1);
      expect(result).assertEqual(TD2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0600
     * @tc.name testLongToDouble2006
     * @tc.desc Verify Long.toDouble(TD2_NEG_1) returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_NEG_1);
      expect(result).assertEqual(TD2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0700
     * @tc.name testLongToDouble2007
     * @tc.desc Verify Long.toDouble(TD2_LARGE) large positive returns double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_LARGE);
      expect(result).assertEqual(TD2_LARGE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0800
     * @tc.name testLongToDouble2008
     * @tc.desc Verify Long.toDouble(TD2_LARGE_NEG) large negative returns double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_LARGE_NEG);
      expect(result).assertEqual(TD2_LARGE_NEG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_0900
     * @tc.name testLongToDouble2009
     * @tc.desc Verify Long.toDouble(TD2_42) small exact value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_42);
      expect(result).assertEqual(TD2_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_1000
     * @tc.name testLongToDouble2010
     * @tc.desc Verify Long.toDouble result is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_42);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_1100
     * @tc.name testLongToDouble2011
     * @tc.desc Verify Long.toDouble(TD2_DOUBLE_EXACT_BOUNDARY) exact at 2^53 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_DOUBLE_EXACT_BOUNDARY);
      expect(result).assertEqual(TD2_DOUBLE_EXACT_BOUNDARY_VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_1200
     * @tc.name testLongToDouble2012
     * @tc.desc Verify Long.toDouble(TD2_DOUBLE_PRECISION_LOSS) precision loss at 2^53+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(TD2_DOUBLE_PRECISION_LOSS);
      expect(result).assertEqual(TD2_DOUBLE_EXACT_BOUNDARY_VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_1300
     * @tc.name testLongToDouble2013
     * @tc.desc Verify Long.toDouble(Long.MAX_VALUE) returns finite double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(Long.MAX_VALUE);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE2_1400
     * @tc.name testLongToDouble2014
     * @tc.desc Verify Long.toDouble(Long.MIN_VALUE) returns finite double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToDouble2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(Long.MIN_VALUE);
      expect(isFinite(result)).assertTrue();
    });
  });
}

