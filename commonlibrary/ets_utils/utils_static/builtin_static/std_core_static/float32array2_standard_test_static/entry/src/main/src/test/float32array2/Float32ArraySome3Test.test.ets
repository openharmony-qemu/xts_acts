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

export default function Float32ArraySome3Test(): void {
  describe('Float32ArraySome3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_THREE_0100
     * @tc.name testFloat32ArraySomeThree001
     * @tc.desc Verify some callback modifying a not-yet-visited element persists after some completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (index === 0) {
          array.$_set(2, 99.0);
        }
        return false;
      });
      expect(arr.$_get(2)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_THREE_0200
     * @tc.name testFloat32ArraySomeThree002
     * @tc.desc Verify some invokes the callback exactly once per element when no match is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let callCount = 0;
      arr.some((element: number): boolean => {
        callCount++;
        return false;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_THREE_0300
     * @tc.name testFloat32ArraySomeThree003
     * @tc.desc Verify some reads live (mutated) value of a future element when not yet visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let seenAt2 = 0.0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (index === 0) {
          array.$_set(2, 99.0);
        }
        if (index === 2) {
          seenAt2 = element;
        }
        return false;
      });
      expect(seenAt2).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_THREE_0400
     * @tc.name testFloat32ArraySomeThree004
     * @tc.desc Verify some short-circuits and stops invoking callback once a truthy result is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let callCount = 0;
      const result = arr.some((element: number): boolean => {
        callCount++;
        return element > 1.5;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_THREE_0500
     * @tc.name testFloat32ArraySomeThree005
     * @tc.desc Verify some on empty array returns false and never invokes the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let callCount = 0;
      const result = arr.some((element: number): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(0);
    });

  });
}
