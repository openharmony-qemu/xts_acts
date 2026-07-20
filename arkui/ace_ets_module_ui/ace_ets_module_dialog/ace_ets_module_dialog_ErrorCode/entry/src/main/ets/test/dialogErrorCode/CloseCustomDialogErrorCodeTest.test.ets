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

export default function CloseCustomDialogErrorCodeTest() {
  describe('CloseCustomDialogErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] CloseCustomDialogErrorCodeTest beforeEach');
    let driver: Driver = Driver.create();
    const pageUrl =
      'MainAbility/pages/dialogErrorCode/closeCustomDialog/CloseCustomDialogErrorCodeTest';
    await ErrorCodeAssert.openTestPage(driver, pageUrl, 'CloseCustomDialogErrorCodeTest_btn_no_args');
    done();
  });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NO_ARGS_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NO_ARGS_0100
     * @tc.desc   dismiss 不传参数返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NO_ARGS_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NO_ARGS_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_no_args', 'CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NO_ARGS_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NULL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NULL_0100
     * @tc.desc   dismiss target=null 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NULL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NULL_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_target_null', 'CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NULL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_DISPOSED_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_DISPOSED_0100
     * @tc.desc   dispose 后 dismiss(content) 返回401（103301 见 @manual-verify）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_DISPOSED_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_disposed', 'CloseCustomDialogErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NOT_OPEN_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NOT_OPEN_0100
     * @tc.desc   未打开 content dismiss 返回103303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NOT_OPEN_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NOT_OPEN_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_not_opened', 'CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NOT_OPEN_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BAD_ID_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BAD_ID_0100
     * @tc.desc   无效 dialogId dismiss 返回103303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BAD_ID_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BAD_ID_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_invalid_id', 'CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BAD_ID_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_CONTENT_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_CONTENT_0100
     * @tc.desc   dismiss(content) 正常流程
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_CONTENT_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_CONTENT_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_dismiss_content', 'CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_CONTENT_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_ID_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_ID_0100
     * @tc.desc   dismiss(dialogId) 正常流程
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_ID_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_dismiss_id', 'CloseCustomDialogErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_ALREADY_CLOSED_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_ALREADY_CLOSED_0100
     * @tc.desc   已关闭后再 dismiss(content) 返回103303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_ALREADY_CLOSED_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_already_closed', 'CloseCustomDialogErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_ALREADY_CLOSED_ID_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_ALREADY_CLOSED_ID_0100
     * @tc.desc   已关闭后再 dismiss(dialogId) 返回103303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_ALREADY_CLOSED_ID_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_already_closed_id', 'CloseCustomDialogErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_SUBWIN_CONTENT_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_SUBWIN_CONTENT_0100
     * @tc.desc   子窗 dismiss(content) 正常流程
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_SUBWIN_CONTENT_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'CloseCustomDialogErrorCodeTest_btn_subwin_content', 'CloseCustomDialogErrorCodeTest');
      expect(status).assertEqual('PASS');
      done();
    });
  });
}
