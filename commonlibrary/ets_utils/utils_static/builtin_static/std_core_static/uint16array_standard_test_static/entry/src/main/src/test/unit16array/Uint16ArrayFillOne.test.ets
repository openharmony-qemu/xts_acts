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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayFill01Test(): void {
  describe('Uint16ArrayFill01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0001
     * @tc.name testUint16ArrayFillOne001
     * @tc.desc Verify value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(1, 0, 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0002
     * @tc.name testUint16ArrayFillOne002
     * @tc.desc Verify start 5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 5, 5);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0003
     * @tc.name testUint16ArrayFillOne003
     * @tc.desc Verify start -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -1, 5);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0004
     * @tc.name testUint16ArrayFillOne004
     * @tc.desc Verify start -3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3, 5);
      expect(arr.at(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0005
     * @tc.name testUint16ArrayFillOne005
     * @tc.desc Verify start -5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -5, 3);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0006
     * @tc.name testUint16ArrayFillOne006
     * @tc.desc Verify end 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 1);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0007
     * @tc.name testUint16ArrayFillOne007
     * @tc.desc Verify end -3 length-3=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -3);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0008
     * @tc.name testUint16ArrayFillOne008
     * @tc.desc Verify start=3, end=1 start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 3, 1);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0009
     * @tc.name testUint16ArrayFillOne009
     * @tc.desc Verify start=-3, end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3, -1);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0010
     * @tc.name testUint16ArrayFillOne010
     * @tc.desc Verify start=-5, end=-2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -5, -2);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0011
     * @tc.name testUint16ArrayFillOne011
     * @tc.desc Verify start=2, end=-1 start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2, -1);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0012
     * @tc.name testUint16ArrayFillOne012
     * @tc.desc Verify start=-3, end=4 start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3, 4);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0013
     * @tc.name testUint16ArrayFillOne013
     * @tc.desc Verify start=0, end=-3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -3);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0014
     * @tc.name testUint16ArrayFillOne014
     * @tc.desc Verify start=-2, end=0 start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -2, 0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0015
     * @tc.name testUint16ArrayFillOne015
     * @tc.desc Verify fill arr.fill(5).fill(10).fill(15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(5, 0, 2).fill(10, 2, 4).fill(15, 4, 5);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(2)).assertEqual(10);
      expect(arr.at(4)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0016
     * @tc.name testUint16ArrayFillOne016
     * @tc.desc Verify fill start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 4, 2);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0017
     * @tc.name testUint16ArrayFillOne017
     * @tc.desc Verify value=65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(65536, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0018
     * @tc.name testUint16ArrayFillOne018
     * @tc.desc Verify 1 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(1);
      arr.fill(99);
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0019
     * @tc.name testUint16ArrayFillOne019
     * @tc.desc Verify 10 fill start=0, end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(10);
      arr.fill(55, 0, 3);
      expect(arr.at(0)).assertEqual(55);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0020
     * @tc.name testUint16ArrayFillOne020
     * @tc.desc Verify fill starts at Double.toInt(1.999) and fills through the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(888, Double.toInt(1.999));
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(888);
      expect(arr.at(4)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0021
     * @tc.name testUint16ArrayFillOne021
     * @tc.desc Verify fill ends at Double.toInt(3.14) and leaves later elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(777, 0, Double.toInt(3.14));
      expect(arr.at(0)).assertEqual(777);
      expect(arr.at(2)).assertEqual(777);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0022
     * @tc.name testUint16ArrayFillOne022
     * @tc.desc Verify fill with very large value (mod 65536) in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 + 1234, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1234);
      expect(arr.at(3)).assertEqual(1234);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0023
     * @tc.name testUint16ArrayFillOne023
     * @tc.desc Verify fill with negative value (mod 65536) on full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-1000);
      expect(arr.at(0)).assertEqual(65536 - 1000);
      expect(arr.at(1)).assertEqual(65536 - 1000);
      expect(arr.at(2)).assertEqual(65536 - 1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0024
     * @tc.name testUint16ArrayFillOne024
     * @tc.desc Verify fill with negative start and end (wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0, -2, -1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL_ONE_0025
     * @tc.name testUint16ArrayFillOne025
     * @tc.desc Verify fill is a no-op when normalized negative start is greater than normalized negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFillOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      arr.fill(42, -1, -3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(4)).assertEqual(5);
    });

  });
}
