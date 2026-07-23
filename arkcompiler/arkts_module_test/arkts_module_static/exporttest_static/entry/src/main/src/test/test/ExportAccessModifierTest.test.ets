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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { AccessClass } from '../exports_access/AccessExport';
import { ReadonlyClass } from '../exports_access/AccessExport';
import ReadonlyCls from '../exports_access/AccessExport';
import { sleep } from '../utils/Utils';

export default function exportAccessModifierTest():void {
  describe('ExportAccessModifierTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportAccessModifierTest0100
     * @tc.number SUB_EXPORT_ACCESS_MODIFIER_TEST_0100
     * @tc.desc   Test public field and private field accessor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportAccessModifierTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      let obj: AccessClass = new AccessClass();
      expect('publicValue').assertEqual(obj.publicField);
      expect('privateValue').assertEqual(obj.getPrivateField());
    })

    /**
     * @tc.name   exportAccessModifierTest0200
     * @tc.number SUB_EXPORT_ACCESS_MODIFIER_TEST_0200
     * @tc.desc   Test public field and private field accessor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportAccessModifierTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect('staticValue').assertEqual(AccessClass.staticField);
      expect('staticValue').assertEqual(AccessClass.staticMethod());
    })

    /**
     * @tc.name   exportAccessModifierTest0300
     * @tc.number SUB_EXPORT_ACCESS_MODIFIER_TEST_0300
     * @tc.desc   Test public field and private field accessor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportAccessModifierTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: ReadonlyClass = new ReadonlyClass('testValue');
      expect('ReadonlyClass').assertEqual(obj.name);
      expect('testValue').assertEqual(obj.value);
    })

    /**
     * @tc.name   exportAccessModifierTest0400
     * @tc.number SUB_EXPORT_ACCESS_MODIFIER_TEST_0400
     * @tc.desc   Test public field and private field accessor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportAccessModifierTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: ReadonlyCls = new ReadonlyCls('defaultTest');
      expect('ReadonlyClass').assertEqual(obj.name);
      expect('defaultTest').assertEqual(obj.value);
    })
  })
}
