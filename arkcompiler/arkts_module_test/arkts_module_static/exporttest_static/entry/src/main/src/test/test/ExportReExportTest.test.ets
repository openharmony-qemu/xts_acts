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
import { reExportConstValue, ReExportClass, reExportFunction } from '../exports_reexport/ReExportChain';
import { renamedConstValue, RenamedClass, renamedFunction } from '../exports_reexport/ReExportRename';
import { ReExportDefaultAsNamedClass } from '../exports_reexport/ReExportDefaultAsNamed';
import { sleep } from '../utils/Utils';

export default function exportReExportTest():void {
  describe('ExportReExportTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportReExportTest0100
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0100
     * @tc.desc   Test re-export const through chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportReExportTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      expect(42).assertEqual(reExportConstValue);
    })

    /**
     * @tc.name   exportReExportTest0200
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0200
     * @tc.desc   Test re-export class through chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportReExportTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: ReExportClass = new ReExportClass('chainTest');
      expect('ReExportClass').assertEqual(obj.name);
      expect('chainTest').assertEqual(obj.value);
    })

    /**
     * @tc.name   exportReExportTest0300
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0300
     * @tc.desc   Test re-export function through chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportReExportTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let result: number = reExportFunction(3, 4);
      expect(7).assertEqual(result);
    })

    /**
     * @tc.name   exportReExportTest0400
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0400
     * @tc.desc   Test renamed re-export const
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportReExportTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect(42).assertEqual(renamedConstValue);
    })

    /**
     * @tc.name   exportReExportTest0500
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0500
     * @tc.desc   Test renamed re-export class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportReExportTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: RenamedClass = new RenamedClass('renameTest');
      expect('ReExportClass').assertEqual(obj.name);
      expect('renameTest').assertEqual(obj.value);
    })

    /**
     * @tc.name   exportReExportTest0600
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0600
     * @tc.desc   Test renamed re-export function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportReExportTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let result: number = renamedFunction(5, 6);
      expect(11).assertEqual(result);
    })

    /**
     * @tc.name   exportReExportTest0700
     * @tc.number SUB_EXPORT_REEXPORT_TEST_0700
     * @tc.desc   Test default exported as named
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportReExportTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: ReExportDefaultAsNamedClass = new ReExportDefaultAsNamedClass('defaultAsNamedTest');
      expect('ReExportDefaultClass').assertEqual(obj.name);
      expect('defaultAsNamedTest').assertEqual(obj.value);
    })
  })
}
