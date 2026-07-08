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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it} from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntDoubleValueTest(): void {
  describe('BigInt.doubleValue (mindmap doubleValue)', () => {
    beforeAll((): void => {
    });
    beforeEach(():void=>{

    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0100
     * @tc.name testBigIntDoubleValueSigns0100
     * @tc.desc Mindmap input: doubleValue for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSigns0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).doubleValue()).assertEqual(42.0);
      expect(BigInt(-42).doubleValue()).assertEqual(-42.0);
      expect(BigInt(0).doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0200
     * @tc.name testBigIntDoubleValueSafeInteger0200
     * @tc.desc Mindmap input: doubleValue near MAX_SAFE_INTEGER boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSafeInteger0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740991').doubleValue()).assertEqual(9007199254740991.0);
      expect(BigInt('9007199254740992').doubleValue()).assertEqual(9007199254740992.0);
      expect(BigInt('9007199254740993').doubleValue()).assertEqual(9007199254740993.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0300
     * @tc.name testBigIntDoubleValueReturnType0300
     * @tc.desc Mindmap return value: doubleValue returns finite double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = BigInt(42).doubleValue();

      expect(Class.of(r)).assertEqual(Class.from<double>());
      expect(r % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0400
     * @tc.name testBigIntDoubleValueFromExpression0400
     * @tc.desc Mindmap return value: doubleValue on arithmetic result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromExpression0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(20)).doubleValue()).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0500
     * @tc.name testBigIntDoubleValueLarge0500
     * @tc.desc Mindmap input: doubleValue on very large string BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLarge0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999999999999999999').doubleValue() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0600
     * @tc.name testBigIntDoubleValueNoThrow0600
     * @tc.desc Mindmap error handling: doubleValue does not throw on normal calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNoThrow0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(999999).doubleValue()).assertEqual(999999.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0700
     * @tc.name testBigIntDoubleValueLongBounds0700
     * @tc.desc Mindmap input: doubleValue at signed long extrema within exact double range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLongBounds0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).doubleValue()).assertEqual(Long.toDouble(9223372036854775807));
      expect(BigInt(-9223372036854775808).doubleValue()).assertEqual(Long.toDouble(-9223372036854775808));
      expect(BigInt(0).doubleValue()).assertEqual(0.0);
    });
  });
}
