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

export default function Float32ArraySubarray1Test(): void {
  describe('Float32ArraySubarray1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0100
     * @tc.name testFloat32ArraySubarrayOne001
     * @tc.desc Verify subarray() on [1,2,3,4,5] returns view with length 5 (full view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray();
        expect(view.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0200
     * @tc.name testFloat32ArraySubarrayOne002
     * @tc.desc Verify subarray(2) on [1,2,3,4,5] returns view starting at index 2 with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2);
        expect(view.length).assertEqual(3);
        expect(view.byteOffset).assertEqual(8);
        expect(view.$_get(0)).assertEqual(3.0);
        expect(view.$_get(1)).assertEqual(4.0);
        expect(view.$_get(2)).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0300
     * @tc.name testFloat32ArraySubarrayOne003
     * @tc.desc Verify subarray(1,4) on [1,2,3,4,5] returns view with elements [2,3,4] and length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        expect(view.length).assertEqual(3);
        expect(view.byteOffset).assertEqual(4);
        expect(view.$_get(0)).assertEqual(2.0);
        expect(view.$_get(1)).assertEqual(3.0);
        expect(view.$_get(2)).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0400
     * @tc.name testFloat32ArraySubarrayOne004
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0);
        expect(view.length).assertEqual(5);
        const element004 = view.$_get(0);
        expect(element004).assertEqual(1.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0500
     * @tc.name testFloat32ArraySubarrayOne005
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1);
        expect(view.length).assertEqual(4);
        const element005 = view.$_get(0);
        expect(element005).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0600
     * @tc.name testFloat32ArraySubarrayOne006
     * @tc.desc Verify begin=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2);
        expect(view.byteOffset).assertEqual(8);
        const element006 = view.$_get(0);
        expect(element006).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0700
     * @tc.name testFloat32ArraySubarrayOne007
     * @tc.desc Verify begin=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(4);
        expect(view.length).assertEqual(1);
        const element007 = view.$_get(0);
        expect(element007).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0800
     * @tc.name testFloat32ArraySubarrayOne008
     * @tc.desc Verify begin = length returns an empty view and reading index 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(5);
        expect(view.length).assertEqual(0);
        try {
          view.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_0900
     * @tc.name testFloat32ArraySubarrayOne009
     * @tc.desc Verify begin = length + 1 is clamped to length and returns an empty view with the end byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(6);
        expect(view.length).assertEqual(0);
        expect(view.byteOffset).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1000
     * @tc.name testFloat32ArraySubarrayOne010
     * @tc.desc Verify begin=100 returns empty view with length 0 and byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(100);
        expect(view.length).assertEqual(0);
        expect(view.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1100
     * @tc.name testFloat32ArraySubarrayOne011
     * @tc.desc Verify begin=2147483647 returns empty view with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2147483647);
        expect(view.length).assertEqual(0);
        try {
          view.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1200
     * @tc.name testFloat32ArraySubarrayOne012
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-1);
        expect(view.length).assertEqual(1);
        const element012 = view.$_get(0);
        expect(element012).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1300
     * @tc.name testFloat32ArraySubarrayOne013
     * @tc.desc Verify begin=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-2);
        expect(view.length).assertEqual(2);
        const element013 = view.$_get(0);
        expect(element013).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1400
     * @tc.name testFloat32ArraySubarrayOne014
     * @tc.desc Verify begin=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-3);
        expect(view.byteOffset).assertEqual(8);
        const element014 = view.$_get(0);
        expect(element014).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1500
     * @tc.name testFloat32ArraySubarrayOne015
     * @tc.desc Verify begin=-length returns full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-5);
        expect(view.length).assertEqual(5);
        const element015 = view.$_get(0);
        expect(element015).assertEqual(1.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1600
     * @tc.name testFloat32ArraySubarrayOne016
     * @tc.desc Verify begin=-(length+1) clamped to 0 returns full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-6);
        expect(view.length).assertEqual(5);
        const element016 = view.$_get(4);
        expect(element016).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1700
     * @tc.name testFloat32ArraySubarrayOne017
     * @tc.desc Verify begin=-100 clamped to 0 returns full array with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-100);
        expect(view.length).assertEqual(5);
        expect(view.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1800
     * @tc.name testFloat32ArraySubarrayOne018
     * @tc.desc Verify begin=-2147483647 clamped to 0 returns full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-2147483647);
        expect(view.length).assertEqual(5);
        const element018 = view.$_get(0);
        expect(element018).assertEqual(1.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_1900
     * @tc.name testFloat32ArraySubarrayOne019
     * @tc.desc Verify begin=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(3);
        expect(view.length).assertEqual(2);
        const element019 = view.$_get(0);
        expect(element019).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2000
     * @tc.name testFloat32ArraySubarrayOne020
     * @tc.desc Verify end=0 begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 0);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2100
     * @tc.name testFloat32ArraySubarrayOne021
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 1);
        expect(view.length).assertEqual(1);
        const element021 = view.$_get(0);
        expect(element021).assertEqual(1.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2200
     * @tc.name testFloat32ArraySubarrayOne022
     * @tc.desc Verify end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 3);
        expect(view.byteOffset).assertEqual(0);
        const element022 = view.$_get(2);
        expect(element022).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2300
     * @tc.name testFloat32ArraySubarrayOne023
     * @tc.desc Verify end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 5);
        expect(view.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2400
     * @tc.name testFloat32ArraySubarrayOne024
     * @tc.desc Verify end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 4);
        expect(view.length).assertEqual(4);
        const element024 = view.$_get(3);
        expect(element024).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2500
     * @tc.name testFloat32ArraySubarrayOne025
     * @tc.desc Verify end=length+1 returns full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 6);
        expect(view.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2600
     * @tc.name testFloat32ArraySubarrayOne026
     * @tc.desc Verify end=100 returns full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 100);
        expect(view.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2700
     * @tc.name testFloat32ArraySubarrayOne027
     * @tc.desc Verify end=2147483647 returns full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 2147483647);
        expect(view.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2800
     * @tc.name testFloat32ArraySubarrayOne028
     * @tc.desc Verify end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -1);
        expect(view.length).assertEqual(4);
        const element028 = view.$_get(3);
        expect(element028).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_2900
     * @tc.name testFloat32ArraySubarrayOne029
     * @tc.desc Verify end=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -2);
        expect(view.byteOffset).assertEqual(0);
        expect(view.length).assertEqual(3);
        expect(view.$_get(0)).assertEqual(1.0);
        expect(view.$_get(2)).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3000
     * @tc.name testFloat32ArraySubarrayOne030
     * @tc.desc Verify end=-length clamped to 0 returns empty view with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -5);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3100
     * @tc.name testFloat32ArraySubarrayOne031
     * @tc.desc Verify end=-(length+1) clamped to 0 returns empty view with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -6);
        expect(view.length).assertEqual(0);
        expect(view.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3200
     * @tc.name testFloat32ArraySubarrayOne032
     * @tc.desc Verify end=-100 clamped to 0 returns empty view with length 0 and byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -100);
        expect(view.length).assertEqual(0);
        expect(view.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3300
     * @tc.name testFloat32ArraySubarrayOne033
     * @tc.desc Verify end=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -3);
        expect(view.length).assertEqual(2);
        const element033 = view.$_get(1);
        expect(element033).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3400
     * @tc.name testFloat32ArraySubarrayOne034
     * @tc.desc Verify end=undefined results in full array with length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, undefined);
        expect(view.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3500
     * @tc.name testFloat32ArraySubarrayOne035
     * @tc.desc Verify end=-2147483647 clamped to 0 returns empty view with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, -2147483647);
        expect(view.length).assertEqual(0);
        try {
          view.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3600
     * @tc.name testFloat32ArraySubarrayOne036
     * @tc.desc Verify end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 2);
        expect(view.length).assertEqual(2);
        const element036 = view.$_get(1);
        expect(element036).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3700
     * @tc.name testFloat32ArraySubarrayOne037
     * @tc.desc Verify begin=1,end=3 [2.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 3);
        expect(view.length).assertEqual(2);
        const element037 = view.$_get(0);
        expect(element037).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3800
     * @tc.name testFloat32ArraySubarrayOne038
     * @tc.desc Verify begin=2,end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2, 2);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_3900
     * @tc.name testFloat32ArraySubarrayOne039
     * @tc.desc Verify begin=3,end=1 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(3, 1);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4000
     * @tc.name testFloat32ArraySubarrayOne040
     * @tc.desc Verify begin=-3,end=-1 [3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-3, -1);
        expect(view.length).assertEqual(2);
        const element040 = view.$_get(0);
        expect(element040).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4100
     * @tc.name testFloat32ArraySubarrayOne041
     * @tc.desc Verify begin=-4,end=5 [2.0, 3.0, 4.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-4, 5);
        expect(view.length).assertEqual(4);
        const element041 = view.$_get(0);
        expect(element041).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4200
     * @tc.name testFloat32ArraySubarrayOne042
     * @tc.desc Verify begin=1,end=0 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 0);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4300
     * @tc.name testFloat32ArraySubarrayOne043
     * @tc.desc Verify begin=-2,end=-3 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-2, -3);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4400
     * @tc.name testFloat32ArraySubarrayOne044
     * @tc.desc Verify begin=4,end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(4, 5);
        expect(view.length).assertEqual(1);
        const element045 = view.$_get(0);
        expect(element045).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4500
     * @tc.name testFloat32ArraySubarrayOne045
     * @tc.desc Verify begin=5,end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(5, 5);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4600
     * @tc.name testFloat32ArraySubarrayOne046
     * @tc.desc Verify begin=5,end=10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(5, 10);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4700
     * @tc.name testFloat32ArraySubarrayOne047
     * @tc.desc Verify begin=-1,end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-1, -1);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4800
     * @tc.name testFloat32ArraySubarrayOne048
     * @tc.desc Verify begin=-2147483647,end=2147483647 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-2147483647, 2147483647);
        expect(view.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_4900
     * @tc.name testFloat32ArraySubarrayOne049
     * @tc.desc Verify begin=0x2,end=0x4 [3.0, 4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0x2, 0x4);
        expect(view.length).assertEqual(2);
        const element050 = view.$_get(0);
        expect(element050).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5000
     * @tc.name testFloat32ArraySubarrayOne050
     * @tc.desc Verify begin=0b0,end=0b10 [1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0b0, 0b10);
        expect(view.length).assertEqual(2);
        const element051 = view.$_get(0);
        expect(element051).assertEqual(1.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5100
     * @tc.name testFloat32ArraySubarrayOne051
     * @tc.desc Verify begin=2,end=-1 [3.0, 4.0] byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2, -1);
        expect(view.length).assertEqual(2);
        const element052 = view.$_get(0);
        expect(element052).assertEqual(3.0);
        expect(view.byteOffset).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5200
     * @tc.name testFloat32ArraySubarrayOne052
     * @tc.desc Verify begin=-2,end=-1 [4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(-2, -1);
        expect(view.length).assertEqual(1);
        const element053 = view.$_get(0);
        expect(element053).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5300
     * @tc.name testFloat32ArraySubarrayOne053
     * @tc.desc Verify begin=1,end=100 [2.0, 3.0, 4.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 100);
        expect(view.length).assertEqual(4);
        const element054 = view.$_get(3);
        expect(element054).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5400
     * @tc.name testFloat32ArraySubarrayOne054
     * @tc.desc Verify begin=3,end=5 [4.0, 5.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(3, 5);
        expect(view.length).assertEqual(2);
        const element055 = view.$_get(0);
        expect(element055).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5500
     * @tc.name testFloat32ArraySubarrayOne055
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        expect(view.buffer).assertEqual(base.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5600
     * @tc.name testFloat32ArraySubarrayOne056
     * @tc.desc Verify subarray view $_set modifies base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2);
        view.$_set(0, 99.0);
        const element057 = base.$_get(2);
        expect(element057).assertEqual(99.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5700
     * @tc.name testFloat32ArraySubarrayOne057
     * @tc.desc Verify base $_set reflected in subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2);
        base.$_set(3, 88.0);
        const element058 = view.$_get(1);
        expect(element058).assertEqual(88.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5800
     * @tc.name testFloat32ArraySubarrayOne058
     * @tc.desc Verify subarray(2) byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2);
        expect(view.byteOffset).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_5900
     * @tc.name testFloat32ArraySubarrayOne059
     * @tc.desc Verify subarray(1, 4) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        expect(view.byteLength).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6000
     * @tc.name testFloat32ArraySubarrayOne060
     * @tc.desc Verify subarray(0, 3) returns view with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 3);
        expect(view.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6100
     * @tc.name testFloat32ArraySubarrayOne061
     * @tc.desc Verify subarray(0, 2) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const observedValue062 = base.subarray(0, 2);
        const observedValue062Part2 = base.subarray(3, 5);
        observedValue062.$_set(0, 10.0);
        observedValue062Part2.$_set(0, 20.0);
        const element062 = base.$_get(0);
        expect(element062).assertEqual(10.0);
        const element062Part2 = base.$_get(3);
        expect(element062Part2).assertEqual(20.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6200
     * @tc.name testFloat32ArraySubarrayOne062
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const a = base.subarray(0, 3);
        const b = base.subarray(2, 5);
        a.$_set(2, 99.0);
        const element063 = b.$_get(0);
        expect(element063).assertEqual(99.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6300
     * @tc.name testFloat32ArraySubarrayOne063
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const observedValue064 = base.subarray(1);
        const observedValue064Part2 = observedValue064.subarray(1);
        expect(observedValue064Part2.buffer).assertEqual(base.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6400
     * @tc.name testFloat32ArraySubarrayOne064
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(2, 5);
        const element065 = view.$_get(0);
        expect(element065).assertEqual(3.0);
        const element065Part2 = view.$_get(2);
        expect(element065Part2).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6500
     * @tc.name testFloat32ArraySubarrayOne065
     * @tc.desc Verify fill(7.0) through subarray modifies original in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        view.fill(7.0);
        const element066 = base.$_get(1);
        expect(element066).assertEqual(7.0);
        const element066Part2 = base.$_get(3);
        expect(element066Part2).assertEqual(7.0);
        const element066Part3 = base.$_get(4);
        expect(element066Part3).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6600
     * @tc.name testFloat32ArraySubarrayOne066
     * @tc.desc Verify copyWithin(0,1) through subarray modifies original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        view.copyWithin(0, 1);
        const element067 = base.$_get(1);
        expect(element067).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6700
     * @tc.name testFloat32ArraySubarrayOne067
     * @tc.desc Verify reverse() through subarray modifies original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        view.reverse();
        const element068 = base.$_get(1);
        expect(element068).assertEqual(4.0);
        const element068Part2 = base.$_get(3);
        expect(element068Part2).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6800
     * @tc.name testFloat32ArraySubarrayOne068
     * @tc.desc Verify set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 3);
        view.set([8.0, 9.0]);
        const element069 = base.$_get(1);
        expect(element069).assertEqual(8.0);
        const element069Part2 = base.$_get(2);
        expect(element069Part2).assertEqual(9.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_6900
     * @tc.name testFloat32ArraySubarrayOne069
     * @tc.desc Verify fill(9.0) on empty subarray(5) has no effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(5);
        view.fill(9.0);
        const element070 = base.$_get(0);
        expect(element070).assertEqual(1.0);
        expect(view.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7000
     * @tc.name testFloat32ArraySubarrayOne070
     * @tc.desc Verify sort() through subarray modifies original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([5.0, 1.0, 3.0, 2.0, 4.0]);
        const view = base.subarray(0, 4);
        view.sort();
        const element071 = base.$_get(0);
        expect(element071).assertEqual(1.0);
        const element071Part2 = base.$_get(3);
        expect(element071Part2).assertEqual(5.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7100
     * @tc.name testFloat32ArraySubarrayOne071
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        const atValue072 = view.at(0);
        expect(atValue072).assertEqual(2.0);
        const atValue072Part2 = view.at(-1);
        expect(atValue072Part2).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7200
     * @tc.name testFloat32ArraySubarrayOne072
     * @tc.desc Verify subarray(1, 4) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        let sum: number = 0;
        for (let __f32i = 0; __f32i < view.length; __f32i++) { const v = view.$_get(__f32i);
          sum = sum + v;
        }
        expect(sum).assertEqual(9.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7300
     * @tc.name testFloat32ArraySubarrayOne073
     * @tc.desc Verify subarray set() modifies parent array toString() output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 3);
        view.$_set(0, 9.0);
        const observedValue074 = base.toString();
        expect(observedValue074).assertEqual('9,2,3,4,5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7400
     * @tc.name testFloat32ArraySubarrayOne074
     * @tc.desc Verify set() on subarray with offset copies values into correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 5);
        view.set([9.0, 8.0], 1);
        const element075 = base.$_get(2);
        expect(element075).assertEqual(9.0);
        const element075Part2 = base.$_get(3);
        expect(element075Part2).assertEqual(8.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7500
     * @tc.name testFloat32ArraySubarrayOne075
     * @tc.desc Verify subarray(0, 4) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 4);
        let count = 0;
        for (let __f32i = 0; __f32i < view.length; __f32i++) { const v = view.$_get(__f32i);
          count++;
        }
        expect(count).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7600
     * @tc.name testFloat32ArraySubarrayOne076
     * @tc.desc Verify subarray().subarray() preserves element access through nested views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const part = base.subarray(2);
        const back = part.subarray(-3);
        expect(back.length).assertEqual(3);
        const element077 = back.$_get(0);
        expect(element077).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7700
     * @tc.name testFloat32ArraySubarrayOne077
     * @tc.desc Verify nested subarray() calls produce correct byteOffset and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const v = base.subarray(1).subarray(1).subarray(1);
        expect(v.byteOffset).assertEqual(12);
        expect(v.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7800
     * @tc.name testFloat32ArraySubarrayOne078
     * @tc.desc Verify subarray(1).subarray(1) modifies parent array via set() on nested view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const observedValue079 = base.subarray(1);
        const observedValue079Part2 = observedValue079.subarray(1);
        observedValue079Part2.$_set(0, 77.0);
        const element079 = base.$_get(2);
        expect(element079).assertEqual(77.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_7900
     * @tc.name testFloat32ArraySubarrayOne079
     * @tc.desc Verify fill() on subarray with start=1 end=3 fills only specified range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0, 5);
        view.fill(9.0, 1, 3);
        const element080 = base.$_get(1);
        expect(element080).assertEqual(9.0);
        const element080Part2 = base.$_get(2);
        expect(element080Part2).assertEqual(9.0);
        const element080Part3 = base.$_get(0);
        expect(element080Part3).assertEqual(1.0);
        const element080Part4 = base.$_get(3);
        expect(element080Part4).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_8000
     * @tc.name testFloat32ArraySubarrayOne080
     * @tc.desc Verify reverse() twice on subarray restores original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(1, 4);
        view.reverse();
        view.reverse();
        const element081 = base.$_get(1);
        expect(element081).assertEqual(2.0);
        const element081Part2 = base.$_get(3);
        expect(element081Part2).assertEqual(4.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_8100
     * @tc.name testFloat32ArraySubarrayOne081
     * @tc.desc Verify set() copies Float32Array source into subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const src = new Float32Array([7.0, 8.0]);
        const view = base.subarray(1, 3);
        view.set(src);
        const element082 = base.$_get(1);
        expect(element082).assertEqual(7.0);
        const element082Part2 = base.$_get(2);
        expect(element082Part2).assertEqual(8.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_8200
     * @tc.name testFloat32ArraySubarrayOne082
     * @tc.desc Verify subarray(begin=length) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(5);
        expect(view.byteOffset).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_8300
     * @tc.name testFloat32ArraySubarrayOne083
     * @tc.desc Verify subarray(begin=length) byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(5);
        expect(view.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_8400
     * @tc.name testFloat32ArraySubarrayOne084
     * @tc.desc Verify subarray(0) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray(0);
        expect(view.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_ONE_8500
     * @tc.name testFloat32ArraySubarrayOne085
     * @tc.desc Verify subarray() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        const view = base.subarray();
        expect(view.byteLength).assertEqual(20);
      }
    });

  });
}
