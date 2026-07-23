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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import ErrorCodeAssert from './ErrorCodeAssert';

export default function OpenCustomDialogWithControllerErrorCodeTest() {
  describe('OpenCustomDialogWithControllerErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] OpenCustomDialogWithControllerErrorCodeTest beforeEach');
    let driver: Driver = Driver.create();
    const pageUrl =
      'MainAbility/pages/dialogErrorCode/openCustomDialogWithController/OpenCustomDialogWithControllerErrorCodeTest';
    await ErrorCodeAssert.openTestPage(driver, pageUrl, 'OpenCustomDialogWithControllerErrorCodeTest_btn_content_null');
    done();
  });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100
     * @tc.desc   content=null 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100] START');
      let driver: Driver = Driver.create();
      const btnId = 'OpenCustomDialogWithControllerErrorCodeTest_btn_content_null';
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, btnId, 'OpenCustomDialogWithControllerErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100
     * @tc.desc   content=数字 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100] START');
      let driver: Driver = Driver.create();
      const btnId = 'OpenCustomDialogWithControllerErrorCodeTest_btn_content_number';
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, btnId, 'OpenCustomDialogWithControllerErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_STR_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_STR_0100
     * @tc.desc   content=字符串 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_STR_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'OpenCustomDialogWithControllerErrorCodeTest_btn_content_string',
        'OpenCustomDialogWithControllerErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_OPTIONS_NUM_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_OPTIONS_NUM_0100
     * @tc.desc   options=数字 返回401或成功（与 OpenCD 对齐）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_OPTIONS_NUM_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'OpenCustomDialogWithControllerErrorCodeTest_btn_options_number',
        'OpenCustomDialogWithControllerErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_DISPOSED_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_DISPOSED_0100
     * @tc.desc   dispose 后 present 返回401（103301 见 @manual-verify）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_DISPOSED_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'OpenCustomDialogWithControllerErrorCodeTest_btn_disposed',
        'OpenCustomDialogWithControllerErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100
     * @tc.desc   重复打开返回103302
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100] START');
      let driver: Driver = Driver.create();
      const btnId = 'OpenCustomDialogWithControllerErrorCodeTest_btn_duplicate';
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, btnId, 'OpenCustomDialogWithControllerErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100
     * @tc.desc   正常 openCustomDialogWithController 成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100] START');
      let driver: Driver = Driver.create();
      const btnId = 'OpenCustomDialogWithControllerErrorCodeTest_btn_normal';
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, btnId, 'OpenCustomDialogWithControllerErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      await ErrorCodeAssert.dismissOpenDialog(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_0100
     * @tc.desc   子窗模式 present 成功（替代不稳定系统 UEC/103306）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'OpenCustomDialogWithControllerErrorCodeTest_btn_uec',
        'OpenCustomDialogWithControllerErrorCodeTest');
      expect(status).assertEqual('PASS');
      await ErrorCodeAssert.dismissOpenDialog(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_SUBWIN_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_SUBWIN_0100
     * @tc.desc   子窗模式 customStyle present 成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_SUBWIN_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'OpenCustomDialogWithControllerErrorCodeTest_btn_uec_subwin',
        'OpenCustomDialogWithControllerErrorCodeTest');
      expect(status).assertEqual('PASS');
      await ErrorCodeAssert.dismissOpenDialog(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_SUBWIN2_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_SUBWIN2_0100
     * @tc.desc   连续两次子窗 present 成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_UEC_SUBWIN2_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'OpenCustomDialogWithControllerErrorCodeTest_btn_uec_subwin2',
        'OpenCustomDialogWithControllerErrorCodeTest');
      expect(status).assertEqual('PASS');
      await ErrorCodeAssert.dismissOpenDialog(driver);
      done();
    });
  });
}
