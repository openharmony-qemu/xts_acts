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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';


class TypeAliasBox {
  val: bigint = BigInt(0);
}

class Calc {
  add(a: bigint, b: bigint): bigint {
    return a.operatorAdd(b);
  }
}

class Factory {
  make(n: int): bigint {
    return BigInt(n);
  }
}

class Wrapper {
  val: bigint;
  constructor(v: bigint) {
    this.val = v;
  }
}

class Parent {
  p: bigint = BigInt(1);
}

class Child extends Parent {
  c: bigint = BigInt(2);
}

class WithGetSet {
  private _v: bigint = BigInt(0);
  get v(): bigint {
    return this._v;
  }
  set v(val: bigint) {
    this._v = val;
  }
}

class Holder {
  v: bigint;
  constructor(val: bigint) {
    this.v = val;
  }
}

interface HasValue {
  val: bigint;
}

interface Operator {
  exec(a: bigint, b: bigint): bigint;
}

type MyBig = bigint;
type ValType = bigint | string;

function fnParam(p: bigint): string {
  return p.toString();
}

function fnReturn(): bigint {
  return BigInt(777);
}

function defaultFn(v: bigint = BigInt(10)): string {
  return v.toString();
}

function sumTwo(a: bigint, b: bigint): bigint {
  return a.operatorAdd(b);
}

function higher(fn: (v: bigint) => string, v: bigint): string {
  return fn(v);
}

function calcFn(): bigint {
  let r: bigint = BigInt(0);
  r = r.operatorAdd(5n);
  r = r.operatorMultiply(3n);
  return r;
}

function sumArr(arr: bigint[]): bigint {
  let s: bigint = BigInt(0);
  for (const v of arr) {
    s = s.operatorAdd(v);
  }
  return s;
}

function fnBigIntParam(p: BigInt): string {
  return p.toString();
}

function fnReturnBigInt(): BigInt {
  const r: bigint = BigInt(100);
  return r;
}

export default function BigIntTypeAliasTest_2(): void {
  describe('BigIntTypeAliasTest_2', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0001
     * @tc.name testBigIntTypeAliasDoubleAssign0001
     * @tc.desc const bigint = BigInt(double) and BigInt(long min / int min)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasDoubleAssign0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromDouble: bigint = BigInt(100.0);
      expect(fromDouble.toString()).assertEqual('100');
      const fromSci: bigint = BigInt(1e10);
      expect(fromSci.toString()).assertEqual('10000000000');
      const fromIntMin: bigint = BigInt(-2147483648);
      expect(fromIntMin.toString()).assertEqual('-2147483648');
      const fromLongMin: bigint = BigInt(-9223372036854775808);
      expect(fromLongMin.toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0002
     * @tc.name testBigIntTypeAliasReassignDiffType0002
     * @tc.desc let bigint reassign with different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasReassignDiffType0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v: bigint = BigInt(100);
      expect(v.toString()).assertEqual('100');
      v = BigInt('999');
      expect(v.toString()).assertEqual('999');
      v = BigInt(true);
      expect(v.toString()).assertEqual('1');
      v = BigInt(0);
      expect(v.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0003
     * @tc.name testBigIntTypeAliasMultiDeclare0003
     * @tc.desc multiple bigint declarations and direct assign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasMultiDeclare0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: bigint = BigInt(1);
      const b: bigint = BigInt(2);
      const c: bigint = BigInt(3);

      expect(a.toString()).assertEqual('1');
      expect(b.toString()).assertEqual('2');
      expect(c.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0004
     * @tc.name testBigIntTypeAliasMixedWithBigInt0004
     * @tc.desc bigint mixed with BigInt variable in expression and direct assign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasMixedWithBigInt0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: bigint = BigInt(10);
      const B: BigInt = BigInt(20);
      const r: bigint = b.operatorAdd(B);
      expect(r.toString()).assertEqual('30');
      const src: bigint = BigInt(777);
      const dest: bigint = src;
      expect(dest.toString()).assertEqual('777');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0005
     * @tc.name testBigIntTypeAliasConstructorStr0005
     * @tc.desc bigint from string with + sign, leading zero, large copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasConstructorStr0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromSignedStr: bigint = BigInt('+12345');
      expect(fromSignedStr.toString()).assertEqual('12345');
      const fromLeadingZero: bigint = BigInt('007');
      expect(fromLeadingZero.toString()).assertEqual('7');
      const src: BigInt = new BigInt('18446744073709551615');
      const copyLarge: bigint = BigInt(src);
      expect(copyLarge.toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0006
     * @tc.name testBigIntTypeAliasToStringRadix0006
     * @tc.desc bigint.toString with radix parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasToStringRadix0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: bigint = BigInt(255);
      expect(v.toString(16)).assertEqual('ff');
      expect(v.toString(2)).assertEqual('11111111');
      expect(v.toString(8)).assertEqual('377');
      const d: bigint = BigInt(100);
      expect(d.toString()).assertEqual('100');
      const neg: bigint = BigInt(-123);
      expect(neg.toString()).assertEqual('-123');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0007
     * @tc.name testBigIntTypeAliasValueOfEdge0007
     * @tc.desc bigint.valueOf with zero, negative and chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasValueOfEdge0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: bigint = BigInt(999);
      const r: bigint = v.valueOf();
      expect(v.equals(r)).assertTrue();
      const zero: bigint = BigInt(0);
      const zr: bigint = zero.valueOf();
      expect(zr.toString()).assertEqual('0');
      const neg: bigint = BigInt(-999);
      const nr: bigint = neg.valueOf();
      expect(nr.toString()).assertEqual('-999');
      const v50: bigint = BigInt(50);
      const chain: bigint = v50.valueOf().operatorAdd(50n);
      expect(chain.toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0008
     * @tc.name testBigIntTypeAliasEqualsFull0008
     * @tc.desc bigint.equals with various scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasEqualsFull0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: bigint = BigInt(100);
      const b: bigint = BigInt(200);
      expect(a.equals(b)).assertFalse();
      const v: bigint = BigInt(42);
      expect(v.equals(v)).assertTrue();
      expect(v.equals(0n)).assertFalse();
      const zv: bigint = BigInt(0);
      expect(zv.equals(0n)).assertTrue();
      const big: bigint = BigInt('9007199254740993');
      const bigB: BigInt = BigInt('9007199254740993');
      expect(big.equals(bigB)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0009
     * @tc.name testBigIntTypeAliasToLocaleString0009
     * @tc.desc bigint.toLocaleString with locales and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasToLocaleString0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1: bigint = BigInt(12345);
      const s1: string = v1.toLocaleString();
      expect(s1.length > 0).assertTrue();
      const v2: bigint = BigInt(1000000);
      const s2: string = v2.toLocaleString('en-US', { useGrouping: true });
      expect(s2.length >= '1000000'.length).assertTrue();
      const zero: bigint = BigInt(0);
      const s3: string = zero.toLocaleString('en-US', { minimumIntegerDigits: 3 });
      expect(s3).assertEqual('000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0010
     * @tc.name testBigIntTypeAliasArithmeticFull0010
     * @tc.desc bigint arithmetic: subtract, multiply, divide, modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasArithmeticFull0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a100: bigint = BigInt(100);
      const a55: bigint = BigInt(55);
      const sub: bigint = a100.operatorSubtract(a55);
      expect(sub.toString()).assertEqual('45');
      const a6: bigint = BigInt(6);
      const a7: bigint = BigInt(7);
      const mul: bigint = a6.operatorMultiply(a7);
      expect(mul.toString()).assertEqual('42');
      const a3: bigint = BigInt(3);
      const div: bigint = a100.operatorDivide(a3);
      expect(div.toString()).assertEqual('33');
      const a30: bigint = BigInt(30);
      const mod: bigint = a100.operatorModule(a30);
      expect(mod.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0011
     * @tc.name testBigIntTypeAliasArithmeticEdge0011
     * @tc.desc bigint arithmetic edge: subtract negative, add negatives, mul zero, div one, immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasArithmeticEdge0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v10: bigint = BigInt(10);
      const negRes: bigint = v10.operatorSubtract(100n);
      expect(negRes.toString()).assertEqual('-90');
      const negA: bigint = BigInt(-50);
      const negB: bigint = BigInt(-30);
      const negAdd: bigint = negA.operatorAdd(negB);
      expect(negAdd.toString()).assertEqual('-80');
      const big: bigint = BigInt(999);
      const zeroV: bigint = BigInt(0);
      const mulZero: bigint = big.operatorMultiply(zeroV);
      expect(mulZero.toString()).assertEqual('0');
      const vBig: bigint = BigInt(123456);
      const one: bigint = BigInt(1);
      const divOne: bigint = vBig.operatorDivide(one);
      expect(divOne.toString()).assertEqual('123456');
      const a: bigint = BigInt(10);
      const bb: bigint = BigInt(20);
      a.operatorAdd(bb);
      expect(a.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0012
     * @tc.name testBigIntTypeAliasBigArith0012
     * @tc.desc bigint arithmetic with large numbers beyond long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasBigArith0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bigA: bigint = BigInt('9007199254740993');
      const bigB: bigint = BigInt('9007199254740993');
      const bigAdd: bigint = bigA.operatorAdd(bigB);
      expect(bigAdd.toString()).assertEqual('18014398509481986');
      const va: bigint = BigInt('123456789012345678901234567890');
      const vb: bigint = BigInt('987654321098765432109876543210');
      const bigSum: bigint = va.operatorAdd(vb);
      expect(bigSum.toString()).assertEqual('1111111110111111111011111111100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0013
     * @tc.name testBigIntTypeAliasIncrDecr0013
     * @tc.desc bigint operatorIncrement and operatorDecrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasIncrDecr0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1: bigint = BigInt(1);
      const inc: bigint = v1.operatorIncrement();
      expect(inc.toString()).assertEqual('2');
      const v5: bigint = BigInt(5);
      const dec: bigint = v5.operatorDecrement();
      expect(dec.toString()).assertEqual('4');
      const zero: bigint = BigInt(0);
      const inc2: bigint = zero.operatorIncrement().operatorIncrement();
      expect(inc2.toString()).assertEqual('2');
      const zeroDec: bigint = BigInt(0);
      const decNeg: bigint = zeroDec.operatorDecrement();
      expect(decNeg.toString()).assertEqual('-1');
      const val: bigint = BigInt(10);
      val.operatorIncrement();
      expect(val.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0014
     * @tc.name testBigIntTypeAliasBitwise0014
     * @tc.desc bigint bitwise operators: and, or, xor, not, left shift, right shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasBitwise0014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a12: bigint = BigInt(12);
      const a5: bigint = BigInt(5);
      const andR: bigint = a12.operatorBitwiseAnd(a5);
      expect(andR.toString()).assertEqual('4');
      const orR: bigint = a12.operatorBitwiseOr(a5);
      expect(orR.toString()).assertEqual('13');
      const xorR: bigint = a12.operatorBitwiseXor(a5);
      expect(xorR.toString()).assertEqual('9');
      const zero: bigint = BigInt(0);
      const notR: bigint = zero.operatorBitwiseNot();
      expect(notR.toString()).assertEqual('-1');
      const v1: bigint = BigInt(1);
      const shift4: bigint = BigInt(4);
      const lsR: bigint = v1.operatorLeftShift(shift4);
      expect(lsR.toString()).assertEqual('16');
      const v16: bigint = BigInt(16);
      const shift2: bigint = BigInt(2);
      const rsR: bigint = v16.operatorRightShift(shift2);
      expect(rsR.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0015
     * @tc.name testBigIntTypeAliasBitwiseEdge0015
     * @tc.desc bigint bitwise edge: immutability, shift zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasBitwiseEdge0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a12: bigint = BigInt(12);
      const a5: bigint = BigInt(5);
      a12.operatorBitwiseAnd(a5);
      expect(a12.toString()).assertEqual('12');
      const v42: bigint = BigInt(42);
      const zero: bigint = BigInt(0);
      const ls0: bigint = v42.operatorLeftShift(zero);
      expect(ls0.toString()).assertEqual('42');
      const rs0: bigint = v42.operatorRightShift(zero);
      expect(rs0.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0016
     * @tc.name testBigIntTypeAliasComparison0016
     * @tc.desc bigint comparison: gt, lt, ge, le, zero/neg/large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasComparison0016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a100: bigint = BigInt(100);
      const a50: bigint = BigInt(50);
      expect(a100.operatorGreaterThan(a50)).assertTrue();
      const a10: bigint = BigInt(10);
      const a20: bigint = BigInt(20);
      expect(a10.operatorLessThan(a20)).assertTrue();
      const eq: bigint = BigInt(50);
      expect(eq.operatorGreaterThanEqual(eq)).assertTrue();
      const eq100: bigint = BigInt(100);
      expect(eq100.operatorLessThanEqual(eq100)).assertTrue();
      const negA: bigint = BigInt(-5);
      const negB: bigint = BigInt(-10);
      expect(negA.operatorGreaterThan(negB)).assertTrue();
      const zero: bigint = BigInt(0);
      const pos: bigint = BigInt(1);
      expect(zero.operatorLessThan(pos)).assertTrue();
      const negVal: bigint = BigInt(-1);
      expect(zero.operatorGreaterThan(negVal)).assertTrue();
      const v: bigint = BigInt(42);
      expect(v.operatorGreaterThanEqual(v)).assertTrue();
      const bigA: bigint = BigInt('9007199254740993');
      const bigB: bigint = BigInt('9007199254740992');
      expect(bigA.operatorGreaterThan(bigB)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0017
     * @tc.name testBigIntTypeAliasConversion0017
     * @tc.desc bigint type conversion: doubleValue, getLong, getULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasConversion0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v42: bigint = BigInt(42);
      const d: double = v42.doubleValue();
      expect(d).assertEqual(42.0);
      const v999: bigint = BigInt(999);
      const l: long = v999.getLong();
      expect(l).assertEqual(999);
      const v100: bigint = BigInt(100);
      const ul: long = v100.getULong();
      expect(ul).assertEqual(100);
      const negV: bigint = BigInt(-100);
      const negD: double = negV.doubleValue();
      expect(negD).assertEqual(-100.0);
      const big: bigint = BigInt('9007199254740993');
      const bd: double = big.doubleValue();
      expect(typeof bd).assertEqual('number');
      const fromUL: bigint = BigInt.fromULong(-1);
      const ulVal: long = fromUL.getULong();
      expect(ulVal).assertEqual(-1);
      const conv: bigint = BigInt(42);
      conv.doubleValue();
      expect(conv.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0018
     * @tc.name testBigIntTypeAliasUtility0018
     * @tc.desc bigint utility: negative, positive, negate, pow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasUtility0018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const negV: bigint = BigInt(-5);
      expect(negV.negative()).assertTrue();
      const posV: bigint = BigInt(10);
      expect(posV.positive()).assertTrue();
      const zeroV: bigint = BigInt(0);
      expect(zeroV.negative()).assertFalse();
      expect(zeroV.positive()).assertTrue();
      const v100: bigint = BigInt(100);
      const negated: bigint = v100.negate();
      expect(negated.toString()).assertEqual('-100');
      const v2: bigint = BigInt(2);
      const exp10: bigint = BigInt(10);
      const power: bigint = v2.pow(exp10);
      expect(power.toString()).assertEqual('1024');
      const v999: bigint = BigInt(999);
      const zeroExp: bigint = BigInt(0);
      const powZero: bigint = v999.pow(zeroExp);
      expect(powZero.toString()).assertEqual('1');
      const v42: bigint = BigInt(42);
      const oneExp: bigint = BigInt(1);
      const powOne: bigint = v42.pow(oneExp);
      expect(powOne.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0019
     * @tc.name testBigIntTypeAliasFunctionParamReturn0019
     * @tc.desc bigint as function parameter type and return type (module-level helpers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasFunctionParamReturn0019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(fnParam(BigInt(42))).assertEqual('42');
      const r: bigint = fnReturn();
      expect(r.toString()).assertEqual('777');
      const arrowFn = (v: bigint): string => v.toString();
      expect(arrowFn(BigInt(100))).assertEqual('100');
      const arrowRet = (): bigint => BigInt(42);
      const ar: bigint = arrowRet();
      expect(ar.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0020
     * @tc.name testBigIntTypeAliasFunctionDefault0020
     * @tc.desc bigint as function default parameter and multi-parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasFunctionDefault0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(defaultFn()).assertEqual('10');
      expect(defaultFn(BigInt(99))).assertEqual('99');
      const r: bigint = sumTwo(BigInt(30), BigInt(12));
      expect(r.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0021
     * @tc.name testBigIntTypeAliasFunctionHigher0021
     * @tc.desc higher-order function with bigint and immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasFunctionHigher0021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = higher((v: bigint): string => v.toString(), BigInt(42));
      expect(result).assertEqual('42');
      const src: bigint = BigInt(50);
      const mutFn = (v: bigint): bigint => v.operatorAdd(10n);
      mutFn(src);
      expect(src.toString()).assertEqual('50');
      expect(calcFn().toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0022
     * @tc.name testBigIntTypeAliasArray0022
     * @tc.desc bigint array: declaration, access, traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasArray0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: bigint[] = [BigInt(1), BigInt(2), BigInt(3)];
      expect(arr.length).assertEqual(3);
      const elem: bigint = arr[0];
      expect(elem.toString()).assertEqual('1');
      arr[0] = BigInt(100);
      expect(arr[0].toString()).assertEqual('100');
      let sum: bigint = BigInt(0);
      for (const v of arr) {
        sum = sum.operatorAdd(v);
      }
      expect(sum.toString()).assertEqual('105');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0023
     * @tc.name testBigIntTypeAliasArray2dMap0023
     * @tc.desc bigint 2d array, array as param, map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasArray2dMap0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const matrix: bigint[][] = [[BigInt(1), BigInt(2)], [BigInt(3), BigInt(4)]];
      expect(matrix[0][1].toString()).assertEqual('2');
      expect(matrix[1][0].toString()).assertEqual('3');
      expect(sumArr([BigInt(10), BigInt(20)]).toString()).assertEqual('30');
      const src: bigint[] = [BigInt(1), BigInt(2)];
      const doubled: bigint[] = src.map((v: bigint): bigint => v.operatorMultiply(2n));
      expect(doubled[0].toString()).assertEqual('2');
      expect(doubled[1].toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0024
     * @tc.name testBigIntTypeAliasClassFieldMethod0024
     * @tc.desc bigint as class field, method parameter/return, constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasClassFieldMethod0024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: TypeAliasBox = new TypeAliasBox();
      b.val = BigInt(42);
      expect(b.val.toString()).assertEqual('42');
      const c: Calc = new Calc();
      expect(c.add(BigInt(3), BigInt(4)).toString()).assertEqual('7');
      const f: Factory = new Factory();
      expect(f.make(100).toString()).assertEqual('100');
      const w: Wrapper = new Wrapper(BigInt(50));
      expect(w.val.toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0025
     * @tc.name testBigIntTypeAliasInterfaceInheritGetSet0025
     * @tc.desc bigint in interface, inheritance, getter/setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasInterfaceInheritGetSet0025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: HasValue = { val: BigInt(999) };
      expect(obj.val.toString()).assertEqual('999');
      const op: Operator = {
        exec(a: bigint, b: bigint): bigint {
          return a.operatorAdd(b);
        }
      };
      expect(op.exec(BigInt(10), BigInt(20)).toString()).assertEqual('30');
      const ch: Child = new Child();
      expect(ch.p.toString()).assertEqual('1');
      expect(ch.c.toString()).assertEqual('2');
      const w: WithGetSet = new WithGetSet();
      w.v = BigInt(77);
      expect(w.v.toString()).assertEqual('77');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0026
     * @tc.name testBigIntTypeAliasChaining0026
     * @tc.desc bigint method chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasChaining0026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v10: bigint = BigInt(10);
      const chain1: bigint = v10.operatorAdd(5n).operatorMultiply(2n);
      expect(chain1.toString()).assertEqual('30');
      const v123: bigint = BigInt(123);
      const s: string = v123.valueOf().toString();
      expect(s).assertEqual('123');
      const v256: bigint = BigInt(256);
      const chain2: bigint = BigInt.asIntN(8, v256).operatorAdd(10n);
      expect(chain2.toString()).assertEqual('10');
      const vNeg: bigint = BigInt(10);
      const chain3: bigint = vNeg.negate().operatorSubtract(5n);
      expect(chain3.toString()).assertEqual('-15');
      const v9: bigint = BigInt(9);
      const chain4: bigint = v9.operatorIncrement().operatorMultiply(5n);
      expect(chain4.toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0027
     * @tc.name testBigIntTypeAliasChainMore0027
     * @tc.desc bigint chain: Add-Divide-toString, asIntN chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasChainMore0027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v2: bigint = BigInt(2);
      const len: int = v2.pow(10n).toString().length;
      expect(len > 0).assertTrue();
      const v100: bigint = BigInt(100);
      const chain: string = v100.operatorAdd(50n).operatorDivide(3n).toString();
      expect(chain).assertEqual('50');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0028
     * @tc.name testBigIntTypeAliasStaticMore0028
     * @tc.desc BigInt static methods with bigint type: fromULong, asIntN/asUintN with bigint source, zero-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasStaticMore0028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromUL1: bigint = BigInt.fromULong(-1);
      expect(fromUL1.toString()).assertEqual('18446744073709551615');
      const fromUL2: bigint = BigInt.fromULong(127);
      expect(fromUL2.toString()).assertEqual('127');
      const bSrc: bigint = BigInt(255);
      const asInt: bigint = BigInt.asIntN(8, bSrc);
      expect(asInt.toString()).assertEqual('-1');
      const bNeg: bigint = BigInt(-1);
      const asUint: bigint = BigInt.asUintN(8, bNeg);
      expect(asUint.toString()).assertEqual('255');
      const bZero: bigint = BigInt(255);
      const asInt0: bigint = BigInt.asIntN(0, bZero);
      expect(asInt0.toString()).assertEqual('0');
      const asUint0: bigint = BigInt.asUintN(0, bZero);
      expect(asUint0.toString()).assertEqual('0');
      const b999: bigint = BigInt(999);
      const roundTrip: bigint = BigInt.fromULong(b999.getLong());
      expect(roundTrip.toString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0029
     * @tc.name testBigIntTypeAliasTypeCompat0029
     * @tc.desc bigint/BigInt type compatibility: param BigInt accepts bigint, return bigint, equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasTypeCompat0029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: bigint = BigInt(42);
      expect(fnBigIntParam(b)).assertEqual('42');
      const ret: bigint = fnReturnBigInt();
      expect(ret.toString()).assertEqual('100');
      const b1: bigint = BigInt(42);
      const B1: BigInt = BigInt(42);
      expect(b1.equals(B1)).assertTrue();
      const v: bigint = BigInt(123);
      expect(v.equals(123n)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0030
     * @tc.name testBigIntTypeAliasAliasSemantics0030
     * @tc.desc alias semantics: type alias, instanceof, typeof, union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasAliasSemantics0030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: MyBig = BigInt(100);
      expect(v.toString()).assertEqual('100');
      expect(v instanceof BigInt).assertTrue();
      expect(typeof v).assertEqual('bigint');
      const v1: ValType = BigInt(42);
      const v2: ValType = 'hello';
      expect(v1 instanceof BigInt).assertTrue();
      expect(typeof v2).assertEqual('string');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0031
     * @tc.name testBigIntTypeAliasHolderGeneric0031
     * @tc.desc Holder class with bigint, shared reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasHolderGeneric0031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const h = new Holder(BigInt(42));
      expect(h.v.toString()).assertEqual('42');
      const src: BigInt = new BigInt(42);
      const a1: bigint = src;
      const a2: bigint = src;
      expect(a1.equals(a2)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0032
     * @tc.name testBigIntTypeAliasEdgeLoop0032
     * @tc.desc bigint in loop accumulation and cross assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasEdgeLoop0032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sum: bigint = BigInt(0);
      for (let i: int = 1; i <= 10; i++) {
        sum = sum.operatorAdd(BigInt(i));
      }
      expect(sum.toString()).assertEqual('55');
      let a: bigint = BigInt(10);
      let b: bigint = BigInt(20);
      a = b;
      b = b.operatorAdd(5n);
      expect(a.toString()).assertEqual('20');
      expect(b.toString()).assertEqual('25');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0033
     * @tc.name testBigIntTypeAliasEdgeTernaryDestructure0033
     * @tc.desc bigint in ternary expression and destructuring assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasEdgeTernaryDestructure0033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const flag: boolean = true;
      const v: bigint = flag ? BigInt(100) : BigInt(200);
      expect(v.toString()).assertEqual('100');
      const arr: bigint[] = [BigInt(1), BigInt(2)];
      const [a, b]: bigint[] = arr;
      expect(a.toString()).assertEqual('1');
      expect(b.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BIGINT_ALIAS_0034
     * @tc.name testBigIntTypeAliasEdgeSelfDivideIf0034
     * @tc.desc bigint divide by self, if-condition compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntTypeAliasEdgeSelfDivideIf0034', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val: bigint = BigInt(100);
      const selfDiv: bigint = val.operatorDivide(val);
      expect(selfDiv.toString()).assertEqual('1');
      const zero: bigint = BigInt(0);
      expect(zero.operatorLessThan(1n)).assertTrue();
    });
  });
}
