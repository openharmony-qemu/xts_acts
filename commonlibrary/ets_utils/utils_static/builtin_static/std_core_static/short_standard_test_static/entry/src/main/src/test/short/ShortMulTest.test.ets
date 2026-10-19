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
import Utils from './../Util.test';

export default function shortMulTest(): void {
  describe('ShortMulTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0100
     * @tc.name testShortMul_merged1
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.mul, including positive values, negative values, sign handling, boundary values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let leftOperand: Short = new Short(6 as short);
        let rightOperand: Short = new Short(4 as short);
        let product: Short = leftOperand.mul(rightOperand);
        expect(product.toShort()).assertEqual(24 as short);
        expect(leftOperand.toShort()).assertEqual(6 as short);
        expect(rightOperand.toShort()).assertEqual(4 as short);
      }

      {
        let positiveOperand: Short = new Short(12 as short);
        let negativeOperand: Short = new Short((-3) as short);
        let product: Short = positiveOperand.mul(negativeOperand);
        expect(product.toShort()).assertEqual((-36) as short);
        expect(positiveOperand.toShort()).assertEqual(12 as short);
        expect(negativeOperand.toShort()).assertEqual((-3) as short);
      }

      {
        let leftOperand: Short = new Short((-6) as short);
        let rightOperand: Short = new Short((-4) as short);
        let product: Short = leftOperand.mul(rightOperand);
        expect(product.toShort()).assertEqual(24 as short);
        expect(leftOperand.toShort()).assertEqual((-6) as short);
        expect(rightOperand.toShort()).assertEqual((-4) as short);
      }

      {
        let valueOperand: Short = new Short(5 as short);
        let negativeOneOperand: Short = new Short((-1) as short);
        let flippedProduct: Short = valueOperand.mul(negativeOneOperand);
        let restoredProduct: Short = flippedProduct.mul(negativeOneOperand);
        expect(flippedProduct.toShort()).assertEqual((-5) as short);
        expect(restoredProduct.toShort()).assertEqual(5 as short);
        expect(valueOperand.toShort()).assertEqual(5 as short);
        expect(negativeOneOperand.toShort()).assertEqual((-1) as short);
      }

      {
        let testPairs: Short[][] = [
          [new Short(10 as short), new Short(20 as short)],
          [new Short((-15) as short), new Short(30 as short)],
          [new Short(25 as short), new Short((-40) as short)],
          [new Short((-5) as short), new Short((-100) as short)]
        ];
        for (let i: int = 0; i < testPairs.length; i++) {
          let a: Short = testPairs[i][0];
          let b: Short = testPairs[i][1];
          let product: Short = a.mul(b);
          let absProduct: int = Math.abs(product.toInt());
          let absA: int = a.toInt() < 0 ? -a.toInt() : a.toInt();
          let absB: int = b.toInt() < 0 ? -b.toInt() : b.toInt();
          expect(absProduct).assertEqual(absA * absB);
        }
      }

      {
        let scanValues: short[] = [0 as short, 1 as short, 2 as short, 100 as short, 256 as short, 512 as short, 1024 as short, Short.MIN_VALUE];
        let zeroResults: int = 0;
        let totalPairs: int = 0;
        let valCount: int = 8;
        for (let i: int = 0; i < valCount; i++) {
          for (let j: int = 0; j < valCount; j++) {
            let a: Short = new Short(scanValues[i]);
            let b: Short = new Short(scanValues[j]);
            let product: Short = a.mul(b);
            expect(product.toShort()).assertEqual(Int.toShort(a.toInt() * b.toInt()));
            if (product.toShort() == (0 as short)) {
              zeroResults++;
            }
            totalPairs++;
          }
        }
        expect(totalPairs).assertEqual(64);
        expect(zeroResults).assertEqual(35);
      }

      {
        let running: Short = new Short(1 as short);
        let multipliers: short[] = [2 as short, (-3) as short, 4 as short, (-5) as short, 2 as short];
        let signFlips: int = 0;
        let prevSign: int = 1;
        for (let i: int = 0; i < multipliers.length; i++) {
          let mult: Short = new Short(multipliers[i]);
          running = running.mul(mult);
          let curSign: int = running.toInt() > 0 ? 1 : (running.toInt() < 0 ? -1 : 0);
          if (curSign !== 0 && prevSign !== 0 && curSign !== prevSign) {
            signFlips++;
          }
          if (curSign !== 0) prevSign = curSign;
        }
        expect(signFlips).assertEqual(2);
        let wideProduct: int = 1 * 2 * (-3) * 4 * (-5) * 2;
        expect(running.toInt()).assertEqual(wideProduct);
      }

      {
        let leftOperand: Short = new Short(150 as short);
        let rightOperand: Short = new Short(200 as short);
        let product: Short = leftOperand.mul(rightOperand);
        expect(product.toShort()).assertEqual(30000 as short);
        expect(product.toInt()).assertEqual(30000);
        expect(product.toLong()).assertEqual(Long.toLong(30000));
        expect(leftOperand.toShort()).assertEqual(150 as short);
        expect(rightOperand.toShort()).assertEqual(200 as short);
      }

      {
        let maxValueOperand: Short = new Short(Short.MAX_VALUE);
        let minValueOperand: Short = new Short(Short.MIN_VALUE);
        let identityOperand: Short = new Short(1 as short);
        let maxProduct: Short = maxValueOperand.mul(identityOperand);
        let minProduct: Short = minValueOperand.mul(identityOperand);
        expect(maxProduct.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minProduct.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValueOperand.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValueOperand.toShort()).assertEqual(Short.MIN_VALUE);
        expect(identityOperand.toShort()).assertEqual(1 as short);
      }

      {
        let nearMaxOperand: Short = new Short(32766 as short);
        let nearMinOperand: Short = new Short((-32767) as short);
        let identityOperand: Short = new Short(1 as short);
        let nearMaxProduct: Short = nearMaxOperand.mul(identityOperand);
        let nearMinProduct: Short = nearMinOperand.mul(identityOperand);
        expect(nearMaxProduct.toShort()).assertEqual(32766 as short);
        expect(nearMinProduct.toShort()).assertEqual((-32767) as short);
        expect(nearMaxOperand.toShort()).assertEqual(32766 as short);
        expect(nearMinOperand.toShort()).assertEqual((-32767) as short);
        expect(identityOperand.toShort()).assertEqual(1 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0200
     * @tc.name testShortMul_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.mul, including overflow, fractions and rounding, boundary values, zero values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let leftOperand: Short = new Short(256 as short);
        let rightOperand: Short = new Short(256 as short);
        let product: Short = leftOperand.mul(rightOperand);
        expect(product.toShort()).assertEqual(0 as short);
        expect(product.toInt()).assertEqual(0);
        expect(leftOperand.toShort()).assertEqual(256 as short);
        expect(rightOperand.toShort()).assertEqual(256 as short);
      }

      {
        let maxValueOperand: Short = new Short(Short.MAX_VALUE);
        let twoOperand: Short = new Short(2 as short);
        let product: Short = maxValueOperand.mul(twoOperand);
        expect(product.toShort()).assertEqual((-2) as short);
        expect(maxValueOperand.toShort()).assertEqual(Short.MAX_VALUE);
        expect(twoOperand.toShort()).assertEqual(2 as short);
      }

      {
        let minValueOperand: Short = new Short(Short.MIN_VALUE);
        let twoOperand: Short = new Short(2 as short);
        let product: Short = minValueOperand.mul(twoOperand);
        expect(product.toShort()).assertEqual(0 as short);
        expect(product.toInt()).assertEqual(0);
        expect(minValueOperand.toShort()).assertEqual(Short.MIN_VALUE);
        expect(twoOperand.toShort()).assertEqual(2 as short);
      }

      {
        let left: Short = new Short(Double.toShort(12.9));
        let right: Short = new Short(Double.toShort((-3.9)));
        let result: Short = left.mul(right);
        expect(left.toShort()).assertEqual(12 as short);
        expect(right.toShort()).assertEqual((-3) as short);
        expect(result.toShort()).assertEqual((-36) as short);
        expect(result.toInt()).assertEqual(-36);
      }

      {
        let posA: Short = new Short(15 as short);
        let posB: Short = new Short(20 as short);
        let negA: Short = new Short((-15) as short);
        let negB: Short = new Short((-20) as short);
        let pp: int = posA.mul(posB).toInt();
        let pn: int = posA.mul(negB).toInt();
        let np: int = negA.mul(posB).toInt();
        let nn: int = negA.mul(negB).toInt();
        expect(pp).assertEqual(300);
        expect(pn).assertEqual(-300);
        expect(np).assertEqual(-300);
        expect(nn).assertEqual(300);
      }

      {
        let a: Short = new Short(25 as short);
        let b: Short = new Short(10 as short);
        let product: Short = a.mul(b);
        expect(product.toByte()).assertEqual(Int.toByte(250));
        let c: Short = new Short(256 as short);
        let d: Short = new Short(3 as short);
        let product2: Short = c.mul(d);
        expect(product2.toByte()).assertEqual(Int.toByte(0));
        expect(product2.toInt()).assertEqual(768);
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let negOne: Short = new Short((-1) as short);
        let product: Short = minVal.mul(negOne);
        expect(product.toInt()).assertEqual(-32768);
      }

      {
        let v180: Short = new Short(180 as short);
        let v181: Short = new Short(181 as short);
        let v182: Short = new Short(182 as short);
        let v183: Short = new Short(183 as short);
        let sq180: Short = v180.mul(v180);
        let sq181: Short = v181.mul(v181);
        let sq182: Short = v182.mul(v182);
        let sq183: Short = v183.mul(v183);
        expect(sq180.toInt()).assertEqual(32400);
        expect(sq181.toInt()).assertEqual(32761);
        let sq182Full: int = v182.toInt() * v182.toInt();
        expect(sq182Full).assertEqual(33124);
        expect(sq182.toInt()).assertEqual(-32412);
        let sq183Full: int = v183.toInt() * v183.toInt();
        expect(sq183Full).assertEqual(33489);
        expect(sq183.toInt()).assertEqual(-32047);
      }

      {
        let a: Short = new Short(300 as short);
        let b: Short = new Short(250 as short);
        let product: Short = a.mul(b);
        let fullProduct: int = a.toInt() * b.toInt();
        let unsignedWrap: int = fullProduct % 65536;
        let expectedSigned: int = unsignedWrap > 32767 ? unsignedWrap - 65536 : unsignedWrap;
        expect(product.toInt()).assertEqual(expectedSigned);
        expect(product.toInt()).assertEqual(9464);
        let c: Short = new Short(400 as short);
        let d: Short = new Short(200 as short);
        let product2: Short = c.mul(d);
        expect(product2.toInt()).assertEqual(14464);
      }

      {
        let zero: Short = new Short(0 as short);
        let pos: Short = new Short(9 as short);
        let neg: Short = new Short((-9) as short);
        let posPos: Short = pos.mul(pos);
        expect(posPos.toShort()).assertEqual(81 as short);
        expect(posPos.isGreaterThan(zero)).assertTrue();
        expect(posPos.isLessThan(zero)).assertFalse();
        let posNeg: Short = pos.mul(neg);
        expect(posNeg.toShort()).assertEqual((-81) as short);
        expect(posNeg.isLessThan(zero)).assertTrue();
        expect(posNeg.isGreaterThan(zero)).assertFalse();
        let negNeg: Short = neg.mul(neg);
        expect(negNeg.toShort()).assertEqual(81 as short);
        expect(negNeg.isGreaterThan(zero)).assertTrue();
        expect(negNeg.isLessThan(zero)).assertFalse();
        let zeroProd: Short = pos.mul(zero);
        expect(zeroProd.toShort()).assertEqual(0 as short);
        expect(zeroProd.isGreaterThan(zero)).assertFalse();
        expect(zeroProd.isLessThan(zero)).assertFalse();
        expect(zeroProd.equals(zero)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0300
     * @tc.name testShortMul_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.mul, including overflow, boundary values, negative values, sign handling, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let posA: Short = new Short(20000 as short);
        let posB: Short = new Short(2 as short);
        let overflowProduct: Short = posA.mul(posB);
        expect(overflowProduct.toShort() < (0 as short)).assertTrue();
        expect(overflowProduct.toInt()).assertEqual(-25536);
        let posC: Short = new Short(16384 as short);
        let posD: Short = new Short(3 as short);
        let overflowProduct2: Short = posC.mul(posD);
        expect(overflowProduct2.toShort() < (0 as short)).assertTrue();
        expect(overflowProduct2.toInt()).assertEqual(-16384);
      }

      {
        let a: Short = new Short(50 as short);
        let b: Short = new Short(100 as short);
        let c: Short = new Short(5 as short);
        let aTimesC: Short = a.mul(c);
        let bTimesC: Short = b.mul(c);
        expect(aTimesC.isLessThan(bTimesC)).assertTrue();
        expect(aTimesC.toShort()).assertEqual(250 as short);
        expect(bTimesC.toShort()).assertEqual(500 as short);
        let negC: Short = new Short((-5) as short);
        let aTimesNegC: Short = a.mul(negC);
        let bTimesNegC: Short = b.mul(negC);
        expect(bTimesNegC.isLessThan(aTimesNegC)).assertTrue();
      }

      {
        let testValues: short[] = [
          Short.MIN_VALUE,
          (-20000) as short,
          (-10000) as short,
          (-5000) as short,
          (-1000) as short,
          (-100) as short,
          (-10) as short,
          (-1) as short,
          0 as short,
          1 as short,
          10 as short,
          100 as short,
          1000 as short,
          5000 as short,
          10000 as short,
          20000 as short,
          Short.MAX_VALUE
        ];
        let factorValues: short[] = [
          0 as short, 1 as short, 2 as short, (-1) as short
        ];
        let testCount: int = 17;
        let factorCount: int = 4;
        for (let i: int = 0; i < testCount; i++) {
          let a: Short = new Short(testValues[i]);
          for (let j: int = 0; j < factorCount; j++) {
            let b: Short = new Short(factorValues[j]);
            let beforeA: short = a.toShort();
            a.mul(b);
            expect(a.toShort()).assertEqual(beforeA);
          }
        }
        let knownPos: Short = new Short(30 as short);
        let knownPos2: Short = new Short(4 as short);
        expect(knownPos.mul(knownPos2).toShort()).assertEqual(120 as short);
        let knownNeg: Short = new Short((-30) as short);
        expect(knownNeg.mul(knownPos2).toShort()).assertEqual((-120) as short);
        let knownZero: Short = new Short(0 as short);
        let knownMax: Short = new Short(Short.MAX_VALUE);
        expect(knownZero.mul(knownMax).toShort()).assertEqual(0 as short);
      }

      {
        let values: Short[] = [
          new Short(10 as short), new Short(100 as short), new Short(1000 as short), new Short(5000 as short)
        ];
        let factor: Short = new Short(8 as short);
  
        let scaledShort: Short[] = [];
        let scaledInt: int[] = [];
        let overflowed: boolean[] = [];
  
        for (let v of values) {
          let resultShort: Short = v.mul(factor);
          let resultInt: int = v.toInt() * factor.toInt();
          scaledShort.push(resultShort);
          scaledInt.push(resultInt);
          overflowed.push(resultShort.toInt() !== resultInt);
        }
  
        expect(scaledShort[0]).assertEqual(80 as short);
        expect(scaledInt[3]).assertEqual(40000);
        expect(overflowed[3]).assertTrue();
  
        let doubleResult: double = values[3].toDouble() * factor.toDouble();
        expect(doubleResult).assertEqual(40000.0);
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let product: Short = maxVal.mul(maxVal);
        expect(product.toInt()).assertEqual(1);
        expect(maxVal.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let product: Short = minVal.mul(minVal);
        expect(product.toInt()).assertEqual(0);
        expect(minVal.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        let product: Short = maxVal.mul(minVal);
        expect(product.toInt()).assertEqual(-32768);
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let nearMin: Short = new Short((-32767) as short);
        let factor2: Short = new Short(2 as short);
        let factor3: Short = new Short(3 as short);
        expect(minVal.mul(factor2).toShort()).assertEqual(0 as short);
        expect(minVal.mul(factor3).toShort()).assertEqual(-32768 as short);
        expect(nearMin.mul(factor2).toShort()).assertEqual(2 as short);
        expect(nearMin.mul(factor3).toShort()).assertEqual((-32765) as short);
        expect(minVal.toShort()).assertEqual(Short.MIN_VALUE);
        expect(nearMin.toShort()).assertEqual((-32767) as short);
      }

      {
        let byteMax: Short = new Short(127 as short);
        let byteMin: Short = new Short((-128) as short);
        let factor: Short = new Short(2 as short);
        let productPos: Short = byteMax.mul(factor);
        let productNeg: Short = byteMin.mul(factor);
        expect(productPos.toShort()).assertEqual(254 as short);
        expect(productNeg.toShort()).assertEqual((-256) as short);
      }

      {
        let base: Short = new Short(3 as short);
        let factor: Short = new Short(2 as short);
        let p1: Short = base;
        let p2: Short = p1.mul(factor);
        let p3: Short = p2.mul(factor);
        let p4: Short = p3.mul(factor);
        let p5: Short = p4.mul(factor);
        let p6: Short = p5.mul(factor);
        let p7: Short = p6.mul(factor);
        let p8: Short = p7.mul(factor);
        expect(p1.toShort()).assertEqual(3 as short);
        expect(p2.toShort()).assertEqual(6 as short);
        expect(p3.toShort()).assertEqual(12 as short);
        expect(p4.toShort()).assertEqual(24 as short);
        expect(p5.toShort()).assertEqual(48 as short);
        expect(p6.toShort()).assertEqual(96 as short);
        expect(p7.toShort()).assertEqual(192 as short);
        expect(p8.toShort()).assertEqual(384 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0400
     * @tc.name testShortMul_merged4
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.mul, including overflow, wrapping, boundary values, sign handling, and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(513 as short);
        let b: Short = new Short(128 as short);
        let product: Short = a.mul(b);
        let fullInt: int = 513 * 128;
        expect(fullInt).assertEqual(65664);
        expect(product.toInt()).assertEqual(128);
        expect(product.toShort()).assertEqual(128 as short);
        expect(a.toShort()).assertEqual(513 as short);
        expect(b.toShort()).assertEqual(128 as short);
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let factor1: Short = new Short(1 as short);
        let factor3: Short = new Short(3 as short);
        let factor5: Short = new Short(5 as short);
        let factor7: Short = new Short(7 as short);
        expect(minVal.mul(factor1).toShort()).assertEqual(Short.MIN_VALUE);
        expect(minVal.mul(factor3).toShort()).assertEqual(Short.MIN_VALUE);
        expect(minVal.mul(factor5).toShort()).assertEqual(Short.MIN_VALUE);
        expect(minVal.mul(factor7).toShort()).assertEqual(Short.MIN_VALUE);
        expect(minVal.mul(factor1).toInt()).assertEqual(-32768);
        expect(minVal.mul(factor3).toInt()).assertEqual(-32768);
        expect(minVal.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let a: Short = new Short(181 as short);
        let product: Short = a.mul(a);
        expect(product.toShort()).assertEqual(32761 as short);
        expect(product.toInt()).assertEqual(32761);
        expect(a.toShort()).assertEqual(181 as short);
      }

      {
        let a: Short = new Short(182 as short);
        let product: Short = a.mul(a);
        expect(product.toShort()).assertEqual((-32412) as short);
        expect(product.toInt()).assertEqual(-32412);
        expect(a.toShort()).assertEqual(182 as short);
      }

      {
        let a: Short = new Short(256 as short);
        let b: Short = new Short(128 as short);
        let product1: Short = a.mul(b);
        expect(product1.toShort() < (0 as short)).assertTrue();
        expect(product1.toInt()).assertEqual(-32768);
        let c: Short = new Short(256 as short);
        let d: Short = new Short(256 as short);
        let product2: Short = c.mul(d);
        expect(product2.toShort()).assertEqual(0 as short);
        expect(product2.toInt()).assertEqual(0);
        let e: Short = new Short(513 as short);
        let f: Short = new Short(128 as short);
        let product3: Short = e.mul(f);
        expect(product3.toShort() > (0 as short)).assertTrue();
        expect(product3.toInt()).assertEqual(128);
      }

      {
        let testPairs: Short[][] = [
          [new Short(50 as short), new Short(50 as short)],
          [new Short(200 as short), new Short(200 as short)],
          [new Short(182 as short), new Short(182 as short)],
          [new Short(32767 as short), new Short(3 as short)],
          [new Short((-256) as short), new Short(128 as short)]
        ];
        for (let i: int = 0; i < testPairs.length; i++) {
          let a: Short = testPairs[i][0];
          let b: Short = testPairs[i][1];
          let product: Short = a.mul(b);
          let fullInt: int = a.toInt() * b.toInt();
          expect(product.toShort()).assertEqual(Int.toShort(fullInt));
        }
      }

      {
        let values: short[] = [2 as short, 3 as short, 255 as short, 256 as short, 257 as short, 511 as short];
        let overflowCount: int = 0;
        let nonOverflowCount: int = 0;
        let valueCount: int = 6;
        for (let i: int = 0; i < valueCount; i++) {
          for (let j: int = 0; j < valueCount; j++) {
            let a: Short = new Short(values[i]);
            let b: Short = new Short(values[j]);
            let product: Short = a.mul(b);
            let fullInt: int = a.toInt() * b.toInt();
            expect(product.toShort()).assertEqual(Int.toShort(fullInt));
            if (product.toInt() !== fullInt) {
              overflowCount++;
            } else {
              nonOverflowCount++;
            }
          }
        }
        expect(overflowCount).assertEqual(16);
        expect(nonOverflowCount).assertEqual(20);
        expect(overflowCount + nonOverflowCount).assertEqual(36);
      }

      {
        let a: Short = new Short(300 as short);
        let b: Short = new Short(200 as short);
        let product: Short = a.mul(b);
        expect(product.toInt()).assertEqual(-5536);
        let c: Short = new Short(400 as short);
        let d: Short = new Short(300 as short);
        let product2: Short = c.mul(d);
        expect(product2.toInt()).assertEqual(-11072);
        let largeProduct: int = a.toInt() * d.toInt();
        expect(largeProduct).assertEqual(90000);
      }

      {
        let overflowCount: int = 0;
        let gridSize: int = 100;
        for (let i: int = 0; i < gridSize; i++) {
          for (let j: int = 0; j < gridSize; j++) {
            let a: Short = new Short(Int.toShort(i * 3));
            let b: Short = new Short(Int.toShort(j * 3));
            let product: Short = a.mul(b);
            let expectedFull: int = a.toInt() * b.toInt();
            expect(product.toShort()).assertEqual(Int.toShort(expectedFull));
            if (product.toInt() !== expectedFull) {
              overflowCount++;
            }
          }
        }
        expect(overflowCount > 0).assertTrue();
        expect(overflowCount < 10000).assertTrue();
      }

      {
        let a: Short = new Short(300 as short);
        let b: Short = new Short(200 as short);
        let longProduct: long = Short.toLong(a).mul(Short.toLong(b));
        expect(longProduct.toInt()).assertEqual(60000);
        let c: Short = new Short(1000 as short);
        let d: Short = new Short(50 as short);
        let longProduct2: long = Short.toLong(c).mul(Short.toLong(d));
        expect(longProduct2.toInt()).assertEqual(50000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0500
     * @tc.name testShortMul_merged5
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.mul, including overflow, business scenarios, boundary values, fractions and rounding, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let pairs: Short[][] = [
          [new Short(100 as short), new Short(300 as short)],
          [new Short(50 as short), new Short(500 as short)],
          [new Short(181 as short), new Short(181 as short)],
          [new Short(182 as short), new Short(180 as short)]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          let product: Short = a.mul(b);
          expect(product.toInt()).assertEqual(a.toInt() * b.toInt());
        }
      }

      {
        let overflowPairs: Short[][] = [
          [new Short(200 as short), new Short(200 as short)],
          [new Short(256 as short), new Short(128 as short)],
          [new Short(182 as short), new Short(182 as short)]
        ];
        for (let i: int = 0; i < overflowPairs.length; i++) {
          let a: Short = overflowPairs[i][0];
          let b: Short = overflowPairs[i][1];
          let absProduct: int = Math.abs(a.toInt()) * Math.abs(b.toInt());
          expect(absProduct > 32767).assertTrue();
          let product: Short = a.mul(b);
          expect(product.toShort()).assertEqual(Int.toShort(a.toInt() * b.toInt()));
        }
      }

      {
        let negOne: Short = new Short((-1) as short);
        let byteMin: Short = new Short((-128) as short);
        let byteMax: Short = new Short(127 as short);
        let zero: Short = new Short(0 as short);
        expect(byteMin.mul(negOne).toShort()).assertEqual(128 as short);
        expect(byteMax.mul(negOne).toShort()).assertEqual((-127) as short);
        expect(zero.mul(negOne).toShort()).assertEqual(0 as short);
        expect(zero.mul(negOne).toInt()).assertEqual(0);
        expect(byteMin.toShort()).assertEqual((-128) as short);
        expect(byteMax.toShort()).assertEqual(127 as short);
      }

      {
        let a: Short = new Short(7 as short);
        let b: Short = new Short(13 as short);
        let c: Short = a.mul(b);
        let recovered: Short = c.div(a);
        expect(recovered.toShort()).assertEqual(b.toShort());
        let d: Short = new Short((-6) as short);
        let e: Short = new Short(15 as short);
        let f: Short = d.mul(e);
        let recovered2: Short = f.div(d);
        expect(recovered2.toShort()).assertEqual(e.toShort());
        let zero: Short = new Short(0 as short);
        let zeroFactor: Short = new Short(99 as short);
        let zeroProduct: Short = zeroFactor.mul(zero);
        expect(zeroProduct.toShort()).assertEqual(0 as short);
      }

      {
        let negOne: Short = new Short((-1) as short);
        let testValues: short[] = [0 as short, 1 as short, 42 as short, (-100) as short, 32767 as short, (-32767) as short];
        for (let i: int = 0; i < testValues.length; i++) {
          let a: Short = new Short(testValues[i]);
          let doubleNegated: Short = a.mul(negOne).mul(negOne);
          expect(doubleNegated.toShort()).assertEqual(testValues[i]);
          expect(doubleNegated.equals(a)).assertTrue();
        }
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(30 as short);
        let leftSide: Short = a.mul(b.add(c));
        let rightSide: Short = a.mul(b).add(a.mul(c));
        expect(leftSide.toShort()).assertEqual(rightSide.toShort());
        expect(leftSide.toInt()).assertEqual(500);
        expect(rightSide.toInt()).assertEqual(500);
        let overflowA: Short = new Short(1000 as short);
        let overflowB: Short = new Short(20 as short);
        let overflowC: Short = new Short(30 as short);
        let overflowLeft: Short = overflowA.mul(overflowB.add(overflowC));
        let overflowRight: Short = overflowA.mul(overflowB).add(overflowA.mul(overflowC));
        expect(overflowLeft.toShort()).assertEqual(overflowRight.toShort());
      }

      {
        let distributeCount: int = 0;
        let testCount: int = 1000;
        for (let i: int = 0; i < testCount; i++) {
          let aVal: int = i % 181;
          let bVal: int = (i * 7) % 100;
          let cVal: int = (i * 13) % 80;
          let a: Short = new Short(Int.toShort(aVal));
          let b: Short = new Short(Int.toShort(bVal));
          let c: Short = new Short(Int.toShort(cVal));
          let leftSide: Short = a.mul(b.add(c));
          let rightSide: Short = a.mul(b).add(a.mul(c));
          if (leftSide.toInt() == rightSide.toInt()) {
            distributeCount++;
          }
        }
        expect(distributeCount).assertEqual(testCount);
      }

      {
        let width: Short = new Short(150 as short);
        let height: Short = new Short(100 as short);
        let area: Short = width.mul(height);
        expect(area.toInt()).assertEqual(15000);
        let width2: Short = new Short(200 as short);
        let height2: Short = new Short(200 as short);
        let area2: Short = width2.mul(height2);
        expect(area2.toInt()).assertEqual(-25536);
        let width3: Short = new Short(256 as short);
        let height3: Short = new Short(128 as short);
        let area3: Short = width3.mul(height3);
        expect(area3.toShort()).assertEqual((-32768) as short);
      }

      {
        let rate: Short = new Short(2 as short);
        let principals: Short[] = [new Short(100 as short), new Short(500 as short)];
        let yearCounts: int[] = [3, 2];
        for (let p: int = 0; p < principals.length; p++) {
          let acc: Short = principals[p];
          for (let y: int = 0; y < yearCounts[p]; y++) {
            acc = acc.mul(rate);
            expect(acc.toInt()).assertEqual(principals[p].toInt() * (1 << (y + 1)));
          }
        }
      }

      {
        let x: Short = new Short(30000 as short);
        let k: Short = new Short(5 as short);
        let product: Short = x.mul(k);
        let recovered: Short = product.div(k);
        expect(recovered.toShort() !== 30000 as short).assertTrue();
        expect(x.toInt() * k.toInt() !== product.toInt()).assertTrue();
        expect(recovered.toShort()).assertEqual(3785 as short);
        expect(product.toInt()).assertEqual(18928);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0600
     * @tc.name testShortMul_merged6
     * @tc.desc BoundaryOverflow / ErrorException: covers 10 merged test points for Short.mul, including overflow, boundary values, type conversion, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(327 as short);
        let ten: Short = new Short(10 as short);
        let hundred: Short = new Short(100 as short);
        let thousand: Short = new Short(1000 as short);
        let by10: Short = value.mul(ten);
        let by100: Short = value.mul(hundred);
        let by1000: Short = value.mul(thousand);
        expect(by10.toInt()).assertEqual(3270);
        expect(by100.toInt()).assertEqual(32700);
        let by1000Full: int = 327 * 1000;
        expect(by1000Full).assertEqual(327000);
        let overflowed: boolean = by1000.toInt() !== by1000Full;
        expect(overflowed).assertTrue();
        let value2: Short = new Short(3 as short);
        let by10_2: Short = value2.mul(ten);
        let by100_2: Short = value2.mul(hundred);
        let by1000_2: Short = value2.mul(thousand);
        expect(by10_2.toInt()).assertEqual(30);
        expect(by100_2.toInt()).assertEqual(300);
        expect(by1000_2.toInt()).assertEqual(3000);
      }

      {
        let detectMulOverflow = (a: Short, b: Short): boolean => {
          let product: Short = a.mul(b);
          let bothPositive: boolean = a.toInt() > 0 && b.toInt() > 0;
          let bothNegative: boolean = a.toInt() < 0 && b.toInt() < 0;
          let productNegative: boolean = product.toInt() < 0;
          if (bothPositive && productNegative) return true;
          if (bothNegative && productNegative) return true;
          let oppositeSigns: boolean = (a.toInt() > 0 && b.toInt() < 0) || (a.toInt() < 0 && b.toInt() > 0);
          let productPositive: boolean = product.toInt() > 0;
          if (oppositeSigns && productPositive) return true;
          return false;
        };
        let posA: Short = new Short(200 as short);
        let posB: Short = new Short(200 as short);
        expect(detectMulOverflow(posA, posB)).assertTrue();
        let negA: Short = new Short((-200) as short);
        let negB: Short = new Short((-200) as short);
        expect(detectMulOverflow(negA, negB)).assertTrue();
        let safeA: Short = new Short(10 as short);
        let safeB: Short = new Short(20 as short);
        expect(detectMulOverflow(safeA, safeB)).assertFalse();
      }

      {
        let a: Short = new Short((-200) as short);
        let b: Short = new Short((-200) as short);
        let product: Short = a.mul(b);
        let wideProduct: int = (-200) * (-200);
        expect(wideProduct).assertEqual(40000);
        expect(product.toInt() < 0).assertTrue();
        expect(product.toInt()).assertEqual(-25536);
        let c: Short = new Short((-256) as short);
        let d: Short = new Short((-128) as short);
        let product2: Short = c.mul(d);
        let wideProduct2: int = (-256) * (-128);
        expect(wideProduct2).assertEqual(32768);
        expect(product2.toInt() < 0).assertTrue();
        expect(product2.toShort()).assertEqual(Short.MIN_VALUE);
        let e: Short = new Short((-182) as short);
        let f: Short = new Short((-182) as short);
        let product3: Short = e.mul(f);
        expect(product3.toInt() < 0).assertTrue();
      }

      {
        let detectMulOverflowViaLong = (a: Short, b: Short): boolean => {
          let shortResult: long = a.mul(b).toLong();
          let wideResult: long = Short.toLong(a).mul(Short.toLong(b));
          return !shortResult.equals(wideResult);
        };
        let testSets: Short[][] = [
        [new Short(300 as short), new Short(200 as short)],
        [new Short(256 as short), new Short(256 as short)],
        [new Short(182 as short), new Short(182 as short)],
        [new Short(32767 as short), new Short(3 as short)],
        [new Short((-32768) as short), new Short(2 as short)],
        [new Short(100 as short), new Short(100 as short)]
        ];
        let overflowCount: int = 0;
        for (let i: int = 0; i < testSets.length; i++) {
          if (detectMulOverflowViaLong(testSets[i][0], testSets[i][1])) {
            overflowCount++;
          }
        }
        expect(overflowCount).assertEqual(5);
        let safeA: Short = new Short(50 as short);
        let safeB: Short = new Short(60 as short);
        expect(detectMulOverflowViaLong(safeA, safeB)).assertFalse();
      }

      {
        let base: Short = new Short(128 as short);
        let mult32: Short = new Short(32 as short);
        let product0x1000: Short = base.mul(mult32);
        expect(product0x1000.toShort()).assertEqual(4096 as short);
        expect(product0x1000.toString(16)).assertEqual('1000');
        let mult33: Short = new Short(33 as short);
        let beyond0x1000: Short = base.mul(mult33);
        expect(beyond0x1000.toShort()).assertEqual(4224 as short);
        let mult256: Short = new Short(256 as short);
        let product0x8000: Short = base.mul(mult256);
        expect(product0x8000.toShort()).assertEqual(Short.MIN_VALUE);
        expect(product0x8000.toString(16)).assertEqual('-8000');
        let mult257: Short = new Short(257 as short);
        let beyond0x8000: Short = base.mul(mult257);
        expect(beyond0x8000.toShort()).assertEqual((-32640) as short);
      }

      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(200 as short);
        let c: Short = new Short(2 as short);
        let step1: Short = a.mul(b);
        expect(step1.toShort()).assertEqual((-25536) as short);
        let step2: Short = step1.mul(c);
        let wideStep1: int = a.toInt() * b.toInt();
        let wideStep2: int = wideStep1 * c.toInt();
        let expectedWrapped: short = Int.toShort(wideStep2);
        expect(step2.toShort()).assertEqual(expectedWrapped);
        expect(wideStep1).assertEqual(40000);
        expect(wideStep2).assertEqual(80000);
        expect(a.toShort()).assertEqual(200 as short);
        expect(b.toShort()).assertEqual(200 as short);
        expect(c.toShort()).assertEqual(2 as short);
      }

      {
        let byteBoundaryValues: short[] = [127 as short, 128 as short, (-128) as short, (-129) as short];
        let results: Map<string, int> = new Map<string, int>();
        let overflowResults: Map<string, boolean> = new Map<string, boolean>();
        for (let i: int = 0; i < byteBoundaryValues.length; i++) {
          for (let j: int = 0; j < byteBoundaryValues.length; j++) {
            let a: Short = new Short(byteBoundaryValues[i]);
            let b: Short = new Short(byteBoundaryValues[j]);
            let product: Short = a.mul(b);
            let wideProduct: int = a.toInt() * b.toInt();
            let key: string = a.toInt() + '*' + b.toInt();
            results.set(key, product.toInt());
            overflowResults.set(key, product.toInt() !== wideProduct);
          }
        }
        expect(results.get('127*127')).assertEqual(16129);
        expect(results.get('128*128')).assertEqual(16384);
        expect(results.get('127*128')).assertEqual(16256);
        expect(results.get('-128*-128')).assertEqual(16384);
        expect(overflowResults.get('-129*-129')).assertEqual(false);
        expect(overflowResults.get('-129*128')).assertEqual(false);
        let a: Short = new Short(127 as short);
        let b: Short = new Short(128 as short);
        expect(a.mul(b).toInt()).assertEqual(16256);
      }

      {
        let digitRoot = (v: int): int => {
          if (v == 0) {
            return 0;
          }
          let r: int = v % 9;
          return r == 0 ? 9 : r;
        };
        let a: Short = new Short(123 as short);
        let b: Short = new Short(45 as short);
        let product: Short = a.mul(b);
        expect(digitRoot(product.toInt())).assertEqual(digitRoot(digitRoot(a.toInt()) * digitRoot(b.toInt())));
  
        let c: Short = new Short(98 as short);
        let d: Short = new Short(76 as short);
        let product2: Short = c.mul(d);
        expect(digitRoot(product2.toInt())).assertEqual(digitRoot(digitRoot(c.toInt()) * digitRoot(d.toInt())));
  
        let e: Short = new Short(200 as short);
        let f: Short = new Short(150 as short);
        let product3: Short = e.mul(f);
        expect(digitRoot(product3.toInt())).assertEqual(digitRoot(digitRoot(e.toInt()) * digitRoot(f.toInt())));
      }

      {
        let base: Short = new Short(3 as short);
        let receiver: Short = base.mul(new Short(2 as short));
        try {
          receiver.mul(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        try {
          let undefinedOperand: Short = undefined as Short;
          new Short(6 as short).mul(undefinedOperand);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0700
     * @tc.name testShortMul_merged7
     * @tc.desc ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.mul, including type conversion, loop accumulation, business scenarios, fractions and rounding, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(100 as short);
        let c: Short = new Short(80 as short);
        let leftSide: Short = a.mul(b.add(c));
        let rightSide: Short = a.mul(b).add(a.mul(c));
        let leftInt: int = leftSide.toInt();
        let rightInt: int = rightSide.toInt();
        let diff: int = leftInt > rightInt ? leftInt - rightInt : rightInt - leftInt;
        expect(diff % 65536).assertEqual(0);
        let aFull: int = a.toInt() * (b.toInt() + c.toInt());
        expect(aFull).assertEqual(36000);
      }

      {
        let error: Short = new Short((-5) as short);
        let ditherCoeff: Short = new Short(7 as short);
        let diffused: Short = error.mul(ditherCoeff);
        expect(diffused.toInt()).assertEqual(-35);
        let error2: Short = new Short(10 as short);
        let ditherCoeff2: Short = new Short(16 as short);
        let diffused2: Short = error2.mul(ditherCoeff2);
        expect(diffused2.toShort()).assertEqual(160 as short);
        let errors: Short[] = [
          new Short(3 as short), new Short((-2) as short), new Short(1 as short), new Short((-4) as short)
        ];
        let coeffs: Short[] = [
          new Short(7 as short), new Short(3 as short), new Short(5 as short), new Short(1 as short)
        ];
        let totalDiffused: Short = new Short(0 as short);
        for (let i: int = 0; i < errors.length; i++) {
          totalDiffused = totalDiffused.add(errors[i].mul(coeffs[i]));
        }
        expect(totalDiffused.toInt()).assertEqual(16);
      }

      {
        let expected: Short = new Short(100 as short);
        let values: short[] = [95 as short, 105 as short, 98 as short, 102 as short, 100 as short];
        let squaredErrors: Short[] = [];
        let sumSquaredErrors: Short = new Short(0 as short);
        for (let i: int = 0; i < values.length; i++) {
          let val: Short = new Short(values[i]);
          let error: Short = val.sub(expected);
          let sqError: Short = error.mul(error);
          squaredErrors.push(sqError);
          sumSquaredErrors = sumSquaredErrors.add(sqError);
          let wideSq: int = error.toInt() * error.toInt();
          expect(sqError.toInt()).assertEqual(wideSq);
        }
        let expectedTotal: int = (25 + 25 + 4 + 4 + 0);
        expect(sumSquaredErrors.toInt()).assertEqual(expectedTotal);
        expect(squaredErrors[0].toShort()).assertEqual(25 as short);
        expect(squaredErrors[4].toShort()).assertEqual(0 as short);
      }

      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(200 as short);
        let product: Short = a.mul(b);
        expect(product.toInt()).assertEqual(-25536);
        let charVal: char = product.toChar();
        let refShort: Short = new Short(product.toShort());
        expect(charVal).assertEqual(refShort.toChar());
        let c: Short = new Short((-128) as short);
        let d: Short = new Short(6 as short);
        let product2: Short = c.mul(d);
        expect(product2.toInt()).assertEqual(-768);
      }

      {
        let testValues: short[] = [7 as short, 13 as short, 42 as short, (-8) as short, (-33) as short];
        let factor: Short = new Short(5 as short);
        for (let i: int = 0; i < testValues.length; i++) {
          let original: Short = new Short(testValues[i]);
          let multiplied: Short = original.mul(factor);
          let recovered: Short = multiplied.div(factor);
          expect(recovered.toShort()).assertEqual(testValues[i]);
          expect(recovered.equals(original)).assertTrue();
        }
      }

      {
        let a: Short = new Short(17 as short);
        let b: Short = new Short(8 as short);
        let product: Short = a.mul(b);
        let roundTripped: Short = new Short(product.toShort());
        expect(roundTripped.equals(product)).assertTrue();
        expect(roundTripped.toShort()).assertEqual(136 as short);
        let c: Short = new Short((-23) as short);
        let d: Short = new Short(9 as short);
        let product2: Short = c.mul(d);
        let roundTripped2: Short = new Short(product2.toShort());
        expect(roundTripped2.equals(product2)).assertTrue();
        expect(roundTripped2.toShort()).assertEqual((-207) as short);
      }

      {
        let factorial: Short[] = [];
        let current: Short = new Short(1 as short);
        let n: int = 1;
  
        let prevInt: int = 1;
        while (n <= 10) {
          factorial.push(current);
          n++;
          let multiplier: Short = new Short(Int.toShort(n));
          current = current.mul(multiplier);
  
          prevInt = prevInt * n;
          if (prevInt > 32767) {
            break;
          }
        }
  
        expect(factorial[6].toInt()).assertEqual(5040);
        expect(factorial.length).assertEqual(7);
  
        let longFactorial: long = Short.toLong(new Short(1 as short));
        for (let i: int = 2; i <= 8; i++) {
          longFactorial = longFactorial.mul(Short.toLong(new Short(Int.toShort(i))));
        }
        expect(longFactorial.toInt()).assertEqual(40320);
      }

      {
        let base: Short = new Short(3 as short);
        let pow128: Short = new Short(128 as short);
        let pow256: Short = new Short(256 as short);
        let pow512: Short = new Short(512 as short);
        let v128: Short = base.mul(pow128);
        let v256: Short = base.mul(pow256);
        let v512: Short = base.mul(pow512);
        expect(v128.toShort()).assertEqual(384 as short);
        expect(v256.toShort()).assertEqual(768 as short);
        expect(v512.toShort()).assertEqual(1536 as short);
        expect(v128.toInt()).assertEqual(384);
        expect(v256.toInt()).assertEqual(768);
        expect(v512.toInt()).assertEqual(1536);
        expect(base.toShort()).assertEqual(3 as short);
      }

      {
        let a: Short = new Short(256 as short);
        let b: Short = new Short(128 as short);
        let product: Short = a.mul(b);
        expect(product.toShort()).assertEqual((-32768) as short);
        let unsignedChar: char = product.toChar();
        let refShort: Short = new Short(product.toShort());
        expect(unsignedChar).assertEqual(refShort.toChar());
        expect(unsignedChar).assertEqual(Short.toChar(Short.MIN_VALUE));
        let c: Short = new Short(32767 as short);
        let d: Short = new Short(2 as short);
        let product2: Short = c.mul(d);
        expect(product2.toShort()).assertEqual((-2) as short);
      }

      {
        let longA: long = Long.toLong(150);
        let longB: long = Long.toLong(8);
        let shortA: Short = new Short(Long.toShort(longA));
        let shortB: Short = new Short(Long.toShort(longB));
        let product: Short = shortA.mul(shortB);
        expect(product.toInt()).assertEqual(1200);
        let longProduct: Short = new Short(Long.toShort(Long.toLong(1200)));
        expect(product.equals(longProduct)).assertTrue();
        let bigLongA: long = Long.toLong(70000);
        let bigLongB: long = Long.toLong(2);
        let bigShortA: Short = new Short(Long.toShort(bigLongA));
        let bigShortB: Short = new Short(Long.toShort(bigLongB));
        let bigProduct: Short = bigShortA.mul(bigShortB);
        let wideExpected: int = Long.toInt(bigLongA) * Long.toInt(bigLongB);
        let expectedWrapped: short = Int.toShort(wideExpected);
        expect(bigProduct.toShort()).assertEqual(expectedWrapped);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0800
     * @tc.name testShortMul_merged8
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.mul, including equality consistency, algebraic properties, idempotence, radix conversion, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(15 as short);
        let b: Short = new Short(17 as short);
        let product: Short = a.mul(b);
        expect(product.toShort()).assertEqual(255 as short);
        let binaryStr: string = product.toString(2);
        expect(binaryStr).assertEqual('11111111');
        let restoredBin: short = Short.parseInt(binaryStr, 2);
        expect(new Short(restoredBin).equals(product)).assertTrue();
        let octalStr: string = product.toString(8);
        expect(octalStr).assertEqual('377');
        let restoredOct: short = Short.parseInt(octalStr, 8);
        expect(new Short(restoredOct).equals(product)).assertTrue();
        let c: Short = new Short(16 as short);
        let d: Short = new Short(16 as short);
        let product2: Short = c.mul(d);
        let hexStr: string = product2.toString(16);
        expect(hexStr).assertEqual('100');
        let restoredHex: short = Short.parseInt(hexStr, 16);
        expect(new Short(restoredHex).toShort()).assertEqual(256 as short);
      }

      {
        let zeroOperand: Short = new Short(0 as short);
        let nonZeroOperand: Short = new Short(7 as short);
        let zeroLeftProduct: Short = zeroOperand.mul(nonZeroOperand);
        let zeroRightProduct: Short = nonZeroOperand.mul(zeroOperand);
        expect(zeroLeftProduct.toShort()).assertEqual(0 as short);
        expect(zeroRightProduct.toShort()).assertEqual(0 as short);
        expect(zeroOperand.toShort()).assertEqual(0 as short);
        expect(nonZeroOperand.toShort()).assertEqual(7 as short);
      }

      {
        let leftOperand: Short = new Short(5 as short);
        let rightOperand: Short = new Short(3 as short);
        let firstProduct: Short = leftOperand.mul(rightOperand);
        let secondProduct: Short = leftOperand.mul(rightOperand);
        let thirdProduct: Short = leftOperand.mul(rightOperand);
        expect(firstProduct.toShort()).assertEqual(15 as short);
        expect(secondProduct.toShort()).assertEqual(15 as short);
        expect(thirdProduct.toShort()).assertEqual(15 as short);
        expect(secondProduct.toShort()).assertEqual(firstProduct.toShort());
        expect(thirdProduct.toShort()).assertEqual(firstProduct.toShort());
        expect(leftOperand.toShort()).assertEqual(5 as short);
        expect(rightOperand.toShort()).assertEqual(3 as short);
      }

      {
        let firstLeftOperand: Short = new Short(8 as short);
        let firstRightOperand: Short = new Short(2 as short);
        let secondLeftOperand: Short = new Short(8 as short);
        let secondRightOperand: Short = new Short(2 as short);
        let firstProduct: Short = firstLeftOperand.mul(firstRightOperand);
        let secondProduct: Short = secondLeftOperand.mul(secondRightOperand);
        expect(firstProduct.toShort()).assertEqual(16 as short);
        expect(secondProduct.toShort()).assertEqual(16 as short);
        expect(secondProduct.toShort()).assertEqual(firstProduct.toShort());
        expect(firstLeftOperand.toShort()).assertEqual(8 as short);
        expect(firstRightOperand.toShort()).assertEqual(2 as short);
        expect(secondLeftOperand.toShort()).assertEqual(8 as short);
        expect(secondRightOperand.toShort()).assertEqual(2 as short);
      }

      {
        let leftOperand: Short = new Short(7 as short);
        let rightOperand: Short = new Short(9 as short);
        let leftFirstProduct: Short = leftOperand.mul(rightOperand);
        let rightFirstProduct: Short = rightOperand.mul(leftOperand);
        let repeatedProduct: Short = leftOperand.mul(rightOperand);
        expect(leftFirstProduct.toShort()).assertEqual(rightFirstProduct.toShort());
        expect(leftFirstProduct.toShort()).assertEqual(63 as short);
        expect(rightFirstProduct.toShort()).assertEqual(63 as short);
        expect(repeatedProduct.toShort()).assertEqual(63 as short);
        expect(leftOperand.toShort()).assertEqual(7 as short);
        expect(rightOperand.toShort()).assertEqual(9 as short);
      }

      {
        let originalOperand: Short = new Short(4 as short);
        let multiplierValues: short[] = [
          2 as short,
          3 as short,
          4 as short,
          5 as short,
          6 as short
        ];
        let expectedProducts: short[] = [
          8 as short,
          12 as short,
          16 as short,
          20 as short,
          24 as short
        ];
        let iterationLimit: int = 5;
        let iterationIndex: int = 0;
        while (iterationIndex < iterationLimit) {
          let multiplierOperand: Short = new Short(multiplierValues[iterationIndex]);
          let product: Short = originalOperand.mul(multiplierOperand);
          expect(product.toShort()).assertEqual(expectedProducts[iterationIndex]);
          iterationIndex++;
        }
        expect(originalOperand.toShort()).assertEqual(4 as short);
      }

      {
        let a: Short = new Short(2 as short);
        let b: Short = new Short(3 as short);
        let c: Short = new Short(4 as short);
        let abMulC: Short = a.mul(b).mul(c);
        let aMulBc: Short = a.mul(b.mul(c));
        expect(abMulC.toShort()).assertEqual(aMulBc.toShort());
        expect(abMulC.toShort()).assertEqual(24 as short);
      }

      {
        let nA: Short = new Short((-2) as short);
        let nB: Short = new Short((-3) as short);
        let nC: Short = new Short((-4) as short);
        let nLeft: Short = nA.mul(nB).mul(nC);
        let nRight: Short = nA.mul(nB.mul(nC));
        expect(nLeft.toShort()).assertEqual(nRight.toShort());
        expect(nLeft.toShort()).assertEqual((-24) as short);
        let mA: Short = new Short((-5) as short);
        let mB: Short = new Short(6 as short);
        let mC: Short = new Short((-7) as short);
        let mLeft: Short = mA.mul(mB).mul(mC);
        let mRight: Short = mA.mul(mB.mul(mC));
        expect(mLeft.toShort()).assertEqual(mRight.toShort());
        expect(mLeft.toShort()).assertEqual(210 as short);
        let oA: Short = new Short(8 as short);
        let oB: Short = new Short(9 as short);
        let oC: Short = new Short((-10) as short);
        let oLeft: Short = oA.mul(oB).mul(oC);
        let oRight: Short = oA.mul(oB.mul(oC));
        expect(oLeft.toShort()).assertEqual(oRight.toShort());
        expect(oLeft.toShort()).assertEqual((-720) as short);
      }

      {
        let two: Short = new Short(2 as short);
        let four: Short = two.mul(two);
        let eight: Short = four.mul(two);
        let sixteen: Short = eight.mul(two);
        expect(four.toShort()).assertEqual(4 as short);
        expect(eight.toShort()).assertEqual(8 as short);
        expect(sixteen.toShort()).assertEqual(16 as short);
      }

      {
        let a: Short = new Short(12 as short);
        let b: Short = new Short(34 as short);
        let c: Short = new Short(56 as short);
  
        expect(a.mul(b).equals(b.mul(a))).assertTrue();
        expect(a.mul(b).mul(c).equals(a.mul(b.mul(c)))).assertTrue();
  
        let leftSide: Short = a.mul(b.add(c));
        let rightSide: Short = a.mul(b).add(a.mul(c));
        expect(leftSide.equals(rightSide)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_0900
     * @tc.name testShortMul_merged9
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.mul, including business scenarios, idempotence, sign handling, loop accumulation, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(7 as short);
        let five: Short = new Short(5 as short);
        let mulResult: Short = a.mul(five);
        let addResult: Short = a.add(a).add(a).add(a).add(a);
        expect(mulResult.toShort()).assertEqual(addResult.toShort());
        expect(mulResult.toInt()).assertEqual(35);
        expect(addResult.toInt()).assertEqual(35);
        let b: Short = new Short(12 as short);
        let mulResult2: Short = b.mul(five);
        let addResult2: Short = b.add(b).add(b).add(b).add(b);
        expect(mulResult2.toShort()).assertEqual(addResult2.toShort());
      }

      {
        let base: Short = new Short(3 as short);
        let power2: Short = base.mul(base);
        let power3: Short = power2.mul(base);
        let power4: Short = power3.mul(base);
        let power5: Short = power4.mul(base);
        expect(power2.toShort()).assertEqual(9 as short);
        expect(power3.toShort()).assertEqual(27 as short);
        expect(power4.toShort()).assertEqual(81 as short);
        expect(power5.toShort()).assertEqual(243 as short);
        expect(power2.toInt()).assertEqual(3 ** 2);
        expect(power3.toInt()).assertEqual(3 ** 3);
        expect(power4.toInt()).assertEqual(3 ** 4);
        expect(power5.toInt()).assertEqual(3 ** 5);
        let base2: Short = new Short(2 as short);
        let power10: Short = base2;
        for (let i: int = 1; i < 10; i++) {
          power10 = power10.mul(base2);
        }
        expect(power10.toShort()).assertEqual(1024 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(50 as short);
        let product: Short = a.mul(b);
        expect(product.toShort()).assertEqual(5000 as short);
        expect(product.toString()).assertEqual('5000');
        let localeStr: string = product.toLocaleString();
        expect(typeof localeStr).assertEqual('string');
        expect(localeStr).assertEqual('5,000');
        let localeStr2: string = product.toLocaleString();
        expect(localeStr).assertEqual(localeStr2);
        let c: Short = new Short((-30) as short);
        let d: Short = new Short(40 as short);
        let product2: Short = c.mul(d);
        expect(product2.toString()).assertEqual('-1200');
        let localeStrNeg: string = product2.toLocaleString();
        expect(typeof localeStrNeg).assertEqual('string');
        expect(localeStrNeg).assertEqual('-1,200');
      }

      {
        let positiveOperand: Short = new Short(8 as short);
        let negativeOperand: Short = new Short((-3) as short);
        let zeroOperand: Short = new Short(0 as short);
        let factorOperand: Short = new Short(2 as short);
        let positiveProduct: Short = positiveOperand.mul(factorOperand);
        let mixedSignProduct: Short = positiveOperand.mul(negativeOperand);
        let negativeProduct: Short = negativeOperand.mul(negativeOperand);
        let zeroProduct: Short = zeroOperand.mul(positiveOperand);
        expect(positiveProduct.toShort()).assertEqual(16 as short);
        expect(positiveProduct.toInt()).assertEqual(16);
        expect(mixedSignProduct.toShort()).assertEqual((-24) as short);
        expect(mixedSignProduct.toInt()).assertEqual(-24);
        expect(negativeProduct.toShort()).assertEqual(9 as short);
        expect(zeroProduct.toShort()).assertEqual(0 as short);
      }

      {
        let originalOperand: Short = new Short(10 as short);
        let multiplierOperand: Short = new Short(5 as short);
        let originalBefore: short = originalOperand.toShort();
        let multiplierBefore: short = multiplierOperand.toShort();
        let product: Short = originalOperand.mul(multiplierOperand);
        expect(product.toShort()).assertEqual(50 as short);
        expect(product === originalOperand).assertFalse();
        expect(product === multiplierOperand).assertFalse();
        expect(originalOperand.toShort()).assertEqual(originalBefore);
        expect(multiplierOperand.toShort()).assertEqual(multiplierBefore);
      }

      {
        let fixedA: Short = new Short(512 as short);
        let fixedB: Short = new Short(256 as short);
        let rawProduct: Short = fixedA.mul(fixedB);
        expect(rawProduct.toInt()).assertEqual(0);
        let fixedC: Short = new Short(64 as short);
        let fixedD: Short = new Short(128 as short);
        let rawProduct2: Short = fixedC.mul(fixedD);
        expect(rawProduct2.toShort()).assertEqual(8192 as short);
        expect(rawProduct2.toInt()).assertEqual(8192);
      }

      {
        let rawReading: Short = new Short(512 as short);
        let gain: Short = new Short(4 as short);
        let offset: Short = new Short(100 as short);
        let calibrated: Short = rawReading.mul(gain).add(offset);
        expect(calibrated.toInt()).assertEqual(2148);
        let rawNeg: Short = new Short((-100) as short);
        let calibratedNeg: Short = rawNeg.mul(gain).add(offset);
        expect(calibratedNeg.toInt()).assertEqual(-300);
        expect(rawReading.toShort()).assertEqual(512 as short);
      }

      {
        let a: Short = new Short(2 as short);
        let b: Short = new Short(3 as short);
        let c: Short = new Short(5 as short);
        let chained: Short = a.mul(b).mul(c);
        expect(chained.toShort()).assertEqual(30 as short);
        expect(chained.toInt()).assertEqual(30);
      }

      {
        let a: Short = new Short((-2) as short);
        let b: Short = new Short(3 as short);
        let c: Short = new Short((-4) as short);
        let chained: Short = a.mul(b).mul(c);
        expect(chained.toShort()).assertEqual(24 as short);
      }

      {
        let parsed: Short = new Short(Short.parseInt("8", 10));
        let factor: Short = new Short(7 as short);
        let product: Short = parsed.mul(factor);
        expect(product.toShort()).assertEqual(56 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_MUL_1000
     * @tc.name testShortMul_merged10
     * @tc.desc ArithmeticBitwise / SortCompare / BusinessScenario: covers 10 merged test points for Short.mul, including equality consistency, loop accumulation, containers and references, bitwise operations, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortMul_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(9 as short);
        let square: Short = a.mul(a);
        expect(square.toShort()).assertEqual(81 as short);
        expect(square.toInt()).assertEqual(81);
      }

      {
        let a: Short = new Short(5 as short);
        let cube: Short = a.mul(a).mul(a);
        expect(cube.toShort()).assertEqual(125 as short);
      }

      {
        let a: Short = new Short(7 as short);
        let b: Short = new Short(6 as short);
        let c: Short = new Short(10 as short);
        let mulSub: Short = a.mul(b).sub(c);
        expect(mulSub.toShort()).assertEqual(32 as short);
        let d: Short = new Short((-3) as short);
        let e: Short = new Short(8 as short);
        let f: Short = new Short(5 as short);
        let mulSub2: Short = d.mul(e).sub(f);
        expect(mulSub2.toShort()).assertEqual((-29) as short);
        let g: Short = new Short(100 as short);
        let h: Short = new Short(3 as short);
        let i: Short = new Short(250 as short);
        let mulSub3: Short = g.mul(h).sub(i);
        expect(mulSub3.toShort()).assertEqual(50 as short);
        let j: Short = new Short((-5) as short);
        let k: Short = new Short((-5) as short);
        let l: Short = new Short(10 as short);
        let mulSub4: Short = j.mul(k).sub(l);
        expect(mulSub4.toShort()).assertEqual(15 as short);
      }

      {
        let baseValues: short[] = [
          (-200) as short, (-100) as short, (-50) as short, (-10) as short,
          (-1) as short, 0 as short, 1 as short, 10 as short,
          50 as short, 100 as short, 200 as short
        ];
        let multipliers: short[] = [
          1 as short, 2 as short, 3 as short, 5 as short,
          (-1) as short, (-2) as short
        ];
        let baseCount: int = 11;
        let mulCount: int = 6;
        for (let i: int = 0; i < baseCount; i++) {
          let base: Short = new Short(baseValues[i]);
          for (let j: int = 0; j < mulCount; j++) {
            let multiplier: Short = new Short(multipliers[j]);
            let baseBefore: short = base.toShort();
            let multiplierBefore: short = multiplier.toShort();
            let product: Short = base.mul(multiplier);
            expect(base.toShort()).assertEqual(baseBefore);
            expect(multiplier.toShort()).assertEqual(multiplierBefore);
            let aVal: int = baseValues[i];
            let bVal: int = multipliers[j];
            expect(product.toInt()).assertEqual(aVal * bVal);
          }
        }
        let concreteA: Short = new Short(150 as short);
        let concreteB: Short = new Short(3 as short);
        expect(concreteA.mul(concreteB).toInt()).assertEqual(450);
        let concreteC: Short = new Short((-150) as short);
        let concreteD: Short = new Short(3 as short);
        expect(concreteC.mul(concreteD).toInt()).assertEqual(-450);
      }

      {
        let left: Short = new Short(Char.toShort(c'A'));
        let right: Short = new Short(Char.toShort(c'B'));
        let product: Short = left.mul(right);
        expect(product.toShort()).assertEqual(4290 as short);
        expect(left.toShort()).assertEqual(65 as short);
        expect(right.toShort()).assertEqual(66 as short);
        expect(product.equals(new Short(4290 as short))).assertTrue();
      }

      {
        let rawSignal: Short = new Short(1000 as short);
        let gainQ8: Short = new Short(384 as short);
        let qScale: Short = new Short(256 as short);
        let amplified: Short = rawSignal.mul(gainQ8).div(qScale);
        expect(amplified.toShort()).assertEqual((-36) as short);
        let rawSignal2: Short = new Short(500 as short);
        let amplified2: Short = rawSignal2.mul(gainQ8).div(qScale);
        expect(amplified2.toShort()).assertEqual((-18) as short);
        let rawNeg: Short = new Short((-200) as short);
        let amplifiedNeg: Short = rawNeg.mul(gainQ8).div(qScale);
        expect(amplifiedNeg.toShort()).assertEqual((-44) as short);
      }

      {
        let x: Short = new Short(4 as short);
        let coeff3: Short = new Short(3 as short);
        let coeff2: Short = new Short(2 as short);
        let coeff1: Short = new Short(5 as short);
        let coeff0: Short = new Short(7 as short);
        let result: Short = new Short(0 as short);
        result = result.add(coeff3);
        result = result.mul(x);
        result = result.add(coeff2);
        result = result.mul(x);
        result = result.add(coeff1);
        result = result.mul(x);
        result = result.add(coeff0);
        let expected: int = 3 * 64 + 2 * 16 + 5 * 4 + 7;
        expect(expected).assertEqual(251);
        expect(result.toInt()).assertEqual(expected);
        let x2: Short = new Short(2 as short);
        let result2: Short = new Short(0 as short);
        result2 = result2.add(coeff3).mul(x2).add(coeff2).mul(x2).add(coeff1).mul(x2).add(coeff0);
        let expected2: int = 3 * 8 + 2 * 4 + 5 * 2 + 7;
        expect(result2.toInt()).assertEqual(expected2);
      }

      {
        let oddA: Short = new Short(3 as short);
        let oddB: Short = new Short(5 as short);
        expect(oddA.mul(oddB).toInt() % 2).assertEqual(1);
  
        let evenA: Short = new Short(4 as short);
        let oddC: Short = new Short(3 as short);
        expect(evenA.mul(oddC).toInt() % 2).assertEqual(0);
  
        let oddD: Short = new Short(5 as short);
        let evenB: Short = new Short(6 as short);
        expect(oddD.mul(evenB).toInt() % 2).assertEqual(0);
  
        let evenC: Short = new Short(6 as short);
        let evenD: Short = new Short(8 as short);
        expect(evenC.mul(evenD).toInt() % 2).assertEqual(0);
      }

      {
        let a: Short = new Short(25 as short);
        let b: Short = new Short(16 as short);
        let product: Short = a.mul(b);
        let expected: Short = new Short(400 as short);
        let smaller: Short = new Short(399 as short);
        let larger: Short = new Short(401 as short);
        expect(product.equals(expected)).assertTrue();
        expect(product.compareTo(expected)).assertEqual(0);
        expect(product.isGreaterThan(smaller)).assertTrue();
        expect(product.isLessThan(larger)).assertTrue();
        expect(product.isGreaterEqualThan(expected)).assertTrue();
        expect(product.isLessEqualThan(expected)).assertTrue();
        expect(product.isGreaterEqualThan(smaller)).assertTrue();
        expect(product.isLessEqualThan(larger)).assertTrue();
        expect(a.toShort()).assertEqual(25 as short);
        expect(b.toShort()).assertEqual(16 as short);
      }

      {
        let adcRaw: Short = new Short(2048 as short);
        let lsbMilliVolts: Short = new Short(2 as short);
        let voltageMV: Short = adcRaw.mul(lsbMilliVolts);
        expect(voltageMV.toInt()).assertEqual(4096);
        let adcMax: Short = new Short(4095 as short);
        let maxVoltageMV: Short = adcMax.mul(lsbMilliVolts);
        expect(maxVoltageMV.toInt()).assertEqual(8190);
        expect(adcRaw.toShort()).assertEqual(2048 as short);
        expect(adcMax.toShort()).assertEqual(4095 as short);
      }
    });

  });
}