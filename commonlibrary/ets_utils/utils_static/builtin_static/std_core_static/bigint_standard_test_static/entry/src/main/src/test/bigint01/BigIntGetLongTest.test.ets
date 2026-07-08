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
import { describe, it, expect ,afterAll, afterEach, beforeAll, beforeEach} from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntGetLongTest(): void {
  describe('BigInt.getLong (mindmap getLong)', () => {
    beforeAll((): void => {
    });
    beforeEach(async():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0100
     * @tc.name testBigIntGetLongPositive0100
     * @tc.desc Mindmap input: getLong for positive values within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongPositive0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).getLong()).assertEqual(1);
      expect(BigInt(42).getLong()).assertEqual(42);
      expect(BigInt(2147483647).getLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0200
     * @tc.name testBigIntGetLongNegative0200
     * @tc.desc Mindmap input: getLong for negative values within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongNegative0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).getLong()).assertEqual(-1);
      expect(BigInt(-42).getLong()).assertEqual(-42);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0300
     * @tc.name testBigIntGetLongZero0300
     * @tc.desc Mindmap input: getLong for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongZero0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).getLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0400
     * @tc.name testBigIntGetLongBoundary0400
     * @tc.desc Mindmap input: getLong at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongBoundary0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).getLong()).assertEqual(9223372036854775807);
      expect(BigInt(-9223372036854775808).getLong()).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0500
     * @tc.name testBigIntGetLongOverflowWrap0500
     * @tc.desc Mindmap return value: getLong wraps out-of-range values mod 2^64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongOverflowWrap0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775808').getLong()).assertEqual(-9223372036854775808);
      expect(BigInt('-9223372036854775809').getLong()).assertEqual(9223372036854775807);
      expect(BigInt('18446744073709551616').getLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0600
     * @tc.name testBigIntGetLongReturnType0600
     * @tc.desc Mindmap return value: getLong returns long and is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongReturnType0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(8);
      const first = v.getLong();

      expect(Class.of(first)).assertEqual(Class.from<long>());
      expect(v.getLong()).assertEqual(first);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0700
     * @tc.name testBigIntGetLongNoThrow0700
     * @tc.desc Mindmap error handling: getLong does not throw on large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongNoThrow0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775808').getLong()).assertEqual(-9223372036854775808);
      expect(BigInt('-99999999999999999999999').getLong()).assertEqual(-200376420520689663);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0800
     * @tc.name testBigIntGetLongNegativeBoundary0800
     * @tc.desc Mindmap boundary: getLong at -9223372036854775808 and one step below signed long minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongNegativeBoundary0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9223372036854775808').getLong()).assertEqual(-9223372036854775808);
      expect(BigInt('-9223372036854775809').getLong()).assertEqual(9223372036854775807);
      expect(BigInt('-18446744073709551616').getLong()).assertEqual(0);
      expect(BigInt(-9223372036854775808).operatorIncrement().getLong()).assertEqual(-9223372036854775807);
    });
  });
}
