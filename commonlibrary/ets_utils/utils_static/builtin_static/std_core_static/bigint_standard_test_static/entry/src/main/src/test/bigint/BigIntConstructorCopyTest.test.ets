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
import { LONG_MAX, LONG_MIN, LONG_MAX_STR, LONG_MIN_STR, ULONG_MAX_STR } from '../BigIntTestLimits';

export default function BigIntConstructorCopyTest(): void {
  describe('BigInt copy constructor (mindmap constructor_9)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0100
     * @tc.name testBigIntConstructorCopyValueEqual0100
     * @tc.desc Mindmap input: copy positive int BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyValueEqual0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(42);
      const copied = BigInt(original);

      expect(copied.equals(original)).assertTrue();
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
      const original = BigInt('9007199254740993');
      const copied = BigInt(original);

      expect(copied.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0300
     * @tc.name testBigIntConstructorCopyZero0300
     * @tc.desc Mindmap input: copy zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyZero0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(0);
      const copied = BigInt(original);

      expect(copied.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0400
     * @tc.name testBigIntConstructorCopyNegative0400
     * @tc.desc Mindmap input: copy negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyNegative0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(-42);
      const copied = BigInt(original);

      expect(copied.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0500
     * @tc.name testBigIntConstructorCopyMinLong0500
     * @tc.desc Mindmap input: copy LONG_MIN string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyMinLong0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(LONG_MIN_STR);
      const copied = BigInt(original);

      expect(copied.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0600
     * @tc.name testBigIntConstructorCopyMaxLong0600
     * @tc.desc Mindmap input: copy LONG_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyMaxLong0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxLong = BigInt(LONG_MAX_STR);

      expect(BigInt(maxLong).equals(maxLong)).assertTrue();
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
      const beyondSafe = BigInt('9007199254740992');
      const copiedBeyond = BigInt(beyondSafe);

      expect(copiedBeyond.equals(beyondSafe)).assertTrue();
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
     * @tc.desc Mindmap input: copy at LONG_MIN and unsigned 64-bit maximum magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLongMinULongMax1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const minLong = BigInt(LONG_MIN_STR);
      const umax = BigInt(ULONG_MAX_STR);

      expect(BigInt(minLong).equals(minLong)).assertTrue();
      expect(BigInt(umax).equals(umax)).assertTrue();
      expect(BigInt(umax).toString()).assertEqual(ULONG_MAX_STR);
    });
  });
}
