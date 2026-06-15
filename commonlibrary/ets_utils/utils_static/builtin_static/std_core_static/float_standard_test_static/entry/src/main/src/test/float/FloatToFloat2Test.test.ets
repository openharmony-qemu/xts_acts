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
import Utils from './../Util.test';

export default function FloatToFloat2Test(): void {
  describe('FloatToFloat2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0100
     * @tc.name testToFloat2001
     * @tc.desc Verify normal parameter count(1 param) for Float.toFloat static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(1.5f);
      expect(result).assertEqual(1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0200
     * @tc.name testToFloat2002
     * @tc.desc Verify Float.toFloat with 0.0f returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(0.0f);
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0300
     * @tc.name testToFloat2003
     * @tc.desc Verify Float.toFloat with -0.0f returns -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(-0.0f);
      let isNegativeZero: boolean = 1.0f / result === Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0400
     * @tc.name testToFloat2004
     * @tc.desc Verify Float.toFloat with Float.EPSILON preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.EPSILON);
      expect(result).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0500
     * @tc.name testToFloat2005
     * @tc.desc Verify positive float value identity for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult: float = Float.toFloat(1.5f);
      expect(toFloatResult).assertEqual(1.5f);
      let toFloatResult2: float = Float.toFloat(5.0f);
      expect(toFloatResult2).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0600
     * @tc.name testToFloat2006
     * @tc.desc Verify negative float value identity for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult3: float = Float.toFloat(-3.14f);
      expect(toFloatResult3).assertEqual(-3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0700
     * @tc.name testToFloat2007
     * @tc.desc Verify zero and negative zero for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult4: float = Float.toFloat(0.0f);
      expect(toFloatResult4).assertEqual(0.0f);
      let toFloatResult5: float = Float.toFloat(-0.0f);
      expect(toFloatResult5).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0800
     * @tc.name testToFloat2008
     * @tc.desc Verify NaN value propagation for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.NaN);
      let isNaN: boolean = result !== result;
      expect(isNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_0900
     * @tc.name testToFloat2009
     * @tc.desc Verify positive infinity for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.POSITIVE_INFINITY);
      expect(result > 3.4e38f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1000
     * @tc.name testToFloat2010
     * @tc.desc Verify negative infinity for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.NEGATIVE_INFINITY);
      expect(result < -3.4e38f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1100
     * @tc.name testToFloat2011
     * @tc.desc Verify Float.MIN_VALUE for Float.toFloat identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult6: float = Float.toFloat(Float.MIN_VALUE);
      expect(toFloatResult6).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1200
     * @tc.name testToFloat2012
     * @tc.desc Verify Float.MAX_VALUE for Float.toFloat identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult7: float = Float.toFloat(Float.MAX_VALUE);
      expect(toFloatResult7).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1300
     * @tc.name testToFloat2013
     * @tc.desc Verify boundary float values identity for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult8: float = Float.toFloat(1.4e-45f);
      expect(toFloatResult8).assertEqual(1.4e-45f);
      let toFloatResult9: float = Float.toFloat(3.4028235e38f);
      expect(toFloatResult9).assertEqual(3.4028235e38f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1400
     * @tc.name testToFloat2014
     * @tc.desc Verify float variable reference for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2.5f;
      let toFloatResult10: float = Float.toFloat(val);
      expect(toFloatResult10).assertEqual(2.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1500
     * @tc.name testToFloat2015
     * @tc.desc Verify float expression result for Float.toFloat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toFloatResult11: float = Float.toFloat(1.0f + 0.5f);
      expect(toFloatResult11).assertEqual(1.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1600
     * @tc.name testToFloat2016
     * @tc.desc Verify multiple calls to Float.toFloat with same value consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = Float.toFloat(3.14f);
      const r2: float = Float.toFloat(3.14f);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1700
     * @tc.name testToFloat2017
     * @tc.desc Verify multiple calls with special values consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = Float.toFloat(Float.POSITIVE_INFINITY);
      const r2: float = Float.toFloat(Float.POSITIVE_INFINITY);
      const r3: float = Float.toFloat(Float.MIN_VALUE);
      const r4: float = Float.toFloat(Float.MIN_VALUE);
      expect(r1).assertEqual(r2);
      expect(r3).assertEqual(r4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_2_1800
     * @tc.name testToFloat2018
     * @tc.desc Verify chain call Float.toFloat(Float.toFloat(x)) identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToFloat2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.toFloat(Float.toFloat(3.14f));
      expect(result).assertEqual(3.14f);
    });

  });
}
