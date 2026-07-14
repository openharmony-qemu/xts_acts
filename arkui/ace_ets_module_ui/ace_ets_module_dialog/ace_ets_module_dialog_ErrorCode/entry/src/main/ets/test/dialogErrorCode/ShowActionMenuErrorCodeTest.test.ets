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

export default function ShowActionMenuErrorCodeTest() {
  describe('ShowActionMenuErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] ShowActionMenuErrorCodeTest beforeEach');
    let driver: Driver = Driver.create();
    const pageUrl =
      'MainAbility/pages/dialogErrorCode/showActionMenu/ShowActionMenuErrorCodeTest';
    await ErrorCodeAssert.openTestPage(driver, pageUrl, 'ShowActionMenuErrorCodeTest_btn_no_args');
    done();
  });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NO_ARGS_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NO_ARGS_0100
     * @tc.desc   present 不传参数返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NO_ARGS_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NO_ARGS_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowActionMenuErrorCodeTest_btn_no_args', 'ShowActionMenuErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NO_ARGS_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NULL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NULL_0100
     * @tc.desc   present 传 null 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NULL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NULL_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowActionMenuErrorCodeTest_btn_null', 'ShowActionMenuErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NULL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NUMBER_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NUMBER_0100
     * @tc.desc   present 传数字返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NUMBER_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NUMBER_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowActionMenuErrorCodeTest_btn_number', 'ShowActionMenuErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NUMBER_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_EMPTY_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_EMPTY_0100
     * @tc.desc   buttons 为空返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_EMPTY_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_EMPTY_0100] START');
      let driver: Driver = Driver.create();
      let status: string = await ErrorCodeAssert.clickAndWaitStatus(
        driver, 'ShowActionMenuErrorCodeTest_btn_empty_buttons', 'ShowActionMenuErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_EMPTY_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NORMAL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NORMAL_0100
     * @tc.desc   正常 showActionMenu 返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NORMAL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NORMAL_0100] START');
      let driver: Driver = Driver.create();
      try {
        await ErrorCodeAssert.clickById(driver, 'ShowActionMenuErrorCodeTest_btn_normal');
      } catch (_e) {
        await ErrorCodeAssert.clickByText(driver, '正常showActionMenu');
      }
      await CommonFunc.sleep(800);
      // 菜单遮罩可能挡住 Inspector，先关窗再读结果态
      await ErrorCodeAssert.dismissAfterNormal(driver);
      let status: string = await ErrorCodeAssert.waitStatus(
        'ShowActionMenuErrorCodeTest', ErrorCodeAssert.STATUS_WAIT_MS);
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NORMAL_0100] status=' + status);
      if (status === 'IDLE' || status.length === 0) {
        await ErrorCodeAssert.clickByText(driver, '正常showActionMenu');
        await CommonFunc.sleep(800);
        await ErrorCodeAssert.dismissAfterNormal(driver);
        status = await ErrorCodeAssert.waitStatus(
          'ShowActionMenuErrorCodeTest', ErrorCodeAssert.STATUS_WAIT_MS);
      }
      expect(status).assertEqual('PASS');
      done();
    });
  });
}
