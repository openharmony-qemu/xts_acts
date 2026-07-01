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


export default function mathClz32Test(): void {
  describe('MathClz32Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0100
     * @tc.name testMathClz32001
     * @tc.desc Verify clz32 method with int input 0 for expected return 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(32);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0200
     * @tc.name testMathClz32002
     * @tc.desc Verify clz32 method with int input 1 for expected return 31
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 1;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(31);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0300
     * @tc.name testMathClz32003
     * @tc.desc Verify clz32 method with int input 2 for expected return 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(30);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0400
     * @tc.name testMathClz32004
     * @tc.desc Verify clz32 method with int input 3 for expected return 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 3;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(30);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0500
     * @tc.name testMathClz32005
     * @tc.desc Verify clz32 method with int input 4 for expected return 29
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 4;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(29);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0600
     * @tc.name testMathClz32006
     * @tc.desc Verify clz32 method with int input 7 for expected return 29
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 7;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(29);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0700
     * @tc.name testMathClz32007
     * @tc.desc Verify clz32 method with int input 8 for expected return 28
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 8;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(28);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0800
     * @tc.name testMathClz32008
     * @tc.desc Verify clz32 method with int input 15 for expected return 28
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 15;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(28);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0900
     * @tc.name testMathClz32009
     * @tc.desc Verify clz32 method with int input 16 for expected return 27
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 16;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(27);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1000
     * @tc.name testMathClz32010
     * @tc.desc Verify clz32 method with int input 31 for expected return 27
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 31;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(27);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1100
     * @tc.name testMathClz32011
     * @tc.desc Verify clz32 method with int input 32 for expected return 26
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 32;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(26);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1200
     * @tc.name testMathClz32012
     * @tc.desc Verify clz32 method with int input 63 for expected return 26
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 63;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(26);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1300
     * @tc.name testMathClz32013
     * @tc.desc Verify clz32 method with int input 64 for expected return 25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 64;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1400
     * @tc.name testMathClz32014
     * @tc.desc Verify clz32 method with int input 255 for expected return 24
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 255;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(24);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1500
     * @tc.name testMathClz32015
     * @tc.desc Verify clz32 method with int input 256 for expected return 23
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 256;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(23);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1600
     * @tc.name testMathClz32016
     * @tc.desc Verify clz32 method with int input 1024 for expected return 21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 1024;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1700
     * @tc.name testMathClz32017
     * @tc.desc Verify clz32 method with int input 65535 for expected return 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 65535;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1800
     * @tc.name testMathClz32018
     * @tc.desc Verify clz32 method with int input 65536 for expected return 15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 65536;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1900
     * @tc.name testMathClz32019
     * @tc.desc Verify clz32 method with int input 16777215 for expected return 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 16777215;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2000
     * @tc.name testMathClz32020
     * @tc.desc Verify clz32 method with Int.MAX_VALUE input for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2100
     * @tc.name testMathClz32021
     * @tc.desc Verify clz32 method with int input -1 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = -1;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2200
     * @tc.name testMathClz32022
     * @tc.desc Verify clz32 method with int input -100 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = -100;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2300
     * @tc.name testMathClz32023
     * @tc.desc Verify clz32 method with double input 0.0 for expected return 32.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2400
     * @tc.name testMathClz32024
     * @tc.desc Verify clz32 method with double input -0.0 for expected return 32.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2500
     * @tc.name testMathClz32025
     * @tc.desc Verify clz32 method with double input 1.0 for expected return 31.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(31.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2600
     * @tc.name testMathClz32026
     * @tc.desc Verify clz32 method with double input 1.1 for expected return 31.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.1;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(31.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2700
     * @tc.name testMathClz32027
     * @tc.desc Verify clz32 method with double input 1.5 for expected return 31.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.5;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(31.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2800
     * @tc.name testMathClz32028
     * @tc.desc Verify clz32 method with double input 1.99 for expected return 31.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.99;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(31.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2900
     * @tc.name testMathClz32029
     * @tc.desc Verify clz32 method with double input 2.0 for expected return 30.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(30.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3000
     * @tc.name testMathClz32030
     * @tc.desc Verify clz32 method with double input 3.9 for expected return 30.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.9;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(30.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3100
     * @tc.name testMathClz32031
     * @tc.desc Verify clz32 method with double input 16.0 for expected return 27.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 16.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(27.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3200
     * @tc.name testMathClz32032
     * @tc.desc Verify clz32 method with double input 31.9 for expected return 27.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 31.9;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(27.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3300
     * @tc.name testMathClz32033
     * @tc.desc Verify clz32 method with double input 32.0 for expected return 26.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 32.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(26.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3400
     * @tc.name testMathClz32034
     * @tc.desc Verify clz32 method with double input 255.0 for expected return 24.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 255.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(24.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3500
     * @tc.name testMathClz32035
     * @tc.desc Verify clz32 method with double input 256.0 for expected return 23.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 256.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(23.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3600
     * @tc.name testMathClz32036
     * @tc.desc Verify clz32 method with double input 65535.0 for expected return 16.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 65535.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(16.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3700
     * @tc.name testMathClz32037
     * @tc.desc Verify clz32 method with double input 65536.0 for expected return 15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 65536.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(15.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3800
     * @tc.name testMathClz32038
     * @tc.desc Verify clz32 method with double input 4294967295.0 for expected return 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 4294967295.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3900
     * @tc.name testMathClz32039
     * @tc.desc Verify clz32 method with double input 4294967296.0 for expected return 32.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 4294967296.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4000
     * @tc.name testMathClz32040
     * @tc.desc Verify clz32 method with double input -0.5 for expected return 32.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.5;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4100
     * @tc.name testMathClz32041
     * @tc.desc Verify clz32 method with double input -1.0 for expected return 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4200
     * @tc.name testMathClz32042
     * @tc.desc Verify clz32 method with double input -2.0 for expected return 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4300
     * @tc.name testMathClz32043
     * @tc.desc Verify clz32 method with double input 1e+20 for expected return 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1e+20;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4400
     * @tc.name testMathClz32044
     * @tc.desc Verify clz32 method with double input -1000000000000000.0 for expected return 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1000000000000000.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4500
     * @tc.name testMathClz32045
     * @tc.desc Verify clz32 method with double Double.POSITIVE_INFINITY for 32.0 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.clz32(infValue);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4600
     * @tc.name testMathClz32046
     * @tc.desc Verify clz32 method with double Double.NEGATIVE_INFINITY for 32.0 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = -1.0 / 0.0;
      let result: double = Math.clz32(negInfValue);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4700
     * @tc.name testMathClz32047
     * @tc.desc Verify clz32 method with int variable for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 1000;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(22);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4800
     * @tc.name testMathClz32048
     * @tc.desc Verify clz32 method with Int.MIN_VALUE input for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MIN_VALUE;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4900
     * @tc.name testMathClz32049
     * @tc.desc Verify clz32 method with widened byte zero input returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(32);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5000
     * @tc.name testMathClz32050
     * @tc.desc Verify clz32 method with widened byte normal input 12 returns 28
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(12);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(28);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5100
     * @tc.name testMathClz32051
     * @tc.desc Verify clz32 method with widened byte negative one input returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-1);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5200
     * @tc.name testMathClz32052
     * @tc.desc Verify clz32 method with widened byte maximum boundary 127 returns 25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(127);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5300
     * @tc.name testMathClz32053
     * @tc.desc Verify clz32 method with widened byte minimum boundary -128 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-128);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5400
     * @tc.name testMathClz32054
     * @tc.desc Verify clz32 method with byte overflow conversion input 128 follows wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(128);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5500
     * @tc.name testMathClz32055
     * @tc.desc Verify clz32 method with widened short zero input returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(32);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5600
     * @tc.name testMathClz32056
     * @tc.desc Verify clz32 method with widened short normal input 2048 returns 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(2048);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5700
     * @tc.name testMathClz32057
     * @tc.desc Verify clz32 method with widened short maximum boundary 32767 returns 17
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32767);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(17);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5800
     * @tc.name testMathClz32058
     * @tc.desc Verify clz32 method with widened short minimum boundary -32768 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32768);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_5900
     * @tc.name testMathClz32059
     * @tc.desc Verify clz32 method with short mapped value 65535 follows wrapped value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(65535);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6000
     * @tc.name testMathClz32060
     * @tc.desc Verify clz32 method with short overflow conversion input 32768 follows wrapped value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32768);
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6100
     * @tc.name testMathClz32061
     * @tc.desc Verify clz32 method with hexadecimal int input 0x1234 returns 19
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0x1234;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(19);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6200
     * @tc.name testMathClz32062
     * @tc.desc Verify clz32 method with binary int input 0b1010 returns 28
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0b1010;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(28);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6300
     * @tc.name testMathClz32063
     * @tc.desc Verify clz32 method with Int.MAX_VALUE minus one returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE - 1;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6400
     * @tc.name testMathClz32064
     * @tc.desc Verify clz32 method with int overflow from Int.MAX_VALUE plus one follows wrapped value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let input: int = maxValue + 1;
      let result: int = Math.clz32(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6500
     * @tc.name testMathClz32065
     * @tc.desc Verify clz32 method with widened long positive value outside int range returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(10000000000);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6600
     * @tc.name testMathClz32066
     * @tc.desc Verify clz32 method with widened long zero input returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Int.toLong(0);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6700
     * @tc.name testMathClz32067
     * @tc.desc Verify clz32 method with widened long negative value outside int range returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-10000000000);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6800
     * @tc.name testMathClz32068
     * @tc.desc Verify clz32 method with widened Long.MAX_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_6900
     * @tc.name testMathClz32069
     * @tc.desc Verify clz32 method with widened Long.MIN_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MIN_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7000
     * @tc.name testMathClz32070
     * @tc.desc Verify clz32 method with long overflow from Long.MAX_VALUE plus one follows wrapped value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: long = Long.MAX_VALUE;
      let input: long = maxValue + Int.toLong(1);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7100
     * @tc.name testMathClz32071
     * @tc.desc Verify clz32 method with float normal input 3.14f returns 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(3.14);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(30.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7200
     * @tc.name testMathClz32072
     * @tc.desc Verify clz32 method with float negative finite input -99.99f returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-99.99);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7300
     * @tc.name testMathClz32073
     * @tc.desc Verify clz32 method with Float.MAX_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MAX_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7400
     * @tc.name testMathClz32074
     * @tc.desc Verify clz32 method with Float.MIN_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MIN_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7500
     * @tc.name testMathClz32075
     * @tc.desc Verify clz32 method with negative Float.MIN_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MIN_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7600
     * @tc.name testMathClz32076
     * @tc.desc Verify clz32 method with float positive zero input returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.0);
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7700
     * @tc.name testMathClz32077
     * @tc.desc Verify clz32 method with Float.POSITIVE_INFINITY input returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7800
     * @tc.name testMathClz32078
     * @tc.desc Verify clz32 method with Float.NEGATIVE_INFINITY input returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_7900
     * @tc.name testMathClz32079
     * @tc.desc Verify clz32 method with Double.MAX_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MAX_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8000
     * @tc.name testMathClz32080
     * @tc.desc Verify clz32 method with Double.MIN_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MIN_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8100
     * @tc.name testMathClz32081
     * @tc.desc Verify clz32 method with negative Double.MIN_VALUE boundary returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MIN_VALUE;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8200
     * @tc.name testMathClz32082
     * @tc.desc Verify clz32 method with double fractional input 1025.75 returns 21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1025.75;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(21.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8300
     * @tc.name testMathClz32083
     * @tc.desc Verify clz32 method with double Int.MAX_VALUE boundary returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8400
     * @tc.name testMathClz32084
     * @tc.desc Verify clz32 method with double sign bit boundary 2147483648.0 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483648.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8500
     * @tc.name testMathClz32085
     * @tc.desc Verify clz32 method with double fractional sign bit boundary 2147483648.5 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483648.5;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8600
     * @tc.name testMathClz32086
     * @tc.desc Verify clz32 method with double below signed int minimum wraps to Int.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2147483649.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8700
     * @tc.name testMathClz32087
     * @tc.desc Verify clz32 method with double 2 power 32 plus one wraps to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 4294967297.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(31.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8800
     * @tc.name testMathClz32088
     * @tc.desc Verify clz32 method with double negative 2 power 32 wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -4294967296.0;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_8900
     * @tc.name testMathClz32089
     * @tc.desc Verify clz32 method with double fractional negative input -1.5 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.5;
      let result: double = Math.clz32(input);
      expect(result).assertEqual(0.0);
    });
  });
}
