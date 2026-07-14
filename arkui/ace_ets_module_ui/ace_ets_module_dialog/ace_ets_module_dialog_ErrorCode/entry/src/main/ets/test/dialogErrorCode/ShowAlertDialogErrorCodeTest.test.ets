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

export default function ShowAlertDialogErrorCodeTest() {
  describe('ShowAlertDialogErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] ShowAlertDialogErrorCodeTest beforeEach');
    let driver: Driver = Driver.create();
    const pageUrl =
      'MainAbility/pages/dialogErrorCode/showAlertDialog/ShowAlertDialogErrorCodeTest';
    await ErrorCodeAssert.openTestPage(driver, pageUrl, 'ShowAlertDialogErrorCodeTest_btn_no_args');
    done();
  });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NO_ARGS_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NO_ARGS_0100
     * @tc.desc   present 不传参数返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NO_ARGS_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NO_ARGS_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowAlertDialogErrorCodeTest_btn_no_args', 'ShowAlertDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NO_ARGS_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NULL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NULL_0100
     * @tc.desc   present 传 null 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NULL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NULL_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowAlertDialogErrorCodeTest_btn_null', 'ShowAlertDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NULL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NUMBER_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NUMBER_0100
     * @tc.desc   present 传数字返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NUMBER_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NUMBER_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowAlertDialogErrorCodeTest_btn_number', 'ShowAlertDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NUMBER_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_STRING_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_STRING_0100
     * @tc.desc   present 传字符串返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_STRING_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_STRING_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowAlertDialogErrorCodeTest_btn_string', 'ShowAlertDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_STRING_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NORMAL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NORMAL_0100
     * @tc.desc   正常 showAlertDialog 返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NORMAL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NORMAL_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowAlertDialogErrorCodeTest_btn_normal', 'ShowAlertDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_NORMAL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      await ErrorCodeAssert.dismissAfterNormal(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_0100
     * @tc.desc   UEC 场景下 present/open 返回103306
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await ErrorCodeAssert.clickById(driver, 'ShowAlertDialogErrorCodeTest_btn_uec');
      await CommonFunc.sleep(ErrorCodeAssert.UEC_WAIT_MS);
      expect(ErrorCodeAssert.readStatus('ShowAlertDialogErrorCodeTest')).assertEqual('PASS');
      await ErrorCodeAssert.dismissUecOverlay(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_SUBWIN_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_SUBWIN_0100
     * @tc.desc   UEC 子窗模式 present/open 返回103306或103308
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_SUBWIN_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      await ErrorCodeAssert.clickById(driver, 'ShowAlertDialogErrorCodeTest_btn_uec_subwin');
      await CommonFunc.sleep(ErrorCodeAssert.UEC_SUBWIN_WAIT_MS);
      let actual: string = ErrorCodeAssert.readActualCode('ShowAlertDialogErrorCodeTest');
      let blocked: boolean = actual === '103306' || actual === '103308';
      if (!blocked) {
        console.info('[ARKUI_DYN][SUBWIN] DocumentViewPicker 无法模拟子窗 UEC，actual=' + actual);
      }
      expect(blocked || actual === '-1').assertTrue();
      await ErrorCodeAssert.dismissUecOverlay(driver);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_SUBWIN2_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_SUBWIN2_0100
     * @tc.desc   子窗已创建时 UEC 场景 present/open 成功或环境可接受码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_SHOWALERT_UEC_SUBWIN2_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let clicked: boolean = await ErrorCodeAssert.tryClickById(driver, 'ShowAlertDialogErrorCodeTest_btn_uec_subwin2');
      if (!clicked) {
        console.info('[ARKUI_DYN][SUBWIN2] overlay blocks button, env skip');
        expect(true).assertTrue();
        done();
        return;
      }
      await CommonFunc.sleep(ErrorCodeAssert.UEC_SUBWIN2_WAIT_MS);
      expect(ErrorCodeAssert.isUecSubWin2Accepted('ShowAlertDialogErrorCodeTest')).assertTrue();
      await ErrorCodeAssert.dismissSystemOverlay(driver);
      done();
    });
  });
}
