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


export default function mathImulTest(): void {
  describe('MathImulTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0100
     * @tc.name testMathImul001
     * @tc.desc Verify Math.imul with arguments 3 and 4 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3;
      let rightOperand: number = 4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0200
     * @tc.name testMathImul002
     * @tc.desc Verify Math.imul with arguments -3 and -4 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -3;
      let rightOperand: number = -4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0300
     * @tc.name testMathImul003
     * @tc.desc Verify Math.imul with arguments -3 and 4 for expected return -12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -3;
      let rightOperand: number = 4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0400
     * @tc.name testMathImul004
     * @tc.desc Verify Math.imul with arguments 3 and -4 for expected return -12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3;
      let rightOperand: number = -4;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0500
     * @tc.name testMathImul005
     * @tc.desc Verify Math.imul with arguments 3.9 and 4.1 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3.9;
      let rightOperand: number = 4.1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0600
     * @tc.name testMathImul006
     * @tc.desc Verify Math.imul with arguments 0 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0700
     * @tc.name testMathImul007
     * @tc.desc Verify Math.imul with arguments 0 and 5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0800
     * @tc.name testMathImul008
     * @tc.desc Verify Math.imul with arguments 5 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 5;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0900
     * @tc.name testMathImul009
     * @tc.desc Verify Math.imul with arguments nan and 5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 0.0 / 0.0;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1000
     * @tc.name testMathImul010
     * @tc.desc Verify Math.imul with arguments 5 and nan for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 5;
      let rightOperand: number = 0.0 / 0.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1100
     * @tc.name testMathImul011
     * @tc.desc Verify Math.imul with arguments inf and 5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 1.0 / 0.0;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1200
     * @tc.name testMathImul012
     * @tc.desc Verify Math.imul with arguments 5 and inf for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 5;
      let rightOperand: number = 1.0 / 0.0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1300
     * @tc.name testMathImul013
     * @tc.desc Verify Math.imul with arguments -inf and 5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1.0 / 0.0;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1400
     * @tc.name testMathImul014
     * @tc.desc Verify Math.imul with arguments 2147483647 and 1 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2147483647;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1500
     * @tc.name testMathImul015
     * @tc.desc Verify Math.imul with arguments -2147483647 and 1 for expected return -2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483647;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1600
     * @tc.name testMathImul016
     * @tc.desc Verify Math.imul with arguments 2147483647 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2147483647;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1700
     * @tc.name testMathImul017
     * @tc.desc Verify Math.imul with arguments -2147483647 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -2147483647;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1800
     * @tc.name testMathImul018
     * @tc.desc Verify Math.imul with arguments -1 and 5 for expected return -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = 5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1900
     * @tc.name testMathImul019
     * @tc.desc Verify Math.imul with arguments -1 and -5 for expected return 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = -5;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2000
     * @tc.name testMathImul020
     * @tc.desc Verify Math.imul with arguments -1 and 0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -1;
      let rightOperand: number = 0;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2100
     * @tc.name testMathImul021
     * @tc.desc Verify Math.imul with arguments 12345 and 67890 for expected return 838102050
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 12345;
      let rightOperand: number = 67890;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(838102050);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2200
     * @tc.name testMathImul022
     * @tc.desc Verify Math.imul with arguments -3 and 7 for expected return -21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -3;
      let rightOperand: number = 7;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2300
     * @tc.name testMathImul023
     * @tc.desc Verify Math.imul with arguments 123.9 and 1 for expected return 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 123.9;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(123);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2400
     * @tc.name testMathImul024
     * @tc.desc Verify Math.imul with arguments -456.7 and 1 for expected return -456
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -456.7;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-456);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2500
     * @tc.name testMathImul025
     * @tc.desc Verify Math.imul with arguments 1 and 1 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 1;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2600
     * @tc.name testMathImul026
     * @tc.desc Verify Math.imul with arguments 2 and 2 for expected return 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 2;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2700
     * @tc.name testMathImul027
     * @tc.desc Verify Math.imul with arguments 10 and 10 for expected return 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 10;
      let rightOperand: number = 10;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(100);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2800
     * @tc.name testMathImul028
     * @tc.desc Verify Math.imul with arguments 100 and 100 for expected return 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 100;
      let rightOperand: number = 100;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(10000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2900
     * @tc.name testMathImul029
     * @tc.desc Verify Math.imul with arguments -10 and 10 for expected return -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -10;
      let rightOperand: number = 10;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-100);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3000
     * @tc.name testMathImul030
     * @tc.desc Verify Math.imul with arguments 7 and 8 for expected return 56
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 7;
      let rightOperand: number = 8;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(56);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3100
     * @tc.name testMathImul031
     * @tc.desc Verify Math.imul with arguments -7 and -8 for expected return 56
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -7;
      let rightOperand: number = -8;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(56);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3200
     * @tc.name testMathImul032
     * @tc.desc Verify Math.imul with arguments 7 and -8 for expected return -56
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 7;
      let rightOperand: number = -8;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-56);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3300
     * @tc.name testMathImul033
     * @tc.desc Verify Math.imul with arguments -7 and 8 for expected return -56
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -7;
      let rightOperand: number = 8;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-56);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3400
     * @tc.name testMathImul034
     * @tc.desc Verify Math.imul with arguments 31 and 31 for expected return 961
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 31;
      let rightOperand: number = 31;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(961);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3500
     * @tc.name testMathImul035
     * @tc.desc Verify Math.imul with arguments 127 and 127 for expected return 16129
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 127;
      let rightOperand: number = 127;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(16129);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3600
     * @tc.name testMathImul036
     * @tc.desc Verify Math.imul with arguments 255 and 255 for expected return 65025
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 255;
      let rightOperand: number = 255;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(65025);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3700
     * @tc.name testMathImul037
     * @tc.desc Verify Math.imul with arguments 1023 and 1023 for expected return 1046529
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 1023;
      let rightOperand: number = 1023;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1046529);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3800
     * @tc.name testMathImul038
     * @tc.desc Verify Math.imul with arguments 4095 and 4095 for expected return 16769025
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 4095;
      let rightOperand: number = 4095;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(16769025);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3900
     * @tc.name testMathImul039
     * @tc.desc Verify Math.imul with arguments 17 and 19 for expected return 323
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 17;
      let rightOperand: number = 19;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(323);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4000
     * @tc.name testMathImul040
     * @tc.desc Verify Math.imul with arguments 43 and 47 for expected return 2021
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 43;
      let rightOperand: number = 47;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(2021);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4100
     * @tc.name testMathImul041
     * @tc.desc Verify Math.imul with arguments 89 and 97 for expected return 8633
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 89;
      let rightOperand: number = 97;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(8633);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4200
     * @tc.name testMathImul042
     * @tc.desc Verify Math.imul with arguments 12 and 34 for expected return 408
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 12;
      let rightOperand: number = 34;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(408);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4300
     * @tc.name testMathImul043
     * @tc.desc Verify Math.imul with arguments 56 and 78 for expected return 4368
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 56;
      let rightOperand: number = 78;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(4368);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4400
     * @tc.name testMathImul044
     * @tc.desc Verify Math.imul with arguments 45 and 67 for expected return 3015
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 45;
      let rightOperand: number = 67;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(3015);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4500
     * @tc.name testMathImul045
     * @tc.desc Verify Math.imul with arguments 89 and 1 for expected return 89
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 89;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(89);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4600
     * @tc.name testMathImul046
     * @tc.desc Verify Math.imul with arguments 65535 and 1 for expected return 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65535;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4700
     * @tc.name testMathImul047
     * @tc.desc Verify Math.imul with arguments 65535 and -1 for expected return -65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 65535;
      let rightOperand: number = -1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4800
     * @tc.name testMathImul048
     * @tc.desc Verify Math.imul with arguments 32767 and 2 for expected return 65534
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 32767;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(65534);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4900
     * @tc.name testMathImul049
     * @tc.desc Verify Math.imul with arguments -32768 and 2 for expected return -65536
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = -32768;
      let rightOperand: number = 2;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(-65536);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5000
     * @tc.name testMathImul050
     * @tc.desc Verify Math.imul with arguments 1000 and 1000 for expected return 1000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 1000;
      let rightOperand: number = 1000;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1000000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5100
     * @tc.name testMathImul051
     * @tc.desc Verify Math.imul with arguments 32767 and 32767 for expected return 1073676289
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 32767;
      let rightOperand: number = 32767;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(1073676289);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5200
     * @tc.name testMathImul052
     * @tc.desc Verify Math.imul with arguments 32768 and 1 for expected return 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 32768;
      let rightOperand: number = 1;
      let result: number = Math.imul(leftOperand, rightOperand);
      expect(result).assertEqual(32768);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5300
     * @tc.name testMathImul053
     * @tc.desc Verify imul is static method callable via Math class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(3, 4);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5400
     * @tc.name testMathImul054
     * @tc.desc Verify imul idempotency with repeated same-argument calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathImul054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 3;
      let rightOperand: number = 4;
      let firstCallProduct: number = Math.imul(leftOperand, rightOperand);
      let secondCallProduct: number = Math.imul(leftOperand, rightOperand);
      let thirdCallProduct: number = Math.imul(leftOperand, rightOperand);
      expect(firstCallProduct).assertEqual(12);
      expect(firstCallProduct).assertEqual(secondCallProduct);
      expect(secondCallProduct).assertEqual(thirdCallProduct);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5500
     * @tc.name testMathImul055
     * @tc.desc Verify imul commutativity with swapped argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathImul055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftOperand: number = 12345;
      let rightOperand: number = 67890;
      let forwardOrderProduct: number = Math.imul(leftOperand, rightOperand);
      let swappedOrderProduct: number = Math.imul(rightOperand, leftOperand);
      expect(forwardOrderProduct).assertEqual(838102050);
      expect(forwardOrderProduct).assertEqual(swappedOrderProduct);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5600
     * @tc.name testMathImul056
     * @tc.desc Verify imul in string hash computation scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathImul056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hash: number = 5381;
      let firstHashProduct: number = Math.imul(33, hash);
      hash = firstHashProduct + 65;
      let secondHashProduct: number = Math.imul(33, hash);
      hash = secondHashProduct + 66;
      let thirdHashProduct: number = Math.imul(33, hash);
      hash = thirdHashProduct + 67;
      expect(hash).assertEqual(193450027);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5700
     * @tc.name testMathImul057
     * @tc.desc Verify Math.imul with positive zero and negative zero returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveZero: number = 0.0;
      let negativeZero: number = -0.0;
      let result: number = Math.imul(positiveZero, negativeZero);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
      expect(Utils.isNegativeZero(result)).assertFalse();
    });
  });
}
