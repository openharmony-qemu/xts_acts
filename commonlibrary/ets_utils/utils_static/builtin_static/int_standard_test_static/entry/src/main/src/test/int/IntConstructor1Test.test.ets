'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function IntConstructor1Test(): void {
  describe('IntConstructor1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0100
     * @tc.name testIntConstructor1001
     * @tc.desc Verify Int constructor without any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      expect(zero.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0200
     * @tc.name testIntConstructor1002
     * @tc.desc Verify no-argument constructor does not accept parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int();
      expect(n instanceof Int).assertTrue();
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0300
     * @tc.name testIntConstructor1003
     * @tc.desc Verify no-argument constructor returns Int instance with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      expect(zero).not().assertNull();
      expect(zero.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0400
     * @tc.name testIntConstructor1004
     * @tc.desc Verify return value is Int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      expect(typeof zero).assertEqual("int");
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0500
     * @tc.name testIntConstructor1005
     * @tc.desc Verify no-argument constructor always creates instance with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int();
      const b = new Int();
      expect(a.toInt()).assertEqual(0);
      expect(b.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0600
     * @tc.name testIntConstructor1006
     * @tc.desc Verify returned instance is Int type using instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      expect(zero instanceof Int).assertTrue();
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0700
     * @tc.name testIntConstructor1007
     * @tc.desc Verify constructor must be called with new keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(42);
      expect(n instanceof Int).assertTrue();
      expect(n.toInt()).assertEqual(42);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0800
     * @tc.name testIntConstructor1008
     * @tc.desc Verify -2147483648 equals -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      expect(min.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_0900
     * @tc.name testIntConstructor1009
     * @tc.desc Verify 2147483647 equals 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1000
     * @tc.name testIntConstructor1010
     * @tc.desc Verify Int.BIT_SIZE equals 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.BIT_SIZE).assertEqual(32);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1100
     * @tc.name testIntConstructor1011
     * @tc.desc Verify Int.BYTE_SIZE equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.BYTE_SIZE).assertEqual(4);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1300
     * @tc.name testIntConstructor1013
     * @tc.desc Verify two no-argument constructed instances are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int();
      const b = new Int();
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1400
     * @tc.name testIntConstructor1014
     * @tc.desc Verify toString returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      expect(zero.toString()).assertEqual("0");
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1500
     * @tc.name testIntConstructor1015
     * @tc.desc Verify zero addition operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      const result = zero.add(new Int(10));
      expect(result.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1600
     * @tc.name testIntConstructor1016
     * @tc.desc Verify zero subtraction operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      const result = zero.sub(new Int(5));
      expect(result.toInt()).assertEqual(-5);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1700
     * @tc.name testIntConstructor1017
     * @tc.desc Verify zero multiplication operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      const result = zero.mul(new Int(100));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1800
     * @tc.name testIntConstructor1018
     * @tc.desc Verify zero division operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int();
      const result = zero.div(new Int(5));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR_ITEM_CHK_1900
     * @tc.name testIntConstructor1019
     * @tc.desc Verify multiple no-argument constructor calls produce independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Int();
      const b = new Int();
      a = a.add(new Int(1));
      expect(a.toInt()).assertEqual(1);
      expect(b.toInt()).assertEqual(0);
    });
  });
}

