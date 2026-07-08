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

export default function CharEqualsTest(): void {
  describe('CharEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_0100
     * @tc.name testCharEquals0001
     * @tc.desc Verify equals with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.equals(new Char(c'A'));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_0500
     * @tc.name testCharEquals0005
     * @tc.desc Verify equals returns false when passing different Char instance values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.equals(c2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_0600
     * @tc.name testCharEquals0006
     * @tc.desc Verify equals returns true when passing null character Char instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\u0000');
      const c2 = new Char(c'\u0000');
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_1600
     * @tc.name testCharEquals0016
     * @tc.desc Verify equals returns false when passing Chinese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      const other = new Char(c'国');
      const result = c.equals(other);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_1900
     * @tc.name testCharEquals0019
     * @tc.desc Verify equals returns false when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.equals(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_2000
     * @tc.name testCharEquals0020
     * @tc.desc Verify equals returns false when passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.equals(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3100
     * @tc.name testCharEquals0031
     * @tc.desc Verify equals returns true for same instance comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.equals(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3400
     * @tc.name testCharEquals0034
     * @tc.desc Verify equals returns false for uppercase and lowercase comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'a');
      expect(c1.equals(c2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3500
     * @tc.name testCharEquals0035
     * @tc.desc Verify equals returns false for different digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      const c2 = new Char(c'1');
      expect(c1.equals(c2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3600
     * @tc.name testCharEquals0036
     * @tc.desc Verify equals returns true for equal high surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uD800');
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3700
     * @tc.name testCharEquals0037
     * @tc.desc Verify equals returns false for high and low surrogate comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uDC00');
      expect(c1.equals(c2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3800
     * @tc.name testCharEquals0038
     * @tc.desc Verify equals returns true for minimum character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MIN_VALUE);
      const c2 = new Char(Char.MIN_VALUE);
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_3900
     * @tc.name testCharEquals0039
     * @tc.desc Verify equals returns true for maximum character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MAX_VALUE);
      const c2 = new Char(Char.MAX_VALUE);
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_4000
     * @tc.name testCharEquals0040
     * @tc.desc Verify equals returns true for equal space characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c' ');
      const c2 = new Char(c' ');
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_4100
     * @tc.name testCharEquals0041
     * @tc.desc Verify equals returns true for equal newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\n');
      const c2 = new Char(c'\n');
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_4200
     * @tc.name testCharEquals0042
     * @tc.desc Verify equals return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.equals(new Char(c'A'));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_4400
     * @tc.name testCharEquals0044
     * @tc.desc Verify equals returns correct result after multiple comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 100; i++) {
        expect(c.equals(new Char(c'A'))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5000
     * @tc.name testCharEquals0050
     * @tc.desc Verify equals is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(typeof c.equals).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5200
     * @tc.name testCharEquals0052
     * @tc.desc Verify equals is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const startTime = Date.now();
      const result = c1.equals(c2);
      const endTime = Date.now();
      expect(endTime - startTime < 100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5300
     * @tc.name testCharEquals0053
     * @tc.desc Verify equals symmetry for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(c1.equals(c2)).assertEqual(c2.equals(c1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5400
     * @tc.name testCharEquals0054
     * @tc.desc Verify equals symmetry for unequal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.equals(c2)).assertEqual(c2.equals(c1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5500
     * @tc.name testCharEquals0055
     * @tc.desc Verify equals transitivity for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const c3 = new Char(c'A');
      expect(c1.equals(c2)).assertTrue();
      expect(c2.equals(c3)).assertTrue();
      expect(c1.equals(c3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5600
     * @tc.name testCharEquals0056
     * @tc.desc Verify equals returns consistent result across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result1 = c1.equals(c2);
      const result2 = c1.equals(c2);
      const result3 = c1.equals(c2);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5700
     * @tc.name testCharEquals0057
     * @tc.desc Verify compareTo returns 0 when equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(c1.equals(c2)).assertTrue();
      expect(c1.compareTo(c2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_5800
     * @tc.name testCharEquals0058
     * @tc.desc Verify compareTo is not 0 when equals returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.equals(c2)).assertFalse();
      expect(c1.compareTo(c2) !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_6200
     * @tc.name testCharEquals0062
     * @tc.desc Verify equals returns true for equal Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'中');
      const c2 = new Char(c'中');
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAREQUALSTEST_EQUALSTEST_6300
     * @tc.name testCharEquals0063
     * @tc.desc Verify equals returns true for equal emoji surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharEquals0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD83D');
      const c2 = new Char(c'\uD83D');
      expect(c1.equals(c2)).assertTrue();
    });
  });
}
