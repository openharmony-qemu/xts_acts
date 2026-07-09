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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect} from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';


export default function BigIntConstructorBoolean2Test(): void {
  describe('testBigIntConstructorBoolean2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1100
     * @tc.name testBigIntConstructorBoolean2Test011
     * @tc.desc Verify BigInt from ternary conditional expression boolean result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1 > 0 ? true : false).toString()).assertEqual('1');
      expect(BigInt(1 < 0 ? true : false).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1200
     * @tc.name testBigIntConstructorBoolean2Test012
     * @tc.desc Verify BigInt from compound comparison and property expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('a'.length === 1).toString()).assertEqual('1');
      expect(BigInt(42 > 0).toString()).assertEqual('1');
      expect(BigInt(NaN === NaN).toString()).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1300
     * @tc.name testBigIntConstructorBoolean2Test013
     * @tc.desc Verify bitwise operations on boolean-constructed BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = BigInt(true);
      const f = BigInt(false);

      expect(t.operatorBitwiseAnd(f).toString()).assertEqual('0');
      expect(t.operatorBitwiseOr(f).toString()).assertEqual('1');
      expect(t.operatorBitwiseXor(t).toString()).assertEqual('0');
      expect(f.operatorBitwiseNot().toString()).assertEqual('-1');
      expect(t.operatorLeftShift(BigInt(3)).toString()).assertEqual('8');
      expect(BigInt(8).operatorRightShift(BigInt(3)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1400
     * @tc.name testBigIntConstructorBoolean2Test014
     * @tc.desc Verify boolean-constructed values equal those from number, string, and fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).equals(BigInt(1))).assertTrue();
      expect(BigInt(true).equals(BigInt('1'))).assertTrue();
      expect(BigInt(false).equals(BigInt(0))).assertTrue();
      expect(BigInt(false).equals(BigInt('0'))).assertTrue();
      expect(BigInt(true).equals(BigInt.fromULong(1))).assertTrue();
      expect(BigInt(false).equals(BigInt.fromULong(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1500
     * @tc.name testBigIntConstructorBoolean2Test015
     * @tc.desc Verify boolean-constructed BigInt survives toString serialization round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(true).toString()).equals(BigInt(true))).assertTrue();
      expect(BigInt(BigInt(false).toString()).equals(BigInt(false))).assertTrue();
      expect(BigInt('0x' + BigInt(true).toString(16)).equals(BigInt(true))).assertTrue();
      expect(BigInt('0b' + BigInt(true).toString(2)).equals(BigInt(true))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1600
     * @tc.name testBigIntConstructorBoolean2Test016
     * @tc.desc Verify boolean-constructed values in large number arithmetic at long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMax = BigInt('9223372036854775807');
      const longMin = BigInt('-9223372036854775808');

      expect(longMax.operatorAdd(BigInt(true)).toString()).assertEqual('9223372036854775808');
      expect(longMin.operatorSubtract(BigInt(true)).toString()).assertEqual('-9223372036854775809');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_CONSTRUCTOR_BOOLEAN_1700
     * @tc.name testBigIntConstructorBoolean2Test017
     * @tc.desc Verify boolean→BigInt→boolean→BigInt idempotency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBoolean2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(true).equals(BigInt(1))).toString()).assertEqual('1');
      expect(BigInt(BigInt(false).equals(BigInt(0))).toString()).assertEqual('1');
      expect(BigInt(BigInt(true).equals(BigInt(0))).toString()).assertEqual('0');
    });
  });
}
