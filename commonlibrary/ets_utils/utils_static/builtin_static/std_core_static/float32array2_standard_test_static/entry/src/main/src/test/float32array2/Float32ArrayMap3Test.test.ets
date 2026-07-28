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

export default function Float32ArrayMap3Test(): void {
  describe('Float32ArrayMap3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_THREE_0100
     * @tc.name testFloat32ArrayMapThree001
     * @tc.desc Verify map callback receives array parameter that is the same reference as the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let sameRef = false;
      arr.map((element: number, index: int, array: Float32Array): number => {
        if (array === arr) {
          sameRef = true;
        }
        return element;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_THREE_0200
     * @tc.name testFloat32ArrayMapThree002
     * @tc.desc Verify map callback modifying the source array persists after map completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.map((element: number, index: int, array: Float32Array): number => {
        if (index === 0) {
          array.$_set(2, 99.0);
        }
        return element * 2.0;
      });
      expect(arr.$_get(2)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_THREE_0300
     * @tc.name testFloat32ArrayMapThree003
     * @tc.desc Verify map result has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.map((element: number): number => element * 2.0);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(2.0);
      expect(result.$_get(2)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_THREE_0400
     * @tc.name testFloat32ArrayMapThree004
     * @tc.desc Verify map().reduce() pipeline composes correctly (sum of doubled values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.map((element: number): number => element * 2.0)
        .reduce<number>((prev: number, curr: number): number => prev + curr, 0.0);
      expect(result).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MAP_THREE_0500
     * @tc.name testFloat32ArrayMapThree005
     * @tc.desc Verify map preserves NaN propagation through the transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMapThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 2.0);
      const result = arr.map((element: number): number => element * 2.0);
      expect(result.$_get(0)).assertNaN();
      expect(result.$_get(1)).assertEqual(4.0);
    });

  });
}
