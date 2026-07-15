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

export default function Float32ArrayFill3Test(): void {
  describe('Float32ArrayFill3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0010
     * @tc.name testFloat32ArrayFillTHREE001
     * @tc.desc Verify E overload 1 parameter value fills the entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const vf = 3;
      arr.fill(vf);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0020
     * @tc.name testFloat32ArrayFillTHREE002
     * @tc.desc Verify E overload 2 parameters value and start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 0;
      arr.fill(vf, 2);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0030
     * @tc.name testFloat32ArrayFillTHREE003
     * @tc.desc Verify E overload 3 parameters value and start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const vf = 9;
      arr.fill(vf, 1, 3);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0040
     * @tc.name testFloat32ArrayFillTHREE004
     * @tc.desc Verify the two overloads 1-parameter full fill dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array(3);
      const vf = 6;
      a1.fill(vf);
      const a2 = new Float32Array(3);
      a2.fill(6);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
      expect(a1.toString()).assertEqual(a2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0050
     * @tc.name testFloat32ArrayFillTHREE005
     * @tc.desc Verify the two overloads 3-parameter range fill dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 7;
      a1.fill(vf, 1, 3);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(7, 1, 3);
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(3)).assertEqual(a2.$_get(3));
      expect(a1.toString()).assertEqual(a2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0060
     * @tc.name testFloat32ArrayFillTHREE006
     * @tc.desc Verify value of 0 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0]);
      const vf = 0;
      a1.fill(vf);
      const a2 = new Float32Array([1.0, 2.0]);
      a2.fill(0);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0070
     * @tc.name testFloat32ArrayFillTHREE007
     * @tc.desc Verify value of 1 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 1;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0080
     * @tc.name testFloat32ArrayFillTHREE008
     * @tc.desc Verify value of -1 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = -1;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(-1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0090
     * @tc.name testFloat32ArrayFillTHREE009
     * @tc.desc Verify value of 2 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 2;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(2);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0100
     * @tc.name testFloat32ArrayFillTHREE010
     * @tc.desc Verify value of 0.5 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 0.5;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(0.5);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0110
     * @tc.name testFloat32ArrayFillTHREE011
     * @tc.desc Verify value of -0.5 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = -0.5;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(-0.5);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0120
     * @tc.name testFloat32ArrayFillTHREE012
     * @tc.desc Verify value of 1.5 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 1.5;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(1.5);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0130
     * @tc.name testFloat32ArrayFillTHREE013
     * @tc.desc Verify value of 2.5 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 2.5;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(2.5);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0140
     * @tc.name testFloat32ArrayFillTHREE014
     * @tc.desc Verify value of -0.125 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = -0.125;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(-0.125);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-0.125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0150
     * @tc.name testFloat32ArrayFillTHREE015
     * @tc.desc Verify value of 16 number path uses 0x10 the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 16;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(0x10);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0160
     * @tc.name testFloat32ArrayFillTHREE016
     * @tc.desc Verify value of 255 number path uses 0xFF the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 255;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(0xFF);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0170
     * @tc.name testFloat32ArrayFillTHREE017
     * @tc.desc Verify value of 65536 number path uses 0x10000 the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 65536;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(0x10000);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0180
     * @tc.name testFloat32ArrayFillTHREE018
     * @tc.desc Verify value of 1048576 number path uses 0x100000 the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 1048576;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(0x100000);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1048576);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0190
     * @tc.name testFloat32ArrayFillTHREE019
     * @tc.desc Verify value of 1000 number path uses 1.0e3 the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 1000;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(1.0e3);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0200
     * @tc.name testFloat32ArrayFillTHREE020
     * @tc.desc Verify value of 8388608 i.e. 2 to the 23rd power the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 8388608;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(8388608);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0210
     * @tc.name testFloat32ArrayFillTHREE021
     * @tc.desc Verify value of 16777216 i.e. 2 to the 24th power the two overloads results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 16777216;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(16777216);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0220
     * @tc.name testFloat32ArrayFillTHREE022
     * @tc.desc Verify value of -8388608 the two overloads dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = -8388608;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(-8388608);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0230
     * @tc.name testFloat32ArrayFillTHREE023
     * @tc.desc Verify value of 16777215 i.e. 2 to the 24th power minus 1 exactly represented the two overloads consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0, 0.0]);
      const vf = 16777215;
      a1.fill(vf);
      const a2 = new Float32Array([0.0, 0.0]);
      a2.fill(16777215);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0240
     * @tc.name testFloat32ArrayFillTHREE024
     * @tc.desc Verify E overload start of 0 explicitly fills from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 5;
      arr.fill(vf, 0);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0250
     * @tc.name testFloat32ArrayFillTHREE025
     * @tc.desc Verify number overload start of 1 fills from the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(5, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0260
     * @tc.name testFloat32ArrayFillTHREE026
     * @tc.desc Verify the two overloads start of 2 dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 9;
      a1.fill(vf, 2);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(9, 2);
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
      expect(a1.$_get(0)).assertEqual(1);
      expect(a2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0270
     * @tc.name testFloat32ArrayFillTHREE027
     * @tc.desc Verify E overload start of length minus 1 fills only the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 7;
      arr.fill(vf, 3);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0280
     * @tc.name testFloat32ArrayFillTHREE028
     * @tc.desc Verify number overload start of length is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(7, 3);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0290
     * @tc.name testFloat32ArrayFillTHREE029
     * @tc.desc Verify the two overloads start of -1 wraps around to the end dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 8;
      a1.fill(vf, -1);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(8, -1);
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
      expect(a1.$_get(2)).assertEqual(8);
      expect(a1.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0300
     * @tc.name testFloat32ArrayFillTHREE030
     * @tc.desc Verify the two overloads start of -length wraps around to the first element dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 0;
      a1.fill(vf, -3);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(0, -3);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0);
      expect(a1.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0310
     * @tc.name testFloat32ArrayFillTHREE031
     * @tc.desc Verify the two overloads start of 2 and end of 3 dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 6;
      a1.fill(vf, 2, 3);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(6, 2, 3);
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
      expect(a1.$_get(2)).assertEqual(6);
      expect(a1.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0320
     * @tc.name testFloat32ArrayFillTHREE032
     * @tc.desc Verify the two overloads start greater than end is a no-op dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 9;
      a1.fill(vf, 2, 1);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(9, 2, 1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(16);
      expect(a1.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0330
     * @tc.name testFloat32ArrayFillTHREE033
     * @tc.desc Verify E overload start negative value less than negative length clamps to 0 full fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 5;
      arr.fill(vf, -10);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0340
     * @tc.name testFloat32ArrayFillTHREE034
     * @tc.desc Verify number overload start of -2 fills the last two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(5, -2);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0350
     * @tc.name testFloat32ArrayFillTHREE035
     * @tc.desc Verify E overload end defaults to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 7;
      arr.fill(vf, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0360
     * @tc.name testFloat32ArrayFillTHREE036
     * @tc.desc Verify number overload end defaults to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.fill(7, 2);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0370
     * @tc.name testFloat32ArrayFillTHREE037
     * @tc.desc Verify the two overloads end of 1 dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 9;
      a1.fill(vf, 0, 1);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(9, 0, 1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(9);
      expect(a1.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0380
     * @tc.name testFloat32ArrayFillTHREE038
     * @tc.desc Verify the two overloads end of length explicit and default are equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 4;
      a1.fill(vf, 0, 3);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(vf);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
      expect(a1.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0390
     * @tc.name testFloat32ArrayFillTHREE039
     * @tc.desc Verify the two overloads end of 0 is a no-op dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 5;
      a1.fill(vf, 0, 0);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(5, 0, 0);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0400
     * @tc.name testFloat32ArrayFillTHREE040
     * @tc.desc Verify the two overloads end of -1 excludes the last dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 6;
      a1.fill(vf, 0, -1);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(6, 0, -1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(2)).assertEqual(6);
      expect(a1.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0410
     * @tc.name testFloat32ArrayFillTHREE041
     * @tc.desc Verify the two overloads end of -length clamps to 0 is a no-op dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 0;
      a1.fill(vf, 0, -4);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(0, 0, -4);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1);
      expect(a1.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0420
     * @tc.name testFloat32ArrayFillTHREE042
     * @tc.desc Verify the two overloads end of 2 dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 8;
      a1.fill(vf, 0, 2);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(8, 0, 2);
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(1)).assertEqual(8);
      expect(a1.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0430
     * @tc.name testFloat32ArrayFillTHREE043
     * @tc.desc Verify the two overloads end greater than length clamps dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 2;
      a1.fill(vf, 1, 100);
      const a2 = Float32Array.of(0x10, 0b1010, -1.0);
      a2.fill(2, 1, 100);
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(1)).assertEqual(2);
      expect(a1.$_get(2)).assertEqual(2);
      expect(a1.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0440
     * @tc.name testFloat32ArrayFillTHREE044
     * @tc.desc Verify the two overloads start of -2 and end of -1 filling only second-to-last dispatch results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 7;
      a1.fill(vf, -2, -1);
      const a2 = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      a2.fill(7, -2, -1);
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
      expect(a1.$_get(2)).assertEqual(7);
      expect(a1.$_get(1)).assertEqual(2);
      expect(a1.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0450
     * @tc.name testFloat32ArrayFillTHREE045
     * @tc.desc Verify E overload fills using a standalone float variable and verifies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 4;
      arr.fill(vf);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.toString()).assertEqual("4,4,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0460
     * @tc.name testFloat32ArrayFillTHREE046
     * @tc.desc Verify number overload fills using a standalone number literal and verifies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(4);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.toString()).assertEqual("4,4,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0470
     * @tc.name testFloat32ArrayFillTHREE047
     * @tc.desc Verify E overload 3 parameters full fill of a range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const vf = 0;
      arr.fill(vf, 1, 4);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0480
     * @tc.name testFloat32ArrayFillTHREE048
     * @tc.desc Verify number overload 3 parameters full fill of a range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.fill(0, 1, 4);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0490
     * @tc.name testFloat32ArrayFillTHREE049
     * @tc.desc Verify the same array first E overload then number overload mixed fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 7;
      arr.fill(vf, 0, 2);
      arr.fill(8, 2, 4);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0500
     * @tc.name testFloat32ArrayFillTHREE050
     * @tc.desc Verify the two overloads returned instance's length and byteLength and toString cross-overload comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0]);
      const vf = 3;
      const r1 = a1.fill(vf);
      const a2 = new Float32Array([1.0, 2.0]);
      const r2 = a2.fill(3);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.byteLength).assertEqual(r2.byteLength);
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0510
     * @tc.name testFloat32ArrayFillTHREE051
     * @tc.desc Verify E overload returns this and writing through the returned reference is visible in the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 5;
      const ret = arr.fill(vf);
      ret.$_set(0, 9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0520
     * @tc.name testFloat32ArrayFillTHREE052
     * @tc.desc Verify number overload returns this and writing through the returned reference is visible in the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const ret = arr.fill(5);
      ret.$_set(2, 9);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0530
     * @tc.name testFloat32ArrayFillTHREE053
     * @tc.desc Verify the two overloads returned references both share the same identity with the original array verified through writing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0, 2.0]);
      const vf = 3;
      const r1 = a1.fill(vf);
      const a2 = new Float32Array([1.0, 2.0]);
      const r2 = a2.fill(3);
      r1.$_set(0, 8);
      r2.$_set(0, 8);
      expect(a1.$_get(0)).assertEqual(8);
      expect(a2.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0540
     * @tc.name testFloat32ArrayFillTHREE054
     * @tc.desc Verify E overload return value length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const vf = 2;
      const ret = arr.fill(vf, 1, 3);
      expect(ret.length).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0550
     * @tc.name testFloat32ArrayFillTHREE055
     * @tc.desc Verify number overload return value length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const ret = arr.fill(2, 1, 3);
      expect(ret.length).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0560
     * @tc.name testFloat32ArrayFillTHREE056
     * @tc.desc Verify E overload return value toString reflects the fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 7;
      const ret = arr.fill(vf);
      expect(ret.toString()).assertEqual("7,7,7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0570
     * @tc.name testFloat32ArrayFillTHREE057
     * @tc.desc Verify number overload return value toString reflects the fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const ret = arr.fill(7);
      expect(ret.toString()).assertEqual("7,7,7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0580
     * @tc.name testFloat32ArrayFillTHREE058
     * @tc.desc Verify the two overloads same value fill toString cross-overload consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array(3);
      const vf = 4;
      a1.fill(vf);
      const a2 = new Float32Array(3);
      a2.fill(4);
      expect(a1.toString()).assertEqual(a2.toString());
      expect(a1.toString()).assertEqual("4,4,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0590
     * @tc.name testFloat32ArrayFillTHREE059
     * @tc.desc Verify E overload after filling byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      const vf = 6;
      arr.fill(vf);
      expect(arr.byteLength).assertEqual(before);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0600
     * @tc.name testFloat32ArrayFillTHREE060
     * @tc.desc Verify number overload after filling byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.fill(6);
      expect(arr.byteLength).assertEqual(before);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0610
     * @tc.name testFloat32ArrayFillTHREE061
     * @tc.desc Verify offset view after filling byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      const before = arr.byteOffset;
      arr.fill(3);
      expect(arr.byteOffset).assertEqual(before);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0620
     * @tc.name testFloat32ArrayFillTHREE062
     * @tc.desc Verify after filling buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const bufBefore = arr.buffer;
      arr.fill(5);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0630
     * @tc.name testFloat32ArrayFillTHREE063
     * @tc.desc Verify E overload return value can be read via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 8;
      const ret = arr.fill(vf);
      expect(ret.$_get(0)).assertEqual(8);
      expect(ret.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0640
     * @tc.name testFloat32ArrayFillTHREE064
     * @tc.desc Verify E overload return value after filling can still be written via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 8;
      const ret = arr.fill(vf);
      ret.$_set(1, 99);
      expect(ret.$_get(1)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0650
     * @tc.name testFloat32ArrayFillTHREE065
     * @tc.desc Verify number overload return value after filling can still be written via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const ret = arr.fill(8);
      ret.$_set(0, 50);
      expect(ret.$_get(0)).assertEqual(50);
      expect(arr.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0660
     * @tc.name testFloat32ArrayFillTHREE066
     * @tc.desc Verify E overload fill chained call to fill result is the last fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const a = 4;
      const b = 5;
      arr.fill(a).fill(b);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0670
     * @tc.name testFloat32ArrayFillTHREE067
     * @tc.desc Verify cross-overload fill chained call E overload followed by number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 4;
      arr.fill(vf).fill(6);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0680
     * @tc.name testFloat32ArrayFillTHREE068
     * @tc.desc Verify E overload filling NaN does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const nf = NaN;
      arr.fill(nf);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0690
     * @tc.name testFloat32ArrayFillTHREE069
     * @tc.desc Verify number overload filling Infinity does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(Infinity);
      expect(arr.$_get(0)).assertEqual(Infinity);
      expect(arr.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0700
     * @tc.name testFloat32ArrayFillTHREE070
     * @tc.desc Verify E overload start greater than or equal to end is a no-op does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 9;
      arr.fill(vf, 2, 1);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0710
     * @tc.name testFloat32ArrayFillTHREE071
     * @tc.desc Verify number overload negative start and negative end wrap around fill does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(9, -2, -1);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0720
     * @tc.name testFloat32ArrayFillTHREE072
     * @tc.desc Verify E overload start greater than length clamps is a no-op does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const vf = 9;
      arr.fill(vf, 10, 20);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0730
     * @tc.name testFloat32ArrayFillTHREE073
     * @tc.desc Verify number overload empty array fill does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      arr.fill(5);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0740
     * @tc.name testFloat32ArrayFillTHREE074
     * @tc.desc Verify empty array after filling through shared buffer verifies identity preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const bufBefore = arr.buffer;
      const ret = arr.fill(5);
      expect(ret.buffer).assertEqual(bufBefore);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0750
     * @tc.name testFloat32ArrayFillTHREE075
     * @tc.desc Verify after with throws fill still applies normally proving the exception does not affect subsequent fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.with(100, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const vf = 6;
      arr.fill(vf);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0760
     * @tc.name testFloat32ArrayFillTHREE076
     * @tc.desc Verify 0.1 filled via both overloads both truncate to the same float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 0.1;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(0.1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0770
     * @tc.name testFloat32ArrayFillTHREE077
     * @tc.desc Verify 0.2 filled via both overloads both truncate to the same float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 0.2;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(0.2);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0780
     * @tc.name testFloat32ArrayFillTHREE078
     * @tc.desc Verify 0.3 filled via both overloads both truncate to the same float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 0.3;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(0.3);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0790
     * @tc.name testFloat32ArrayFillTHREE079
     * @tc.desc Verify 1.0000001 filled via both overloads both truncate to the same float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 1.0000001;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(1.0000001);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0800
     * @tc.name testFloat32ArrayFillTHREE080
     * @tc.desc Verify 1.1 filled via both overloads both truncate to the same float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 1.1;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(1.1);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0810
     * @tc.name testFloat32ArrayFillTHREE081
     * @tc.desc Verify 16777217 filled via both overloads both truncate to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 16777217;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(16777217);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0820
     * @tc.name testFloat32ArrayFillTHREE082
     * @tc.desc Verify 2147483647 filled via both overloads both truncate to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 2147483647;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(2147483647);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0830
     * @tc.name testFloat32ArrayFillTHREE083
     * @tc.desc Verify -2147483648 filled via both overloads exactly preserves -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = -2147483648;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(-2147483648);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0840
     * @tc.name testFloat32ArrayFillTHREE084
     * @tc.desc Verify NaN filled via both overloads both stored as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const nf = NaN;
      a1.fill(nf);
      const a2 = new Float32Array([0.0]);
      a2.fill(NaN);
      expect(a1.$_get(0)).assertNaN();
      expect(a2.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0850
     * @tc.name testFloat32ArrayFillTHREE085
     * @tc.desc Verify positive Infinity filled via both overloads both stored as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const inf = Infinity;
      a1.fill(inf);
      const a2 = new Float32Array([0.0]);
      a2.fill(Infinity);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0860
     * @tc.name testFloat32ArrayFillTHREE086
     * @tc.desc Verify negative Infinity filled via both overloads both stored as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const ninf = -Infinity;
      a1.fill(ninf);
      const a2 = new Float32Array([0.0]);
      a2.fill(-Infinity);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0870
     * @tc.name testFloat32ArrayFillTHREE087
     * @tc.desc Verify Float32 max value filled via both overloads exactly preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const maxf = 3.4028234663852886e+38;
      a1.fill(maxf);
      const a2 = new Float32Array([0.0]);
      a2.fill(3.4028234663852886e+38);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0880
     * @tc.name testFloat32ArrayFillTHREE088
     * @tc.desc Verify Float32 minimum finite negative value filled via both overloads exactly preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const minf = -3.4028234663852886e+38;
      a1.fill(minf);
      const a2 = new Float32Array([0.0]);
      a2.fill(-3.4028234663852886e+38);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0890
     * @tc.name testFloat32ArrayFillTHREE089
     * @tc.desc Verify Float32 minimum normal number filled via both overloads exactly preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const mnf = 1.1754943508222875e-38;
      a1.fill(mnf);
      const a2 = new Float32Array([0.0]);
      a2.fill(1.1754943508222875e-38);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0900
     * @tc.name testFloat32ArrayFillTHREE090
     * @tc.desc Verify Float32 minimum subnormal number filled via both overloads exactly preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const mvf = 1.401298464324817e-45;
      a1.fill(mvf);
      const a2 = new Float32Array([0.0]);
      a2.fill(1.401298464324817e-45);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0910
     * @tc.name testFloat32ArrayFillTHREE091
     * @tc.desc Verify positive zero filled via both overloads both stored as positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0]);
      const zf = 0;
      a1.fill(zf);
      const a2 = new Float32Array([1.0]);
      a2.fill(0);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0);
      expect(1 / a1.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0920
     * @tc.name testFloat32ArrayFillTHREE092
     * @tc.desc Verify negative zero filled via both overloads both stored as negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0]);
      const nzf = -0.0;
      a1.fill(nzf);
      const a2 = new Float32Array([1.0]);
      a2.fill(-0.0);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(1 / a1.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0930
     * @tc.name testFloat32ArrayFillTHREE093
     * @tc.desc Verify 1.0e40 overflows filled via number overload as Infinity is consistent with E overload Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      a1.fill(1.0e40);
      const a2 = new Float32Array([0.0]);
      const inf = Infinity;
      a2.fill(inf);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0940
     * @tc.name testFloat32ArrayFillTHREE094
     * @tc.desc Verify -1.0e40 overflows filled via number overload as -Infinity is consistent with E overload -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      a1.fill(-1.0e40);
      const a2 = new Float32Array([0.0]);
      const ninf = -Infinity;
      a2.fill(ninf);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0950
     * @tc.name testFloat32ArrayFillTHREE095
     * @tc.desc Verify 1.0e-46 underflows filled via number overload as positive zero is consistent with E overload positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([1.0]);
      a1.fill(1.0e-46);
      const a2 = new Float32Array([1.0]);
      const zf = 0;
      a2.fill(zf);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(0);
      expect(1 / a1.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0960
     * @tc.name testFloat32ArrayFillTHREE096
     * @tc.desc Verify 33554433 i.e. 2 to the 25th power plus 1 filled via both overloads both truncate to 33554432
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 33554433;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(33554433);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(0)).assertEqual(33554432);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0970
     * @tc.name testFloat32ArrayFillTHREE097
     * @tc.desc Verify 0.1 and 0.3 after filling stored as different float32 values precision difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float32Array([0.0]);
      const vf = 0.1;
      a1.fill(vf);
      const a2 = new Float32Array([0.0]);
      a2.fill(0.3);
      expect(a1.$_get(0)).assertEqual(0.10000000149011612);
      expect(a2.$_get(0)).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0980
     * @tc.name testFloat32ArrayFillTHREE098
     * @tc.desc Verify E overload filling the parent array affects the subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = parent.subarray(1, 3);
      const vf = 9;
      parent.fill(vf);
      expect(view.$_get(0)).assertEqual(9);
      expect(view.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_0990
     * @tc.name testFloat32ArrayFillTHREE099
     * @tc.desc Verify number overload filling the subarray view affects the parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = parent.subarray(0, 2);
      view.fill(8);
      expect(parent.$_get(0)).assertEqual(8);
      expect(parent.$_get(1)).assertEqual(8);
      expect(parent.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1000
     * @tc.name testFloat32ArrayFillTHREE100
     * @tc.desc Verify two subarray views share a buffer and filling through one view is visible in the other view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const v1 = parent.subarray(0, 2);
      const v2 = parent.subarray(0, 2);
      v1.fill(7);
      expect(v2.$_get(0)).assertEqual(7);
      expect(v2.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1010
     * @tc.name testFloat32ArrayFillTHREE101
     * @tc.desc Verify offset ArrayBuffer view fill only fills the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 3);
      arr.fill(5);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1020
     * @tc.name testFloat32ArrayFillTHREE102
     * @tc.desc Verify E overload fill does not deep copy and changes are visible through the alias reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const alias = arr;
      const vf = 6;
      arr.fill(vf);
      expect(alias.$_get(0)).assertEqual(6);
      expect(alias.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1030
     * @tc.name testFloat32ArrayFillTHREE103
     * @tc.desc Verify number overload after filling slice copy is independent and not affected by subsequent modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.fill(9);
      const copy = arr.slice(0);
      copy.$_set(0, 100);
      expect(arr.$_get(0)).assertEqual(9);
      expect(copy.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1040
     * @tc.name testFloat32ArrayFillTHREE104
     * @tc.desc Verify three subarray views share buffer and filling through one view is visible in all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const v1 = parent.subarray(0, 4);
      const v2 = parent.subarray(0, 4);
      const v3 = parent.subarray(0, 4);
      v1.fill(3);
      expect(v2.$_get(0)).assertEqual(3);
      expect(v3.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1050
     * @tc.name testFloat32ArrayFillTHREE105
     * @tc.desc Verify same buffer different offsets two views filled separately do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 8, 2);
      a.fill(1);
      b.fill(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(b.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1060
     * @tc.name testFloat32ArrayFillTHREE106
     * @tc.desc Verify cross-overload E overload fills the parent array and number reads subarray consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = parent.subarray(1, 4);
      const vf = 7;
      parent.fill(vf);
      expect(view.$_get(0)).assertEqual(7);
      expect(view.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1070
     * @tc.name testFloat32ArrayFillTHREE107
     * @tc.desc Verify fill returns this sharing the same buffer and byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const bufBefore = arr.buffer;
      const lenBefore = arr.byteLength;
      const ret = arr.fill(4);
      expect(ret.buffer).assertEqual(bufBefore);
      expect(ret.byteLength).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLTHREE_1080
     * @tc.name testFloat32ArrayFillTHREE108
     * @tc.desc Verify float typed value and number value produce the same range fill result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillTHREE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typedValue: float = 6;
      const numberValue: number = 6;
      const a = Float32Array.of(1.0, 2.0, 3.0);
      const b = Float32Array.of(1.0, 2.0, 3.0);
      a.fill(typedValue, 1, 3);
      b.fill(numberValue, 1, 3);
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
    });

  });
}
