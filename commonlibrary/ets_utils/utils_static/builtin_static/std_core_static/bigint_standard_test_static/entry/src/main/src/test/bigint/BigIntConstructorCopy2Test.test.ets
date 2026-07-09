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

function assertCopyPreserves(source: BigInt): void {
  expect(BigInt(source).equals(source)).assertTrue();
}

export default function BigIntConstructorCopy2Test(): void {
  describe('testBigIntConstructorCopy2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1200
     * @tc.name testBigIntConstructorCopy2Test012
     * @tc.desc Copy hex-constructed longMax BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt('0x7FFFFFFFFFFFFFFF');
      assertCopyPreserves(src);
      expect(BigInt(src).equals(BigInt('9223372036854775807'))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1300
     * @tc.name testBigIntConstructorCopy2Test013
     * @tc.desc Copy binary-constructed ulongMax BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt('0b1111111111111111111111111111111111111111111111111111111111111111');
      assertCopyPreserves(src);
      expect(BigInt(src).equals(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1400
     * @tc.name testBigIntConstructorCopy2Test014
     * @tc.desc Copy fromULong(0) factory-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt.fromULong(0);
      assertCopyPreserves(src);
      expect(BigInt(src).equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1500
     * @tc.name testBigIntConstructorCopy2Test015
     * @tc.desc Copy fromULong(-1) yields ulongMax, copy preserves it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt.fromULong(-1);
      assertCopyPreserves(src);
      expect(BigInt(src).equals(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1600
     * @tc.name testBigIntConstructorCopy2Test016
     * @tc.desc Copy BigInt(true) constructed from boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(true);
      assertCopyPreserves(src);
      expect(BigInt(src).equals(BigInt(1))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1700
     * @tc.name testBigIntConstructorCopy2Test017
     * @tc.desc Copy asIntN(8, 255) truncation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt.asIntN(8, BigInt(255));
      assertCopyPreserves(src);
      expect(BigInt(src).toString()).assertEqual('-1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1800
     * @tc.name testBigIntConstructorCopy2Test018
     * @tc.desc Copy bitwise AND result BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(255).operatorBitwiseAnd(BigInt(15));
      assertCopyPreserves(src);
      expect(BigInt(src).toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_1900
     * @tc.name testBigIntConstructorCopy2Test019
     * @tc.desc Copy bitwise NOT of zero result BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(0).operatorBitwiseNot();
      assertCopyPreserves(src);
      expect(BigInt(src).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2000
     * @tc.name testBigIntConstructorCopy2Test020
     * @tc.desc Copy cross-boundary addition result BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt('9223372036854775807').operatorAdd(BigInt('9223372036854775807'));
      assertCopyPreserves(src);
      expect(BigInt(src).toString()).assertEqual('18446744073709551614');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2100
     * @tc.name testBigIntConstructorCopy2Test021
     * @tc.desc Copy power result BigInt (2^100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(2).pow(BigInt(100));
      assertCopyPreserves(src);
      expect(BigInt(src).operatorRightShift(BigInt(99)).equals(BigInt(2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2200
     * @tc.name testBigIntConstructorCopy2Test022
     * @tc.desc Copy.negate() equals original.negate()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(42);
      const cpy = BigInt(src);
      expect(cpy.negate().equals(src.negate())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2300
     * @tc.name testBigIntConstructorCopy2Test023
     * @tc.desc Copy.positive() and Copy.negative() match original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posSrc = BigInt(5);
      const negSrc = BigInt(-5);
      const zeroSrc = BigInt(0);

      const posCpy = BigInt(posSrc);
      const negCpy = BigInt(negSrc);
      const zeroCpy = BigInt(zeroSrc);

      expect(posCpy.positive()).assertEqual(posSrc.positive());
      expect(posCpy.negative()).assertEqual(posSrc.negative());
      expect(negCpy.positive()).assertEqual(negSrc.positive());
      expect(negCpy.negative()).assertEqual(negSrc.negative());
      expect(zeroCpy.positive()).assertEqual(zeroSrc.positive());
      expect(zeroCpy.negative()).assertEqual(zeroSrc.negative());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2400
     * @tc.name testBigIntConstructorCopy2Test024
     * @tc.desc Copy.valueOf() and Copy.getLong() match original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(12345);
      const cpy = BigInt(src);
      expect(cpy.valueOf().toString()).assertEqual(src.valueOf().toString());
      expect(cpy.getLong()).assertEqual(src.getLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2500
     * @tc.name testBigIntConstructorCopy2Test025
     * @tc.desc Copy.toString(16) and toString(2) match original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt('18446744073709551615');
      const cpy = BigInt(src);
      expect(cpy.toString(16)).assertEqual(src.toString(16));
      expect(cpy.toString(2)).assertEqual(src.toString(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2600
     * @tc.name testBigIntConstructorCopy2Test026
     * @tc.desc Multiple copies of same source are all equal and independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(999);
      const a = BigInt(src);
      const b = BigInt(src);
      const c = BigInt(src);
      expect(a.equals(b)).assertTrue();
      expect(b.equals(c)).assertTrue();
      expect(a.equals(c)).assertTrue();
      const aMod = a.operatorAdd(BigInt(1));
      expect(b.toString()).assertEqual('999');
      expect(c.toString()).assertEqual('999');
      expect(aMod.toString()).assertEqual('1000');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2700
     * @tc.name testBigIntConstructorCopy2Test027
     * @tc.desc undefined cast to BigInt throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(undefined as Object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2800
     * @tc.name testBigIntConstructorCopy2Test028
     * @tc.desc Non-BigInt types cast to BigInt throw ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt('abc' as Object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(123 as Object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(true as Object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_2900
     * @tc.name testBigIntConstructorCopy2Test029
     * @tc.desc Valid copy succeeds after invalid copy input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(null as BigInt);
      }).assertThrowError('ClassCastError');
      assertCopyPreserves(BigInt(42));
      assertCopyPreserves(BigInt(-99));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_3000
     * @tc.name testBigIntConstructorCopy2Test030
     * @tc.desc Copy BigInt(0), BigInt('0'), BigInt(false) all yield equal zero copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const z1 = BigInt(BigInt(0));
      const z2 = BigInt(BigInt('0'));
      const z3 = BigInt(BigInt(false));
      const z4 = BigInt(BigInt.fromULong(0));
      expect(z1.equals(z2)).assertTrue();
      expect(z1.equals(z3)).assertTrue();
      expect(z1.equals(z4)).assertTrue();
      expect(z1.positive()).assertTrue();
      expect(z1.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_COPY_3100
     * @tc.name testBigIntConstructorCopy2Test031
     * @tc.desc Copy result of a multi-step bitwise + arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopy2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = BigInt(42);
      const masked = BigInt.asUintN(8, base.operatorAdd(BigInt(200)));
      const shifted = masked.operatorRightShift(BigInt(1));
      const negated = BigInt(shifted).negate();
      assertCopyPreserves(negated);
      const doubleCopy = BigInt(BigInt(negated));
      expect(doubleCopy.equals(negated)).assertTrue();
    });
  });
}
