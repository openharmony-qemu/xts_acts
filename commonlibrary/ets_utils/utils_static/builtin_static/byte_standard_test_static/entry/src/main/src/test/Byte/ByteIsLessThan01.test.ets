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

export default function ByteIsLessThanTest06_01test(): void {
  describe("ByteIsLessThanTest06_01", () => {
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
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0100
     * @tc.name      testByteIsLessThan0001
     * @tc.desc      Verify isLessThan returns true when comparing smaller positive byte value (30) to larger positive byte value (50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0200
     * @tc.name      testByteIsLessThan0002
     * @tc.desc      Verify isLessThan returns expected result when parameter is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        try {
          b1.isLessThan(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0300
     * @tc.name      testByteIsLessThan0003
     * @tc.desc      Verify isLessThan returns expected result when parameter is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        try {
          b1.isLessThan(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0400
     * @tc.name      testByteIsLessThan0004
     * @tc.desc      Verify isLessThan returns expected result when parameter is false (cast to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let result: boolean = b1.isLessThan(0 as byte);
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0500
     * @tc.name      testByteIsLessThan0005
     * @tc.desc      Verify isLessThan returns expected result when parameter is true (cast to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let result: boolean = b1.isLessThan(1 as byte);
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0600
     * @tc.name      testByteIsLessThan0006
     * @tc.desc      Verify isLessThan does not returns expected result when parameter is valid byte value (70)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        try {
          b1.isLessThan(70 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0700
     * @tc.name      testByteIsLessThan0007
     * @tc.desc      Verify isLessThan bidirectional comparison: smaller (40) < larger (60) returns true, reverse returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 40 as byte;
        let b2: byte = 60 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0800
     * @tc.name      testByteIsLessThan0008
     * @tc.desc      Verify isLessThan returns false when comparing equal byte values (50 and 50) in both directions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_0900
     * @tc.name      testByteIsLessThan0009
     * @tc.desc      Verify isLessThan compares minimum value (-128) to zero (0): -128 < 0 returns true, 0 < -128 returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -128 as byte;
        let b2: byte = 0 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1000
     * @tc.name      testByteIsLessThan0010
     * @tc.desc      Verify isLessThan compares maximum value (127) to (126): 127 < 126 returns false, 126 < 127 returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 127 as byte;
        let b2: byte = 126 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1400
     * @tc.name      testByteIsLessThan0014
     * @tc.desc      Verify isLessThan return type is boolean and 30 < 50 returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let result: boolean = b1.isLessThan(b2);
        expect(typeof result).assertEqual('boolean');
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1500
     * @tc.name      testByteIsLessThan0015
     * @tc.desc      Verify isLessThan return type is boolean and 50 < 30 returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 30 as byte;
        let result: boolean = b1.isLessThan(b2);
        expect(typeof result).assertEqual('boolean');
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1600
     * @tc.name      testByteIsLessThan0016
     * @tc.desc      Verify isLessThan return type is boolean and 40 < 40 returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 40 as byte;
        let b2: byte = 40 as byte;
        let result: boolean = b1.isLessThan(b2);
        expect(typeof result).assertEqual('boolean');
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1700
     * @tc.name      testByteIsLessThan0017
     * @tc.desc      Verify isLessThan returns true when 30 < 80
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 80 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1800
     * @tc.name      testByteIsLessThan0018
     * @tc.desc      Verify isLessThan returns true when comparing negative (-50) to positive (20)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = 20 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_1900
     * @tc.name      testByteIsLessThan0019
     * @tc.desc      Verify isLessThan returns true when comparing minimum (-128) to maximum (127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -128 as byte;
        let b2: byte = 127 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2000
     * @tc.name      testByteIsLessThan0020
     * @tc.desc      Verify isLessThan returns false when comparing larger (80) to smaller (30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 80 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2100
     * @tc.name      testByteIsLessThan0021
     * @tc.desc      Verify isLessThan returns false when comparing positive (20) to negative (-50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 20 as byte;
        let b2: byte = -50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2200
     * @tc.name      testByteIsLessThan0022
     * @tc.desc      Verify isLessThan returns false when comparing maximum (127) to minimum (-128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 127 as byte;
        let b2: byte = -128 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2400
     * @tc.name      testByteIsLessThan0024
     * @tc.desc      Verify isLessThan returns false in both directions when comparing zero values (0 and 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 0 as byte;
        let b2: byte = 0 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2500
     * @tc.name      testByteIsLessThan0025
     * @tc.desc      Verify isLessThan returns false in both directions when comparing equal Byte objects (127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(127 as byte);
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2600
     * @tc.name      testByteIsLessThan0026
     * @tc.desc      Verify isLessThan compares zero, positive (50), and negative (-30) Byte objects correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: Byte = new Byte(0 as byte);
        let bPos: Byte = new Byte(50 as byte);
        let bNeg: Byte = new Byte(-30 as byte);
        expect(bZero.isLessThan(bPos)).assertTrue();
        expect(bZero.isLessThan(bNeg)).assertFalse();
        expect(bPos.isLessThan(bZero)).assertFalse();
        expect(bNeg.isLessThan(bZero)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2700
     * @tc.name      testByteIsLessThan0027
     * @tc.desc      Verify isLessThan compares Byte objects with min, zero, and max values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMax: Byte = new Byte(Byte.MAX_VALUE as byte);
        let bMin: Byte = new Byte(Byte.MIN_VALUE as byte);
        let bMid: Byte = new Byte(0 as byte);
        expect(bMin.isLessThan(bMax)).assertTrue();
        expect(bMid.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bMin)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2800
     * @tc.name      testByteIsLessThan0028
     * @tc.desc      Verify isLessThan returns true when comparing Byte object (-100) to (-50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(-50 as byte);
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_2900
     * @tc.name      testByteIsLessThan0029
     * @tc.desc      Verify isLessThan returns true when comparing Byte object (-128) to (-100)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(-100 as byte);
        expect(b1.isLessThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3000
     * @tc.name      testByteIsLessThan0030
     * @tc.desc      Verify isLessThan returns false when comparing Byte object (-50) to (-100)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(-100 as byte);
        expect(b1.isLessThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3100
     * @tc.name      testByteIsLessThan0031
     * @tc.desc      Verify isLessThan returns true when comparing Byte object minimum (-128) to zero (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMin: Byte = new Byte(-128 as byte);
        let bZero: Byte = new Byte(0 as byte);
        expect(bMin.isLessThan(bZero)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3200
     * @tc.name      testByteIsLessThan0032
     * @tc.desc      Verify isLessThan returns false when comparing Byte object maximum (127) to zero (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMax: Byte = new Byte(Byte.MAX_VALUE as byte);
        let bZero: Byte = new Byte(0 as byte);
        expect(bMax.isLessThan(bZero)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3300
     * @tc.name      testByteIsLessThan0033
     * @tc.desc      Verify isLessThan transitivity with three Byte objects (-100, -80, -50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(-80 as byte);
        let b3: Byte = new Byte(-50 as byte);
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b3)).assertTrue();
        expect(b1.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3500
     * @tc.name      testByteIsLessThan0035
     * @tc.desc      Verify isLessThan returns false when comparing negative values (-20, -50, -128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -20 as byte;
        let b2: byte = -50 as byte;
        let b3: byte = -128 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b3)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3600
     * @tc.name      testByteIsLessThan0036
     * @tc.desc      Verify isLessThan transitivity with three positive values (10, 30, 50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 30 as byte;
        let b3: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b3)).assertTrue();
        expect(b1.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3700
     * @tc.name      testByteIsLessThan0037
     * @tc.desc      Verify isLessThan returns false in reverse comparison with three values (10, 30, 50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 30 as byte;
        let b3: byte = 50 as byte;
        expect(b2.isLessThan(b1)).assertFalse();
        expect(b3.isLessThan(b2)).assertFalse();
        expect(b3.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3800
     * @tc.name      testByteIsLessThan0038
     * @tc.desc      Verify isLessThan returns false when comparing equal pairs (30,30) and (50,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        let b3: byte = 50 as byte;
        let b4: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b3.isLessThan(b4)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_3900
     * @tc.name      testByteIsLessThan0039
     * @tc.desc      Verify isLessThan compares 100 with maximum value (127) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 100 as byte;
        let bMax: byte = 127 as byte;
        expect(b1.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4000
     * @tc.name      testByteIsLessThan0040
     * @tc.desc      Verify isLessThan compares zero (0) with positive value (10) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: byte = 0 as byte;
        let bPos: byte = 10 as byte;
        expect(bZero.isLessThan(bPos)).assertTrue();
        expect(bPos.isLessThan(bZero)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4100
     * @tc.name      testByteIsLessThan0041
     * @tc.desc      Byte isLessThan comparison: adjacent values validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -50, 0, 50, 127];
        let count: int = 0;
        for (let i = 0; i < testValues.length - 1; i++) {
          let currentValue: int = testValues[i];
          let nextValue: int = testValues[i + 1];
          let b1: byte = Int.toByte(currentValue);
          let b2: byte = Int.toByte(nextValue);
          expect(b1.isLessThan(b2)).assertTrue();
          expect(b2.isLessThan(b1)).assertFalse();
          count++;
        }
        let bMax: byte = Int.toByte(127);
        let bMin: byte = Int.toByte(-128);
        expect(bMax.isLessThan(bMin)).assertFalse();
        expect(bMin.isLessThan(bMax)).assertTrue();
        expect(count > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4200
     * @tc.name      testByteIsLessThan0042
     * @tc.desc      Verify isLessThan compares minimum (-128) with next value (-127) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bNext: byte = Int.toByte(testValues[1]);
        expect(bMin.isLessThan(bNext)).assertTrue();
        expect(bNext.isLessThan(bMin)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4300
     * @tc.name      testByteIsLessThan0043
     * @tc.desc      Verify isLessThan compares (126) with maximum value (127) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [126, 127];
        let bPrev: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(bPrev.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bPrev)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4400
     * @tc.name      testByteIsLessThan0044
     * @tc.desc      Verify isLessThan compares positive and negative pairs (1-10) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testNumbers: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        for (let i: int = 0; i < testNumbers.length; i++) {
          let num: int = testNumbers[i];
          let bPos: byte = Int.toByte(num);
          let bNeg: byte = Int.toByte(-num);
          expect(bNeg.isLessThan(bPos)).assertTrue();
          expect(bPos.isLessThan(bNeg)).assertFalse();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4500
     * @tc.name      testByteIsLessThan0045
     * @tc.desc      Verify isLessThan compares (-127) with maximum value (127) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-127, 127];
        let bNegMax: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(bNegMax.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bNegMax)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4600
     * @tc.name      testByteIsLessThan0046
     * @tc.desc      Verify isLessThan compares minimum (-128) with zero (0) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 0];
        let bMin: byte = Int.toByte(testValues[0]);
        let bZero: byte = Int.toByte(testValues[1]);
        expect(bMin.isLessThan(bZero)).assertTrue();
        expect(bZero.isLessThan(bMin)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4700
     * @tc.name      testByteIsLessThan0047
     * @tc.desc      Verify isLessThan returns false when comparing value (88) with itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 88 as byte;
        expect(b.isLessThan(b)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_4900
     * @tc.name      testByteIsLessThan0049
     * @tc.desc      Verify isLessThan returns false when comparing minimum value with itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = Byte.MIN_VALUE as byte;
        expect(b.isLessThan(b)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_5000
     * @tc.name      testByteIsLessThan0050
     * @tc.desc      Verify isLessThan returns false when comparing maximum value with itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = Byte.MAX_VALUE as byte;
        expect(b.isLessThan(b)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_5100
     * @tc.name      testByteIsLessThan0051
     * @tc.desc      Verify isLessThan returns false in both directions when comparing equal values (55,55)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 55 as byte;
        let b2: byte = 55 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_5300
     * @tc.name      testByteIsLessThan0053
     * @tc.desc      Verify isLessThan returns false in both directions when comparing minimum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Byte.MIN_VALUE as byte;
        let b2: byte = Byte.MIN_VALUE as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_5400
     * @tc.name      testByteIsLessThan0054
     * @tc.desc      Verify isLessThan returns false in both directions when comparing maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Byte.MAX_VALUE as byte;
        let b2: byte = Byte.MAX_VALUE as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_5800
     * @tc.name      testByteIsLessThan0058
     * @tc.desc      Verify isLessThan handles boolean cast: either throws ClassCastError or returns valid bool result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let hasError: boolean = false;
        let result: boolean = false;
        try {
          result = b1.isLessThan(true as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError || !result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_5900
     * @tc.name      testByteIsLessThan0059
     * @tc.desc      Verify isLessThan returns expected result when calling on null object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b = null as byte;
          b.isLessThan(50 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6000
     * @tc.name      testByteIsLessThan0060
     * @tc.desc      Verify isLessThan returns expected result when calling on undefined object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b = undefined as byte;
          b.isLessThan(50 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6100
     * @tc.name      testByteIsLessThan0061
     * @tc.desc      Verify isLessThan does not throw when invalid object is cast to byte at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessThan0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b = {} as byte;
          b.isLessThan(50 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6200
     * @tc.name      testByteIsLessThan0062
     * @tc.desc      Verify isLessThan compares positive values (30,50) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6300
     * @tc.name      testByteIsLessThan0063
     * @tc.desc      Verify isLessThan compares negative values (-50,-30) correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6400
     * @tc.name      testByteIsLessThan0064
     * @tc.desc      Verify isLessThan compares minimum (-128) and maximum (127) values correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(bMin.isLessThan(bMax)).assertTrue();
        expect(bMax.isLessThan(bMin)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6500
     * @tc.name      testByteIsLessThan0065
     * @tc.desc      Verify isLessThan transitivity with three positive values (30,50,70)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let b3: byte = 70 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b3)).assertTrue();
        expect(b1.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6600
     * @tc.name      testByteIsLessThan0066
     * @tc.desc      Verify isLessThan transitivity with three negative values (-70,-50,-30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -70 as byte;
        let b2: byte = -50 as byte;
        let b3: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b2.isLessThan(b3)).assertTrue();
        expect(b1.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6700
     * @tc.name      testByteIsLessThan0067
     * @tc.desc      Verify isLessThan transitivity with minimum, zero, and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 0, 127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bMid: byte = Int.toByte(testValues[1]);
        let bMax: byte = Int.toByte(testValues[2]);
        expect(bMin.isLessThan(bMid)).assertTrue();
        expect(bMid.isLessThan(bMax)).assertTrue();
        expect(bMin.isLessThan(bMax)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6800
     * @tc.name      testByteIsLessThan0068
     * @tc.desc      Verify isLessThan and compareTo consistency with positive values (30,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b1.compareTo(b2) < 0).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_6900
     * @tc.name      testByteIsLessThan0069
     * @tc.desc      Verify isLessThan and compareTo consistency with equal values (50,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.compareTo(b2) === 0).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
        expect(b2.compareTo(b1) === 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7000
     * @tc.name      testByteIsLessThan0070
     * @tc.desc      Verify isLessThan and compareTo consistency with negative values (-50,-30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertTrue();
        expect(b1.compareTo(b2) < 0).assertTrue();
        expect(b2.isLessThan(b1)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7100
     * @tc.name      testByteIsLessThan0071
     * @tc.desc      Verify isLessThan and compareTo consistency with equal positive values (30,30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.compareTo(b2)).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7200
     * @tc.name      testByteIsLessThan0072
     * @tc.desc      Verify isLessThan and compareTo consistency with equal negative values (-30,-30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -30 as byte;
        let b2: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.compareTo(b2)).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7300
     * @tc.name      testByteIsLessThan0073
     * @tc.desc      Verify isLessThan and compareTo consistency with minimum and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMin1: byte = Byte.MIN_VALUE as byte;
        let bMin2: byte = Byte.MIN_VALUE as byte;
        let bMax1: byte = Byte.MAX_VALUE as byte;
        let bMax2: byte = Byte.MAX_VALUE as byte;
        expect(bMin1.isLessThan(bMin2)).assertFalse();
        expect(bMin1.compareTo(bMin2)).assertEqual(0);
        expect(bMax1.isLessThan(bMax2)).assertFalse();
        expect(bMax1.compareTo(bMax2)).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7400
     * @tc.name      testByteIsLessThan0074
     * @tc.desc      Verify isLessThan and isGreaterThan consistency with positive values (30,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b2.isGreaterThan(b1));
        expect(b1.isGreaterThan(b2)).assertEqual(b2.isLessThan(b1));
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7500
     * @tc.name      testByteIsLessThan0075
     * @tc.desc      Verify isLessThan and isGreaterThan consistency with negative values (-50,-30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -30 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b2.isGreaterThan(b1));
        expect(b1.isGreaterThan(b2)).assertEqual(b2.isLessThan(b1));
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7600
     * @tc.name      testByteIsLessThan0076
     * @tc.desc      Verify isLessThan and isGreaterThan consistency with equal values (30,30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 30 as byte;
        expect(b1.isLessThan(b2)).assertEqual(b2.isGreaterThan(b1));
        expect(b1.isGreaterThan(b2)).assertEqual(b2.isLessThan(b1));
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7700
     * @tc.name      testByteIsLessThan0077
     * @tc.desc      Verify isLessThan and isGreaterThan consistency with minimum and maximum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, 127];
        let bMin: byte = Int.toByte(testValues[0]);
        let bMax: byte = Int.toByte(testValues[1]);
        expect(bMin.isLessThan(bMax)).assertEqual(bMax.isGreaterThan(bMin));
        expect(bMax.isGreaterThan(bMin)).assertEqual(bMin.isLessThan(bMax));
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7800
     * @tc.name      testByteIsLessThan0078
     * @tc.desc      Verify isLessThan and isLessEqualThan consistency with equal positive values (50,50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.isLessEqualThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_THANONE_7900
     * @tc.name      testByteIsLessThan0079
     * @tc.desc      Verify isLessThan and isLessEqualThan consistency with equal negative values (-50,-50)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteIsLessThan0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -50 as byte;
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.isLessEqualThan(b2)).assertTrue();
      });
  })
}
