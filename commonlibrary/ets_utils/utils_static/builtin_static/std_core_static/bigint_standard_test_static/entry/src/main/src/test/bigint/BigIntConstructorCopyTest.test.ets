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

function assertBigIntCopyPreservesValue(source: BigInt): void {
  expect(BigInt(source).equals(source)).assertTrue();
}

export default function BigIntConstructorCopyTest(): void {
  describe('BigInt copy constructor (mindmap constructor_9)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0100
     * @tc.name testBigIntConstructorCopyValueEqual0100
     * @tc.desc Mindmap input: copy common integral magnitudes (zero, positive, negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyValueEqual0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assertBigIntCopyPreservesValue(BigInt(0));
      assertBigIntCopyPreservesValue(BigInt(42));
      assertBigIntCopyPreservesValue(BigInt(-42));
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0200
     * @tc.name testBigIntConstructorCopyLargeString0200
     * @tc.desc Mindmap input: copy large decimal string BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLargeString0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assertBigIntCopyPreservesValue(BigInt('9007199254740993'));
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0300
     * @tc.name testBigIntConstructorCopyLongMaxIntegral0300
     * @tc.desc Mindmap input: copy 9223372036854775807 from long integral overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLongMaxIntegral0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assertBigIntCopyPreservesValue(BigInt(9223372036854775807));
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0400
     * @tc.name testBigIntConstructorCopyLongMinString0400
     * @tc.desc Mindmap input: copy -9223372036854775808 from decimal string overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLongMinString0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assertBigIntCopyPreservesValue(BigInt('-9223372036854775808'));
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0500
     * @tc.name testBigIntConstructorCopyLongMinIntegral0500
     * @tc.desc Mindmap input: copy -9223372036854775808 from long integral overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLongMinIntegral0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assertBigIntCopyPreservesValue(BigInt(-9223372036854775808));
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0600
     * @tc.name testBigIntConstructorCopyMaxLong0600
     * @tc.desc Mindmap input: copy 9223372036854775807 string preserves decimal form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyMaxLong0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxLong = BigInt('9223372036854775807');

      assertBigIntCopyPreservesValue(maxLong);
      expect(maxLong.toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0700
     * @tc.name testBigIntConstructorCopyBeyondSafeInteger0700
     * @tc.desc Mindmap input: copy beyond double safe integer (string path)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyBeyondSafeInteger0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assertBigIntCopyPreservesValue(BigInt('9007199254740992'));
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0800
     * @tc.name testBigIntConstructorCopyReturnType0800
     * @tc.desc Mindmap return value: copy constructor returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyReturnType0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(7);
      const copied = BigInt(original);

      expect(Class.of(copied as Object)).assertEqual(Class.from<BigInt>());
      expect(copied.operatorAdd(BigInt(1)).toString()).assertEqual('8');
      expect(original.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0900
     * @tc.name testBigIntConstructorCopyImmutable0900
     * @tc.desc Mindmap return value: mutating copy does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyImmutable0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(10);
      const copied = BigInt(original);
      const sum = copied.operatorAdd(BigInt(5));

      expect(original.toString()).assertEqual('10');
      expect(sum.toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_1000
     * @tc.name testBigIntConstructorCopyLongMinULongMax1000
     * @tc.desc Mindmap input: copy at unsigned 64-bit maximum magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLongMinULongMax1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const umax = BigInt('18446744073709551615');

      assertBigIntCopyPreservesValue(umax);
      expect(BigInt(umax).toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_1100
     * @tc.name testBigIntConstructorCopyNested1100
     * @tc.desc Mindmap boundary: nested copy and copy of copy preserve value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyNested1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source = BigInt('9007199254740993');
      const once = BigInt(source);
      const twice = BigInt(once);

      expect(twice.equals(source)).assertTrue();
      expect(BigInt(twice).equals(once)).assertTrue();
      expect(twice.toString()).assertEqual('9007199254740993');
    });
  });
}
