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

export default function BigIntConstructorCopyTest(): void {
  describe('BigInt copy constructor (mindmap constructor_9)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0100
     * @tc.name testBigIntConstructorCopyValueEqual0100
     * @tc.desc Verify copy constructor produces equal BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyValueEqual0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt(42);
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
        expect(copied.toString()).assertEqual('42');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0200
     * @tc.name testBigIntConstructorCopyLargeString0200
     * @tc.desc Verify copy constructor matches large decimal string source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyLargeString0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt('9007199254740993');
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0300
     * @tc.name testBigIntConstructorCopySameValue0300
     * @tc.desc Verify copy constructor preserves source numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopySameValue0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt(1);
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
        expect(copied.toString()).assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0400
     * @tc.name testBigIntConstructorCopyZero0400
     * @tc.desc Verify copy constructor preserves zero BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyZero0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt(0);
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
        expect(copied.toString()).assertEqual('0');
        expect(copied.negative()).assertFalse();
        expect(copied.positive()).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0500
     * @tc.name testBigIntConstructorCopyNegative0500
     * @tc.desc Verify copy constructor preserves negative BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyNegative0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const original = new BigInt(-42);
        const copied = new BigInt(original);
        expect(copied.equals(original)).assertTrue();
        expect(copied.toString()).assertEqual('-42');
        expect(copied.negative()).assertTrue();
        const largeNeg = new BigInt('-9223372036854775808');
        const copiedLarge = new BigInt(largeNeg);
        expect(copiedLarge.equals(largeNeg)).assertTrue();
        expect(copiedLarge.toString()).assertEqual('-9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_COPY_0600
     * @tc.name testBigIntConstructorCopyBoundary0600
     * @tc.desc Verify copy constructor at long and beyond-safe-integer boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorCopyBoundary0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxLong = new BigInt('9223372036854775807');
        expect(new BigInt(maxLong).equals(maxLong)).assertTrue();
        expect(new BigInt(maxLong).toString()).assertEqual('9223372036854775807');
        const beyondSafe = new BigInt('9007199254740992');
        const copiedBeyond = new BigInt(beyondSafe);
        expect(copiedBeyond.equals(beyondSafe)).assertTrue();
        expect(copiedBeyond.toString()).assertEqual('9007199254740992');
      });
  });
}
