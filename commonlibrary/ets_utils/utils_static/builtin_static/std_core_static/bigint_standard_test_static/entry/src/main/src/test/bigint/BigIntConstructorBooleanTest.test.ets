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

export default function BigIntConstructorBooleanTest(): void {
  describe('BigInt boolean constructor (mindmap constructor_8)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0100
     * @tc.name testBigIntConstructorBooleanLiterals0100
     * @tc.desc Mindmap input: boolean literals true and false map to 1 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanLiterals0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).toString()).assertEqual('1');
      expect(BigInt(false).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0200
     * @tc.name testBigIntConstructorBooleanVariables0200
     * @tc.desc Mindmap input: boolean variables construct expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanVariables0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const t: boolean = true;
      const f: boolean = false;

      expect(BigInt(t).toString()).assertEqual('1');
      expect(BigInt(f).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0300
     * @tc.name testBigIntConstructorBooleanExpressions0300
     * @tc.desc Mindmap input: boolean expressions including logical and negation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanExpressions0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1 === 1).toString()).assertEqual('1');
      expect(BigInt(1 !== 1).toString()).assertEqual('0');
      expect(BigInt(true && true).toString()).assertEqual('1');
      expect(BigInt(true && false).toString()).assertEqual('0');
      expect(BigInt(true || false).toString()).assertEqual('1');
      expect(BigInt(!true).toString()).assertEqual('0');
      expect(BigInt(!false).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0400
     * @tc.name testBigIntConstructorBooleanReturnType0400
     * @tc.desc Mindmap return value: constructor yields BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(true) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(BigInt(false) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0500
     * @tc.name testBigIntConstructorBooleanArithmetic0500
     * @tc.desc Mindmap return value: boolean-constructed values participate in operatorAdd and compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanArithmetic0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const t = BigInt(true);
      const f = BigInt(false);

      expect(t.operatorAdd(t).toString()).assertEqual('2');
      expect(f.operatorAdd(f).toString()).assertEqual('0');
      expect(t.operatorAdd(f).toString()).assertEqual('1');
      expect(t.operatorSubtract(f).toString()).assertEqual('1');
      expect(t.operatorMultiply(t).toString()).assertEqual('1');
      expect(f.operatorMultiply(t).toString()).assertEqual('0');
      expect(t.operatorGreaterThan(f)).assertTrue();
      expect(f.operatorLessThan(t)).assertTrue();
      expect(t.operatorGreaterThanEqual(t)).assertTrue();
      expect(f.operatorLessThanEqual(f)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0600
     * @tc.name testBigIntConstructorBooleanStaticTruncation0600
     * @tc.desc Mindmap return value: asIntN and asUintN with boolean-constructed operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanStaticTruncation0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(true)).toString()).assertEqual('1');
      expect(BigInt.asUintN(8, BigInt(true)).toString()).assertEqual('1');
      expect(BigInt.asIntN(8, BigInt(false)).toString()).assertEqual('0');
      expect(BigInt.asUintN(8, BigInt(false)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0700
     * @tc.name testBigIntConstructorBooleanIndependence0700
     * @tc.desc Mindmap return value: repeated constructions yield equal values and distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanIndependence0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(true);
      const b = BigInt(true);
      const c = BigInt(false);

      expect(a.equals(b)).assertTrue();
      expect(a.operatorAdd(BigInt(1)).toString()).assertEqual('2');
      expect(b.toString()).assertEqual('1');
      expect(c.toString()).assertEqual('0');
      expect(BigInt(false).equals(c)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0800
     * @tc.name testBigIntConstructorBooleanValueOfAndRadix0800
     * @tc.desc Mindmap return value: valueOf, toString radix, and getLong for boolean sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanValueOfAndRadix0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).valueOf().toString()).assertEqual('1');
      expect(BigInt(false).valueOf().toString()).assertEqual('0');
      expect(BigInt(true).toString(2)).assertEqual('1');
      expect(BigInt(false).toString(2)).assertEqual('0');
      expect(BigInt(true).toString(16)).assertEqual('1');
      expect(BigInt(false).toString(16)).assertEqual('0');
      expect(BigInt(true).getLong()).assertEqual(1);
      expect(BigInt(false).getLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0900
     * @tc.name testBigIntConstructorBooleanInvalidArg0900
     * @tc.desc Mindmap error handling: null, undefined, and wrong types cast to boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanInvalidArg0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(null as Object as boolean);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(undefined as Object as boolean);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt('true' as Object as boolean);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(123 as Object as boolean);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_1000
     * @tc.name testBigIntConstructorBooleanRecovery1000
     * @tc.desc Mindmap error handling: valid construction succeeds after invalid-arg path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanRecovery1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(null as Object as boolean);
      }).assertThrowError('ClassCastError');
      expect(BigInt(true).toString()).assertEqual('1');
      expect(BigInt(false).toString()).assertEqual('0');
    });
  });
}
