'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the License);
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an AS IS BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import { fixedArr, charValue, SetHolder, FuncType, NumOrNull } from '../exports_container/ContainerExport';
import { sleep } from '../utils/Utils';

export default function exportContainerTypeTest(): void {
  describe('ExportContainerTypeTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportContainerTypeTest0100
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0100
     * @tc.desc   Test exported FixedArray values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportContainerTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const target: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
      expect(fixedArr[0]).assertEqual(target[0]);
      expect(fixedArr[1]).assertEqual(target[1]);
      expect(fixedArr[2]).assertEqual(target[2]);
    })

    /**
     * @tc.name   exportContainerTypeTest0200
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0200
     * @tc.desc   Test exported char value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect(c'a').assertEqual(charValue);
    })

    /**
     * @tc.name   exportContainerTypeTest0300
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0300
     * @tc.desc   Test SetHolder class with exported Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let holder: SetHolder = new SetHolder();
      expect(holder.has('key1')).assertTrue();
      expect(!holder.has('key2')).assertTrue();
    })

    /**
     * @tc.name   exportContainerTypeTest0400
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0400
     * @tc.desc   Test exported function type alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let fn: FuncType = (x: int): int => x + 1;
      expect(11).assertEqual(fn(10));
    })

    /**
     * @tc.name   exportContainerTypeTest0500
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0500
     * @tc.desc   Test NumOrNull union type with number value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let v: NumOrNull = 42;
      if (v !== null) {
        expect(42).assertEqual(v);
      }
    })
  })
}
