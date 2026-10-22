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

class CacheEntry {
  key: Short;
  value: string;
  constructor(key: Short, value: string) {
    this.key = key;
    this.value = value;
  }
}

export default function shortEqualsTest(): void {
  describe('ShortEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0100
     * @tc.name testShortEquals_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short.equals, including equality consistency, zero values, negative values, bitwise operations, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let boxedValue: Short = new Short(50 as short);
        let plainObjectArgument: Object = new Object();
        let isEqual: boolean = boxedValue.equals(plainObjectArgument);
        expect(isEqual).assertFalse();
      }

      {
        let zeroShort: Short = new Short(0 as short);
        let isEqual: boolean = zeroShort.equals(0);
        expect(isEqual).assertTrue();
      }

      {
        let flags: Short = new Short(Int.toShort(0x00FF));
        let clearMask: int = ~0x000F;
        let cleared: Short = new Short(Int.toShort(flags.toInt() & clearMask));
        let expected: Short = new Short(Int.toShort(0x00F0));
        expect(cleared.equals(expected)).assertTrue();
        expect(cleared.equals(flags)).assertFalse();
        expect(cleared.toInt() & 0x000F).assertEqual(0);
      }

      {
        let flagA: Short = new Short(Int.toShort(0x00C0));
        let flagB: Short = new Short(Int.toShort(0x0003));
        let orResult: Short = new Short(Int.toShort(flagA.toInt() | flagB.toInt()));
        let orExpected: Short = new Short(Int.toShort(0x00C3));
        expect(orResult.equals(orExpected)).assertTrue();
        expect(orResult.equals(new Short(Int.toShort(0x00C0)))).assertFalse();
        expect(orResult.equals(new Short(Int.toShort(0x0003)))).assertFalse();
        let shiftBase: Short = new Short(1 as short);
        let leftShifted: Short = new Short(Int.toShort(shiftBase.toInt() << 7));
        expect(leftShifted.equals(new Short(Int.toShort(0x0080)))).assertTrue();
        let leftOverflow: Short = new Short(Int.toShort(shiftBase.toInt() << 15));
        expect(leftOverflow.equals(new Short(Int.toShort(0x8000)))).assertTrue();
        let rightBase: Short = new Short(Int.toShort(0x8000));
        let rightShifted: Short = new Short(Int.toShort(rightBase.toInt() >> 31));
        expect(rightShifted.equals(new Short((-1) as short))).assertTrue();
        let unsignedShifted: Short = new Short(Int.toShort(rightBase.toInt() >>> 31));
        expect(unsignedShifted.equals(new Short(1 as short))).assertTrue();
      }

      {
        let base: Short = new Short(300 as short);
        let plusZero: Short = base.add(new Short(0 as short));
        let minusZero: Short = base.add(new Short((-0) as short));
        expect(plusZero.equals(minusZero)).assertTrue();
        expect(plusZero.toInt()).assertEqual(300);
      }

      {
        let lower: Short = new Short((-300) as short);
        let higher: Short = new Short((-100) as short);
        expect(lower.equals(higher)).assertFalse();
        expect(lower.isLessThan(higher)).assertTrue();
        expect(higher.isGreaterThan(lower)).assertTrue();
        expect(lower.isLessEqualThan(higher)).assertTrue();
        expect(lower.isGreaterEqualThan(higher)).assertFalse();
      }

      {
        let base: Short = new Short(275 as short);
        let same: Short = new Short(275 as short);
        let difference: Short = base.sub(same);
        let zeroShort: Short = new Short(0 as short);
        expect(difference.toInt()).assertEqual(0);
        expect(difference.equals(zeroShort)).assertTrue();
        expect(difference.equals(base)).assertFalse();
      }

      {
        let val: Short = new Short(1234 as short);
        let zeroMul: Short = val.mul(new Short(0 as short));
        let zeroShort: Short = new Short(0 as short);
        let oneMul: Short = val.mul(new Short(1 as short));
        let oneShort: Short = new Short(1234 as short);
        expect(zeroMul.equals(zeroShort)).assertTrue();
        expect(zeroMul.equals(val)).assertFalse();
        expect(oneMul.equals(oneShort)).assertTrue();
        expect(oneMul.equals(val)).assertTrue();
      }

      {
        let targetPos: Short = new Short(15 as short);
        let iterPos: Short = new Short(0 as short);
        let stepsUp: int = 0;
        while (!iterPos.equals(targetPos)) {
          iterPos = iterPos.add(new Short(3 as short));
          stepsUp++;
        }
        expect(stepsUp).assertEqual(5);
  
        let targetNeg: Short = new Short((-10) as short);
        let iterNeg: Short = new Short(0 as short);
        let stepsDown: int = 0;
        while (!iterNeg.equals(targetNeg)) {
          iterNeg = iterNeg.sub(new Short(2 as short));
          stepsDown++;
        }
        expect(stepsDown).assertEqual(5);
        expect(iterNeg.equals(new Short((-10) as short))).assertTrue();
      }

      {
        let fullBits: Short = new Short(Int.toShort(0xFF0F));
        let mask: Short = new Short(Int.toShort(0x00FF));
        let andResult: Short = new Short(Int.toShort(fullBits.toInt() & mask.toInt()));
        let expected: Short = new Short(Int.toShort(0x000F));
        expect(andResult.equals(expected)).assertTrue();
  
        let negBits: Short = new Short(Int.toShort(0xFFFF));
        let negMask: Short = new Short(Int.toShort(0x00FF));
        let negResult: Short = new Short(Int.toShort(negBits.toInt() & negMask.toInt()));
        let negExpected: Short = new Short(255 as short);
        expect(negResult.equals(negExpected)).assertTrue();
        expect(negResult.equals(new Short(0 as short))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0200
     * @tc.name testShortEquals_merged2
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.equals, including equality consistency, boundary values, zero values, type conversion, and opposite values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let aBits: Short = new Short(Int.toShort(0x5555));
        let bBits: Short = new Short(Int.toShort(0x1F1F));
        let xorResult: Short = new Short(Int.toShort(aBits.toInt() ^ bBits.toInt()));
        let expected: Short = new Short(Int.toShort(0x5555 ^ 0x1F1F));
        expect(xorResult.equals(expected)).assertTrue();
  
        let selfXor: Short = new Short(Int.toShort(aBits.toInt() ^ aBits.toInt()));
        expect(selfXor.equals(new Short(0 as short))).assertTrue();
  
        let zeroXor: Short = new Short(Int.toShort(aBits.toInt() ^ 0));
        expect(zeroXor.equals(aBits)).assertTrue();
      }

      {
        let value: Short = new Short(3276 as short);
        let negValue: Short = new Short(Int.toShort(-value.toInt()));
        let zeroShort: Short = new Short(0 as short);
        let sumResult: Short = value.add(negValue);
        expect(sumResult.equals(zeroShort)).assertTrue();
        expect(value.equals(negValue)).assertFalse();
      }

      {
        let source: Short = new Short(Short.MIN_VALUE);
        let asPrimitive: short = source.toShort();
        let rebuilt: Short = new Short(asPrimitive);
        let oppositeBound: Short = new Short(Short.MAX_VALUE);
        expect(asPrimitive).assertEqual((-32768) as short);
        expect(rebuilt.equals(source)).assertTrue();
        expect(rebuilt.equals(oppositeBound)).assertFalse();
      }

      {
        let boundaryValue: Short = new Short(Short.MIN_VALUE);
        let minNumberArgument: number = -32768;
        let isEqual: boolean = boundaryValue.equals(minNumberArgument);
        expect(isEqual).assertTrue();
      }

      {
        let boundaryValue: Short = new Short(Short.MAX_VALUE);
        let maxNumberArgument: number = 32767;
        let isEqual: boolean = boundaryValue.equals(maxNumberArgument);
        expect(isEqual).assertTrue();
      }

      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let outOfRange: int = 32768;
        let isEqual: boolean = maxShort.equals(outOfRange);
        expect(isEqual).assertFalse();
      }

      {
        let minShort: Short = new Short(Short.MIN_VALUE);
        let outOfRange: int = -32769;
        let isEqual: boolean = minShort.equals(outOfRange);
        expect(isEqual).assertFalse();
      }

      {
        let base: Short = new Short(Int.toShort(0x0F0F));
        let inverted: Short = new Short(Int.toShort(~base.toInt()));
        let expected: Short = new Short(Int.toShort(0xF0F0));
        expect(inverted.equals(expected)).assertTrue();
        expect(inverted.equals(base)).assertFalse();
        expect(inverted.toInt()).assertEqual(expected.toInt());
      }

      {
        let source: Short = new Short(Short.MIN_VALUE);
        let asFloat: float = source.toFloat();
        let rebuilt: Short = new Short(Double.toShort(asFloat));
        let oppositeBound: Short = new Short(Short.MAX_VALUE);
        expect(source.toDouble()).assertEqual(-32768.0);
        expect(rebuilt.equals(source)).assertTrue();
        expect(rebuilt.equals(oppositeBound)).assertFalse();
        expect(rebuilt.equals(new Short((-32767) as short))).assertFalse();
      }

      {
        let total: Short = new Short(0 as short);
        let step: Short = new Short(10000 as short);
        let rounds: int = 4;
        for (let i: int = 0; i < rounds; i++) {
          total = total.add(step);
        }
        let wrapped: Short = new Short(Int.toShort(40000));
        expect(total.equals(wrapped)).assertTrue();
        expect(total.equals(new Short(0 as short))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0300
     * @tc.name testShortEquals_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.equals, including equality consistency, boundary values, wrapping, zero values, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let pairs: Short[][] = [
          [new Short(10 as short), new Short(20 as short)],
          [new Short((-5) as short), new Short(5 as short)],
          [new Short(0 as short), new Short(1 as short)],
          [new Short(Short.MIN_VALUE), new Short(Short.MAX_VALUE)],
          [new Short(32766 as short), new Short(32767 as short)]
        ];
        let pairCount: int = 5;
        for (let i: int = 0; i < pairCount; i++) {
          let left: Short = pairs[i][0];
          let right: Short = pairs[i][1];
          expect(left.equals(right)).assertFalse();
          expect(right.equals(left)).assertFalse();
        }
      }

      {
        let nearMax: Short = new Short(Int.toShort(Short.MAX_VALUE - 1));
        let literal: Short = new Short(32766 as short);
        expect(nearMax.equals(literal)).assertTrue();
        expect(nearMax.toInt()).assertEqual(32766);
      }

      {
        let nearMin: Short = new Short(Int.toShort(Short.MIN_VALUE + 1));
        let literal: Short = new Short((-32767) as short);
        expect(nearMin.equals(literal)).assertTrue();
        expect(nearMin.toInt()).assertEqual(-32767);
      }

      {
        let byteMax: Short = new Short(127 as short);
        let byteMaxLiteral: Short = new Short(127 as short);
        expect(byteMax.equals(byteMaxLiteral)).assertTrue();
        expect(byteMax.toByte()).assertEqual(127 as byte);
        let byteMin: Short = new Short((-128) as short);
        let byteMinLiteral: Short = new Short((-128) as short);
        expect(byteMin.equals(byteMinLiteral)).assertTrue();
        expect(byteMin.toByte()).assertEqual((-128) as byte);
      }

      {
        let wrappedNegOneShort: Short = new Short(Int.toShort(65535));
        let wrappedZeroShort: Short = new Short(Int.toShort(65536));
        let negOneShort: Short = new Short((-1) as short);
        let zeroShort: Short = new Short(0 as short);
  
        expect(wrappedNegOneShort.equals(negOneShort)).assertTrue();
        expect(wrappedZeroShort.equals(zeroShort)).assertTrue();
      }

      {
        let one: Short = new Short(1 as short);
        let shifted: Short = new Short(Int.toShort(one.toInt() << 16));
        expect(shifted.toInt()).assertEqual(0);
        expect(shifted.equals(new Short(0 as short))).assertTrue();
        expect(shifted.equals(one)).assertFalse();
      }

      {
        let multiplicand: Short = new Short(257 as short);
        let multiplier: Short = new Short(256 as short);
        let wrappedProduct: Short = multiplicand.mul(multiplier);
        let lowBitEqual: Short = new Short(256 as short);
        expect(wrappedProduct.equals(lowBitEqual)).assertTrue();
        expect(wrappedProduct.toInt()).assertEqual(256);
        expect(wrappedProduct.equals(multiplicand)).assertFalse();
      }

      {
        let values: Short[] = [
          new Short(1 as short), new Short((-1) as short), new Short(0 as short),
          new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)
        ];
        let selfNegatedEqual: int = 0;
        for (let v of values) {
          let negated: Short = new Short(Int.toShort(-v.toInt()));
          if (v.equals(negated)) {
            selfNegatedEqual++;
          }
        }
        expect(selfNegatedEqual).assertEqual(2);
        expect(new Short(0 as short).equals(new Short(Int.toShort(-0)))).assertTrue();
      }

      {
        let bufferSize: int = 3;
        let buffer: Short[] = [
          new Short(0 as short), new Short(0 as short), new Short(0 as short)
        ];
        let writes: Short[] = [
          new Short(11 as short), new Short(22 as short), new Short(33 as short), new Short(44 as short)
        ];
        let overwritten: int = 0;
        for (let i: int = 0; i < writes.length; i++) {
          let slot: int = i % bufferSize;
          if (!buffer[slot].equals(new Short(0 as short))) {
            overwritten++;
          }
          buffer[slot] = writes[i];
        }
        expect(overwritten).assertEqual(1);
        expect(buffer[0].equals(new Short(44 as short))).assertTrue();
        expect(buffer[1].equals(new Short(22 as short))).assertTrue();
      }

      {
        let sequence: Short[] = [
          new Short(1 as short), new Short(1 as short), new Short(2 as short),
          new Short(3 as short), new Short(3 as short)
        ];
        let equalNeighbours: int = 0;
        for (let i: int = 0; i + 1 < sequence.length; i++) {
          if (sequence[i].equals(sequence[i + 1])) {
            equalNeighbours++;
          }
        }
        expect(equalNeighbours).assertEqual(2);
        expect(sequence[1].equals(sequence[2])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0400
     * @tc.name testShortEquals_merged4
     * @tc.desc BoundaryOverflow / ErrorException: covers 10 merged test points for Short.equals, including equality consistency, boundary values, loop accumulation, exceptions, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let doubled: Short = maxVal.add(maxVal);
        let wrapped: Short = new Short((-2) as short);
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(doubled.toInt()).assertEqual(-2);
        expect(doubled.equals(wrapped)).assertTrue();
        expect(doubled.equals(minVal)).assertFalse();
      }

      {
        let testPairs: [short, short][] = [
          [3 as short, 7 as short],
          [(-3) as short, 7 as short],
          [3 as short, (-7) as short],
          [(-3) as short, (-7) as short],
          [0 as short, 100 as short],
          [1 as short, 32767 as short],
          [(-1) as short, 32767 as short],
          [2 as short, 16384 as short],
          [(-2) as short, 16384 as short],
          [100 as short, 200 as short]
        ];
        let count: int = 10;
        for (let i: int = 0; i < count; i++) {
          let a: Short = new Short(testPairs[i][0]);
          let b: Short = new Short(testPairs[i][1]);
          let aMulB: Short = a.mul(b);
          let bMulA: Short = b.mul(a);
          expect(aMulB.equals(bMulA)).assertTrue();
          expect(aMulB.toShort()).assertEqual(bMulA.toShort());
        }
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        let one: Short = new Short(1 as short);
  
        let overflowed: Short = maxVal.add(one);
        expect(overflowed.equals(minVal)).assertTrue();
        expect(overflowed.compareTo(minVal)).assertEqual(0);
  
        let underflowed: Short = minVal.sub(one);
        expect(underflowed.equals(maxVal)).assertTrue();
        expect(underflowed.compareTo(maxVal)).assertEqual(0);
      }

      {
        let parsed: short = Short.parseInt("32767", 10);
        let parsedShort: Short = new Short(parsed);
        let maxVal: Short = new Short(Short.MAX_VALUE);
        expect(parsed).assertEqual(32767 as short);
        expect(parsedShort.equals(maxVal)).assertTrue();
        expect(parsedShort.equals(new Short(32766 as short))).assertFalse();
      }

      {
        let zero: Short = new Short(0 as short);
        let qPos: Short = new Short(7 as short).div(new Short(10 as short));
        let qNeg: Short = new Short((-7) as short).div(new Short(10 as short));
        expect(qPos.equals(zero)).assertTrue();
        expect(qNeg.equals(zero)).assertTrue();
        expect(qNeg.equals(new Short((-1) as short))).assertFalse();
      }

      {
        let parsedValue: short = Short.parseInt("0042", 10);
        let rebuilt: Short = new Short(parsedValue);
        let neighbour: Short = new Short(43 as short);
        expect(parsedValue).assertEqual(42 as short);
        expect(rebuilt.equals(new Short(42 as short))).assertTrue();
        expect(rebuilt.equals(neighbour)).assertFalse();
      }

      {
        let boxedValue: Short = new Short(7 as short);
        let notANumber: number = Double.NaN;
        let infiniteValue: number = Double.POSITIVE_INFINITY;
        expect(boxedValue.equals(notANumber)).assertFalse();
        expect(boxedValue.equals(infiniteValue)).assertFalse();
        expect(boxedValue.equals(7)).assertTrue();
      }

      {
        let source: Short = new Short(Short.MAX_VALUE);
        let widened: double = source.toDouble();
        let rebuilt: Short = new Short(Double.toShort(widened));
        let oppositeBound: Short = new Short(Short.MIN_VALUE);
        expect(widened).assertEqual(32767.0);
        expect(rebuilt.equals(source)).assertTrue();
        expect(rebuilt.equals(oppositeBound)).assertFalse();
      }

      {
        let values: int[] = [10, 20];
        let held: Short = new Short(10 as short);
        expect(values.length).assertEqual(2);
        expect(held.toInt()).assertEqual(values[0]);
        expect(held.equals(values)).assertFalse();
      }

      {
        let held: Short = new Short(25 as short);
        let failure: Error = new Error();
        let rejected: boolean = held.equals(failure);
        let accepted: boolean = held.equals(new Short(25 as short));
        expect(rejected).assertFalse();
        expect(accepted).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0500
     * @tc.name testShortEquals_merged5
     * @tc.desc ErrorException / SpecialValue / CrossTypeRoundTrip: covers 10 merged test points for Short.equals, including equality consistency, exceptions, type conversion, round-trip conversion, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dividend: Short = new Short(100 as short);
        let divisor: Short = new Short((-8) as short);
        let quotient: Short = dividend.div(divisor);
        let expectedNegative: Short = new Short((-12) as short);
        let positiveCounterpart: Short = new Short(12 as short);
        expect(quotient.equals(expectedNegative)).assertTrue();
        expect(quotient.equals(positiveCounterpart)).assertFalse();
        expect(quotient.isLessThan(new Short(0 as short))).assertTrue();
      }

      {
        let first: Short = new Short((-6) as short);
        let second: Short = new Short((-7) as short);
        let product: Short = first.mul(second);
        expect(product.toInt()).assertEqual(42);
        expect(product.equals(new Short(42 as short))).assertTrue();
        expect(product.equals(new Short((-42) as short))).assertFalse();
      }

      {
        let parsedValue: short = Short.parseInt("-42", 10);
        let parsedShort: Short = new Short(parsedValue);
        let literalShort: Short = new Short((-42) as short);
        let neighbourShort: Short = new Short((-43) as short);
  
        expect(parsedValue).assertEqual((-42) as short);
        expect(parsedShort.toInt()).assertEqual(-42);
        expect(parsedShort.equals(literalShort)).assertTrue();
        expect(parsedShort.equals(neighbourShort)).assertFalse();
      }

      {
        let allowed: Short[] = [
          new Short(200 as short), new Short(201 as short), new Short(204 as short)
        ];
        let requested: Short[] = [
          new Short(200 as short), new Short(202 as short), new Short(204 as short), new Short(201 as short)
        ];
        let granted: Short[] = [];
        for (let code of requested) {
          for (let ok of allowed) {
            if (ok.equals(code)) {
              granted.push(code);
              break;
            }
          }
        }
        expect(granted.length).assertEqual(3);
        expect(granted[1].equals(new Short(204 as short))).assertTrue();
        expect(allowed[1].equals(new Short(202 as short))).assertFalse();
      }

      {
        let boxedValue: Short = new Short(100 as short);
        let isEqual: boolean = boxedValue.equals(null);
        expect(isEqual).assertFalse();
      }

      {
        let boxedValue: Short = new Short(100 as short);
        let isEqual: boolean = boxedValue.equals(undefined);
        expect(isEqual).assertFalse();
      }

      {
        let first: Short = new Short(100 as short);
        let second: Short = new Short(110 as short);
        let firstChar: char = first.toChar();
        let secondChar: char = second.toChar();
        let firstRebuilt: Short = new Short(Char.toShort(firstChar));
        let secondRebuilt: Short = new Short(Char.toShort(secondChar));
        expect(firstRebuilt.equals(first)).assertTrue();
        expect(secondRebuilt.equals(second)).assertTrue();
        expect(firstRebuilt.equals(secondRebuilt)).assertFalse();
        expect(firstRebuilt.compareTo(secondRebuilt) < 0).assertTrue();
      }

      {
        let original: Short = new Short(65 as short);
        let charValue: char = original.toChar();
        expect(charValue).assertEqual(c'A');
        let roundtripped: Short = new Short(Char.toShort(charValue));
        let neighbour: Short = new Short(66 as short);
        expect(roundtripped.equals(original)).assertTrue();
        expect(roundtripped.equals(neighbour)).assertFalse();
      }

      {
        let serverValue: Short = new Short(5000 as short);
        let localValue: Short = new Short(5000 as short);
        let inSyncBefore: boolean = serverValue.equals(localValue);
  
        localValue = localValue.add(new Short(300 as short));
        let divergedValue: int = localValue.toInt();
        let inSyncAfterAdd: boolean = serverValue.equals(localValue);
  
        localValue = localValue.sub(new Short(300 as short));
        let rolledBackValue: int = localValue.toInt();
        let inSyncAfterRollback: boolean = serverValue.equals(localValue);
  
        expect(inSyncBefore).assertTrue();
        expect(divergedValue).assertEqual(5300);
        expect(inSyncAfterAdd).assertFalse();
        expect(rolledBackValue).assertEqual(5000);
        expect(inSyncAfterRollback).assertTrue();
      }

      {
        let source: Short = new Short(123 as short);
        let asPrimitive: short = source.toShort();
        let rebuilt: Short = new Short(asPrimitive);
        expect(asPrimitive).assertEqual(123 as short);
        expect(rebuilt.toInt()).assertEqual(123);
        expect(source.equals(rebuilt)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0600
     * @tc.name testShortEquals_merged6
     * @tc.desc CrossTypeRoundTrip / RadixConversion / Idempotent: covers 10 merged test points for Short.equals, including equality consistency, type conversion, round-trip conversion, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let positive: Short = new Short(100 as short);
        let negative: Short = new Short((-100) as short);
  
        let positiveByte: byte = positive.toByte();
        let negativeByte: byte = negative.toByte();
        expect(positiveByte).assertEqual(100 as byte);
        expect(negativeByte).assertEqual((-100) as byte);
  
        let positiveRebuilt: Short = new Short(positiveByte);
        let negativeRebuilt: Short = new Short(negativeByte);
        expect(positive.equals(positiveRebuilt)).assertTrue();
        expect(negative.equals(negativeRebuilt)).assertTrue();
        expect(positive.equals(negativeRebuilt)).assertFalse();
      }

      {
        let original: Short = new Short(200 as short);
        let widened: long = original.toLong();
        let narrowed: short = widened.toShort();
        let rebuilt: Short = new Short(narrowed);
        expect(widened).assertEqual(Long.toLong(200));
        expect(narrowed).assertEqual(200 as short);
        expect(rebuilt.equals(original)).assertTrue();
        expect(rebuilt.toInt()).assertEqual(200);
      }

      {
        let original: Short = new Short(Int.toShort(0x1234));
        let mask: Short = new Short(Int.toShort(0x00FF));
        let masked: Short = new Short(Int.toShort(original.toInt() ^ mask.toInt()));
        let restored: Short = new Short(Int.toShort(masked.toInt() ^ mask.toInt()));
        expect(restored.equals(original)).assertTrue();
        expect(masked.equals(original)).assertFalse();
        expect(restored.toInt()).assertEqual(original.toInt());
      }

      {
        let low: Short = new Short((-5) as short);
        let high: Short = new Short(5 as short);
        let lowRebuilt: Short = new Short(low.toShort());
        let highRebuilt: Short = new Short(high.toShort());
        expect(lowRebuilt.equals(highRebuilt)).assertFalse();
        expect(lowRebuilt.compareTo(highRebuilt) < 0).assertTrue();
        expect(highRebuilt.compareTo(lowRebuilt) > 0).assertTrue();
      }

      {
        let source: Short = new Short((-1234) as short);
        let widened: double = source.toDouble();
        let rebuilt: Short = new Short(Double.toShort(widened));
        expect(widened).assertEqual(-1234.0);
        expect(rebuilt.equals(source)).assertTrue();
        expect(rebuilt.equals(new Short(1234 as short))).assertFalse();
      }

      {
        let source: Short = new Short((-1500) as short);
        let widened: long = source.toLong();
        let narrowed: short = widened.toShort();
        let rebuilt: Short = new Short(narrowed);
        expect(narrowed).assertEqual((-1500) as short);
        expect(rebuilt.equals(source)).assertTrue();
        expect(rebuilt.equals(new Short(1500 as short))).assertFalse();
      }

      {
        let cache: CacheEntry[] = [];
        for (let k: int = 0; k < 20; k++) {
          cache.push(new CacheEntry(new Short(Int.toShort(k)), "val_" + k.toString()));
        }
        let lookupKey: Short = new Short(15 as short);
        let matchedIndex: int = -1;
        for (let k: int = 0; k < cache.length; k++) {
          if (cache[k].key.equals(lookupKey)) {
            matchedIndex = k;
            break;
          }
        }
        expect(matchedIndex).assertEqual(15);
        expect(cache[matchedIndex].key.toInt()).assertEqual(lookupKey.toInt());
        expect(cache[matchedIndex].value).assertEqual("val_15");
        let absentKey: Short = new Short(99 as short);
        let absentIndex: int = -1;
        for (let k: int = 0; k < cache.length; k++) {
          if (cache[k].key.equals(absentKey)) {
            absentIndex = k;
            break;
          }
        }
        expect(absentIndex).assertEqual(-1);
      }

      {
        let posVal: Short = new Short(500 as short);
        let posStr: string = posVal.toLocaleString();
        let posRound: Short = new Short(Short.parseInt(posStr, 10));
        expect(posVal.equals(posRound)).assertTrue();
  
        let negVal: Short = new Short((-250) as short);
        let negStr: string = negVal.toLocaleString();
        let negRound: Short = new Short(Short.parseInt(negStr, 10));
        expect(negVal.equals(negRound)).assertTrue();
  
        let zeroVal: Short = new Short(0 as short);
        let zeroStr: string = zeroVal.toLocaleString();
        let zeroRound: Short = new Short(Short.parseInt(zeroStr, 10));
        expect(zeroVal.equals(zeroRound)).assertTrue();
      }

      {
        let dataValues: Short[] = [
          new Short(10 as short), new Short(20 as short), new Short(30 as short)
        ];
        let computedHash: int = 0;
        for (let dv of dataValues) {
          computedHash = (computedHash * 31 + dv.toInt()) & 0xFFFF;
        }
        let expectedHash: int = 10260;
        let computedHashShort: Short = new Short(Int.toShort(computedHash));
        let expectedHashShort: Short = new Short(Int.toShort(expectedHash));
        let signatureValid: boolean = computedHashShort.equals(expectedHashShort);
        expect(signatureValid).assertTrue();
        let tamperedHashShort: Short = new Short(Int.toShort((computedHash + 1) & 0xFFFF));
        expect(computedHashShort.equals(tamperedHashShort)).assertFalse();
      }

      {
        let boxedValue: Short = new Short(30 as short);
        let isEqual: boolean = boxedValue.equals(boxedValue);
        expect(isEqual).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0700
     * @tc.name testShortEquals_merged7
     * @tc.desc Idempotent: covers 10 merged test points for Short.equals, including equality consistency, algebraic properties, zero values, comparison and ordering, and idempotence.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let leftVal: Short = new Short(55 as short);
        let rightVal: Short = new Short(55 as short);
        let firstResult: boolean = leftVal.equals(rightVal);
        let secondResult: boolean = leftVal.equals(rightVal);
        let thirdResult: boolean = leftVal.equals(rightVal);
        expect(firstResult).assertTrue();
        expect(secondResult).assertTrue();
        expect(thirdResult).assertTrue();
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }

      {
        let a: Short = new Short(77 as short);
        let b: Short = new Short(77 as short);
        let c: Short = new Short(66 as short);
  
        let aEqualsB: boolean = a.equals(b);
        let bEqualsA: boolean = b.equals(a);
        let aEqualsC: boolean = a.equals(c);
        let cEqualsA: boolean = c.equals(a);
  
        expect(aEqualsB).assertTrue();
        expect(bEqualsA).assertTrue();
        expect(aEqualsB).assertEqual(bEqualsA);
        expect(aEqualsC).assertFalse();
        expect(cEqualsA).assertFalse();
        expect(aEqualsC).assertEqual(cEqualsA);
      }

      {
        let a: Short = new Short(15 as short);
        let b: Short = new Short(15 as short);
        let c: Short = new Short(99 as short);
        let aEqualsB: boolean = a.equals(b);
        let bEqualsC: boolean = b.equals(c);
        let aEqualsC: boolean = a.equals(c);
        expect(aEqualsB).assertTrue();
        expect(bEqualsC).assertFalse();
        expect(aEqualsC).assertFalse();
      }

      {
        let equalPairLeft: Short = new Short(16384 as short);
        let equalPairRight: Short = new Short(16384 as short);
        let unequalPairRight: Short = new Short(-16384 as short);
  
        let equalPairEquals: boolean = equalPairLeft.equals(equalPairRight);
        let equalPairCompareToZero: boolean = equalPairLeft.compareTo(equalPairRight) === 0;
        let unequalPairEquals: boolean = equalPairLeft.equals(unequalPairRight);
        let unequalPairCompareToZero: boolean = equalPairLeft.compareTo(unequalPairRight) === 0;
  
        expect(equalPairEquals).assertEqual(equalPairCompareToZero);
        expect(unequalPairEquals).assertEqual(unequalPairCompareToZero);
      }

      {
        let pairs: [short, short][] = [
          [30 as short, 40 as short],
          [(-10) as short, 25 as short],
          [(-15) as short, (-35) as short],
          [0 as short, 500 as short]
        ];
        let pairCount: int = 4;
        for (let i: int = 0; i < pairCount; i++) {
          let a: Short = new Short(pairs[i][0]);
          let b: Short = new Short(pairs[i][1]);
          let leftSum: Short = a.add(b);
          let rightSum: Short = b.add(a);
          expect(leftSum.equals(rightSum)).assertTrue();
          expect(leftSum.toInt()).assertEqual(rightSum.toInt());
        }
      }

      {
        let operand: Short = new Short(400 as short);
        let beforeInt: int = operand.toInt();
        let derived: Short = operand.add(new Short(100 as short));
        let afterInt: int = operand.toInt();
        expect(derived.equals(new Short(500 as short))).assertTrue();
        expect(beforeInt).assertEqual(400);
        expect(afterInt).assertEqual(beforeInt);
      }

      {
        let allReflexive: boolean = true;
        for (let v: int = Short.MIN_VALUE; v <= Short.MAX_VALUE; v++) {
          let s: Short = new Short(Int.toShort(v));
          if (!s.equals(s)) {
            allReflexive = false;
            break;
          }
        }
        expect(allReflexive).assertTrue();
      }

      {
        let seed: int = 12345;
        let allSymmetric: boolean = true;
        for (let k: int = 0; k < 10000; k++) {
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let a_val: int = (seed % 65536) - 32768;
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let b_val: int = (seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(a_val));
          let b: Short = new Short(Int.toShort(b_val));
          let ab: boolean = a.equals(b);
          let ba: boolean = b.equals(a);
          if (ab !== ba) {
            allSymmetric = false;
            break;
          }
        }
        expect(allSymmetric).assertTrue();
      }

      {
        let seed: int = 54321;
        let allTransitive: boolean = true;
        for (let k: int = 0; k < 5000; k++) {
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let va: int = ((seed * 7) % 65536) - 32768;
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let vb: int = ((seed * 7) % 65536) - 32768;
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let vc: int = ((seed * 7) % 65536) - 32768;
          let a: Short = new Short(Int.toShort(va));
          let b: Short = new Short(Int.toShort(vb));
          let c: Short = new Short(Int.toShort(vc));
          let aEqB: boolean = a.equals(b);
          let bEqC: boolean = b.equals(c);
          let aEqC: boolean = a.equals(c);
          if (aEqB && bEqC && !aEqC) {
            allTransitive = false;
            break;
          }
        }
        expect(allTransitive).assertTrue();
      }

      {
        let seed: int = 98765;
        let allConsistent: boolean = true;
        for (let k: int = 0; k < 10000; k++) {
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let a_val: int = (seed % 65536) - 32768;
          seed = ((seed * 1103515245 + 12345) & 0x7FFFFFFF) as int;
          let b_val: int = (seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(a_val));
          let b: Short = new Short(Int.toShort(b_val));
          let eqResult: boolean = a.equals(b);
          let cmpResult: boolean = a.compareTo(b) === 0;
          if (eqResult !== cmpResult) {
            allConsistent = false;
            break;
          }
        }
        expect(allConsistent).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0800
     * @tc.name testShortEquals_merged8
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.equals, including equality consistency, comparison and ordering, algebraic properties, boundary values, and idempotence.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        let zeroVal: Short = new Short(0 as short);
        expect(maxVal.equals(maxVal)).assertTrue();
        expect(maxVal.compareTo(maxVal)).assertEqual(0);
        expect(minVal.equals(minVal)).assertTrue();
        expect(minVal.compareTo(minVal)).assertEqual(0);
        expect(zeroVal.equals(zeroVal)).assertTrue();
        expect(zeroVal.compareTo(zeroVal)).assertEqual(0);
        expect(maxVal.equals(minVal)).assertFalse();
        expect(maxVal.compareTo(minVal) > 0).assertTrue();
      }

      {
        let a: Short = new Short(3 as short);
        let b: Short = new Short(10 as short);
        let c: Short = new Short(5 as short);
        let leftSide: Short = a.mul(b.add(c));
        let rightSide: Short = a.mul(b).add(a.mul(c));
        expect(leftSide.equals(rightSide)).assertTrue();
        expect(leftSide.toInt()).assertEqual(45);
        expect(rightSide.toInt()).assertEqual(45);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let c: Short = new Short(300 as short);
        let groupedLeft: Short = a.add(b).add(c);
        let groupedRight: Short = a.add(b.add(c));
        expect(groupedLeft.equals(groupedRight)).assertTrue();
        expect(groupedLeft.toShort()).assertEqual(600 as short);
        expect(groupedRight.toShort()).assertEqual(600 as short);
      }

      {
        let sequence: Short[] = [
          new Short(3 as short), new Short(8 as short), new Short(3 as short), new Short(3 as short)
        ];
        let target: Short = new Short(3 as short);
        let firstIndex: int = -1;
        let lastIndex: int = -1;
        for (let i: int = 0; i < sequence.length; i++) {
          if (sequence[i].equals(target)) {
            if (firstIndex < 0) {
              firstIndex = i;
            }
            lastIndex = i;
          }
        }
        expect(firstIndex).assertEqual(0);
        expect(lastIndex).assertEqual(3);
        expect(lastIndex - firstIndex).assertEqual(3);
      }

      {
        let a: Short = new Short(500 as short);
        let b: Short = new Short(500 as short);
        let negA: Short = new Short(Int.toShort(-a.toInt()));
        let negB: Short = new Short(Int.toShort(-b.toInt()));
        expect(a.equals(b)).assertTrue();
        expect(negA.equals(negB)).assertTrue();
      }

      {
        let leftValue: Short = new Short(42 as short);
        let rightValue: Short = new Short(42 as short);
        let isEqual: boolean = leftValue.equals(rightValue);
        expect(isEqual).assertTrue();
      }

      {
        let leftValue: Short = new Short(10 as short);
        let rightValue: Short = new Short(20 as short);
        let isEqual: boolean = leftValue.equals(rightValue);
        expect(isEqual).assertFalse();
      }

      {
        let boxedValue: Short = new Short(42 as short);
        let sameNumberArgument: number = 42;
        let isEqual1: boolean = boxedValue.equals(sameNumberArgument);
        expect(isEqual1).assertTrue();
  
        let differentNumberArgument: number = 43;
        let isEqual2: boolean = boxedValue.equals(differentNumberArgument);
        expect(isEqual2).assertFalse();
      }

      {
        let boxedValue: Short = new Short(99 as short);
        let stringArgument: string = '99';
        let isEqual: boolean = boxedValue.equals(stringArgument);
        expect(isEqual).assertFalse();
      }

      {
        let boxedValue: Short = new Short(1 as short);
        let booleanArgument: boolean = true;
        let isEqual: boolean = boxedValue.equals(booleanArgument);
        expect(isEqual).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0900
     * @tc.name testShortEquals_merged9
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.equals, including equality consistency, comparison and ordering, containers and references, bitwise operations, and byte structure.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let shortVal: Short = new Short(100 as short);
        let intVal: int = 100;
        let longVal: long = Long.toLong(100);
        let byteVal: byte = 100 as byte;
        let floatVal: float = 100.0f;
        let doubleVal: double = 100.0;
  
        expect(shortVal.equals(intVal)).assertTrue();
        expect(shortVal.equals(longVal)).assertTrue();
        expect(shortVal.equals(byteVal)).assertTrue();
        expect(shortVal.equals(floatVal)).assertTrue();
        expect(shortVal.equals(doubleVal)).assertTrue();
      }

      {
        let shortVal: Short = new Short(10 as short);
        let largeInt: int = 10000;
        let largeLong: long = Long.toLong(50000);
        let fracFloat: float = 10.5f;
        let fracDouble: double = 20.1;
  
        expect(shortVal.equals(largeInt)).assertFalse();
        expect(shortVal.equals(largeLong)).assertFalse();
        expect(shortVal.equals(fracFloat)).assertFalse();
        expect(shortVal.equals(fracDouble)).assertFalse();
      }

      {
        let caller: Short = new Short(75 as short);
        let arg: Short = new Short(75 as short);
        let callerBefore: short = caller.toShort();
        let argBefore: short = arg.toShort();
        let result: boolean = caller.equals(arg);
        let callerAfter: short = caller.toShort();
        let argAfter: short = arg.toShort();
        expect(result).assertTrue();
        expect(callerBefore).assertEqual(75 as short);
        expect(callerAfter).assertEqual(75 as short);
        expect(argBefore).assertEqual(75 as short);
        expect(argAfter).assertEqual(75 as short);
        expect(callerAfter).assertEqual(callerBefore);
        expect(argAfter).assertEqual(argBefore);
      }

      {
        let outerKey: Short = new Short(64 as short);
        let innerKey: Short = new Short(32 as short);
        let selectedCode: int = 0;
        if (outerKey.equals(new Short(64 as short))) {
          if (innerKey.equals(new Short(32 as short))) {
            selectedCode = 1;
          } else {
            selectedCode = 2;
          }
        } else {
          selectedCode = 3;
        }
        expect(selectedCode).assertEqual(1);
        expect(outerKey.equals(innerKey)).assertFalse();
      }

      {
        let base: Short = new Short(40 as short);
        let sameA: Short = new Short(40 as short);
        let sameB: Short = new Short(40 as short);
        let other: Short = new Short(41 as short);
        let allEqual: boolean = base.equals(sameA) && sameA.equals(sameB) && base.equals(sameB);
        let anyEqual: boolean = base.equals(other) || base.equals(sameA);
        let mixedAnd: boolean = base.equals(sameA) && base.equals(other);
        let mixedOr: boolean = base.equals(other) || base.equals(sameB);
        expect(allEqual).assertTrue();
        expect(anyEqual).assertTrue();
        expect(mixedAnd).assertFalse();
        expect(mixedOr).assertTrue();
      }

      {
        let grid: Short[][] = [
          [new Short(1 as short), new Short(2 as short)],
          [new Short(3 as short), new Short(4 as short)]
        ];
        let mismatches: int = 0;
        for (let row: int = 0; row < grid.length; row++) {
          for (let col: int = 0; col < grid[row].length; col++) {
            if (!grid[row][col].equals(new Short(Int.toShort(row * 2 + col + 1)))) {
              mismatches++;
            }
          }
        }
        expect(mismatches).assertEqual(0);
        expect(grid[1][0].equals(new Short(3 as short))).assertTrue();
      }

      {
        let values: Short[] = [
          new Short(3 as short), new Short(3 as short), new Short(5 as short), new Short(3 as short)
        ];
        let rawTotal: int = 0;
        let uniqueTotal: int = 0;
        let seen: Short[] = [];
        for (let v of values) {
          rawTotal += v.toInt();
          let known: boolean = false;
          for (let s of seen) {
            if (s.equals(v)) {
              known = true;
              break;
            }
          }
          if (!known) {
            seen.push(v);
            uniqueTotal += v.toInt();
          }
        }
        let uniqueShort: Short = new Short(Int.toShort(uniqueTotal));
        expect(seen.length).assertEqual(2);
        expect(uniqueShort.equals(new Short(8 as short))).assertTrue();
        expect(uniqueShort.equals(new Short(Int.toShort(rawTotal)))).assertFalse();
      }

      {
        let packed: Short = new Short(Int.toShort(0x0102));
        let lowFlag: Short = new Short(Int.toShort(packed.toInt() & 0x00FF));
        let highFlag: Short = new Short(Int.toShort((packed.toInt() >> 8) & 0x00FF));
        expect(lowFlag.equals(new Short(2 as short))).assertTrue();
        expect(highFlag.equals(new Short(1 as short))).assertTrue();
        expect(lowFlag.equals(highFlag)).assertFalse();
      }

      {
        let sorted: Short[] = [
          new Short(10 as short), new Short(20 as short), new Short(30 as short)
        ];
        let incoming: Short = new Short(25 as short);
        let insertAt: int = sorted.length;
        for (let i: int = 0; i < sorted.length; i++) {
          if (sorted[i].equals(incoming)) {
            insertAt = i;
            break;
          }
          if (sorted[i].isGreaterThan(incoming)) {
            insertAt = i;
            break;
          }
        }
        expect(insertAt).assertEqual(2);
        expect(sorted[0].equals(incoming)).assertFalse();
        expect(sorted[2].isGreaterThan(incoming)).assertTrue();
      }

      {
        let zeroShort: Short = new Short(0 as short);
        let negZeroShort: Short = new Short((-0) as short);
        let isEqual: boolean = zeroShort.equals(negZeroShort);
        expect(isEqual).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1000
     * @tc.name testShortEquals_merged10
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.equals, including equality consistency, loop accumulation, bitwise operations, sign handling, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let first: Short = new Short(6 as short);
        let second: Short = new Short(7 as short);
        let factor: Short = new Short(5 as short);
        let groupedLeft: Short = first.add(second).mul(factor);
        let groupedRight: Short = first.add(second.mul(factor));
        expect(groupedLeft.equals(new Short(65 as short))).assertTrue();
        expect(groupedRight.equals(new Short(41 as short))).assertTrue();
        expect(groupedLeft.equals(groupedRight)).assertFalse();
      }

      {
        let value: Short = new Short(1234 as short);
        let once: Short = new Short(Int.toShort(-value.toInt()));
        let twice: Short = new Short(Int.toShort(-once.toInt()));
        expect(once.equals(new Short((-1234) as short))).assertTrue();
        expect(twice.equals(value)).assertTrue();
        expect(once.equals(value)).assertFalse();
      }

      {
        let pending: Short = new Short(0 as short);
        let running: Short = new Short(1 as short);
        let done: Short = new Short(2 as short);
        let current: Short = pending;
        let transitions: int = 0;
        current = running;
        transitions++;
        current = done;
        transitions++;
        expect(transitions).assertEqual(2);
        expect(current.equals(done)).assertTrue();
        expect(current.equals(pending)).assertFalse();
        expect(current.equals(running)).assertFalse();
      }

      {
        let CMD_OPEN: Short = new Short(0x01 as short);
        let CMD_CLOSE: Short = new Short(0x02 as short);
        let CMD_READ: Short = new Short(0x03 as short);
        let receivedCommand: Short = new Short(0x02 as short);
        let selected: string = "unset";
        let matchedCount: int = 0;
        if (receivedCommand.equals(CMD_OPEN)) {
          selected = "open";
          matchedCount++;
        } else if (receivedCommand.equals(CMD_CLOSE)) {
          selected = "close";
          matchedCount++;
        } else if (receivedCommand.equals(CMD_READ)) {
          selected = "read";
          matchedCount++;
        } else {
          selected = "unknown";
        }
        expect(selected).assertEqual("close");
        expect(matchedCount).assertEqual(1);
        let unknownCommand: Short = new Short(0x7F as short);
        let unknownSelected: string = "unset";
        if (unknownCommand.equals(CMD_OPEN)) {
          unknownSelected = "open";
        } else if (unknownCommand.equals(CMD_CLOSE)) {
          unknownSelected = "close";
        } else if (unknownCommand.equals(CMD_READ)) {
          unknownSelected = "read";
        } else {
          unknownSelected = "unknown";
        }
        expect(unknownSelected).assertEqual("unknown");
      }

      {
        let pattern: Short[] = [
          new Short(2 as short), new Short(4 as short), new Short(6 as short), new Short(8 as short)
        ];
        let sample: Short[] = [
          new Short(2 as short), new Short(4 as short), new Short(6 as short), new Short(1 as short)
        ];
        let commonPrefix: int = 0;
        while (commonPrefix < pattern.length && pattern[commonPrefix].equals(sample[commonPrefix])) {
          commonPrefix++;
        }
        expect(commonPrefix).assertEqual(3);
        expect(pattern[3].equals(sample[3])).assertFalse();
      }

      {
        let processedIds: Short[] = [
          new Short(1001 as short), new Short(2002 as short), new Short(3003 as short)
        ];
        let retransmission: Short = new Short(2002 as short);
        let isDuplicate: boolean = false;
        for (let id of processedIds) {
          if (id.equals(retransmission)) {
            isDuplicate = true;
            break;
          }
        }
        expect(isDuplicate).assertTrue();
        let freshTxn: Short = new Short(4004 as short);
        let isFreshDuplicate: boolean = false;
        for (let id of processedIds) {
          if (id.equals(freshTxn)) {
            isFreshDuplicate = true;
            break;
          }
        }
        expect(isFreshDuplicate).assertFalse();
        processedIds.push(freshTxn);
        let isRepeatDuplicate: boolean = false;
        for (let id of processedIds) {
          if (id.equals(freshTxn)) {
            isRepeatDuplicate = true;
            break;
          }
        }
        expect(isRepeatDuplicate).assertTrue();
      }

      {
        let a: Short = new Short(Int.toShort(0x00FF));
        let b: Short = new Short(Int.toShort(0x0F0F));
        let c: Short = new Short(Int.toShort(0x0FFF));
        let combined: Short = new Short(Int.toShort(a.toInt() ^ (b.toInt() & c.toInt())));
        expect(combined.equals(new Short(Int.toShort(0x0FF0)))).assertTrue();
        expect(combined.equals(a)).assertFalse();
        expect(combined.equals(b)).assertFalse();
      }

      {
        let original: Short[] = [
          new Short(1 as short), new Short(2 as short), new Short(3 as short)
        ];
        let rotated: Short[] = [
          new Short(3 as short), new Short(1 as short), new Short(2 as short)
        ];
        let shift: int = 1;
        let rotations: int = 0;
        for (let i: int = 0; i < original.length; i++) {
          if (original[i].equals(rotated[(i + shift) % original.length])) {
            rotations++;
          }
        }
        expect(rotations).assertEqual(3);
        expect(original[0].equals(rotated[0])).assertFalse();
      }

      {
        let source: Short = new Short(250 as short);
  
        let viaFloat: Short = new Short(Double.toShort(source.toFloat()));
        let viaDouble: Short = new Short(Double.toShort(source.toDouble()));
        expect(viaFloat.equals(viaDouble)).assertTrue();
        expect(viaFloat.equals(source)).assertTrue();
        expect(viaFloat.toInt()).assertEqual(250);
  
        let negative: Short = new Short((-300) as short);
        let negViaFloat: Short = new Short(Double.toShort(negative.toFloat()));
        expect(negative.equals(negViaFloat)).assertTrue();
        expect(negViaFloat.toInt()).assertEqual(-300);
        expect(negViaFloat.equals(source)).assertFalse();
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(100 as short);
        expect(a.equals(b)).assertTrue();
        expect(a.isLessThan(b)).assertFalse();
        expect(a.isLessEqualThan(b)).assertTrue();
        expect(a.isGreaterThan(b)).assertFalse();
        expect(a.isGreaterEqualThan(b)).assertTrue();
  
        let c: Short = new Short(200 as short);
        let dEquals: boolean = a.equals(c);
        let dLess: boolean = a.isLessThan(c);
        let dLessEq: boolean = a.isLessEqualThan(c);
        let dGreater: boolean = a.isGreaterThan(c);
        let dGreaterEq: boolean = a.isGreaterEqualThan(c);
        expect(dEquals).assertFalse();
        expect(dLess).assertTrue();
        expect(dLessEq).assertTrue();
        expect(dGreater).assertFalse();
        expect(dGreaterEq).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1100
     * @tc.name testShortEquals_merged11
     * @tc.desc SortCompare / BusinessScenario / Other: covers 10 merged test points for Short.equals, including equality consistency, containers and references, business scenarios, loop accumulation, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let baseline: Short[] = [
          new Short(1 as short), new Short(2 as short), new Short(3 as short)
        ];
        let reordered: Short[] = [
          new Short(3 as short), new Short(1 as short), new Short(2 as short)
        ];
        let matchedValues: int = 0;
        for (let item of reordered) {
          for (let base of baseline) {
            if (item.equals(base)) {
              matchedValues++;
              break;
            }
          }
        }
        expect(matchedValues).assertEqual(3);
        expect(matchedValues).assertEqual(baseline.length);
        expect(baseline[0].equals(reordered[0])).assertFalse();
      }

      {
        let dataset: Short[] = [
          new Short(0 as short), new Short(1 as short), new Short(0 as short),
          new Short(-1 as short), new Short(1 as short), new Short(0 as short),
          new Short(32767 as short), new Short(-32768 as short)
        ];
  
        let uniqueKeys: Short[] = [];
        let freqCounts: int[] = [];
        for (let v of dataset) {
          let foundIdx: int = -1;
          for (let i: int = 0; i < uniqueKeys.length; i++) {
            if (v.equals(uniqueKeys[i])) {
              foundIdx = i;
              break;
            }
          }
          if (foundIdx >= 0) {
            freqCounts[foundIdx]++;
          } else {
            uniqueKeys.push(v);
            freqCounts.push(1);
          }
        }
        expect(uniqueKeys.length).assertEqual(5);
  
        let frequency: Map<int, int> = new Map<int, int>();
        for (let i: int = 0; i < uniqueKeys.length; i++) {
          frequency.set(uniqueKeys[i].toInt(), freqCounts[i]);
        }
        expect(frequency.get(0)).assertEqual(3);
        expect(frequency.get(1)).assertEqual(2);
        expect(frequency.get(-1)).assertEqual(1);
        expect(frequency.get(32767)).assertEqual(1);
        expect(frequency.get(-32768)).assertEqual(1);
      }

      {
        let data: Short[] = [
          new Short(4 as short), new Short(4 as short), new Short(7 as short),
          new Short(4 as short), new Short(9 as short), new Short(9 as short)
        ];
        let mode: Short = data[0];
        let bestCount: int = 0;
        for (let candidate of data) {
          let count: int = 0;
          for (let other of data) {
            if (candidate.equals(other)) {
              count++;
            }
          }
          if (count > bestCount) {
            bestCount = count;
            mode = candidate;
          }
        }
        expect(mode.equals(new Short(4 as short))).assertTrue();
        expect(bestCount).assertEqual(3);
        expect(mode.equals(new Short(9 as short))).assertFalse();
      }

      {
        let data: Short[] = [
          new Short(5 as short), new Short(12 as short), new Short(5 as short),
          new Short(8 as short), new Short(12 as short), new Short(5 as short)
        ];
        let target: Short = new Short(5 as short);
        let matched: Short[] = [];
        let unmatched: Short[] = [];
        for (let item of data) {
          if (item.equals(target)) {
            matched.push(item);
          } else {
            unmatched.push(item);
          }
        }
        expect(matched.length).assertEqual(3);
        expect(unmatched.length).assertEqual(3);
      }

      {
        let generatedIds: Short[] = [];
        let collisions: int = 0;
        for (let k: int = 0; k < 500; k++) {
          let newId: Short = new Short(Int.toShort((k * 131 + 47) % 200));
          let collisionFound: boolean = false;
          for (let id of generatedIds) {
            if (id.equals(newId)) {
              collisionFound = true;
              break;
            }
          }
          if (collisionFound) {
            collisions++;
          } else {
            generatedIds.push(newId);
          }
        }
        expect(generatedIds.length).assertEqual(200);
        expect(collisions).assertEqual(300);
      }

      {
        let originalValues: Short[] = [
          new Short(0 as short), new Short(127 as short), new Short((-128) as short),
          new Short(32767 as short), new Short((-32768) as short)
        ];
        let migratedViaInt: Short[] = [];
        for (let v of originalValues) {
          migratedViaInt.push(new Short(Int.toShort(v.toInt())));
        }
        for (let i: int = 0; i < originalValues.length; i++) {
          expect(originalValues[i].equals(migratedViaInt[i])).assertTrue();
        }
        let migratedViaString: Short[] = [];
        for (let v of originalValues) {
          let parsed: short = Short.parseInt(v.toString(), 10);
          migratedViaString.push(new Short(parsed));
        }
        for (let i: int = 0; i < originalValues.length; i++) {
          expect(originalValues[i].equals(migratedViaString[i])).assertTrue();
        }
      }

      {
        let sequence: Short[] = [
          new Short(5 as short), new Short(9 as short), new Short(5 as short)
        ];
        let lastIndex: int = sequence.length - 1;
        let mirroredEqual: boolean = true;
        for (let i: int = 0; i <= lastIndex - i; i++) {
          if (!sequence[i].equals(sequence[lastIndex - i])) {
            mirroredEqual = false;
            break;
          }
        }
        expect(mirroredEqual).assertTrue();
        expect(sequence[0].equals(sequence[1])).assertFalse();
      }

      {
        let addResult: Short = new Short(10 as short).add(new Short(5 as short));
        expect(addResult.equals(new Short(15 as short))).assertTrue();
  
        let subResult: Short = new Short(20 as short).sub(new Short(8 as short));
        expect(subResult.equals(new Short(12 as short))).assertTrue();
  
        let mulResult: Short = new Short(7 as short).mul(new Short(6 as short));
        expect(mulResult.equals(new Short(42 as short))).assertTrue();
  
        let divResult: Short = new Short(100 as short).div(new Short(4 as short));
        expect(divResult.equals(new Short(25 as short))).assertTrue();
      }

      {
        let viaAdd: Short = new Short(12 as short).add(new Short(8 as short));
        let viaSub: Short = new Short(30 as short).sub(new Short(10 as short));
        let viaMul: Short = new Short(4 as short).mul(new Short(5 as short));
        let viaDiv: Short = new Short(80 as short).div(new Short(4 as short));
        expect(viaAdd.equals(viaSub)).assertTrue();
        expect(viaSub.equals(viaMul)).assertTrue();
        expect(viaMul.equals(viaDiv)).assertTrue();
        expect(viaAdd.equals(viaDiv)).assertTrue();
        expect(viaAdd.toInt()).assertEqual(20);
      }

      {
        let snapshot: Short[] = [
          new Short(100 as short), new Short(200 as short), new Short(300 as short)
        ];
  
        let current: Short[] = [
          new Short(100 as short), new Short(250 as short), new Short(300 as short)
        ];
  
        let changedIndices: int[] = [];
        for (let i: int = 0; i < snapshot.length; i++) {
          if (!snapshot[i].equals(current[i])) {
            changedIndices.push(i);
          }
        }
  
        expect(changedIndices.length).assertEqual(1);
        expect(changedIndices[0]).assertEqual(1);
  
        expect(current[changedIndices[0]].toInt()).assertEqual(250);
        expect(current[1].toFloat() > snapshot[1].toFloat()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1200
     * @tc.name testShortEquals_merged12
     * @tc.desc Other: covers 1 merged test points for Short.equals, including equality consistency and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let store: Short[] = [new Short(1 as short), new Short(2 as short)];
        let incoming: Short = new Short(2 as short);
        let updated: boolean = false;
        for (let i: int = 0; i < store.length; i++) {
          if (store[i].equals(incoming)) {
            store[i] = new Short(9 as short);
            updated = true;
            break;
          }
        }
        expect(updated).assertTrue();
        expect(store[1].equals(new Short(9 as short))).assertTrue();
        expect(store[0].equals(new Short(1 as short))).assertTrue();
        expect(store[1].equals(incoming)).assertFalse();
      }
    });

  });
}