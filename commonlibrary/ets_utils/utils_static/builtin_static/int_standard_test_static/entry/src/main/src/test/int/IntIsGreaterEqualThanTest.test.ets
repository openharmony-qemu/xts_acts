'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function IntIsGreaterEqualThanTest(): void {
  describe('IntIsGreaterEqualThanTest', (): void => {
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
   * @tc.number INT_IS_GRTR_EQUAL_0100
   * @tc.name testIntIsGreaterEqualThan0001
   * @tc.desc Verify isGreaterEqualThan returns true when value is greater than other Int
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const result = a.isGreaterEqualThan(new Int(55));
    expect(result).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0200
   * @tc.name testIntIsGreaterEqualThan0002
   * @tc.desc Verify error when no parameter is passed
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(10);
    const b = new Int(10);
    expect(a.isGreaterEqualThan(b)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0400
   * @tc.name testIntIsGreaterEqualThan0004
   * @tc.desc Verify normal Int value comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(150);
    const b = new Int(100);
    const result = a.isGreaterEqualThan(b);
    expect(result).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0500
   * @tc.name testIntIsGreaterEqualThan0005
   * @tc.desc Verify positive number comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    expect(a.isGreaterEqualThan(new Int(50))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(100))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(150))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0600
   * @tc.name testIntIsGreaterEqualThan0006
   * @tc.desc Verify negative number comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(-50);
    expect(a.isGreaterEqualThan(new Int(-100))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(-50))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(-25))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0700
   * @tc.name testIntIsGreaterEqualThan0007
   * @tc.desc Verify positive and negative number comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(50);
    expect(a.isGreaterEqualThan(new Int(-50))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(50))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(100))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0800
   * @tc.name testIntIsGreaterEqualThan0008
   * @tc.desc Verify maximum value comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(2147483647);
    expect(a.isGreaterEqualThan(new Int(2147483647))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(2147483647 - 1))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_0900
   * @tc.name testIntIsGreaterEqualThan0009
   * @tc.desc Verify comparison with minimum int value
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    expect(a.isGreaterEqualThan(new Int(-2147483648))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1000
   * @tc.name testIntIsGreaterEqualThan0010
   * @tc.desc Verify maximum value is greater than or equal to minimum and itself
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const max = new Int(2147483647);
    expect(max.isGreaterEqualThan(new Int(-2147483648))).assertTrue();
    expect(max.isGreaterEqualThan(new Int(2147483647))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1100
   * @tc.name testIntIsGreaterEqualThan0011
   * @tc.desc Verify comparison results against zero
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(50);
    expect(a.isGreaterEqualThan(new Int(0))).assertTrue();

    const b = new Int(0);
    expect(b.isGreaterEqualThan(new Int(0))).assertTrue();

    const c = new Int(-50);
    expect(c.isGreaterEqualThan(new Int(0))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1200
   * @tc.name testIntIsGreaterEqualThan0012
   * @tc.desc Verify positive adjacent value and equality comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(2);
    expect(a.isGreaterEqualThan(new Int(1))).assertTrue();

    const b = new Int(1);
    expect(b.isGreaterEqualThan(new Int(1))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1300
   * @tc.name testIntIsGreaterEqualThan0013
   * @tc.desc Verify zero and negative equality comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(0);
    expect(a.isGreaterEqualThan(new Int(-1))).assertTrue();

    const b = new Int(-1);
    expect(b.isGreaterEqualThan(new Int(-1))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1600
   * @tc.name testIntIsGreaterEqualThan0016
   * @tc.desc Verify number parameter comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const result = a.isGreaterEqualThan(55);
    expect(result).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1700
   * @tc.name testIntIsGreaterEqualThan0017
   * @tc.desc Verify return value is boolean
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const result = a.isGreaterEqualThan(new Int(55));
    expect(typeof result).assertEqual("boolean");
    expect(result).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1800
   * @tc.name testIntIsGreaterEqualThan0018
   * @tc.desc Verify true results for smaller and equal positive values
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    expect(a.isGreaterEqualThan(new Int(50))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(99))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(100))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_1900
   * @tc.name testIntIsGreaterEqualThan0019
   * @tc.desc Verify false results for greater positive values
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(50);
    expect(a.isGreaterEqualThan(new Int(100))).assertFalse();
    expect(a.isGreaterEqualThan(new Int(75))).assertFalse();
    expect(a.isGreaterEqualThan(new Int(51))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2000
   * @tc.name testIntIsGreaterEqualThan0020
   * @tc.desc Verify greater and equal positive comparisons
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(75);
    expect(a.isGreaterEqualThan(new Int(65))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(75))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(50))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2100
   * @tc.name testIntIsGreaterEqualThan0021
   * @tc.desc Verify false comparisons when receiver is smaller
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    expect(a.isGreaterEqualThan(new Int(75))).assertFalse();
    expect(a.isGreaterEqualThan(new Int(100))).assertFalse();
    expect(a.isGreaterEqualThan(new Int(66))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2200
   * @tc.name testIntIsGreaterEqualThan0022
   * @tc.desc Verify negative value comparison combinations
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(-50);
    expect(a.isGreaterEqualThan(new Int(-100))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(-50))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(-200))).assertTrue();
    expect(a.isGreaterEqualThan(new Int(0))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2300
   * @tc.name testIntIsGreaterEqualThan0023
   * @tc.desc Verify negative value false comparison cases
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(-100);
    expect(a.isGreaterEqualThan(new Int(-50))).assertFalse();
    expect(a.isGreaterEqualThan(new Int(-25))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2400
   * @tc.name testIntIsGreaterEqualThan0024
   * @tc.desc Verify positive and zero values are greater than or equal to zero
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(1);
    expect(a.isGreaterEqualThan(new Int(0))).assertTrue();

    const b = new Int(0);
    expect(b.isGreaterEqualThan(new Int(0))).assertTrue();

    const c = new Int(100);
    expect(c.isGreaterEqualThan(new Int(0))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2500
   * @tc.name testIntIsGreaterEqualThan0025
   * @tc.desc Verify negative values are not greater than or equal to zero
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(-1);
    expect(a.isGreaterEqualThan(new Int(0))).assertFalse();

    const b = new Int(-100);
    expect(b.isGreaterEqualThan(new Int(0))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2600
   * @tc.name testIntIsGreaterEqualThan0026
   * @tc.desc Verify equality returns true for positive negative and zero values
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    expect(a.isGreaterEqualThan(new Int(100))).assertTrue();

    const b = new Int(-100);
    expect(b.isGreaterEqualThan(new Int(-100))).assertTrue();

    const c = new Int(0);
    expect(c.isGreaterEqualThan(new Int(0))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2800
   * @tc.name testIntIsGreaterEqualThan0028
   * @tc.desc Verify comparison with Int variable parameter
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const b = new Int(55);
    const result = a.isGreaterEqualThan(b);
    expect(result).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_2900
   * @tc.name testIntIsGreaterEqualThan0029
   * @tc.desc Verify greater equal relation matches less equal relation
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(75);
    const b = new Int(65);
    expect(a.isGreaterEqualThan(b)).assertTrue();
    expect(b.isLessEqualThan(a)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3000
   * @tc.name testIntIsGreaterEqualThan0030
   * @tc.desc Verify greater than implies greater equal
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(75);
    const b = new Int(65);
    expect(a.isGreaterEqualThan(b)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3100
   * @tc.name testIntIsGreaterEqualThan0031
   * @tc.desc Verify equality is not greater than but is greater equal
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const b = new Int(65);
    expect(a.isGreaterEqualThan(b)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3200
   * @tc.name testIntIsGreaterEqualThan0032
   * @tc.desc Verify greater equal result is opposite of less than for greater value
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(75);
    const b = new Int(65);
    expect(a.isGreaterEqualThan(b)).assertTrue();
    expect(a.isLessThan(b)).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3300
   * @tc.name testIntIsGreaterEqualThan0033
   * @tc.desc Verify equality satisfies both greater equal and less equal
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const b = new Int(65);
    expect(a.isGreaterEqualThan(b)).assertTrue();
    expect(a.isLessEqualThan(b)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3400
   * @tc.name testIntIsGreaterEqualThan0034
   * @tc.desc Verify maximum boundary comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(2147483647);
    expect(a.isGreaterEqualThan(new Int(2147483647))).assertTrue();

    const b = new Int(2147483647 - 1);
    expect(b.isGreaterEqualThan(new Int(2147483647))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3500
   * @tc.name testIntIsGreaterEqualThan0035
   * @tc.desc Verify minimum boundary comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(-2147483648);
    expect(a.isGreaterEqualThan(new Int(-2147483648))).assertTrue();

    const b = new Int(-2147483648 + 1);
    expect(b.isGreaterEqualThan(new Int(-2147483648))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3600
   * @tc.name testIntIsGreaterEqualThan0036
   * @tc.desc Verify maximum and minimum cross comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const max = new Int(2147483647);
    expect(max.isGreaterEqualThan(new Int(-2147483648))).assertTrue();

    const min = new Int(-2147483648);
    expect(min.isGreaterEqualThan(new Int(2147483647))).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3700
   * @tc.name testIntIsGreaterEqualThan0037
   * @tc.desc Verify repeated positive sequence comparisons
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let i = 0; i < 100; i++) {
      const a = new Int(i);
      expect(a.isGreaterEqualThan(new Int(i))).assertTrue();
      expect(a.isGreaterEqualThan(new Int(i - 1))).assertTrue();
      expect(a.isGreaterEqualThan(new Int(i + 1))).assertFalse();
    }
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3800
   * @tc.name testIntIsGreaterEqualThan0038
   * @tc.desc Verify repeated negative sequence comparisons
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let i = -100; i < 0; i++) {
      const a = new Int(i);
      expect(a.isGreaterEqualThan(new Int(i))).assertTrue();
      expect(a.isGreaterEqualThan(new Int(i - 1))).assertTrue();
    }
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_3900
   * @tc.name testIntIsGreaterEqualThan0039
   * @tc.desc Verify range lower bound comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const value = new Int(50);
    const min = new Int(0);
    const max = new Int(100);
    expect(value.isGreaterEqualThan(min)).assertTrue();
    expect(value.isGreaterEqualThan(max)).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4000
   * @tc.name testIntIsGreaterEqualThan0040
   * @tc.desc Verify greater equal result in conditional logic
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const value = new Int(150);
    const threshold = new Int(100);
    expect(value.isGreaterEqualThan(threshold)).assertTrue();
    expect(value.toInt()).assertLargerOrEqual(100);
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4100
   * @tc.name testIntIsGreaterEqualThan0041
   * @tc.desc Verify boundary equality with greater than comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const value = new Int(100);
    const min = new Int(100);
    expect(value.isGreaterEqualThan(min)).assertTrue();
    expect(value.isGreaterThan(min)).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4200
   * @tc.name testIntIsGreaterEqualThan0042
   * @tc.desc Verify repeated greater equal calls return consistent result
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    const b = new Int(50);
    let result = false;
    for (let i = 0; i < 1000; i++) {
      result = a.isGreaterEqualThan(b);
    }
    expect(result).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4300
   * @tc.name testIntIsGreaterEqualThan0043
   * @tc.desc Verify simple Int comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    expect(a.isGreaterEqualThan(new Int(55))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4400
   * @tc.name testIntIsGreaterEqualThan0044
   * @tc.desc Verify table driven comparison results
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const testCases: int[][] = [[20, 10], [10, 20], [10, 10]];
    for (let i = 0; i < testCases.length; i++) {
      const aVal = testCases[i][0];
      const bVal = testCases[i][1];
      const a = new Int(aVal);
      const result = a.isGreaterEqualThan(new Int(bVal));
      expect(result).assertEqual(aVal >= bVal);
    }
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4600
   * @tc.name testIntIsGreaterEqualThan0046
   * @tc.desc Verify equality comparison of same value
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(123);
    expect(a.isGreaterEqualThan(new Int(123))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4700
   * @tc.name testIntIsGreaterEqualThan0047
   * @tc.desc Verify transitive greater equal relation
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    const b = new Int(50);
    const c = new Int(10);
    expect(a.isGreaterEqualThan(b)).assertTrue();
    expect(b.isGreaterEqualThan(c)).assertTrue();
    expect(a.isGreaterEqualThan(c)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4800
   * @tc.name testIntIsGreaterEqualThan0048
   * @tc.desc Verify comparison between positive one and negative one
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const one = new Int(1);
    const minusOne = new Int(-1);
    expect(one.isGreaterEqualThan(minusOne)).assertTrue();
    expect(minusOne.isGreaterEqualThan(one)).assertFalse();
    expect(one.isGreaterEqualThan(new Int(1))).assertTrue();
    expect(minusOne.isGreaterEqualThan(new Int(-1))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_4900
   * @tc.name testIntIsGreaterEqualThan0049
   * @tc.desc Verify comparison among zero positive and negative values
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const zero = new Int(0);
    const positive = new Int(1);
    const negative = new Int(-1);
    expect(positive.isGreaterEqualThan(zero)).assertTrue();
    expect(zero.isGreaterEqualThan(negative)).assertTrue();
    expect(zero.isGreaterEqualThan(new Int(0))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5000
   * @tc.name testIntIsGreaterEqualThan0050
   * @tc.desc Verify boolean result type and value
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(65);
    const result = a.isGreaterEqualThan(new Int(55));
    expect(typeof result).assertEqual("boolean");
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5100
   * @tc.name testIntIsGreaterEqualThan0051
   * @tc.desc Verify filtering values greater than or equal to threshold
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const values: Int[] = [new Int(10), new Int(50), new Int(30),
      new Int(70), new Int(20)];
    const threshold = new Int(40);
    const filtered = values.filter(v => v.isGreaterEqualThan(threshold));
    expect(filtered.length).assertEqual(2);
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5200
   * @tc.name testIntIsGreaterEqualThan0052
   * @tc.desc Verify filtering includes threshold value
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const values: Int[] = [new Int(30), new Int(40), new Int(50)];
    const threshold = new Int(40);
    const filtered = values.filter(v => v.isGreaterEqualThan(threshold));
    expect(filtered.length).assertEqual(2);
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5400
   * @tc.name testIntIsGreaterEqualThan0054
   * @tc.desc Verify inclusive range boundary checks
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const value = new Int(50);
    const lower = new Int(0);
    const upper = new Int(100);
    const inRange = value.isGreaterEqualThan(lower);
    expect(inRange).assertTrue();

    const lowerBound = new Int(0);
    expect(lowerBound.isGreaterEqualThan(lower)).assertTrue();

    const upperBound = new Int(100);
    expect(upperBound.isGreaterEqualThan(lower)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5500
   * @tc.name testIntIsGreaterEqualThan0055
   * @tc.desc Verify sequential greater equal comparison consistency
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let i = 1; i < 1000; i++) {
      const a = new Int(i);
      const b = new Int(i - 1);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(b.isGreaterEqualThan(a)).assertFalse();
      expect(a.isGreaterEqualThan(new Int(i))).assertTrue();
    }
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5600
   * @tc.name testIntIsGreaterEqualThan0056
   * @tc.desc Verify near maximum boundary comparisons
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const nearMax = new Int(2147483647 - 1);
    const max = new Int(2147483647);
    expect(nearMax.isGreaterEqualThan(new Int(2147483647 - 1))).assertTrue();
    expect(max.isGreaterEqualThan(new Int(2147483647))).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5700
   * @tc.name testIntIsGreaterEqualThan0057
   * @tc.desc Verify equality behavior with greater than comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(100);
    const b = new Int(100);
    expect(a.isGreaterThan(b)).assertFalse();
    expect(a.isGreaterEqualThan(b)).assertTrue();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5800
   * @tc.name testIntIsGreaterEqualThan0058
   * @tc.desc Verify boundary equality comparison
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const value = new Int(100);
    const boundary = new Int(100);
    expect(value.isGreaterEqualThan(boundary)).assertTrue();
    expect(value.isGreaterThan(boundary)).assertFalse();
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_5900
   * @tc.name testIntIsGreaterEqualThan0059
   * @tc.desc Verify greater than branch implies greater equal result
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const testCases: int[][] = [[150, 100], [100, 100], [50, 100]];
    for (let i = 0; i < testCases.length; i++) {
      const intA = new Int(testCases[i][0]);
      const intB = new Int(testCases[i][1]);
      expect(intA.isGreaterEqualThan(intB)).assertEqual(intA.toInt() >= intB.toInt());
    }
  });

  /**
   * @tc.number INT_IS_GRTR_EQUAL_6000
   * @tc.name testIntIsGreaterEqualThan0060
   * @tc.desc Verify smaller value comparison with negated result
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testIntIsGreaterEqualThan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    const a = new Int(50);
    const b = new Int(100);
    expect(a.isGreaterEqualThan(b)).assertFalse();
    expect(!a.isGreaterEqualThan(b)).assertTrue();
    expect(a.isLessThan(b)).assertTrue();
  });
});
}

