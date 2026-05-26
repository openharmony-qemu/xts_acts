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
import { LONG_MAX_STR, LONG_MIN_STR } from '../BigIntTestLimits';

export default function BigIntToLocaleString1Test(): void {
  describe('BigInt.toLocaleString no-arg (mindmap toLocaleString_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0100
     * @tc.name testBigIntToLocaleString1Default0100
     * @tc.desc Mindmap input: default toLocaleString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Default0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = BigInt(1000000).toLocaleString();

      expect(s.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0200
     * @tc.name testBigIntToLocaleString1Zero0200
     * @tc.desc Mindmap return value: zero toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Zero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0300
     * @tc.name testBigIntToLocaleString1Negative0300
     * @tc.desc Mindmap return value: negative value toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Negative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-42).toLocaleString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0400
     * @tc.name testBigIntToLocaleString1Large0400
     * @tc.desc Mindmap return value: large magnitude toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Large0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740993').toLocaleString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0500
     * @tc.name testBigIntToLocaleString1LongBounds0500
     * @tc.desc Mindmap boundary: long extrema decimal formatting without grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1LongBounds0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const opts: BigIntToLocaleStringOptions = { useGrouping: false };

      expect(BigInt(LONG_MAX_STR).toLocaleString('en-US', opts)).assertEqual(LONG_MAX_STR);
      expect(BigInt(LONG_MIN_STR).toLocaleString('en-US', opts)).assertEqual(LONG_MIN_STR);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0600
     * @tc.name testBigIntToLocaleString1ZeroExact0600
     * @tc.desc Mindmap return value: zero formats as exact decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1ZeroExact0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const opts: BigIntToLocaleStringOptions = { useGrouping: false };

      expect(BigInt(0).toLocaleString('en-US', opts)).assertEqual('0');
    });
  });
}
