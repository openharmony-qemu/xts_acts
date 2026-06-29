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

function registerCustomDialogSetCasesPart1(): void {
  describe('CustomDialogSetSystemMaterialPart1', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1700
     * @tc.desc   Set ultra thin system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial001', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial001', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial002
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1800
     * @tc.desc   Set thin system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial002', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial002', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial003
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_1900
     * @tc.desc   Set system material with null dialog returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial003', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial003', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial004
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2000
     * @tc.desc   Set null system material on custom dialog succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial004', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial004', done);
    });
  });
}

function registerCustomDialogSetCasesPart2(): void {
  describe('CustomDialogSetSystemMaterialPart2', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial005
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2100
     * @tc.desc   Set regular system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial005', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial005', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial006
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2200
     * @tc.desc   Set thick system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial006', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial006', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial007
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2300
     * @tc.desc   Set ultra thick system material on custom dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial007', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterial007', done);
    });
  });
}

function registerCustomDialogOptionsCasesPart1(): void {
  describe('CustomDialogSetSystemMaterialInOptionsPart1', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions001
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2400
     * @tc.desc   Set ultra thin system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions001', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions001', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions002
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2500
     * @tc.desc   Set thin system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions002', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions002', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions003
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2600
     * @tc.desc   Set system material in options with null options returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions003', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions003', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions004
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2700
     * @tc.desc   Set null system material in dialog options succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions004', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions004', done);
    });
  });
}

function registerCustomDialogOptionsCasesPart2(): void {
  describe('CustomDialogSetSystemMaterialInOptionsPart2', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions005
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2800
     * @tc.desc   Set system material in options with both null returns invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions005', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions005', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions006
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_2900
     * @tc.desc   Set regular system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions006', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions006', done);
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions007
     * @tc.number SUB_ARKUI_CAPI_SYSTEMMATERIAL_3000
     * @tc.desc   Set ultra thick system material in dialog options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions007', Level.LEVEL1, async (done: Function) => {
      runCase('testCustomDialogSetSystemMaterialInOptions007', done);
    });
  });
}

export default function customDialogSystemMaterialTest() {
  registerCustomDialogSetCasesPart1();
  registerCustomDialogSetCasesPart2();
  registerCustomDialogOptionsCasesPart1();
  registerCustomDialogOptionsCasesPart2();
}
