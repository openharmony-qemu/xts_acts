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
import { dcrFuncWithEnumDefault, dcrFuncWithConstDefault } from '../exports_dcr/DcrFunctionDefault';
import { DcrClassWithCtorDefault, DcrClassWithMethodDefault, DcrClassWithFieldDefault } from '../exports_dcr/DcrClassDefault';
import { DcrStatus, DCR_CONST_VALUE, DcrExportedClass, DcrExportedInterface } from '../exports_dcr/DcrEnumSource';
import { sleep } from '../utils/Utils';

export default function exportDCRTest():void {
  describe('ExportDCRTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportDCRTest0100
     * @tc.number SUB_EXPORT_DCR_TEST_0100
     * @tc.desc   Test function with enum default parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportDCRTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      expect('ACTIVE').assertEqual(dcrFuncWithEnumDefault());
    })

    /**
     * @tc.name   exportDCRTest0200
     * @tc.number SUB_EXPORT_DCR_TEST_0200
     * @tc.desc   Test function with const default parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect(100).assertEqual(dcrFuncWithConstDefault());
    })

    /**
     * @tc.name   exportDCRTest0300
     * @tc.number SUB_EXPORT_DCR_TEST_0300
     * @tc.desc   Test enum exported value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect('PENDING').assertEqual(DcrStatus.Pending.valueOf());
    })

    /**
     * @tc.name   exportDCRTest0400
     * @tc.number SUB_EXPORT_DCR_TEST_0400
     * @tc.desc   Test function with explicit enum argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect('ACTIVE').assertEqual(dcrFuncWithEnumDefault(DcrStatus.Active));
    })

    /**
     * @tc.name   exportDCRTest0500
     * @tc.number SUB_EXPORT_DCR_TEST_0500
     * @tc.desc   Test class with constructor default using private enum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: DcrClassWithCtorDefault = new DcrClassWithCtorDefault();
      expect('PENDING').assertEqual(obj.status);
    })

    /**
     * @tc.name   exportDCRTest0600
     * @tc.number SUB_EXPORT_DCR_TEST_0600
     * @tc.desc   Test class with method default using private enum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: DcrClassWithMethodDefault = new DcrClassWithMethodDefault();
      expect('INACTIVE').assertEqual(obj.method());
    })

    /**
     * @tc.name   exportDCRTest0700
     * @tc.number SUB_EXPORT_DCR_TEST_0700
     * @tc.desc   Test class with field default using private enum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: DcrClassWithFieldDefault = new DcrClassWithFieldDefault();
      expect('ACTIVE').assertEqual(obj.status);
      expect('ACTIVE').assertEqual(DcrClassWithFieldDefault.staticStatus);
    })

    /**
     * @tc.name   exportDCRTest0800
     * @tc.number SUB_EXPORT_DCR_TEST_0800
     * @tc.desc   Test exported class with optional constructor param
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let obj: DcrExportedClass = new DcrExportedClass(50);
      expect('DcrExportedClass').assertEqual(obj.name);
      expect(50).assertEqual(obj.value);
    })

    /**
     * @tc.name   exportDCRTest0900
     * @tc.number SUB_EXPORT_DCR_TEST_0900
     * @tc.desc   Test exported interface implementation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportDCRTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let impl: DcrExportedInterface = {
        status: 'ACTIVE',
        value: 100
      };
      expect('ACTIVE').assertEqual(impl.status);
      expect(100).assertEqual(impl.value);
    })
  })
}
