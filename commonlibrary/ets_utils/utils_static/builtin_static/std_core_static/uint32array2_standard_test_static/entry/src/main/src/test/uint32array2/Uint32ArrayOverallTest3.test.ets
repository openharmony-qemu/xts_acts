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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayOverallThreeTest(): void {
  describe('Uint32ArrayOverallThreeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0100
     * @tc.name testUint32ArrayOverallThree001
     * @tc.desc Verify $_get -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0200
     * @tc.name testUint32ArrayOverallThree002
     * @tc.desc Verify $_get -length(-3) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(-3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0300
     * @tc.name testUint32ArrayOverallThree003
     * @tc.desc Verify $_get -length-1(-4) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(-4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0400
     * @tc.name testUint32ArrayOverallThree004
     * @tc.desc Verify $_get length(3) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0500
     * @tc.name testUint32ArrayOverallThree005
     * @tc.desc Verify $_set -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0600
     * @tc.name testUint32ArrayOverallThree006
     * @tc.desc Verify $_set -length(-3) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_set(-3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0700
     * @tc.name testUint32ArrayOverallThree007
     * @tc.desc Verify $_set -length-1(-4) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_set(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0800
     * @tc.name testUint32ArrayOverallThree008
     * @tc.desc Verify $_set length(3) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_0900
     * @tc.name testUint32ArrayOverallThree009
     * @tc.desc Verify at -length-1(-4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.at(-4);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1000
     * @tc.name testUint32ArrayOverallThree010
     * @tc.desc Verify at length(3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.at(3);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1100
     * @tc.name testUint32ArrayOverallThree011
     * @tc.desc Verify at -1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.at(-1);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1200
     * @tc.name testUint32ArrayOverallThree012
     * @tc.desc Verify at 0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.at(0);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1300
     * @tc.name testUint32ArrayOverallThree013
     * @tc.desc Verify with -length-1(-4) throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1400
     * @tc.name testUint32ArrayOverallThree014
     * @tc.desc Verify with length(3) throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1500
     * @tc.name testUint32ArrayOverallThree015
     * @tc.desc Verify with -1 throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      try {
        empty.with(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1600
     * @tc.name testUint32ArrayOverallThree016
     * @tc.desc Verify with 0 throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      try {
        empty.with(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1700
     * @tc.name testUint32ArrayOverallThree017
     * @tc.desc Verify set(Uint32Array , offset=length) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src = Uint32Array.of(1, 2);
      try {
        values.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1800
     * @tc.name testUint32ArrayOverallThree018
     * @tc.desc Verify set(src.length=3, offset=length-1) overflow RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src = Uint32Array.of(1, 2, 3);
      try {
        values.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_1900
     * @tc.name testUint32ArrayOverallThree019
     * @tc.desc Verify set(ArrayLike , offset=length) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [1.0, 2.0];
      try {
        values.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2000
     * @tc.name testUint32ArrayOverallThree020
     * @tc.desc Verify copyWithin target=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.copyWithin(3, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2100
     * @tc.name testUint32ArrayOverallThree021
     * @tc.desc Verify copyWithin start>end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.copyWithin(0, 2, 1);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2200
     * @tc.name testUint32ArrayOverallThree022
     * @tc.desc Verify copyWithin start=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.copyWithin(0, 3, 4);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2300
     * @tc.name testUint32ArrayOverallThree023
     * @tc.desc Verify copyWithin (start==end) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.copyWithin(0, 1, 1);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2400
     * @tc.name testUint32ArrayOverallThree024
     * @tc.desc Verify copyWithin no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      empty.copyWithin(0, 0, 0);
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2500
     * @tc.name testUint32ArrayOverallThree025
     * @tc.desc Verify fill start=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.fill(99, 3, 5);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2600
     * @tc.name testUint32ArrayOverallThree026
     * @tc.desc Verify fill start>end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.fill(99, 2, 1);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2700
     * @tc.name testUint32ArrayOverallThree027
     * @tc.desc Verify fill start> end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.fill(99, -1, -2);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2800
     * @tc.name testUint32ArrayOverallThree028
     * @tc.desc Verify fill end=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.fill(99, 0, 0);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_2900
     * @tc.name testUint32ArrayOverallThree029
     * @tc.desc Verify fill no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      empty.fill(99, 0, 0);
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3000
     * @tc.name testUint32ArrayOverallThree030
     * @tc.desc Verify slice begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const out = values.slice(3);
      expect(out.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3100
     * @tc.name testUint32ArrayOverallThree031
     * @tc.desc Verify slice begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const out = values.slice(2, 1);
      expect(out.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3200
     * @tc.name testUint32ArrayOverallThree032
     * @tc.desc Verify slice() on empty Uint32Array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const out = empty.slice(0);
      expect(out.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3300
     * @tc.name testUint32ArrayOverallThree033
     * @tc.desc Verify subarray begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const view = values.subarray(2, 1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3400
     * @tc.name testUint32ArrayOverallThree034
     * @tc.desc Verify subarray() on empty Uint32Array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const view = empty.subarray(0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3500
     * @tc.name testUint32ArrayOverallThree035
     * @tc.desc Verify includes(NaN) false NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.includes(Number.NaN);
      expect(got).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3600
     * @tc.name testUint32ArrayOverallThree036
     * @tc.desc Verify indexOf(NaN) -1 NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.indexOf(Number.NaN);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3700
     * @tc.name testUint32ArrayOverallThree037
     * @tc.desc Verify lastIndexOf(NaN) -1 NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.lastIndexOf(Number.NaN);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3800
     * @tc.name testUint32ArrayOverallThree038
     * @tc.desc Verify includes(value, fromIndex=length) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.includes(10, 3);
      expect(got).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_3900
     * @tc.name testUint32ArrayOverallThree039
     * @tc.desc Verify indexOf(value, fromIndex=length) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.indexOf(10, 3);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4000
     * @tc.name testUint32ArrayOverallThree040
     * @tc.desc Verify lastIndexOf(absent) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.lastIndexOf(99);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4100
     * @tc.name testUint32ArrayOverallThree041
     * @tc.desc Verify includes(0) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.includes(0);
      expect(got).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4200
     * @tc.name testUint32ArrayOverallThree042
     * @tc.desc Verify lastIndexOf(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.lastIndexOf(0);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4300
     * @tc.name testUint32ArrayOverallThree043
     * @tc.desc Verify new Uint32Array(buf, byteOffset=4, length=2) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4400
     * @tc.name testUint32ArrayOverallThree044
     * @tc.desc Verify new Uint32Array(buf=4 , byteOffset=0, length=2) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(4), 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4500
     * @tc.name testUint32ArrayOverallThree045
     * @tc.desc Verify reduce without initialValue on empty throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      try {
        empty.reduce((previousValue, currentValue, currentIndex, array) => previousValue + currentValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4600
     * @tc.name testUint32ArrayOverallThree046
     * @tc.desc Verify reduceRight without initialValue on empty throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      try {
        empty.reduceRight((previousValue, currentValue, currentIndex, array) => previousValue - currentValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4700
     * @tc.name testUint32ArrayOverallThree047
     * @tc.desc Verify reduceRight on empty with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const result = empty.reduceRight<number>(
        (previousValue, currentValue, currentIndex, array) => previousValue + currentValue,
        100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4800
     * @tc.name testUint32ArrayOverallThree048
     * @tc.desc Verify some() on empty Uint32Array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.some((element: number, index: int, array: Uint32Array): boolean => true);
      expect(got).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_4900
     * @tc.name testUint32ArrayOverallThree049
     * @tc.desc Verify every() on empty Uint32Array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.every((element: number, index: int, array: Uint32Array): boolean => false);
      expect(got).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5000
     * @tc.name testUint32ArrayOverallThree050
     * @tc.desc Verify find() on empty Uint32Array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.find((value: number, index: int, array: Uint32Array): boolean => true);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5100
     * @tc.name testUint32ArrayOverallThree051
     * @tc.desc Verify findIndex() on empty Uint32Array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.findIndex((value: number, index: int, array: Uint32Array): boolean => true);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5200
     * @tc.name testUint32ArrayOverallThree052
     * @tc.desc Verify last element of single-element Uint32Array equals expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5300
     * @tc.name testUint32ArrayOverallThree053
     * @tc.desc Verify findLastIndex() on empty Uint32Array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.findLastIndex((value: number, index: int, array: Uint32Array): boolean => true);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5400
     * @tc.name testUint32ArrayOverallThree054
     * @tc.desc Verify indexOf(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.indexOf(0);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5500
     * @tc.name testUint32ArrayOverallThree055
     * @tc.desc Verify join() on empty Uint32Array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array();
      const got = empty.join();
      expect(got).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5600
     * @tc.name testUint32ArrayOverallThree056
     * @tc.desc Verify find() on single element returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Uint32Array.of(42);
      const got = single.find((value: number, index: int, array: Uint32Array): boolean => value === 42);
      expect(got).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5700
     * @tc.name testUint32ArrayOverallThree057
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Uint32Array.of(42);
      const got = single.at(-1);
      expect(got).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5800
     * @tc.name testUint32ArrayOverallThree058
     * @tc.desc Verify at(-2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Uint32Array.of(42);
      const got = single.at(-2);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_5900
     * @tc.name testUint32ArrayOverallThree059
     * @tc.desc Verify with(0, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Uint32Array.of(42);
      const replaced = single.with(0, 99);
      expect(replaced.$_get(0)).assertEqual(99);
      expect(single.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6000
     * @tc.name testUint32ArrayOverallThree060
     * @tc.desc Verify indexOf(value) on single-element array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Uint32Array.of(42);
      const got = single.indexOf(42);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6100
     * @tc.name testUint32ArrayOverallThree061
     * @tc.desc Verify lastIndexOf(value) on single-element array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Uint32Array.of(42);
      const got = single.lastIndexOf(42);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6200
     * @tc.name testUint32ArrayOverallThree062
     * @tc.desc Verify indexOf() on all-equal array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all = Uint32Array.of(7, 7, 7, 7);
      const got = all.indexOf(7);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6300
     * @tc.name testUint32ArrayOverallThree063
     * @tc.desc Verify lastIndexOf() on all-equal array returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all = Uint32Array.of(7, 7, 7, 7);
      const got = all.lastIndexOf(7);
      expect(got).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6400
     * @tc.name testUint32ArrayOverallThree064
     * @tc.desc Verify includes(value, fromIndex) returns true when in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all = Uint32Array.of(7, 7, 7, 7);
      const got = all.includes(7, 2);
      expect(got).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6500
     * @tc.name testUint32ArrayOverallThree065
     * @tc.desc Verify find() on all-equal array returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all = Uint32Array.of(7, 7, 7, 7);
      const got = all.find((value: number, index: int, array: Uint32Array): boolean => value === 7);
      expect(got).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6600
     * @tc.name testUint32ArrayOverallThree066
     * @tc.desc Verify findLast() on all-equal array returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all = Uint32Array.of(7, 7, 7, 7);
      const got = all.findLast((value: number, index: int, array: Uint32Array): boolean => value === 7);
      expect(got).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6700
     * @tc.name testUint32ArrayOverallThree067
     * @tc.desc Verify findIndex() on all-equal array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all = Uint32Array.of(7, 7, 7, 7);
      const got = all.findIndex((value: number, index: int, array: Uint32Array): boolean => value === 7);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6800
     * @tc.name testUint32ArrayOverallThree068
     * @tc.desc Verify find() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.find((value: number, index: int, array: Uint32Array): boolean => { throw new Error('find-cb-throw'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_6900
     * @tc.name testUint32ArrayOverallThree069
     * @tc.desc Verify findIndex() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.findIndex(
          (value: number, index: int, array: Uint32Array): boolean => {
            if (value === 20) { throw new Error('findIndex-cb-throw'); }
            return false;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7000
     * @tc.name testUint32ArrayOverallThree070
     * @tc.desc Verify findLast() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 15, 25);
      try {
        values.findLast(
          (value: number, index: int, array: Uint32Array): boolean => {
            throw new Error('findLast-cb-throw');
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7100
     * @tc.name testUint32ArrayOverallThree071
     * @tc.desc Verify findLastIndex() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 15, 25);
      try {
        values.findLastIndex(
          (value: number, index: int, array: Uint32Array): boolean => {
            if (index === 1) { throw new Error('findLastIndex-cb-throw'); }
            return false;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7200
     * @tc.name testUint32ArrayOverallThree072
     * @tc.desc Verify some() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.some(
          (element: number, index: int, array: Uint32Array): boolean => {
            throw new Error('some-cb-throw');
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7300
     * @tc.name testUint32ArrayOverallThree073
     * @tc.desc Verify every() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.every(
          (element: number, index: int, array: Uint32Array): boolean => {
            throw new Error('every-cb-throw');
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7400
     * @tc.name testUint32ArrayOverallThree074
     * @tc.desc Verify forEach() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.forEach(
          (value: number, index: int, array: Uint32Array): void => {
            if (index === 1) { throw new Error('forEach-cb-throw'); }
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7500
     * @tc.name testUint32ArrayOverallThree075
     * @tc.desc Verify map() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      try {
        values.map((val: number, index: int, array: Uint32Array): number => { throw new Error('map-cb-throw'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7600
     * @tc.name testUint32ArrayOverallThree076
     * @tc.desc Verify filter() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.filter(
          (val: number, index: int, array: Uint32Array): boolean => {
            if (val > 10) { throw new Error('filter-cb-throw'); }
            return false;
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7700
     * @tc.name testUint32ArrayOverallThree077
     * @tc.desc Verify reduce() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.reduce<number>(
          (sum: number, value: number, index: int, array: Uint32Array): number => {
            if (index === 1) { throw new Error('reduce-cb-throw'); }
            return sum + value;
          },
          0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7800
     * @tc.name testUint32ArrayOverallThree078
     * @tc.desc Verify reduceRight() rethrows exception from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.reduceRight<number>(
          (acc: number, value: number, index: int, array: Uint32Array): number => {
            throw new Error('reduceRight-cb-throw');
          },
          0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_7900
     * @tc.name testUint32ArrayOverallThree079
     * @tc.desc Verify sort() rethrows exception from comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      try {
        values.sort((a: number, b: number): int => { throw new Error('sort-cb-throw'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8000
     * @tc.name testUint32ArrayOverallThree080
     * @tc.desc Verify Uint32Array.from() rethrows exception from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const items: number[] = [1, 2];
        Uint32Array.from(items, (value: number, index: number): number => {
          if (value < 0) {
            return value;
          }
          throw new Error('from-cb-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8100
     * @tc.name testUint32ArrayOverallThree081
     * @tc.desc Verify find() returns undefined when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.find((value: number, index: int, array: Uint32Array): boolean => value > 100);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8200
     * @tc.name testUint32ArrayOverallThree082
     * @tc.desc Verify middle element access on Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      expect(values.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8300
     * @tc.name testUint32ArrayOverallThree083
     * @tc.desc Verify findIndex() returns -1 when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.findIndex((value: number, index: int, array: Uint32Array): boolean => value === 99);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8400
     * @tc.name testUint32ArrayOverallThree084
     * @tc.desc Verify findLastIndex() returns -1 when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const got = values.findLastIndex((value: number, index: int, array: Uint32Array): boolean => value === 99);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8500
     * @tc.name testUint32ArrayOverallThree085
     * @tc.desc Verify copyWithin(target, negative start) copies tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      values.copyWithin(0, -2);
      expect(values.join(',')).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_THREE_8600
     * @tc.name testUint32ArrayOverallThree086
     * @tc.desc Verify copyWithin(target, negative start, negative end) copies subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      values.copyWithin(0, -3, -1);
      expect(values.join(',')).assertEqual('3,4,3,4,5');
    });
  });
}
