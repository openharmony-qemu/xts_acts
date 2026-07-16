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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';


export default function mathAtan2Test(): void {
  describe('MathAtan2Test', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    })
    afterAll((): void => {
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0100
     * @tc.name testMathAtan2001
     * @tc.desc Verify atan2 method with first quadrant parameters (y=1.0, x=1.0) for approximate PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0200
     * @tc.name testMathAtan2002
     * @tc.desc Verify atan2 method with second quadrant parameters (y=1.0, x=-1.0) for approximate 3*PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 3.0 * Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0300
     * @tc.name testMathAtan2003
     * @tc.desc Verify atan2 method with third quadrant parameters (y=-1.0, x=-1.0) for approximate -3*PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -3.0 * Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0400
     * @tc.name testMathAtan2004
     * @tc.desc Verify atan2 method with fourth quadrant parameters (y=-1.0, x=1.0) for approximate -PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0500
     * @tc.name testMathAtan2005
     * @tc.desc Verify atan2 method with positive x-axis boundary (y=0.0, x=1.0) for exact 0.0 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0600
     * @tc.name testMathAtan2006
     * @tc.desc Verify atan2 method with negative x-axis boundary (y=0.0, x=-1.0) for approximate PI return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = Math.PI;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0700
     * @tc.name testMathAtan2007
     * @tc.desc Verify atan2 method with positive y-axis boundary (y=1.0, x=0.0) for approximate PI/2 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = 0.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = Math.PI / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0800
     * @tc.name testMathAtan2008
     * @tc.desc Verify atan2 method with negative y-axis boundary (y=-1.0, x=0.0) for approximate -PI/2 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = 0.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -Math.PI / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0900
     * @tc.name testMathAtan2009
     * @tc.desc Verify atan2 method with origin boundary (y=0.0, x=0.0) for exact 0.0 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.0;
      let xCoordinate: double = 0.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1000
     * @tc.name testMathAtan2010
     * @tc.desc Verify atan2 method with float first quadrant parameters (y=1.0, x=1.0) for approximate PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(1.0);
      let xCoordinate: float = Double.toFloat(1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(0.7853981633974483);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1100
     * @tc.name testMathAtan2011
     * @tc.desc Verify atan2 method with float second quadrant parameters for approximate 3*PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(1.0);
      let xCoordinate: float = Double.toFloat(-1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(2.356194490192345);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1200
     * @tc.name testMathAtan2012
     * @tc.desc Verify atan2 method with float third quadrant parameters for approximate -3*PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(-1.0);
      let xCoordinate: float = Double.toFloat(-1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(-2.356194490192345);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1300
     * @tc.name testMathAtan2013
     * @tc.desc Verify atan2 method with float fourth quadrant parameters for approximate -PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(-1.0);
      let xCoordinate: float = Double.toFloat(1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(-0.7853981633974483);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1400
     * @tc.name testMathAtan2014
     * @tc.desc Verify atan2 method with float positive x-axis boundary for exact zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(0.0);
      let xCoordinate: float = Double.toFloat(1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1500
     * @tc.name testMathAtan2015
     * @tc.desc Verify atan2 method with float positive y-axis boundary for approximate PI/2 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(1.0);
      let xCoordinate: float = Double.toFloat(0.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(1.5707963267948966);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1600
     * @tc.name testMathAtan2016
     * @tc.desc Verify atan2 method with quadrant double parameters (y=2.0, x=3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 2.0;
      let xCoordinate: double = 3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.5880026035475675;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1700
     * @tc.name testMathAtan2017
     * @tc.desc Verify atan2 method with quadrant double parameters (y=5.0, x=1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 5.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.373400766945016;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1800
     * @tc.name testMathAtan2018
     * @tc.desc Verify atan2 method with quadrant double parameters (y=0.5, x=1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.5;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.4636476090008061;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1900
     * @tc.name testMathAtan2019
     * @tc.desc Verify atan2 method with quadrant double parameters (y=4.0, x=3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 4.0;
      let xCoordinate: double = 3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.9272952180016122;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2000
     * @tc.name testMathAtan2020
     * @tc.desc Verify atan2 method with quadrant double parameters (y=1.0, x=2.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = 2.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.4636476090008061;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2100
     * @tc.name testMathAtan2021
     * @tc.desc Verify atan2 method with quadrant double parameters (y=100.0, x=1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 100.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.5607966601082315;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2200
     * @tc.name testMathAtan2022
     * @tc.desc Verify atan2 method with quadrant double parameters (y=1.0, x=100.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = 100.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.009999666686665238;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2300
     * @tc.name testMathAtan2023
     * @tc.desc Verify atan2 method with quadrant double parameters (y=0.25, x=0.75) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.25;
      let xCoordinate: double = 0.75;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.3217505543966422;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2400
     * @tc.name testMathAtan2024
     * @tc.desc Verify atan2 method with quadrant double parameters (y=2.0, x=-3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 2.0;
      let xCoordinate: double = -3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 2.5535900500422257;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2500
     * @tc.name testMathAtan2025
     * @tc.desc Verify atan2 method with quadrant double parameters (y=5.0, x=-1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 5.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.7681918866447774;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2600
     * @tc.name testMathAtan2026
     * @tc.desc Verify atan2 method with quadrant double parameters (y=0.5, x=-1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.5;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 2.677945044588987;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2700
     * @tc.name testMathAtan2027
     * @tc.desc Verify atan2 method with quadrant double parameters (y=4.0, x=-3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 4.0;
      let xCoordinate: double = -3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 2.214297435588181;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2800
     * @tc.name testMathAtan2028
     * @tc.desc Verify atan2 method with quadrant double parameters (y=1.0, x=-2.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = -2.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 2.677945044588987;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_2900
     * @tc.name testMathAtan2029
     * @tc.desc Verify atan2 method with quadrant double parameters (y=100.0, x=-1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 100.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.5807959934815619;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3000
     * @tc.name testMathAtan2030
     * @tc.desc Verify atan2 method with quadrant double parameters (y=1.0, x=-100.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = -100.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 3.131592986903128;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3100
     * @tc.name testMathAtan2031
     * @tc.desc Verify atan2 method with quadrant double parameters (y=0.25, x=-0.75) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 0.25;
      let xCoordinate: double = -0.75;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 2.819842099193151;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3200
     * @tc.name testMathAtan2032
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-2.0, x=-3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -2.0;
      let xCoordinate: double = -3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -2.5535900500422257;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3300
     * @tc.name testMathAtan2033
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-5.0, x=-1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -5.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -1.7681918866447774;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3400
     * @tc.name testMathAtan2034
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-0.5, x=-1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -0.5;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -2.677945044588987;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3500
     * @tc.name testMathAtan2035
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-4.0, x=-3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -4.0;
      let xCoordinate: double = -3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -2.214297435588181;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3600
     * @tc.name testMathAtan2036
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-1.0, x=-2.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = -2.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -2.677945044588987;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3700
     * @tc.name testMathAtan2037
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-100.0, x=-1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -100.0;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -1.5807959934815619;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3800
     * @tc.name testMathAtan2038
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-1.0, x=-100.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = -100.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -3.131592986903128;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_3900
     * @tc.name testMathAtan2039
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-0.25, x=-0.75) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -0.25;
      let xCoordinate: double = -0.75;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -2.819842099193151;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4000
     * @tc.name testMathAtan2040
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-2.0, x=3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -2.0;
      let xCoordinate: double = 3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -0.5880026035475675;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4100
     * @tc.name testMathAtan2041
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-5.0, x=1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -5.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -1.373400766945016;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4200
     * @tc.name testMathAtan2042
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-0.5, x=1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -0.5;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -0.4636476090008061;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4300
     * @tc.name testMathAtan2043
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-4.0, x=3.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -4.0;
      let xCoordinate: double = 3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -0.9272952180016122;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4400
     * @tc.name testMathAtan2044
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-1.0, x=2.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = 2.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -0.4636476090008061;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4500
     * @tc.name testMathAtan2045
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-100.0, x=1.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -100.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -1.5607966601082315;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4600
     * @tc.name testMathAtan2046
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-1.0, x=100.0) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1.0;
      let xCoordinate: double = 100.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -0.009999666686665238;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4700
     * @tc.name testMathAtan2047
     * @tc.desc Verify atan2 method with quadrant double parameters (y=-0.25, x=0.75) for approximate expected angle return within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -0.25;
      let xCoordinate: double = 0.75;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -0.3217505543966422;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4800
     * @tc.name testMathAtan2048
     * @tc.desc Verify atan2 method with float parameters (y=2.0, x=3.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(2.0);
      let xCoordinate: float = Double.toFloat(3.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(0.5880026035475675);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_4900
     * @tc.name testMathAtan2049
     * @tc.desc Verify atan2 method with float parameters (y=-2.0, x=3.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(-2.0);
      let xCoordinate: float = Double.toFloat(3.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(-0.5880026035475675);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5000
     * @tc.name testMathAtan2050
     * @tc.desc Verify atan2 method with float parameters (y=-2.0, x=-3.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(-2.0);
      let xCoordinate: float = Double.toFloat(-3.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(-2.5535900500422257);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5100
     * @tc.name testMathAtan2051
     * @tc.desc Verify atan2 method with float parameters (y=0.5, x=1.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(0.5);
      let xCoordinate: float = Double.toFloat(1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(0.4636476090008061);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5200
     * @tc.name testMathAtan2052
     * @tc.desc Verify atan2 method with float parameters (y=1.0, x=-0.5) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(1.0);
      let xCoordinate: float = Double.toFloat(-0.5);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(2.0344439357957027);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5300
     * @tc.name testMathAtan2053
     * @tc.desc Verify atan2 method with float parameters (y=-0.5, x=-1.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(-0.5);
      let xCoordinate: float = Double.toFloat(-1.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(-2.677945044588987);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5400
     * @tc.name testMathAtan2054
     * @tc.desc Verify atan2 method with float parameters (y=4.0, x=3.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(4.0);
      let xCoordinate: float = Double.toFloat(3.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(0.9272952180016122);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5500
     * @tc.name testMathAtan2055
     * @tc.desc Verify atan2 method with float parameters (y=-1.0, x=-2.0) for approximate expected angle return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(-1.0);
      let xCoordinate: float = Double.toFloat(-2.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(-2.677945044588987);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5600
     * @tc.name testMathAtan2056
     * @tc.desc Verify atan2 method with Double.NaN y and normal x for Double.NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanY: double = 0.0 / 0.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(nanY, xCoordinate);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5700
     * @tc.name testMathAtan2057
     * @tc.desc Verify atan2 method with normal y and Double.NaN x for Double.NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let nanX: double = 0.0 / 0.0;
      let result: double = Math.atan2(yCoordinate, nanX);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5800
     * @tc.name testMathAtan2058
     * @tc.desc Verify atan2 method with Double.NaN y and Double.NaN x for Double.NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanY: double = 0.0 / 0.0;
      let nanX: double = 0.0 / 0.0;
      let result: double = Math.atan2(nanY, nanX);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_5900
     * @tc.name testMathAtan2059
     * @tc.desc Verify atan2 method with Float.NaN y for Float.NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanY: float = fZero / fZero;
      let xCoordinate: float = Double.toFloat(1.0);
      let result: float = Math.atan2(nanY, xCoordinate);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6000
     * @tc.name testMathAtan2060
     * @tc.desc Verify atan2 method with Double.POSITIVE_INFINITY y and normal x for PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infY: double = 1.0 / 0.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(infY, xCoordinate);
      let expected: double = Math.PI / 2.0;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6100
     * @tc.name testMathAtan2061
     * @tc.desc Verify atan2 method with Double.NEGATIVE_INFINITY y and normal x for -PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfY: double = -1.0 / 0.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(negInfY, xCoordinate);
      let expected: double = -Math.PI / 2.0;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6200
     * @tc.name testMathAtan2062
     * @tc.desc Verify atan2 method with normal y and Double.POSITIVE_INFINITY x for zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let infX: double = 1.0 / 0.0;
      let result: double = Math.atan2(yCoordinate, infX);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6300
     * @tc.name testMathAtan2063
     * @tc.desc Verify atan2 method with normal y and Double.NEGATIVE_INFINITY x for PI return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let negInfX: double = -1.0 / 0.0;
      let result: double = Math.atan2(yCoordinate, negInfX);
      expect(result).assertEqual(Math.PI);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6400
     * @tc.name testMathAtan2064
     * @tc.desc Verify atan2 method with y near zero positive and x negative for approximate PI return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1e-15;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let diff: double = Utils.getAbsDiff(result, Math.PI);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6500
     * @tc.name testMathAtan2065
     * @tc.desc Verify atan2 method with y near zero negative and x negative for approximate -PI return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -1e-15;
      let xCoordinate: double = -1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let diff: double = Utils.getAbsDiff(result, -Math.PI);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6600
     * @tc.name testMathAtan2066
     * @tc.desc Verify atan2 method with extreme y/x ratio (y=1e100, x=1e-100) for approximate PI/2 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1e100;
      let xCoordinate: double = 1e-100;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let diff: double = Utils.getAbsDiff(result, Math.PI / 2.0);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6700
     * @tc.name testMathAtan2067
     * @tc.desc Verify atan2 method with extreme x/y ratio (y=1e-100, x=1e100) for approximate 0.0 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1e-100;
      let xCoordinate: double = 1e100;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let diff: double = Utils.getAbsDiff(result, 0.0);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6800
     * @tc.name testMathAtan2068
     * @tc.desc Verify atan2 method complementarity property where atan2(y,x) + atan2(y,-x) approximates PI within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let rightHalfPlaneAngle: double = Math.atan2(yCoordinate, 2.0);
      let leftHalfPlaneAngle: double = Math.atan2(yCoordinate, -2.0);
      let sum: double = rightHalfPlaneAngle + leftHalfPlaneAngle;
      let diff: double = Utils.getAbsDiff(sum, Math.PI);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_6900
     * @tc.name testMathAtan2069
     * @tc.desc Verify atan2 method for Cartesian-to-polar angle conversion with point (3,4) approximating atan(4/3) within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pointX: double = 3.0;
      let pointY: double = 4.0;
      let expected: double = Math.atan(4.0 / 3.0);
      let angle: double = Math.atan2(pointY, pointX);
      let diff: double = Utils.getAbsDiff(angle, expected);
      expect(diff < 1.0e-14).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7000
     * @tc.name testMathAtan2070
     * @tc.desc Verify atan2 method for four key cardinal directions returning correct angular values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroDegreeAngle: double = Math.atan2(0.0, 1.0);
      let ninetyDegreeAngle: double = Math.atan2(1.0, 0.0);
      let oneEightyDegreeAngle: double = Math.atan2(0.0, -1.0);
      let negativeNinetyDegreeAngle: double = Math.atan2(-1.0, 0.0);
      expect(zeroDegreeAngle).assertEqual(0.0);
      let halfPi: double = Math.PI / 2.0;
      expect(ninetyDegreeAngle).assertEqual(halfPi);
      expect(oneEightyDegreeAngle).assertEqual(Math.PI);
      expect(negativeNinetyDegreeAngle).assertEqual(-halfPi);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7100
     * @tc.name testMathAtan2071
     * @tc.desc Verify atan2 method with double variable inputs y=2.0 x=3.0 for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 2.0;
      let xCoordinate: double = 3.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7200
     * @tc.name testMathAtan2072
     * @tc.desc Verify atan2 method with float variable inputs for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = Double.toFloat(2.0);
      let xCoordinate: float = Double.toFloat(3.0);
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7300
     * @tc.name testMathAtan2073
     * @tc.desc Verify atan2 method directly called via Math class name with (1.0, 1.0) for approximate PI/4 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(1.0, 1.0);
      let expected: double = Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7400
     * @tc.name testMathAtan2074
     * @tc.desc Verify atan2 method idempotency with repeated identical double calls returning consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstCallResult: double = Math.atan2(2.0, 2.0);
      let secondCallResult: double = Math.atan2(2.0, 2.0);
      let thirdCallResult: double = Math.atan2(2.0, 2.0);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7500
     * @tc.name testMathAtan2075
     * @tc.desc Verify atan2 method float overload idempotency with repeated identical calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstCallResult: float = Math.atan2(Double.toFloat(2.0), Double.toFloat(2.0));
      let secondCallResult: float = Math.atan2(Double.toFloat(2.0), Double.toFloat(2.0));
      let thirdCallResult: float = Math.atan2(Double.toFloat(2.0), Double.toFloat(2.0));
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7600
     * @tc.name testMathAtan2076
     * @tc.desc Verify atan2 method with negative zero y and positive x for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = -0.0;
      let xCoordinate: double = 1.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7700
     * @tc.name testMathAtan2077
     * @tc.desc Verify atan2 method with positive y and negative zero x for approximate PI/2 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 1.0;
      let xCoordinate: double = -0.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = Math.PI / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7800
     * @tc.name testMathAtan2078
     * @tc.desc Verify atan2 method with widened byte normal coordinates y=12 x=5 for first quadrant angle
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: byte = Int.toByte(12);
      let xCoordinate: byte = Int.toByte(5);
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.1760052070951352;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_7900
     * @tc.name testMathAtan2079
     * @tc.desc Verify atan2 method with widened byte representative coordinates y=-1 x=1 for fourth quadrant angle
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: byte = Int.toByte(-1);
      let xCoordinate: byte = Int.toByte(1);
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_8000
     * @tc.name testMathAtan2080
     * @tc.desc Verify atan2 method with widened short maximum y and unit x approaches positive PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: short = Int.toShort(32767);
      let xCoordinate: short = Int.toShort(1);
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.57076580828543;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_8100
     * @tc.name testMathAtan2081
     * @tc.desc Verify atan2 method with widened int maximum y and unit x approaches positive PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: int = Int.MAX_VALUE;
      let xCoordinate: int = 1;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 1.5707963263292353;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_8200
     * @tc.name testMathAtan2082
     * @tc.desc Verify atan2 method with widened unit y and int minimum x approaches positive PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: int = 1;
      let xCoordinate: int = Int.MIN_VALUE;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 3.141592653124132;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_8300
     * @tc.name testMathAtan2083
     * @tc.desc Verify atan2 method with widened Long.MIN_VALUE y and unit x approaches negative PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: long = Long.MIN_VALUE;
      let xCoordinate: long = Int.toLong(1);
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = -Math.PI / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_8400
     * @tc.name testMathAtan2084
     * @tc.desc Verify atan2 method with representative finite float y=99.99f and unit x returns finite positive angle
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: float = 99.99f;
      let xCoordinate: float = 1.0f;
      let result: float = Math.atan2(yCoordinate, xCoordinate);
      let expected: float = Double.toFloat(1.5607956601082313);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_8500
     * @tc.name testMathAtan2085
     * @tc.desc Verify atan2 method with representative finite double coordinates y=999999.99 x=1000000.0 returns near PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yCoordinate: double = 999999.99;
      let xCoordinate: double = 1000000.0;
      let result: double = Math.atan2(yCoordinate, xCoordinate);
      let expected: double = 0.7853981583974483;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(diff < 1.0e-12).assertTrue();
    });
  });
}
