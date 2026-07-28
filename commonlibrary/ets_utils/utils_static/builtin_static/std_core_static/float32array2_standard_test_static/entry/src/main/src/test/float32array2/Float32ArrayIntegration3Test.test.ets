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
import Utils from '../Util.test';

export default function Float32ArrayIntegration3Test(): void {
  describe('Float32ArrayIntegration3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0010
     * @tc.name testFloat32ArrayIntegrationThree001
     * @tc.desc Verify $_get(-length) throws an error for a negative index equal to the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(-3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0020
     * @tc.name testFloat32ArrayIntegrationThree002
     * @tc.desc Verify $_get(-length - 1) throws an error for an out-of-bounds negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(-4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0030
     * @tc.name testFloat32ArrayIntegrationThree003
     * @tc.desc Verify $_get(-2147483648) throws an error for a large negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0040
     * @tc.name testFloat32ArrayIntegrationThree004
     * @tc.desc Verify $_set(-1, value) throws an error for a negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(-1, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0050
     * @tc.name testFloat32ArrayIntegrationThree005
     * @tc.desc Verify $_set(length, value) throws an error for an out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(3, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0060
     * @tc.name testFloat32ArrayIntegrationThree006
     * @tc.desc Verify $_set(length + 1, value) throws an error for an out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(4, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0070
     * @tc.name testFloat32ArrayIntegrationThree007
     * @tc.desc Verify $_set(-length, value) throws an error for a negative index equal to the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(-3, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0080
     * @tc.name testFloat32ArrayIntegrationThree008
     * @tc.desc Verify $_set(-length - 1, value) throws an error for an out-of-bounds negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(-4, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0090
     * @tc.name testFloat32ArrayIntegrationThree009
     * @tc.desc Verify $_set(2147483647, value) throws an error for a large positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(2147483647, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0100
     * @tc.name testFloat32ArrayIntegrationThree010
     * @tc.desc Verify at(length+1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue018 = a.at(4);
      expect(atValue018).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0110
     * @tc.name testFloat32ArrayIntegrationThree011
     * @tc.desc Verify at(2147483647) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue019 = a.at(2147483647);
      expect(atValue019).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0120
     * @tc.name testFloat32ArrayIntegrationThree012
     * @tc.desc Verify at(-2147483648) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue020 = a.at(-2147483648);
      expect(atValue020).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0130
     * @tc.name testFloat32ArrayIntegrationThree013
     * @tc.desc Verify with(length, value) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(3, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0140
     * @tc.name testFloat32ArrayIntegrationThree014
     * @tc.desc Verify with(length+1, value) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(4, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0150
     * @tc.name testFloat32ArrayIntegrationThree015
     * @tc.desc Verify with(-length-1, value) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(-4, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0160
     * @tc.name testFloat32ArrayIntegrationThree016
     * @tc.desc Verify with(2147483647, value) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(2147483647, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0170
     * @tc.name testFloat32ArrayIntegrationThree017
     * @tc.desc Verify with(-2147483648, value) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(-2147483648, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0180
     * @tc.name testFloat32ArrayIntegrationThree018
     * @tc.desc Verify set(source, offset=length) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.set([4.0, 5.0, 6.0], 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0190
     * @tc.name testFloat32ArrayIntegrationThree019
     * @tc.desc Verify set(source, offset=length+1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.set([4.0, 5.0], 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0200
     * @tc.name testFloat32ArrayIntegrationThree020
     * @tc.desc Verify set(, offset=0) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.set([4.0, 5.0, 6.0, 7.0], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0210
     * @tc.name testFloat32ArrayIntegrationThree021
     * @tc.desc Verify set(source, offset=-1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.set([4.0, 5.0], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0220
     * @tc.name testFloat32ArrayIntegrationThree022
     * @tc.desc Verify set(source, offset=2147483647) throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.set([4.0, 5.0], 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0230
     * @tc.name testFloat32ArrayIntegrationThree023
     * @tc.desc Verify copyWithin(target=length, start=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(3, 0);
      const element032 = a.$_get(0);
      expect(element032).assertEqual(1.0);
      const element032Part2 = a.$_get(2);
      expect(element032Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0240
     * @tc.name testFloat32ArrayIntegrationThree024
     * @tc.desc Verify copyWithin(target=length+1, start=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(4, 0);
      expect(a.length).assertEqual(3);
      const element033 = a.$_get(2);
      expect(element033).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0250
     * @tc.name testFloat32ArrayIntegrationThree025
     * @tc.desc Verify copyWithin(target=0, start=2, end=1) start>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(0, 2, 1);
      const element034 = a.$_get(0);
      expect(element034).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0260
     * @tc.name testFloat32ArrayIntegrationThree026
     * @tc.desc Verify copyWithin(target=-1, start=0, end=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(-1, 0, 0);
      const element035 = a.$_get(2);
      expect(element035).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0270
     * @tc.name testFloat32ArrayIntegrationThree027
     * @tc.desc Verify copyWithin(target=-1, start=0, end=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(-1, 0, 1);
      const element036 = a.$_get(2);
      expect(element036).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0280
     * @tc.name testFloat32ArrayIntegrationThree028
     * @tc.desc Verify fill(value, start=length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.fill(9.0, 3);
      const element037 = a.$_get(0);
      expect(element037).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0290
     * @tc.name testFloat32ArrayIntegrationThree029
     * @tc.desc Verify fill(value, start=length+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.fill(9.0, 4);
      const element038 = a.$_get(2);
      expect(element038).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0300
     * @tc.name testFloat32ArrayIntegrationThree030
     * @tc.desc Verify fill(value, start=2, end=1) start>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.fill(9.0, 2, 1);
      const element039 = a.$_get(2);
      expect(element039).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0310
     * @tc.name testFloat32ArrayIntegrationThree031
     * @tc.desc Verify fill(value, start=-1, end=-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.fill(9.0, -1, -1);
      const element040 = a.$_get(2);
      expect(element040).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0320
     * @tc.name testFloat32ArrayIntegrationThree032
     * @tc.desc Verify fill(value, start=-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.fill(9.0, -1);
      const element041 = a.$_get(2);
      expect(element041).assertEqual(9.0);
      const element041Part2 = a.$_get(0);
      expect(element041Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0330
     * @tc.name testFloat32ArrayIntegrationThree033
     * @tc.desc Verify subarray(length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const v = a.subarray(3);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0340
     * @tc.name testFloat32ArrayIntegrationThree034
     * @tc.desc Verify subarray(length+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const v = a.subarray(4);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0350
     * @tc.name testFloat32ArrayIntegrationThree035
     * @tc.desc Verify subarray(-length - 1) clamps the negative begin to 0 and returns the full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const v = a.subarray(-4);
      expect(v.length).assertEqual(3);
      const element044 = v.$_get(0);
      expect(element044).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0360
     * @tc.name testFloat32ArrayIntegrationThree036
     * @tc.desc Verify subarray(begin=2, end=1) begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const v = a.subarray(2, 1);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0370
     * @tc.name testFloat32ArrayIntegrationThree037
     * @tc.desc Verify slice(length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.slice(3);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0380
     * @tc.name testFloat32ArrayIntegrationThree038
     * @tc.desc Verify slice(length+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.slice(4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0390
     * @tc.name testFloat32ArrayIntegrationThree039
     * @tc.desc Verify slice(-length-1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.slice(-4);
      expect(r.length).assertEqual(3);
      const element048 = r.$_get(0);
      expect(element048).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0400
     * @tc.name testFloat32ArrayIntegrationThree040
     * @tc.desc Verify slice(begin=2, end=1) begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.slice(2, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0410
     * @tc.name testFloat32ArrayIntegrationThree041
     * @tc.desc Verify new Float32Array(-2.9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-2.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0420
     * @tc.name testFloat32ArrayIntegrationThree042
     * @tc.desc Verify new Float32Array(buf, byteOffset=6) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0430
     * @tc.name testFloat32ArrayIntegrationThree043
     * @tc.desc Verify new Float32Array(buf, byteOffset=12) buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 12);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0440
     * @tc.name testFloat32ArrayIntegrationThree044
     * @tc.desc Verify new Float32Array(0buffer, 0, length=1) 0 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      try {
        new Float32Array(buf, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0450
     * @tc.name testFloat32ArrayIntegrationThree045
     * @tc.desc Verify new Float32Array(4buffer, 4, length=1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try {
        new Float32Array(buf, 4, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0460
     * @tc.name testFloat32ArrayIntegrationThree046
     * @tc.desc Verify reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      try {
        a.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0470
     * @tc.name testFloat32ArrayIntegrationThree047
     * @tc.desc Verify reduceRight initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      try {
        a.reduceRight((acc: number, v: number, index: int, array: Float32Array): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0480
     * @tc.name testFloat32ArrayIntegrationThree048
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 5.0);
      expect(r).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0490
     * @tc.name testFloat32ArrayIntegrationThree049
     * @tc.desc Verify reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.reduceRight((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 5.0);
      expect(r).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0500
     * @tc.name testFloat32ArrayIntegrationThree050
     * @tc.desc Verify map propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      let called = 0;
      try {
        a.map((v: number, index: int, array: Float32Array): number => { called++; throw new Error('map-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('map-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0510
     * @tc.name testFloat32ArrayIntegrationThree051
     * @tc.desc Verify filter propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([2.0, 4.0, 6.0]);
      let called = 0;
      try {
        a.filter((v: number, index: int, array: Float32Array): boolean => { called++; throw new Error('filter-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('filter-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0520
     * @tc.name testFloat32ArrayIntegrationThree052
     * @tc.desc Verify forEach propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.5, 2.5]);
      let called = 0;
      try {
        a.forEach((v: number, index: int, array: Float32Array): void => { called++; throw new Error('forEach-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('forEach-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0530
     * @tc.name testFloat32ArrayIntegrationThree053
     * @tc.desc Verify some propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0]);
      let called = 0;
      try {
        a.some((v: number, index: int, array: Float32Array): boolean => { called++; throw new Error('some-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('some-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0540
     * @tc.name testFloat32ArrayIntegrationThree054
     * @tc.desc Verify every propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([3.0, 4.0]);
      let called = 0;
      try {
        a.every((v: number, index: int, array: Float32Array): boolean => { called++; throw new Error('every-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('every-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0550
     * @tc.name testFloat32ArrayIntegrationThree055
     * @tc.desc Verify find propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0, 6.0]);
      let called = 0;
      try {
        a.find((v: number, index: int, array: Float32Array): boolean => { called++; throw new Error('find-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('find-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0560
     * @tc.name testFloat32ArrayIntegrationThree056
     * @tc.desc Verify findIndex propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0, 8.0]);
      let called = 0;
      try {
        a.findIndex((v: number, index: int, array: Float32Array): boolean => { called++; throw new Error('findIndex-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('findIndex-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0570
     * @tc.name testFloat32ArrayIntegrationThree057
     * @tc.desc Verify findLast propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([9.0, 10.0]);
      let called = 0;
      try {
        a.findLast((v: number, index: int, array: Float32Array): boolean => {
          called++;
          throw new Error('findLast-throws');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('findLast-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0580
     * @tc.name testFloat32ArrayIntegrationThree058
     * @tc.desc Verify findLastIndex propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([11.0, 12.0]);
      let called = 0;
      try {
        a.findLastIndex((v: number, index: int, array: Float32Array): boolean => {
          called++;
          throw new Error('findLastIndex-throws');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('findLastIndex-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0590
     * @tc.name testFloat32ArrayIntegrationThree059
     * @tc.desc Verify reduce propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0]);
      let called = 0;
      try {
        a.reduce((acc: number, v: number, index: int, array: Float32Array): number => { called++; throw new Error('reduce-throws'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('reduce-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0600
     * @tc.name testFloat32ArrayIntegrationThree060
     * @tc.desc Verify reduceRight propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([3.0, 4.0]);
      let called = 0;
      try {
        a.reduceRight((acc: number, v: number, index: int, array: Float32Array): number => { called++; throw new Error('reduceRight-throws'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('reduceRight-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0610
     * @tc.name testFloat32ArrayIntegrationThree061
     * @tc.desc Verify sort propagates callback Error and calls callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([3.0, 1.0, 2.0]);
      let called = 0;
      try {
        a.sort((x: number, y: number): int => { called++; throw new Error('sort-throws'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('sort-throws');
        expect(called).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0620
     * @tc.name testFloat32ArrayIntegrationThree062
     * @tc.desc Verify toSorted() returns a new sorted array and leaves the original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([2.0, 3.0, 1.0]);
      const r = a.toSorted();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
      expect(r.$_get(2)).assertEqual(3.0);
      expect(a.$_get(0)).assertEqual(2.0);
      expect(a.$_get(1)).assertEqual(3.0);
      expect(a.$_get(2)).assertEqual(1.0);
      const sameRef = r === a;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0630
     * @tc.name testFloat32ArrayIntegrationThree063
     * @tc.desc Verify reduce U number|undefined undefined undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0]);
      const r = a.reduce<number | undefined>((acc: number | undefined, v: number, index: int, array: Float32Array): number | undefined => undefined, 0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0640
     * @tc.name testFloat32ArrayIntegrationThree064
     * @tc.desc Verify reduceRight U number|undefined undefined undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0]);
      const r =
        a.reduceRight<number | undefined>((acc: number | undefined, v: number, index: int, array: Float32Array): number | undefined => undefined, 0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0650
     * @tc.name testFloat32ArrayIntegrationThree065
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.find((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0660
     * @tc.name testFloat32ArrayIntegrationThree066
     * @tc.desc Verify findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.findIndex((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0670
     * @tc.name testFloat32ArrayIntegrationThree067
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.findLastIndex((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0680
     * @tc.name testFloat32ArrayIntegrationThree068
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.some((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0690
     * @tc.name testFloat32ArrayIntegrationThree069
     * @tc.desc Verify every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.every((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0700
     * @tc.name testFloat32ArrayIntegrationThree070
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.every((v: number, index: int, array: Float32Array): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0710
     * @tc.name testFloat32ArrayIntegrationThree071
     * @tc.desc Verify filter does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.filter((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r.length).assertEqual(0);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1.0);
      expect(a.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0720
     * @tc.name testFloat32ArrayIntegrationThree072
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.some((v: number, index: int, array: Float32Array): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0730
     * @tc.name testFloat32ArrayIntegrationThree073
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.every((v: number, index: int, array: Float32Array): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0740
     * @tc.name testFloat32ArrayIntegrationThree074
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.find((v: number, index: int, array: Float32Array): boolean => true);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0750
     * @tc.name testFloat32ArrayIntegrationThree075
     * @tc.desc Verify findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.findIndex((v: number, index: int, array: Float32Array): boolean => true);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0760
     * @tc.name testFloat32ArrayIntegrationThree076
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.findLastIndex((v: number, index: int, array: Float32Array): boolean => true);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0770
     * @tc.name testFloat32ArrayIntegrationThree077
     * @tc.desc Verify forEach on an empty Float32Array does not invoke the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      let called = 0;
      a.forEach((v: number, index: int, array: Float32Array): void => {
        called++;
      });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0780
     * @tc.name testFloat32ArrayIntegrationThree078
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const r = a.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 7.0);
      expect(r).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0790
     * @tc.name testFloat32ArrayIntegrationThree079
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const indexValue094 = a.indexOf(1.0);
      expect(indexValue094).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0800
     * @tc.name testFloat32ArrayIntegrationThree080
     * @tc.desc Verify lastIndexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const lastIndexValue095 = a.lastIndexOf(1.0);
      expect(lastIndexValue095).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0810
     * @tc.name testFloat32ArrayIntegrationThree081
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const predicateResult096 = a.includes(1.0);
      expect(predicateResult096).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0820
     * @tc.name testFloat32ArrayIntegrationThree082
     * @tc.desc Verify values().next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const it = a.values();
      const n = it.next();
      expect(n.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0830
     * @tc.name testFloat32ArrayIntegrationThree083
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const r = a.some((v: number, index: int, array: Float32Array): boolean => v === 7.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0840
     * @tc.name testFloat32ArrayIntegrationThree084
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const r = a.some((v: number, index: int, array: Float32Array): boolean => v > 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0850
     * @tc.name testFloat32ArrayIntegrationThree085
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const r = a.every((v: number, index: int, array: Float32Array): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0860
     * @tc.name testFloat32ArrayIntegrationThree086
     * @tc.desc Verify find(v===7.0) returns 7.0 on a single-element Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const r = a.find((v: number, index: int, array: Float32Array): boolean => v === 7.0);
      expect(r).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0870
     * @tc.name testFloat32ArrayIntegrationThree087
     * @tc.desc Verify findIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const r = a.findIndex((v: number, index: int, array: Float32Array): boolean => v === 7.0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0880
     * @tc.name testFloat32ArrayIntegrationThree088
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const r = a.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v);
      expect(r).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0890
     * @tc.name testFloat32ArrayIntegrationThree089
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const atValue105 = a.at(0);
      expect(atValue105).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0900
     * @tc.name testFloat32ArrayIntegrationThree090
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([7.0]);
      const atValue106 = a.at(-1);
      expect(atValue106).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0910
     * @tc.name testFloat32ArrayIntegrationThree091
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0, 5.0, 5.0]);
      const indexValue107 = a.indexOf(5.0);
      expect(indexValue107).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0920
     * @tc.name testFloat32ArrayIntegrationThree092
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0, 5.0, 5.0]);
      const lastIndexValue108 = a.lastIndexOf(5.0);
      expect(lastIndexValue108).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0930
     * @tc.name testFloat32ArrayIntegrationThree093
     * @tc.desc Verify find(v===5.0) on [5,5,5] returns 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0, 5.0, 5.0]);
      const r = a.find((v: number, index: int, array: Float32Array): boolean => v === 5.0);
      expect(r).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0940
     * @tc.name testFloat32ArrayIntegrationThree094
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0, 5.0, 5.0]);
      const r = a.some((v: number, index: int, array: Float32Array): boolean => v === 5.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0950
     * @tc.name testFloat32ArrayIntegrationThree095
     * @tc.desc Verify sort returns array with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0, 5.0, 5.0]);
      a.sort();
      expect(a.length).assertEqual(3);
      const element111 = a.$_get(0);
      expect(element111).assertEqual(5.0);
      const element111Part2 = a.$_get(2);
      expect(element111Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0960
     * @tc.name testFloat32ArrayIntegrationThree096
     * @tc.desc Verify $_set NaN $_get NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0]);
      a.$_set(0, Number.NaN);
      const element112 = a.$_get(0);
      expect(element112).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0970
     * @tc.name testFloat32ArrayIntegrationThree097
     * @tc.desc Verify indexOf NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([Number.NaN, 2.0, 3.0]);
      const indexValue113 = a.indexOf(Number.NaN);
      expect(indexValue113).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0980
     * @tc.name testFloat32ArrayIntegrationThree098
     * @tc.desc Verify includes NaN true indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([Number.NaN, 2.0, 3.0]);
      const predicateResult114 = a.includes(Number.NaN);
      expect(predicateResult114).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_0990
     * @tc.name testFloat32ArrayIntegrationThree099
     * @tc.desc Verify fill(value, undefined) start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.fill(9.0, undefined);
      const element115 = a.$_get(0);
      expect(element115).assertEqual(9.0);
      const element115Part2 = a.$_get(2);
      expect(element115Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_THREE_1000
     * @tc.name testFloat32ArrayIntegrationThree100
     * @tc.desc Verify slice(0, undefined) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationThree100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.slice(0, undefined);
      expect(r.length).assertEqual(3);
      const element116 = r.$_get(2);
      expect(element116).assertEqual(3.0);
    });

  });
}

