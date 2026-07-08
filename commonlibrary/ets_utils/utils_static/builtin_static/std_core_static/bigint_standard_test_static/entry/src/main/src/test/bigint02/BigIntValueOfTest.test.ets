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
import { describe, it, expect ,afterAll, afterEach, beforeAll, beforeEach } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntValueOfTest(): void {
  describe('BigInt.valueOf (mindmap valueOf)', () => {
    beforeAll((): void => {
    });
    beforeEach(():void=>{
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0100
     * @tc.name testBigIntValueOfEquals0100
     * @tc.desc Verify valueOf returns equal BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfEquals0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const v = new BigInt(123);
        expect(v.valueOf().equals(v)).assertTrue();
        expect(v.valueOf().toString()).assertEqual('123');
        expect(new BigInt(-456).valueOf().toString()).assertEqual('-456');
        expect(new BigInt(0).valueOf().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0200
     * @tc.name testBigIntValueOfReturnType0200
     * @tc.desc Verify valueOf returns BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfReturnType0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(Class.of(new BigInt(42).valueOf() as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0300
     * @tc.name testBigIntValueOfStable0300
     * @tc.desc Mindmap return value: repeated valueOf is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfStable0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(99);

      expect(v.valueOf().equals(v.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0400
     * @tc.name testBigIntValueOfLarge0400
     * @tc.desc Mindmap input: valueOf on large string BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfLarge0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = BigInt('9007199254740993');

      expect(huge.valueOf().equals(huge)).assertTrue();
      expect(huge.valueOf().toString()).assertEqual('9007199254740993');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0500
     * @tc.name testBigIntValueOfAssignToBigint0500
     * @tc.desc Mindmap return value: valueOf result assignable to bigint alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfAssignToBigint0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original: bigint = BigInt(123);
      const val: bigint = original.valueOf();

      expect(val.toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0600
     * @tc.name testBigIntValueOfLongBounds0600
     * @tc.desc Mindmap input: valueOf at signed long extrema and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);
      const zero = BigInt(0);

      expect(max.valueOf().toString()).assertEqual('9223372036854775807');
      expect(min.valueOf().toString()).assertEqual('-9223372036854775808');
      expect(zero.valueOf().equals(zero)).assertTrue();
      expect(max.valueOf().equals(min)).assertFalse();
    });
  });
}
