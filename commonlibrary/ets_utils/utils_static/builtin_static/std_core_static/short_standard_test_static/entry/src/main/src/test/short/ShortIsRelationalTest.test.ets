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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function shortIsRelationalTest(): void {
  describe('ShortIsRelationalTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0100
     * @tc.name testShortIsRelational001
     * @tc.desc Verify all relational methods with smaller Short argument when current value is greater
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(5 as short);
      let smallerArgument: Short = new Short(3 as short);
      let lessThanResult: boolean = current.isLessThan(smallerArgument);
      let lessEqualResult: boolean = current.isLessEqualThan(smallerArgument);
      let greaterThanResult: boolean = current.isGreaterThan(smallerArgument);
      let greaterEqualResult: boolean = current.isGreaterEqualThan(smallerArgument);
      expect(lessThanResult).assertFalse();
      expect(lessEqualResult).assertFalse();
      expect(greaterThanResult).assertTrue();
      expect(greaterEqualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0200
     * @tc.name testShortIsRelational002
     * @tc.desc Verify all relational methods with equal Short argument when current value is equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(42 as short);
      let equalArgument: Short = new Short(42 as short);
      let lessThanResult: boolean = current.isLessThan(equalArgument);
      let lessEqualResult: boolean = current.isLessEqualThan(equalArgument);
      let greaterThanResult: boolean = current.isGreaterThan(equalArgument);
      let greaterEqualResult: boolean = current.isGreaterEqualThan(equalArgument);
      expect(lessThanResult).assertFalse();
      expect(lessEqualResult).assertTrue();
      expect(greaterThanResult).assertFalse();
      expect(greaterEqualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0300
     * @tc.name testShortIsRelational003
     * @tc.desc Verify all relational methods with larger Short argument when current value is smaller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(5 as short);
      let largerArgument: Short = new Short(7 as short);
      let lessThanResult: boolean = current.isLessThan(largerArgument);
      let lessEqualResult: boolean = current.isLessEqualThan(largerArgument);
      let greaterThanResult: boolean = current.isGreaterThan(largerArgument);
      let greaterEqualResult: boolean = current.isGreaterEqualThan(largerArgument);
      expect(lessThanResult).assertTrue();
      expect(lessEqualResult).assertTrue();
      expect(greaterThanResult).assertFalse();
      expect(greaterEqualResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0400
     * @tc.name testShortIsRelational004
     * @tc.desc Verify all relational methods across sign boundary with negative current and positive argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeCurrent: Short = new Short((-1) as short);
      let positiveArgument: Short = new Short(1 as short);
      let lessThanResult: boolean = negativeCurrent.isLessThan(positiveArgument);
      let lessEqualResult: boolean = negativeCurrent.isLessEqualThan(positiveArgument);
      let greaterThanResult: boolean = negativeCurrent.isGreaterThan(positiveArgument);
      let greaterEqualResult: boolean = negativeCurrent.isGreaterEqualThan(positiveArgument);
      expect(lessThanResult).assertTrue();
      expect(lessEqualResult).assertTrue();
      expect(greaterThanResult).assertFalse();
      expect(greaterEqualResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0500
     * @tc.name testShortIsRelational005
     * @tc.desc Verify all relational methods at MIN_VALUE equality boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(Short.MIN_VALUE);
      let equalArgument: Short = new Short(Short.MIN_VALUE);
      let lessThanResult: boolean = current.isLessThan(equalArgument);
      let lessEqualResult: boolean = current.isLessEqualThan(equalArgument);
      let greaterThanResult: boolean = current.isGreaterThan(equalArgument);
      let greaterEqualResult: boolean = current.isGreaterEqualThan(equalArgument);
      expect(lessThanResult).assertFalse();
      expect(lessEqualResult).assertTrue();
      expect(greaterThanResult).assertFalse();
      expect(greaterEqualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0600
     * @tc.name testShortIsRelational006
     * @tc.desc Verify all relational methods with MAX_VALUE current and adjacent smaller argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryValue: Short = new Short(Short.MAX_VALUE);
      let adjacentBoundaryValue: Short = new Short(32766 as short);
      let lessThanResult: boolean = maxBoundaryValue.isLessThan(adjacentBoundaryValue);
      let lessEqualResult: boolean = maxBoundaryValue.isLessEqualThan(adjacentBoundaryValue);
      let greaterThanResult: boolean = maxBoundaryValue.isGreaterThan(adjacentBoundaryValue);
      let greaterEqualResult: boolean = maxBoundaryValue.isGreaterEqualThan(adjacentBoundaryValue);
      expect(lessThanResult).assertFalse();
      expect(lessEqualResult).assertFalse();
      expect(greaterThanResult).assertTrue();
      expect(greaterEqualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0700
     * @tc.name testShortIsRelational007
     * @tc.desc Verify all relational methods with MIN_VALUE current and adjacent larger argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryValue: Short = new Short(Short.MIN_VALUE);
      let adjacentBoundaryValue: Short = new Short((-32767) as short);
      let lessThanResult: boolean = minBoundaryValue.isLessThan(adjacentBoundaryValue);
      let lessEqualResult: boolean = minBoundaryValue.isLessEqualThan(adjacentBoundaryValue);
      let greaterThanResult: boolean = minBoundaryValue.isGreaterThan(adjacentBoundaryValue);
      let greaterEqualResult: boolean = minBoundaryValue.isGreaterEqualThan(adjacentBoundaryValue);
      expect(lessThanResult).assertTrue();
      expect(lessEqualResult).assertTrue();
      expect(greaterThanResult).assertFalse();
      expect(greaterEqualResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0800
     * @tc.name testShortIsRelational008
     * @tc.desc Verify relational method calls do not mutate the current Short internal value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(88 as short);
      let argument: Short = new Short(66 as short);
      let beforeShortValue: short = current.toShort();
      let lessThanResult: boolean = current.isLessThan(argument);
      let lessEqualResult: boolean = current.isLessEqualThan(argument);
      let greaterThanResult: boolean = current.isGreaterThan(argument);
      let greaterEqualResult: boolean = current.isGreaterEqualThan(argument);
      let afterShortValue: short = current.toShort();
      expect(lessThanResult).assertFalse();
      expect(lessEqualResult).assertFalse();
      expect(greaterThanResult).assertTrue();
      expect(greaterEqualResult).assertTrue();
      expect(afterShortValue).assertEqual(beforeShortValue);
      expect(afterShortValue).assertEqual(88 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0900
     * @tc.name testShortIsRelational009
     * @tc.desc Verify all relational methods argument runtime cast from null to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(10 as short);
      try {
        current.isLessThan(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        current.isLessEqualThan(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        current.isGreaterThan(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        current.isGreaterEqualThan(null as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1000
     * @tc.name testShortIsRelational010
     * @tc.desc Verify all relational methods argument runtime cast from undefined to Short throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(10 as short);
      try {
        current.isLessThan(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        current.isLessEqualThan(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        current.isGreaterThan(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        current.isGreaterEqualThan(undefined as Short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1100
     * @tc.name testShortIsRelational011
     * @tc.desc Verify isLessThan returns false when current Short value is greater than the argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(5 as short);
      let smallerArgument: Short = new Short(3 as short);
      let actualResult: boolean = current.isLessThan(smallerArgument);
      expect(actualResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1200
     * @tc.name testShortIsRelational012
     * @tc.desc Verify isLessEqualThan returns true for equal Short.MIN_VALUE operands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Short = new Short(Short.MIN_VALUE);
      let equalArgument: Short = new Short(Short.MIN_VALUE);
      let actualResult: boolean = current.isLessEqualThan(equalArgument);
      expect(actualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1300
     * @tc.name testShortIsRelational013
     * @tc.desc Verify isGreaterThan returns true when Short.MAX_VALUE is compared with its adjacent smaller value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryValue: Short = new Short(Short.MAX_VALUE);
      let adjacentBoundaryValue: Short = new Short(32766 as short);
      let actualResult: boolean = maxBoundaryValue.isGreaterThan(adjacentBoundaryValue);
      expect(actualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1400
     * @tc.name testShortIsRelational014
     * @tc.desc Verify isGreaterEqualThan returns false when a negative Short value is compared with a positive argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeCurrent: Short = new Short((-1) as short);
      let positiveArgument: Short = new Short(1 as short);
      let actualResult: boolean = negativeCurrent.isGreaterEqualThan(positiveArgument);
      expect(actualResult).assertFalse();
    });
  });
}
