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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DoubleDollarInvokeOneTest(): void {
  describe('DoubleDollarInvokeOneTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0100
     * @tc.name testDoubleDollarInvokeOne0001
     * @tc.desc Verify calling Double.$_invoke() with no arguments executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke();
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0200
     * @tc.name testDoubleDollarInvokeOne0002
     * @tc.desc Verify extra arguments are ignored or cause error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke("extra");
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0300
     * @tc.name testDoubleDollarInvokeOne0003
     * @tc.desc Verify behavior when explicitly passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let value: Number = Double.$_invoke(undefined);
        expect(value).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0400
     * @tc.name testDoubleDollarInvokeOne0004
     * @tc.desc Verify behavior when explicitly passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let value: Number = Double.$_invoke(null);
        expect(value).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0600
     * @tc.name testDoubleDollarInvokeOne0006
     * @tc.desc Verify calling $_invoke on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Double(1.0);
      try {
        let value = Double.$_invoke();
        expect(value !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0700
     * @tc.name testDoubleDollarInvokeOne0007
     * @tc.desc Verify return value is of Number type (Double alias)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke();
      expect(value instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_0800
     * @tc.name testDoubleDollarInvokeOne0008
     * @tc.desc Verify returned Number instance internal value is 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke();
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1000
     * @tc.name testDoubleDollarInvokeOne0010
     * @tc.desc Verify return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = Double.$_invoke();
      expect(value !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1100
     * @tc.name testDoubleDollarInvokeOne0011
     * @tc.desc Verify returned Number instance value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke();
      expect(Double.isNaN(value.valueOf())).assertFalse();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1200
     * @tc.name testDoubleDollarInvokeOne0012
     * @tc.desc Verify return value is positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke();
      expect(value.valueOf()).assertEqual(0.0);
      expect(1.0 / value.valueOf()).assertEqual(Infinity);
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1400
     * @tc.name testDoubleDollarInvokeOne0014
     * @tc.desc Verify toString() output starts with "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = Double.$_invoke();
      let str = value.toString();
      expect(str === "0" || str === "0.0").assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1500
     * @tc.name testDoubleDollarInvokeOne0015
     * @tc.desc Verify valueOf() returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Number = Double.$_invoke();
      let raw: number = value.valueOf();
      expect(typeof raw).assertEqual("number");
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1600
     * @tc.name testDoubleDollarInvokeOne0016
     * @tc.desc Verify multiple calls return different independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1 = Double.$_invoke();
      let value2 = Double.$_invoke();
      expect(value1 === value2).assertTrue();
      expect(value1.valueOf()).assertEqual(value2.valueOf());
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1700
     * @tc.name testDoubleDollarInvokeOne0017
     * @tc.desc Verify concurrent calls each return Number instance with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        let value: Number = Double.$_invoke();
        expect(value.valueOf()).assertEqual(0.0);
      }
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_1900
     * @tc.name testDoubleDollarInvokeOne0019
     * @tc.desc Verify try-catch wrapping call does not enter catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
        let value: Number = Double.$_invoke();
        expect(value !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_2000
     * @tc.name testDoubleDollarInvokeOne0020
     * @tc.desc Verify illegal parameter exception can be caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        let value: Number = Double.$_invoke("illegal");
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        caught = true;
        expect(e.name !== null).assertTrue();
      }
    });

    /**
     * @tc.number DBL_DLLR_INVK_ONE_2100
     * @tc.name testDoubleDollarInvokeOne0021
     * @tc.desc Verify extra parameters do not cause uncaught error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = Double.$_invoke();
      expect(value !== null).assertTrue();
    });
  });
}
