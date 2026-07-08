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

export default function BigIntToLocaleString1Test(): void {
  describe('BigInt.toLocaleString no-arg (mindmap toLocaleString_1)', () => {
    beforeAll((): void => {
    });
    beforeEach(():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0100
     * @tc.name testBigIntToLocaleString1Default0100
     * @tc.desc Mindmap input: default toLocaleString formats million without grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Default0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = BigInt(1000000);

      expect(value.toLocaleString('en-US', { useGrouping: false })).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0200
     * @tc.name testBigIntToLocaleString1Zero0200
     * @tc.desc Mindmap return value: zero toLocaleString exact decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Zero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0300
     * @tc.name testBigIntToLocaleString1Negative0300
     * @tc.desc Mindmap return value: negative value toLocaleString exact decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Negative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-42).toLocaleString('en-US', { useGrouping: false })).assertEqual('-42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0400
     * @tc.name testBigIntToLocaleString1Large0400
     * @tc.desc Mindmap return value: large magnitude toLocaleString exact decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Large0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740993').toLocaleString('en-US', { useGrouping: false }))
        .assertEqual('9007199254740993');
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
      expect(BigInt('9223372036854775807').toLocaleString('en-US', { useGrouping: false })).assertEqual('9223372036854775807');
      expect(BigInt('-9223372036854775808').toLocaleString('en-US', { useGrouping: false })).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0600
     * @tc.name testBigIntToLocaleString1ReturnType0600
     * @tc.desc Mindmap return value: toLocaleString returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1ReturnType0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(0).toLocaleString('en-US', { useGrouping: false }))).assertEqual(Class.from<string>());
    });
  });
}
