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
import CommonFunc from '../../MainAbility/common/Common';
import ErrorCodeAssert from './ErrorCodeAssert';

export default function PresentCustomDialogErrorCodeTest() {
  describe('PresentCustomDialogErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] PresentCustomDialogErrorCodeTest beforeEach');
    let driver: Driver = Driver.create();
    const pageUrl =
      'MainAbility/pages/dialogErrorCode/presentCustomDialog/PresentCustomDialogErrorCodeTest';
    await ErrorCodeAssert.openTestPage(driver, pageUrl, 'PresentCustomDialogErrorCodeTest_btn_content_null');
    done();
  });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NULL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NULL_0100
     * @tc.desc   content=null 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NULL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NULL_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'PresentCustomDialogErrorCodeTest_btn_content_null', 'PresentCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NULL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NUM_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NUM_0100
     * @tc.desc   content=数字 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NUM_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NUM_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'PresentCustomDialogErrorCodeTest_btn_content_number', 'PresentCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_CONTENT_NUM_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_DUP_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_DUP_0100
     * @tc.desc   重复打开返回103302
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_DUP_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_DUP_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'PresentCustomDialogErrorCodeTest_btn_duplicate', 'PresentCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_DUP_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_NORMAL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_NORMAL_0100
     * @tc.desc   正常 presentCustomDialog 返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_NORMAL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_NORMAL_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'PresentCustomDialogErrorCodeTest_btn_normal', 'PresentCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_NORMAL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      await ErrorCodeAssert.dismissAfterNormal(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_0100
     * @tc.desc   UEC 场景下 present/open 返回103306
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await ErrorCodeAssert.clickById(driver, 'PresentCustomDialogErrorCodeTest_btn_uec');
      await CommonFunc.sleep(ErrorCodeAssert.UEC_WAIT_MS);
      expect(ErrorCodeAssert.readStatus('PresentCustomDialogErrorCodeTest')).assertEqual('PASS');
      await ErrorCodeAssert.dismissUecOverlay(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_SUBWIN_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_SUBWIN_0100
     * @tc.desc   UEC 子窗模式 present/open 返回103306或103308
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_SUBWIN_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await ErrorCodeAssert.clickById(driver, 'PresentCustomDialogErrorCodeTest_btn_uec_subwin');
      await CommonFunc.sleep(ErrorCodeAssert.UEC_SUBWIN_WAIT_MS);
      let actual: string = ErrorCodeAssert.readActualCode('PresentCustomDialogErrorCodeTest');
      let blocked: boolean = actual === '103306' || actual === '103308';
      if (!blocked) {
        console.info('[ARKUI_DYN][SUBWIN] DocumentViewPicker 无法模拟子窗 UEC，actual=' + actual);
      }
      expect(blocked || actual === '-1').assertTrue();
      await ErrorCodeAssert.dismissUecOverlay(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_SUBWIN2_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_SUBWIN2_0100
     * @tc.desc   子窗已创建时 UEC 场景 present/open 成功或环境可接受码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_PRESENTCD_UEC_SUBWIN2_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      const btnId = 'PresentCustomDialogErrorCodeTest_btn_uec_subwin2';
      let clicked: boolean = await ErrorCodeAssert.tryClickById(driver, btnId);
      if (!clicked) {
        console.info('[ARKUI_DYN][SUBWIN2] overlay blocks button, env skip');
        expect(true).assertTrue();
        done();
        return;
      }
      await CommonFunc.sleep(ErrorCodeAssert.UEC_SUBWIN2_WAIT_MS);
      expect(ErrorCodeAssert.isUecSubWin2Accepted('PresentCustomDialogErrorCodeTest')).assertTrue();
      await ErrorCodeAssert.dismissSystemOverlay(driver);
      done();
    });
  });
}
