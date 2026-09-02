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

export default function mathRandomTest2(): void {
  describe('MathRandomTest2', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0100
     * @tc.name testMathRandom001
     * @tc.desc Verify random: random integer part is always 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random()
        let integerPart: double = Math.floor(r)
        expect(integerPart).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0200
     * @tc.name testMathRandom002
     * @tc.desc Verify random: random() [0.5, 1) approximately 50%(5% error)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let upperCount: int = 0
    let total: double = 10000.0
    for (let i: int = 0; i < total; i++) {
    if (Math.random() >= 0.5) {
      upperCount++
    }
    }
    let ratio: double = upperCount / total
    let isReasonable: boolean = Math.abs(ratio - 0.5) < 0.05
    expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0300
     * @tc.name testMathRandom003
     * @tc.desc Verify random: random cosine value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random() * Math.PI
        let cosVal: double = Math.cos(r)
        expect(cosVal >= -1.0).assertTrue()
        expect(cosVal <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0400
     * @tc.name testMathRandom004
     * @tc.desc Verify random: random() less than 1(verified multiple times)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random()
        expect(r < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0500
     * @tc.name testMathRandom005
     * @tc.desc Verify random() can be multiplied to get wider range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.random() * 100.0
      expect(result >= 0.0 && result < 100.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0600
     * @tc.name testMathRandom006
     * @tc.desc Verify random: smoke test that consecutive calls produce some distinct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: Array<double> = new Array<double>()
      for (let i: int = 0; i < 10; i++) {
        vals.push(Math.random())
        }
      let allDistinct: boolean = true
      for (let i: int = 0; i < 9; i++) {
        for (let j:int = i + 1;j < 10;j++) {
          if (vals[i] === vals[j]) {
            allDistinct = false
          }
        }
      }
      expect(allDistinct).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0700
     * @tc.name testMathRandom007
     * @tc.desc Verify random: smoke test that consecutive calls are not trivially predictable from previous values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Math.random()
      let r2: double = Math.random()
      let r3: double = Math.random()
      let isSeq: boolean = (r2 === r1) || (r3 === r2) || (r3 === 2.0 * r2 - r1)
      expect(isSeq).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0800
     * @tc.name testMathRandom008
     * @tc.desc Verify random: pow(random(), 2.0) within [0.0, 1.0) across 50 calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random()
        let powVal: double = Math.pow(r, 2.0)
        expect(powVal >= 0.0).assertTrue()
        expect(powVal < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_0900
     * @tc.name testMathRandom009
     * @tc.desc Verify random: random() non-negative(verified multiple times)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random()
        expect(r >= 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1000
     * @tc.name testMathRandom010
     * @tc.desc Verify random: random() in [0,1) rarely returns exact 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroCount: int = 0
      for (let i: int = 0; i < 10000; i++) {
        if (Math.random() === 0.0) {
          zeroCount++
        }
      }
      expect(zeroCount < 10).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1100
     * @tc.name testMathRandom011
     * @tc.desc Verify random: random logarithmic operation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random()
        if (r > 0.0) {
          let logVal: double = Math.log(r)
          expect(logVal < 0.0).assertTrue()
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1200
     * @tc.name testMathRandom012
     * @tc.desc Verify random() with double type annotation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.random()
      expect(result >= 0.0 && result < 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1300
     * @tc.name testMathRandom013
     * @tc.desc Verify random ignores multiple extra arguments (1, 2, 3) and returns valid [0,1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = (Math.random as Object as (x:Object, y:Object, z:Object)=>number)(1, 2, 3)
      expect(result >= 0.0 && result < 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1400
     * @tc.name testMathRandom014
     * @tc.desc Verify Math.random ignores extra argument (1.0) and returns valid [0,1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = (Math.random as Object as (x: number) => number)(1.0)
      expect(result >= 0.0 && result < 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1500
     * @tc.name testMathRandom015
     * @tc.desc Verify random: random and min/max combination
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let i: int = 0; i < 50; i++) {
    let a: double = Math.random()
    let b: double = Math.random()
    let m: double = Math.max(a, b)
    expect(m >= a).assertTrue()
    expect(m >= b).assertTrue()
    }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1600
     * @tc.name testMathRandom016
     * @tc.desc Verify about 10000 random calls produce mean approx 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = 0.0
      let count: number = 10000
      for (let i: int = 0; i < count; i++) {
        sum += Math.random()
      }
      let mean: double = sum / count
      expect(mean > 0.48 && mean < 0.52).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1700
     * @tc.name testMathRandom017
     * @tc.desc Verify random() result is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.random()
      expect(!isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1800
     * @tc.name testMathRandom018
     * @tc.desc Verify random: random() multiplied by 10 range [0, 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.random() * 10.0
      expect(r >= 0.0).assertTrue()
      expect(r < 10.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_1900
     * @tc.name testMathRandom019
     * @tc.desc Verify gracefully handles invalid input when calling random({}) with an object parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = (Math.random as Object as (x: Object) => number)({})
        expect(result >= 0.0 && result < 1.0).assertTrue()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2000
     * @tc.name testMathRandom020
     * @tc.desc Verify 100 random values are all in [0, 1) range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let result: double = Math.random()
        expect(result >= 0.0 && result < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2100
     * @tc.name testMathRandom021
     * @tc.desc Verify random: random() roughly uniform across four quadrants (expect ~1000 each, allow 800-1200)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q1: int = 0
      let q2: int = 0
      let q3: int = 0
      let q4: int = 0
      let total: int = 4000
      for (let i: int = 0; i < total; i++) {
        let r: double = Math.random()
        if (r < 0.25) {
          q1++
        } else if (r < 0.5) {
          q2++
        } else if (r < 0.75) {
          q3++
        } else {
          q4++
        }
      }
      expect(q1 > 800).assertTrue()
      expect(q2 > 800).assertTrue()
      expect(q3 > 800).assertTrue()
      expect(q4 > 800).assertTrue()
      expect(q1 < 1200).assertTrue()
      expect(q2 < 1200).assertTrue()
      expect(q3 < 1200).assertTrue()
      expect(q4 < 1200).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2200
     * @tc.name testMathRandom022
     * @tc.desc Verify gracefully handles invalid input when calling random("abc") with a string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = (Math.random as Object as (x: Object) => number)('abc')
        expect(result >= 0.0 && result < 1.0).assertTrue()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2300
     * @tc.name testMathRandom023
     * @tc.desc Verify random: random rounded as an index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let idx: double = (Math.random() * 10.0)
        expect(idx >= 0).assertTrue()
        expect(idx < 10).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2400
     * @tc.name testMathRandom024
     * @tc.desc Verify random: random sine value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let i: int = 0; i < 50; i++) {
      let r: double = Math.random() * Math.PI
      let sinVal: double = Math.sin(r)
      expect(sinVal >= -1.0).assertTrue()
      expect(sinVal <= 1.0).assertTrue()
    }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2500
     * @tc.name testMathRandom025
     * @tc.desc Verify random: smoke test that samples are not all identical
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let samples: Array<double> = new Array<double>()
      for (let i: int = 0; i < 10; i++) {
        samples.push(Math.random())
      }
      let allUnique: boolean = true
      for (let i: int = 0; i < samples.length; i++) {
        for (let j = i + 1; j < samples.length; j++) {
          if (samples[i] === samples[j]) {
            allUnique = false
          }
        }
      }
      expect(allUnique || samples.length <= 1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2600
     * @tc.name testMathRandom026
     * @tc.desc Verify random: random result range 0.01 precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random()
        expect(r < 1.0).assertTrue()
        expect(r >= 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2700
     * @tc.name testMathRandom027
     * @tc.desc Verify gracefully handles invalid input when calling random(null)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = (Math.random as Object as (x: number) => number)(null as Object as number)
        expect(result >= 0.0 && result < 1.0).assertTrue()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2800
     * @tc.name testMathRandom028
     * @tc.desc Verify random: random() distribution uniformity variance verification
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: Array<double> = new Array<double>()
      for (let i: int = 0; i < 1000; i++) {
        vals.push(Math.random())
        }
      let sum: double = 0.0
      for (let i: int = 0; i < vals.length; i++) {
        sum += vals[i]
        }
      let mean: double = sum / vals.length
      let variance: double = 0.0
      for (let i: int = 0; i < vals.length; i++) {
        variance += (vals[i] - mean) * (vals[i] - mean)
        }
      variance /= vals.length
      let isReasonable: boolean = Math.abs(variance - 1.0/12.0) < 0.01
      expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_2900
     * @tc.name testMathRandom029
     * @tc.desc Verify random: random as an exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random()
        let expVal: double = Math.pow(2.0,r)
        expect(expVal >= 1.0).assertTrue()
        expect(expVal < Math.E).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3000
     * @tc.name testMathRandom030
     * @tc.desc Verify random: random() always satisfies 0 <= r < 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 200; i++) {
        let r: double = Math.random()
        let inRange: boolean = r >= 0.0 && r < 1.0
        expect(inRange).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3100
     * @tc.name testMathRandom031
     * @tc.desc Verify random: random fractional part range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random()
        let fraction: double = r - Math.floor(r)
        expect(fraction >= 0.0).assertTrue()
        expect(fraction < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3200
     * @tc.name testMathRandom032
     * @tc.desc Verify random: random() [0, 0.1) approximately 10%
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let cnt: int = 0
    let total: double = 10000.0
    for (let i: int = 0; i < total; i++) {
    if (Math.random() < 0.1) {
      cnt++
    }
    }
    let ratio: double = cnt / total
    let isReasonable: boolean = Math.abs(ratio - 0.1) < 0.03
    expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3300
     * @tc.name testMathRandom033
     * @tc.desc Verify random: smoke test that successive calls return different values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Math.random()
      let r2: double = Math.random()
      let isIdempotent: boolean = r1 === r2
      expect(isIdempotent).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3400
     * @tc.name testMathRandom034
     * @tc.desc Verify random: random() range after rounding
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: int = Double.toInt(Math.round(Math.random() * 9.0))
        expect(r >= 0).assertTrue()
        expect(r <= 9).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3500
     * @tc.name testMathRandom035
     * @tc.desc Verify random: random() range after rounding [0, 9]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.floor(Math.random() * 10.0)
      expect(r >= 0.0).assertTrue()
      expect(r < 10.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3600
     * @tc.name testMathRandom036
     * @tc.desc Verify random: random() stable across multiple operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    for (let i: int = 0; i < 10000; i++) {
    let r: double = Math.random()
    expect(isFinite(r)).assertTrue()
    expect(r >= 0.0).assertTrue()
    expect(r < 1.0).assertTrue()
    }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3700
     * @tc.name testMathRandom037
     * @tc.desc Verify random: random minimum precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: double = 1.0
      let maxVal: double = 0.0
      for (let i: int = 0; i < 10000; i++) {
        let r: double = Math.random()
        if (r < minVal) {
          minVal = r
        }
        if (r > maxVal) {
          maxVal = r
        }
      }
      expect(minVal < 0.001).assertTrue()
      expect(maxVal > 0.999).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3800
     * @tc.name testMathRandom038
     * @tc.desc Verify multiple random() calls produce values spread across [0, 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Array<double> = new Array<double>()
      for (let i: int = 0; i < 50; i++) {
        values.push(Math.random())
      }
      let minVal: double = 1.0
      let maxVal: double = 0.0
      for (let i: int = 0; i < values.length; i++) {
        if (values[i] < minVal) {
          minVal = values[i]
        }
        if (values[i] > maxVal) {
          maxVal = values[i]
        }
      }
      expect(minVal >= 0.0).assertTrue()
      expect(maxVal < 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_3900
     * @tc.name testMathRandom039
     * @tc.desc Verify random: random multiplied by 2 range [0, 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random() * 2.0
        expect(r >= 0.0).assertTrue()
        expect(r < 2.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4000
     * @tc.name testMathRandom040
     * @tc.desc Verify random: random() offset variation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random() + 5.0
        expect(r >= 5.0).assertTrue()
        expect(r < 6.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4100
     * @tc.name testMathRandom041
     * @tc.desc Verify random: random() [0.25, 0.75) approximately 50%
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let cnt: int = 0
    let total: double = 10000.0
    for (let i: int = 0; i < total; i++) {
    let r: double = Math.random()
    if (r >= 0.25 && r < 0.75) {
      cnt++
    }
    }
    let ratio: double = cnt / total
    let isReasonable: boolean = Math.abs(ratio - 0.5) < 0.05
    expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4200
     * @tc.name testMathRandom042
     * @tc.desc Verify random: random() less than 1(upper bound)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.random()
      expect(r < 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4300
     * @tc.name testMathRandom043
     * @tc.desc Verify random() values converted to integer in [0, 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Math.floor(Math.random() * 10.0).toInt()
      expect(result >= 0 && result < 10).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4400
     * @tc.name testMathRandom044
     * @tc.desc Verify random: max of 10000 calls is less than 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let maxVal: double = 0.0
    for (let i: int = 0; i < 10000; i++) {
    let r: double = Math.random()
    if (r > maxVal) {
      maxVal = r
    }
    }
    expect(maxVal < 1.0).assertTrue()
    expect(maxVal > 0.99).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4500
     * @tc.name testMathRandom045
     * @tc.desc Verify random: random() roughly uniform across ten buckets (expect ~500 each, allow 300-700)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buckets: int[] = [0,0,0,0,0,0,0,0,0,0]
      let total: int = 5000
      for (let i: int = 0; i < total; i++) {
        let idx: int = Double.toInt(Math.random() * 10.0)
        buckets[idx]++
      }
      for (let i: int = 0; i < 10; i++) {
        expect(buckets[i] > 300).assertTrue()
        expect(buckets[i] < 700).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4600
     * @tc.name testMathRandom046
     * @tc.desc Verify random: smoke test that three consecutive calls are not all equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Math.random()
      let r2: double = Math.random()
      let r3: double = Math.random()
      let allSame: boolean = (r1 === r2) && (r2 === r3)
      expect(allSame).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4700
     * @tc.name testMathRandom047
     * @tc.desc Verify random: random() random multiplier variation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random() * 100.0
        expect(r < 100.0).assertTrue()
        expect(r >= 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4800
     * @tc.name testMathRandom048
     * @tc.desc Verify random: random() [0.9, 1) approximately 10%
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let cnt: int = 0
    let total: double = 10000.0
    for (let i: int = 0; i < total; i++) {
    let r: double = Math.random()
    if (r >= 0.9) {
      cnt++
    }
    }
    let ratio: double = cnt / total
    let isReasonable: boolean = Math.abs(ratio - 0.1) < 0.03
    expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_4900
     * @tc.name testMathRandom049
     * @tc.desc Verify random: min of 10000 calls is greater than or equal to 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let minVal: double = 1.0
    for (let i: int = 0; i < 10000; i++) {
    let r: double = Math.random()
    if (r < minVal) {
      minVal = r
    }
    }
    expect(minVal >= 0.0).assertTrue()
    expect(minVal < 0.01).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5000
     * @tc.name testMathRandom050
     * @tc.desc Verify random: random as a seed(int conversion)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random()
        let val:int = 2147483647
        let seed: int = Double.toInt(r * val)
        expect(seed >= 0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5100
     * @tc.name testMathRandom051
     * @tc.desc Verify random: random square root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.random()
        let sqrtVal: double = Math.sqrt(r)
        expect(sqrtVal >= 0.0).assertTrue()
        expect(sqrtVal < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5200
     * @tc.name testMathRandom052
     * @tc.desc Verify random: random() value is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        let r: double = Math.random()
        expect(isFinite(r)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5300
     * @tc.name testMathRandom053
     * @tc.desc Verify random() can be shifted to get negative range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.random() * 2.0 - 1.0
      expect(result >= -1.0 && result < 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5400
     * @tc.name testMathRandom054
     * @tc.desc Verify random: random() never produces 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let hitOne: boolean = false
    for (let i: int = 0; i < 10000; i++) {
    if (Math.random() >= 1.0) {
      hitOne = true
    }
    }
    expect(hitOne).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5500
     * @tc.name testMathRandom055
     * @tc.desc Verify random: with 5000 samples all ten buckets are non-empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bucketCount: int = 10
      let buckets: Array<int> = new Array<int>(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      let totalSamples: int = 5000
      for (let i: int = 0; i < totalSamples; i++) {
        let idx: int = Math.floor(Math.random() * 10.0).toInt()
        buckets[idx] = buckets[idx] + 1
      }
      let nonEmptyCount: int = 0
      for (let i: int = 0; i < bucketCount; i++) {
        if (buckets[i] > 0) {
          nonEmptyCount++
        }
      }
      expect(nonEmptyCount).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5600
     * @tc.name testMathRandom056
     * @tc.desc Verify random: random and abs combination
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = Math.abs(Math.random())
        expect(r >= 0.0).assertTrue()
        expect(r < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5700
     * @tc.name testMathRandom057
     * @tc.desc Verify random: smoke test that adjacent samples differ
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let prev: double = -1.0
    for (let i: int = 0; i < 20; i++) {
    let curr: double = Math.random()
    let notEqual: boolean = curr !== prev
    expect(notEqual).assertTrue()
    prev = curr
  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5800
     * @tc.name testMathRandom058
     * @tc.desc Verify random: random() mean close to 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = 0.0
      let count: int = 10000
      for (let i: int = 0; i < count; i++) {
        sum += Math.random()
        }
      let avg: double = sum / count
      let isReasonable: boolean = Math.abs(avg - 0.5) < 0.05
      expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_5900
     * @tc.name testMathRandom059
     * @tc.desc Verify gracefully handles invalid input when calling random(undefined)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double =  (Math.random as Object as (x: number) => number)(undefined as Object as number)
        expect(result >= 0.0 && result < 1.0).assertTrue()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_6000
     * @tc.name testMathRandom060
     * @tc.desc Verify random: random negative value simulation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 50; i++) {
        let r: double = -Math.random()
        expect(r <= 0.0).assertTrue()
        expect(r > -1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_6100
     * @tc.name testMathRandom061
     * @tc.desc Verify random: 200 samples all satisfy 0 <= r < 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allInRange: boolean = true
      for (let i: int = 0; i < 200; i++) {
        let r: double = Math.random()
        if (r < 0.0 || r >= 1.0) {
          allInRange = false
          break
        }
      }
      expect(allInRange).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_6200
     * @tc.name testMathRandom062
     * @tc.desc Verify random: random() [0, 0.5) approximately 50%(5% error)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let lowerCount: int = 0
    let total: double = 10000.0
    for (let i: int = 0; i < total; i++) {
    if (Math.random() < 0.5) {
      lowerCount++
    }
    }
    let ratio: double = lowerCount / total
    let isReasonable: boolean = Math.abs(ratio - 0.5) < 0.05
    expect(isReasonable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_6300
     * @tc.name testMathRandom063
     * @tc.desc Verify Math.random() returns non-negative value, validated via integer conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathRandom063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 100; i++) {
        const randomVal: number = Math.random();
        if (randomVal < 0.0) {
          throw new Error(`Unexpected negative value from Math.random(): ${randomVal}`);
        }
        expect(randomVal).assertLess(1.0);
        const intVal: number = Math.trunc(randomVal);
        expect(intVal).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_RANDOM_6400
     * @tc.name testMathRandom064
     * @tc.desc Verify random: repeated calls rarely produce the same consecutive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathRandom064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sameCount: int = 0
      let prev: double = Math.random()
      for (let i: int = 0; i < 200; i++) {
        let curr: double = Math.random()
        if (curr === prev) {
          sameCount++
        }
        prev = curr
      }
      expect(sameCount < 5).assertTrue()
    });

  });
}
