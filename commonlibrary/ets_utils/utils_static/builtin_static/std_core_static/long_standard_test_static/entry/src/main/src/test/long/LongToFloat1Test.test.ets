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

export default function LongToFloat1Test(): void {
  describe('LongToFloat1Test', () => {
    beforeEach(async () => { await Utils.msSleep(30); });

    const TF1_NEG_1000000: long = -1000000;
    const TF1_NEG_10: long = -10;
    const TF1_NEG_1: long = -1;
    const TF1_0: long = 0;
    const TF1_1: long = 1;
    const TF1_7: long = 7;
    const TF1_42: long = 42;
    const TF1_1000000: long = 1000000;
    const TF1_FLOAT_EXACT_BOUNDARY: long = 16777216;
    const TF1_FLOAT_PRECISION_LOSS: long = 16777217;
    const TF1_FLOAT_16777216: float = 16777216.0 as float;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0100
     * @tc.name testLongToFloat1001
     * @tc.desc Verify toFloat() basic 7 -> 7.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_7);
      const result: float = value.toFloat();
      expect(result === TF1_7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0200
     * @tc.name testLongToFloat1002
     * @tc.desc Verify toFloat() zero -> 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_0);
      const result: float = value.toFloat();
      expect(result === TF1_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0300
     * @tc.name testLongToFloat1003
     * @tc.desc Verify toFloat() negative -10 -> -10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_NEG_10);
      const result: float = value.toFloat();
      expect(result === TF1_NEG_10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0400
     * @tc.name testLongToFloat1004
     * @tc.desc Verify toFloat() value 1 -> 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_1);
      const result: float = value.toFloat();
      expect(result === TF1_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0500
     * @tc.name testLongToFloat1005
     * @tc.desc Verify toFloat() value -1 -> -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_NEG_1);
      const result: float = value.toFloat();
      expect(result === TF1_NEG_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0600
     * @tc.name testLongToFloat1006
     * @tc.desc Verify toFloat() large positive TF1_1000000 returns float and is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_1000000);
      const result: float = value.toFloat();
      expect(result === TF1_1000000).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0700
     * @tc.name testLongToFloat1007
     * @tc.desc Verify toFloat() large negative -TF1_1000000 returns float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_NEG_1000000);
      const result: float = value.toFloat();
      expect(result === TF1_NEG_1000000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0800
     * @tc.name testLongToFloat1008
     * @tc.desc Verify toFloat() multiple calls return consistent result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_42);
      const result1: float = value.toFloat();
      const result2: float = value.toFloat();
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_0900
     * @tc.name testLongToFloat1009
     * @tc.desc Verify toFloat() default constructor -> 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long();
      const result: float = value.toFloat();
      expect(result === TF1_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_1000
     * @tc.name testLongToFloat1010
     * @tc.desc Verify toFloat(TF1_FLOAT_EXACT_BOUNDARY) exact at 2^24 boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_FLOAT_EXACT_BOUNDARY);
      const result: float = value.toFloat();
      expect(result === TF1_FLOAT_16777216).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT1_1100
     * @tc.name testLongToFloat1011
     * @tc.desc Verify toFloat(TF1_FLOAT_PRECISION_LOSS) precision loss at 2^24+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToFloat1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TF1_FLOAT_PRECISION_LOSS);
      const result: float = value.toFloat();
      expect(result === TF1_FLOAT_16777216).assertTrue();
    });
  });
}

