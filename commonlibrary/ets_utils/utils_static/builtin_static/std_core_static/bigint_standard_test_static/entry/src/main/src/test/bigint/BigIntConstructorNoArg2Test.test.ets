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
  describe('testBigIntConstructorNoArg2Test', (): void => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1000
     * @tc.name testBigIntConstructorNoArg2Test010
     * @tc.desc zero to the fifth power via pow yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const five = BigInt(5);

      expect(zero.pow(five).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1100
     * @tc.name testBigIntConstructorNoArg2Test011
     * @tc.desc five to the zero power via pow yields one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const five = BigInt(5);
      expect(five.pow(zero).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1200
     * @tc.name testBigIntConstructorNoArg2Test012
     * @tc.desc negate of zero via negate yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      expect(zero.negate().toString()).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1300
     * @tc.name testBigIntConstructorNoArg2Test013
     * @tc.desc bitwise NOT of zero via operatorBitwiseNot yields -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      expect(zero.operatorBitwiseNot().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1400
     * @tc.name testBigIntConstructorNoArg2Test014
     * @tc.desc zero AND 0xFF via operatorBitwiseAnd yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const mask = BigInt(0xFF);
      expect(zero.operatorBitwiseAnd(mask).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1500
     * @tc.name testBigIntConstructorNoArg2Test015
     * @tc.desc zero OR 0xFF via operatorBitwiseOr yields 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const mask = BigInt(0xFF);
      expect(zero.operatorBitwiseOr(mask).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1600
     * @tc.name testBigIntConstructorNoArg2Test016
     * @tc.desc zero XOR 0xFF via operatorBitwiseXor yields 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const mask = BigInt(0xFF);
      expect(zero.operatorBitwiseXor(mask).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1700
     * @tc.name testBigIntConstructorNoArg2Test017
     * @tc.desc valueOf on no-arg BigInt returns Long representation of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      expect(zero.valueOf().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1800
     * @tc.name testBigIntConstructorNoArg2Test018
     * @tc.desc asIntN on no-arg BigInt preserves zero for any bit width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();

      expect(BigInt.asIntN(8, zero).toString()).assertEqual('0');
      expect(BigInt.asIntN(16, zero).toString()).assertEqual('0');
      expect(BigInt.asIntN(32, zero).toString()).assertEqual('0');
      expect(BigInt.asIntN(64, zero).toString()).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_1900
     * @tc.name testBigIntConstructorNoArg2Test019
     * @tc.desc zero does not equal negative one via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const negOne = BigInt(-1);
      const largeNeg = BigInt('-9999999999999999');

      expect(zero.equals(negOne)).assertFalse();
      expect(zero.equals(largeNeg)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2000
     * @tc.name testBigIntConstructorNoArg2Test020
     * @tc.desc arithmetic on no-arg BigInt does not mutate the original instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2100
     * @tc.name testBigIntConstructorNoArg2Test021
     * @tc.desc double negate of no-arg BigInt returns to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      expect(zero.negate().negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2200
     * @tc.name testBigIntConstructorNoArg2Test022
     * @tc.desc double bitwise NOT of no-arg BigInt returns to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      expect(zero.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2300
     * @tc.name testBigIntConstructorNoArg2Test023
     * @tc.desc zero plus x minus x via operatorAdd and operatorSubtract yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const x = BigInt(42);

      expect(zero.operatorAdd(x).operatorSubtract(x).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2400
     * @tc.name testBigIntConstructorNoArg2Test024
     * @tc.desc (zero + a) * (zero + b) via operatorAdd and operatorMultiply equals a * b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const a = BigInt(4);
      const b = BigInt(5);

      const result: BigInt = zero.operatorAdd(a).operatorMultiply(zero.operatorAdd(b));

      expect(result.toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2500
     * @tc.name testBigIntConstructorNoArg2Test025
     * @tc.desc zero to the zero power via pow may be defined as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();

      const result: BigInt = zero.pow(zero);

      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2600
     * @tc.name testBigIntConstructorNoArg2Test026
     * @tc.desc non-zero XOR zero via operatorBitwiseXor retains its value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const value = BigInt(0xAAAA);

      expect(value.operatorBitwiseXor(zero).toString()).assertEqual('43690');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_NOARG_2700
     * @tc.name testBigIntConstructorNoArg2Test027
     * @tc.desc zero plus invert of x equals invert of x, identity property of addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArg2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new BigInt();
      const x = BigInt(-12345);
      const xInvert = zero.operatorSubtract(x);

      expect(zero.operatorAdd(x).equals(x)).assertTrue();
      expect(xInvert.equals(x.negate())).assertTrue();
    });



  });
}
