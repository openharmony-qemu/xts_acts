/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';

function runCase(name: string, done: Function): void {
  expect(nativeFunc[name]()).assertEqual(0);
  done();
}

export default function customDialogSystemMaterialTest() {
  describe('CustomDialogSystemMaterialTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700
     * @tc.desc   Set ultra thin system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800
     * @tc.desc   Set thin system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial002', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900
     * @tc.desc   Set system material with null dialog returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial003', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000
     * @tc.desc   Set system material with null material handle on valid dialog returns SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial004', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100
     * @tc.desc   Set regular system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial005', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2200
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2200
     * @tc.desc   Set thick system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2200', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial006', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2300
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2300
     * @tc.desc   Set ultra thick system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2300', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial007', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2400
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2400
     * @tc.desc   Set ultra thin system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2400', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions001', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2500
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2500
     * @tc.desc   Set thin system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2500', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions002', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2600
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2600
     * @tc.desc   Set system material in options with null options returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2600', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions003', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2700
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2700
     * @tc.desc   Set null system material in dialog options succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2700', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions004', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2800
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2800
     * @tc.desc   Set system material in options with both null returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2800', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions005', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_2900
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2900
     * @tc.desc   Set regular system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_2900', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions006', done);
    });


    /**
     * @tc.name   SUB_ARKUI_CAPI_SYSTEMMATERIAL_3000
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3000
     * @tc.desc   Set ultra thick system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_SYSTEMMATERIAL_3000', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions007', done);
    });

  });
}
