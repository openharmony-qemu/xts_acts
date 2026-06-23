/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteIsLessThanTest06_03test(): void {
  describe("ByteIsLessThanTest06_03", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0100
     * @tc.name      testByteIsLessThan0001
     * @tc.desc      Verify isLessThan and isLessEqualThan consistency with minimum and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 127];
        let bMin1: byte = Int.toByte(testValues[0]);
        let bMin2: byte = Int.toByte(testValues[0]);
        let bMax1: byte = Int.toByte(testValues[1]);
        let bMax2: byte = Int.toByte(testValues[1]);
        expect(bMin1.isLessThan(bMin2)).assertFalse();
        expect(bMin1.isLessEqualThan(bMin2)).assertTrue();
        expect(bMax1.isLessThan(bMax2)).assertFalse();
        expect(bMax1.isLessEqualThan(bMax2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0200
     * @tc.name      testByteIsLessThan0002
     * @tc.desc      Verify isLessThan and native operator consistency with positive values (30,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b1.toByte() < b2.toByte());
        expect(b1.toByte() < b2.toByte()).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0300
     * @tc.name      testByteIsLessThan0003
     * @tc.desc      Verify isLessThan and native operator consistency with negative values (-50,-30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b1.toByte() < b2.toByte());
        expect(b1.toByte() < b2.toByte()).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0400
     * @tc.name      testByteIsLessThan0004
     * @tc.desc      Verify isLessThan and native operator consistency with equal values (50,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b1.toByte() < b2.toByte());
        expect(b1.toByte() < b2.toByte()).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0500
     * @tc.name      testByteIsLessThan0005
     * @tc.desc      Verify isLessThan and native operator consistency with minimum and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(bMin.isLessThan(bMax)).assertEqual(bMin.toByte() < bMax.toByte());
        expect(bMin.toByte() < bMax.toByte()).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0600
     * @tc.name      testByteIsLessThan0006
     * @tc.desc      Verify isLessThan method exists on positive byte value (30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 30 as byte;
        expect(typeof b.isLessThan).assertEqual('function');
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0700
     * @tc.name      testByteIsLessThan0007
     * @tc.desc      Verify isLessThan method exists on negative byte value (-30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -30 as byte;
        expect(typeof b.isLessThan).assertEqual('function');
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_0800
     * @tc.name      testByteIsLessThan0008
     * @tc.desc      Verify isLessThan method exists on minimum and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(typeof bMin.isLessThan).assertEqual('function');
        expect(typeof bMax.isLessThan).assertEqual('function');
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_1100
     * @tc.name      testByteIsLessThan0011
     * @tc.desc      Verify isLessThan returns boolean type and correct result for equal values (30,30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        let result: boolean = b1.isLessThan(b2);
        expect(typeof result).assertEqual('boolean');
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_1200
     * @tc.name      testByteIsLessThan0012
     * @tc.desc      Verify all comparison methods exist on Byte value (50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        expect(typeof b.isLessThan).assertEqual('function');
        expect(typeof b.isLessEqualThan).assertEqual('function');
        expect(typeof b.isGreaterThan).assertEqual('function');
        expect(typeof b.isGreaterEqualThan).assertEqual('function');
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_1300
     * @tc.name      testByteIsLessThan0013
     * @tc.desc      Verify all comparison methods exist on negative Byte value (-50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -50 as byte;
        expect(typeof b.isLessThan).assertEqual('function');
        expect(typeof b.isLessEqualThan).assertEqual('function');
        expect(typeof b.isGreaterThan).assertEqual('function');
        expect(typeof b.isGreaterEqualThan).assertEqual('function');
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THAN_1400
     * @tc.name      testByteIsLessThan0014
     * @tc.desc      Verify all comparison methods exist on minimum and maximum Byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMin: byte = Byte.MIN_VALUE as byte;
        let bMax: byte = Byte.MAX_VALUE as byte;
        expect(typeof bMin.isLessThan).assertEqual('function');
        expect(typeof bMin.isLessEqualThan).assertEqual('function');
        expect(typeof bMin.isGreaterThan).assertEqual('function');
        expect(typeof bMin.isGreaterEqualThan).assertEqual('function');
        expect(typeof bMax.isLessThan).assertEqual('function');
        expect(typeof bMax.isLessEqualThan).assertEqual('function');
        expect(typeof bMax.isGreaterThan).assertEqual('function');
        expect(typeof bMax.isGreaterEqualThan).assertEqual('function');
      });
  })
}
