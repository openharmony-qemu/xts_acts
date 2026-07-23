/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { numArr, SetHolder, FuncType, NumOrNull } from '../exports_container/ContainerExport';
import { sleep } from "../utils/Utils";

export default function exportContainerTypeTest() {
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
     * @tc.desc   Test exported number array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportContainerTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(1).assertEqual(numArr[0]);
      expect(2).assertEqual(numArr[1]);
      expect(3).assertEqual(numArr[2]);
    })

    /**
     * @tc.name   exportContainerTypeTest0200
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0200
     * @tc.desc   Test Set holder class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let holder: SetHolder = new SetHolder();
      expect(holder.has('key1')).assertTrue();
      expect(!holder.has('key2')).assertTrue();
    })

    /**
     * @tc.name   exportContainerTypeTest0300
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0300
     * @tc.desc   Test function type alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let fn: FuncType = (x: number): number => x + 1;
      expect(11).assertEqual(fn(10));
    })

    /**
     * @tc.name   exportContainerTypeTest0400
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0400
     * @tc.desc   Test NumOrNull with number value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: NumOrNull = 42;
      if (v !== null) {
        expect(42).assertEqual(v);
      }
    })

    /**
     * @tc.name   exportContainerTypeTest0500
     * @tc.number SUB_EXPORT_CONTAINER_TYPE_TEST_0500
     * @tc.desc   Test NumOrNull with null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportContainerTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: NumOrNull = null;
      expect(v).assertEqual(null);
    })
  })
}
