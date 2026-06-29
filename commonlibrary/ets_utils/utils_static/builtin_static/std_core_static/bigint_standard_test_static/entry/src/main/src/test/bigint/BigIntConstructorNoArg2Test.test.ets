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

export default function BigIntConstructorNoArg2Test(): void {
  describe('testBigIntConstructorNoArg2Test', () => {


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0100
     * @tc.name testBigIntConstructorNoArg2Test0100
     * @tc.desc zero to the fifth power via pow yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const five = BigInt(5);

      expect(zero.pow(five).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0200
     * @tc.name testBigIntConstructorNoArg2Test0200
     * @tc.desc five to the zero power via pow yields one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const five = BigInt(5);
      expect(five.pow(zero).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0300
     * @tc.name testBigIntConstructorNoArg2Test0300
     * @tc.desc negate of zero via negate yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      expect(zero.negate().toString()).assertEqual('0');
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0400
     * @tc.name testBigIntConstructorNoArg2Test0400
     * @tc.desc bitwise NOT of zero via operatorBitwiseNot yields -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      expect(zero.operatorBitwiseNot().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0500
     * @tc.name testBigIntConstructorNoArg2Test0500
     * @tc.desc zero AND 0xFF via operatorBitwiseAnd yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const mask = BigInt(0xFF);
      expect(zero.operatorBitwiseAnd(mask).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0600
     * @tc.name testBigIntConstructorNoArg2Test0600
     * @tc.desc zero OR 0xFF via operatorBitwiseOr yields 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const mask = BigInt(0xFF);
      expect(zero.operatorBitwiseOr(mask).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0700
     * @tc.name testBigIntConstructorNoArg2Test0700
     * @tc.desc zero XOR 0xFF via operatorBitwiseXor yields 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const mask = BigInt(0xFF);
      expect(zero.operatorBitwiseXor(mask).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0800
     * @tc.name testBigIntConstructorNoArg2Test0800
     * @tc.desc valueOf on no-arg BigInt returns Long representation of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      expect(zero.valueOf().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0900
     * @tc.name testBigIntConstructorNoArg2Test0900
     * @tc.desc asIntN on no-arg BigInt preserves zero for any bit width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();

      expect(BigInt.asIntN(8, zero).toString()).assertEqual('0');
      expect(BigInt.asIntN(16, zero).toString()).assertEqual('0');
      expect(BigInt.asIntN(32, zero).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, zero).toString()).assertEqual('0');
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1000
     * @tc.name testBigIntConstructorNoArg2Test1000
     * @tc.desc zero does not equal negative one via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const negOne = BigInt(-1);
      const largeNeg = BigInt('-9999999999999999');

      expect(zero.equals(negOne)).assertFalse();
      expect(zero.equals(largeNeg)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1100
     * @tc.name testBigIntConstructorNoArg2Test1100
     * @tc.desc arithmetic on no-arg BigInt does not mutate the original instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();

      zero.operatorAdd(BigInt(10));
      zero.operatorSubtract(BigInt(5));
      zero.operatorMultiply(BigInt(3));
      zero.negate();
      zero.operatorBitwiseNot();
      zero.operatorIncrement();
      zero.operatorDecrement();

      expect(zero.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1200
     * @tc.name testBigIntConstructorNoArg2Test1200
     * @tc.desc double negate of no-arg BigInt returns to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      expect(zero.negate().negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1300
     * @tc.name testBigIntConstructorNoArg2Test1300
     * @tc.desc double bitwise NOT of no-arg BigInt returns to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      expect(zero.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1400
     * @tc.name testBigIntConstructorNoArg2Test1400
     * @tc.desc zero plus x minus x via operatorAdd and operatorSubtract yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const x = BigInt(42);

      expect(zero.operatorAdd(x).operatorSubtract(x).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1500
     * @tc.name testBigIntConstructorNoArg2Test1500
     * @tc.desc (zero + a) * (zero + b) via operatorAdd and operatorMultiply equals a * b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const a = BigInt(4);
      const b = BigInt(5);

      const result: BigInt = zero.operatorAdd(a).operatorMultiply(zero.operatorAdd(b));

      expect(result.toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1600
     * @tc.name testBigIntConstructorNoArg2Test1600
     * @tc.desc zero to the zero power via pow may be defined as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();

      const result: BigInt = zero.pow(zero);

      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1700
     * @tc.name testBigIntConstructorNoArg2Test1700
     * @tc.desc non-zero XOR zero via operatorBitwiseXor retains its value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const value = BigInt(0xAAAA);

      expect(value.operatorBitwiseXor(zero).toString()).assertEqual('43690');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_1800
     * @tc.name testBigIntConstructorNoArg2Test1800
     * @tc.desc zero plus invert of x equals invert of x, identity property of addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const x = BigInt(-12345);
      const xInvert = zero.operatorSubtract(x);

      expect(zero.operatorAdd(x).equals(x)).assertTrue();
      expect(xInvert.equals(x.negate())).assertTrue();
    });



  });
}
