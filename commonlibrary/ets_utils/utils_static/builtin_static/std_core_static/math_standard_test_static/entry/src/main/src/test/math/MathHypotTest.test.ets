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
  afterEach,
  beforeEach,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';


function assertHypotClose(actual: double, expected: double, tolerance: double): void {
  let diff: double = Utils.getAbsDiff(actual, expected);
  expect(diff < tolerance).assertTrue();
}

function buildHypotNumberFromHelper(): number {
  return Math.max(9.0, 4.0);
}


export default function mathHypotTest(): void {
  describe('MathHypotTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0100
     * @tc.name testMathHypot001
     * @tc.desc Verify hypot method scenario: 零参数传入hypot，验证返回0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot();
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0200
     * @tc.name testMathHypot002
     * @tc.desc Verify hypot method scenario: 单正参数传入hypot，验证绝对值等价
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 5.0;
      let result: double = Math.hypot(v1);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0300
     * @tc.name testMathHypot003
     * @tc.desc Verify hypot method scenario: 单负参数传入hypot，验证符号消除
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = -3.0;
      let result: double = Math.hypot(v1);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0400
     * @tc.name testMathHypot004
     * @tc.desc Verify hypot method scenario: 两参数勾股数(3,4)传入hypot，验证返回5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 3.0;
      let v2: double = 4.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0500
     * @tc.name testMathHypot005
     * @tc.desc Verify hypot method scenario: 三参数传入hypot，验证多维欧几里得范数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 2.0;
      let v2: double = 3.0;
      let v3: double = 6.0;
      let result: double = Math.hypot(v1, v2, v3);
      expect(result).assertEqual(7.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0600
     * @tc.name testMathHypot006
     * @tc.desc Verify hypot method scenario: 十参数传入hypot，验证高维范数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1.0;
      let v2: double = 2.0;
      let v3: double = 3.0;
      let v4: double = 4.0;
      let v5: double = 5.0;
      let v6: double = 6.0;
      let v7: double = 7.0;
      let v8: double = 8.0;
      let v9: double = 9.0;
      let v10: double = 10.0;
      let result: double = Math.hypot(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
      let expected: double = 19.621416870348586;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0700
     * @tc.name testMathHypot007
     * @tc.desc Verify hypot method scenario: 混合正负零参数传入hypot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = -2.0;
      let v2: double = 0.0;
      let v3: double = 3.0;
      let result: double = Math.hypot(v1, v2, v3);
      let expected: double = 3.6055512754639896;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0800
     * @tc.name testMathHypot008
     * @tc.desc Verify hypot method scenario: 两参数勾股数(6,8)传入hypot，验证返回10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 6.0;
      let v2: double = 8.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0900
     * @tc.name testMathHypot009
     * @tc.desc Verify hypot method scenario: 全零多参数传入hypot，验证返回0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 0.0;
      let v2: double = 0.0;
      let v3: double = 0.0;
      let result: double = Math.hypot(v1, v2, v3);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1000
     * @tc.name testMathHypot010
     * @tc.desc Verify hypot method scenario: 含NaN参数传入hypot，验证NaN传播
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let normalValue: double = 1.0;
      let result: double = Math.hypot(nanValue, normalValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1100
     * @tc.name testMathHypot011
     * @tc.desc Verify hypot method scenario: 含正无穷参数传入hypot，验证返回正无穷
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let v1: double = 1.0;
      let v2: double = 2.0;
      let result: double = Math.hypot(infValue, v1, v2);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1200
     * @tc.name testMathHypot012
     * @tc.desc Verify hypot method scenario: Infinity与NaN共存传入hypot，验证Infinity优先
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.hypot(nanValue, infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1300
     * @tc.name testMathHypot013
     * @tc.desc Verify hypot method scenario: 不同参数个数分支切换验证
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.0;
      let b: double = 4.0;
      let c: double = 12.0;
      let r0: double = Math.hypot();
      let r1: double = Math.hypot(a);
      let r2: double = Math.hypot(a, b);
      let r3: double = Math.hypot(a, b, c);
      expect(r0).assertEqual(0.0);
      expect(r1).assertEqual(3.0);
      expect(r2).assertEqual(5.0);
      expect(r3).assertEqual(13.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1400
     * @tc.name testMathHypot014
     * @tc.desc Verify hypot method scenario: 负零单参数传入hypot，验证返回正零
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = -0.0;
      let result: double = Math.hypot(v1);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1500
     * @tc.name testMathHypot015
     * @tc.desc Verify hypot method scenario: 单零参数传入hypot，验证返回0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 0.0;
      let result: double = Math.hypot(v1);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1600
     * @tc.name testMathHypot016
     * @tc.desc Verify hypot method scenario: 单NaN参数传入hypot，验证返回NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let result: double = Math.hypot(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1700
     * @tc.name testMathHypot017
     * @tc.desc Verify hypot method scenario: 单正无穷参数传入hypot，验证返回正无穷
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.hypot(infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1800
     * @tc.name testMathHypot018
     * @tc.desc Verify hypot method scenario: 单负无穷参数传入hypot，验证返回正无穷
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInf: double = -1.0 / 0.0;
      let posInf: double = 1.0 / 0.0;
      let result: double = Math.hypot(negInf);
      expect(result).assertEqual(posInf);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1900
     * @tc.name testMathHypot019
     * @tc.desc Verify hypot method scenario: 极大参数传入hypot，验证无溢出
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1e+154;
      let result: double = Math.hypot(v1);
      expect(result).assertEqual(1e+154);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2000
     * @tc.name testMathHypot020
     * @tc.desc Verify hypot method scenario: 极小参数传入hypot，验证精度
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1e-200;
      let result: double = Math.hypot(v1);
      let expected: double = 1e-200;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2100
     * @tc.name testMathHypot021
     * @tc.desc Verify hypot method scenario: 二维欧氏距离计算场景
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1: double = 1.0;
      let y1: double = 2.0;
      let x2: double = 5.0;
      let y2: double = 5.0;
      let dx: double = x2 - x1;
      let dy: double = y2 - y1;
      let distance: double = Math.hypot(dx, dy);
      expect(distance).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2200
     * @tc.name testMathHypot022
     * @tc.desc Verify hypot method scenario: 原点距离勾股数(12,-5)场景
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 12.0;
      let v2: double = -5.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(13.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2300
     * @tc.name testMathHypot023
     * @tc.desc Verify hypot method scenario: 五参数传入hypot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1.0;
      let v2: double = 2.0;
      let v3: double = 3.0;
      let v4: double = 4.0;
      let v5: double = 5.0;
      let result: double = Math.hypot(v1, v2, v3, v4, v5);
      let expected: double = 7.416198487095663;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2400
     * @tc.name testMathHypot024
     * @tc.desc Verify hypot method scenario: Math类名静态调用hypot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(3.0, 4.0);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2500
     * @tc.name testMathHypot025
     * @tc.desc Verify hypot method scenario: 相同参数多次调用hypot幂等性
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.0;
      let b: double = 4.0;
      let r1: double = Math.hypot(a, b);
      let r2: double = Math.hypot(a, b);
      let r3: double = Math.hypot(a, b);
      expect(r1).assertEqual(5.0);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2600
     * @tc.name testMathHypot026
     * @tc.desc Verify hypot method scenario: 任意参数组合返回非负验证
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negA: double = -5.0;
      let negB: double = -12.0;
      let result1: double = Math.hypot(negA, negB);
      let result2: double = Math.hypot(-1.0, -1.0, -1.0);
      expect(result1 >= 0.0).assertTrue();
      expect(result2 >= 0.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2700
     * @tc.name testMathHypot027
     * @tc.desc Verify hypot method with arguments 5.0 and 12.0 for expected return 13.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 5.0;
      let v2: double = 12.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(13.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2800
     * @tc.name testMathHypot028
     * @tc.desc Verify hypot method accepts number typed variables and returns the expected Euclidean norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: number = 9.0;
      let v2: number = 12.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(15.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2900
     * @tc.name testMathHypot029
     * @tc.desc Verify hypot method accepts helper-returned number input and returns the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: number = buildHypotNumberFromHelper();
      let v2: double = 40.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(41.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3000
     * @tc.name testMathHypot030
     * @tc.desc Verify hypot method accepts byte and short source values widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: byte = Int.toByte(5);
      let v2: short = Int.toShort(12);
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(13.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3100
     * @tc.name testMathHypot031
     * @tc.desc Verify hypot method accepts long source values widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: long = Int.toLong(20);
      let v2: long = Int.toLong(21);
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(29.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3200
     * @tc.name testMathHypot032
     * @tc.desc Verify hypot method accepts float source values widened to the double rest parameter path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: float = Double.toFloat(1.5);
      let v2: float = Double.toFloat(2.0);
      let result: double = Math.hypot(v1, v2);
      assertHypotClose(result, 2.5, 1.0e-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3300
     * @tc.name testMathHypot033
     * @tc.desc Verify hypot method accepts arithmetic expression results as independent input sources
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 2.0;
      let right: double = 10.0;
      let v1: double = right - left;
      let v2: double = left + right + 3.0;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(17.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3400
     * @tc.name testMathHypot034
     * @tc.desc Verify hypot method with multiple Double.MAX_VALUE inputs overflows the final norm to Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.MAX_VALUE, Double.MAX_VALUE, Double.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3500
     * @tc.name testMathHypot035
     * @tc.desc Verify hypot method delays NaN propagation until all parameters are scanned and no Infinity is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.hypot(3.0, nanValue, 4.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3600
     * @tc.name testMathHypot036
     * @tc.desc Verify hypot method scales large finite inputs without overflowing the intermediate square
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(1.0e154, 1.0e154);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertHypotClose(result, 1.414213562373095e154, 1.0e140);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3700
     * @tc.name testMathHypot037
     * @tc.desc Verify hypot method with mixed signed multi-parameter inputs computes the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(-6.0, 8.0, -24.0);
      expect(result).assertEqual(26.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3800
     * @tc.name testMathHypot038
     * @tc.desc Verify hypot method with arguments 1.0 and 3.0 for expected irrational norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1.0;
      let v2: double = 3.0;
      let result: double = Math.hypot(v1, v2);
      assertHypotClose(result, 3.1622776601683795, 1.0e-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3900
     * @tc.name testMathHypot039
     * @tc.desc Verify hypot method keeps the result unchanged when a positive zero component is added
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withoutZero: double = Math.hypot(5.0, 12.0);
      let withZero: double = Math.hypot(5.0, 12.0, 0.0);
      expect(withZero).assertEqual(withoutZero);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4000
     * @tc.name testMathHypot040
     * @tc.desc Verify hypot method keeps the result unchanged when a negative zero component is added
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withoutZero: double = Math.hypot(8.0, 15.0);
      let withNegativeZero: double = Math.hypot(8.0, 15.0, -0.0);
      expect(withNegativeZero).assertEqual(withoutZero);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4100
     * @tc.name testMathHypot041
     * @tc.desc Verify hypot method with Float.MAX_VALUE and zero stays finite on the widened double path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: float = Float.MAX_VALUE;
      let v2: double = 0.0;
      let result: double = Math.hypot(v1, v2);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertHypotClose(result, Float.MAX_VALUE, 1.0e25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4200
     * @tc.name testMathHypot042
     * @tc.desc Verify hypot method preserves a Double.MIN_VALUE component when paired with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.MIN_VALUE, 0.0);
      expect(result).assertEqual(Double.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4300
     * @tc.name testMathHypot043
     * @tc.desc Verify hypot method computes a large integer-like business distance from long sources
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: long = Long.toLong(9000000000);
      let v2: long = Long.toLong(12000000000);
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(15000000000.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4400
     * @tc.name testMathHypot044
     * @tc.desc Verify hypot method consumes Math constant expression inputs and returns the expected finite norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = Math.PI - Math.PI;
      let v2: double = Math.E;
      let result: double = Math.hypot(v1, v2);
      expect(result).assertEqual(Math.E);
    });
  });
}
