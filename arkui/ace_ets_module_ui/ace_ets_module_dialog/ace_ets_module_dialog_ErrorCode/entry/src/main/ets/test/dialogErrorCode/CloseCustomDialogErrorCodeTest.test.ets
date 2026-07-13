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
import { Driver, ON } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';
import ErrorCodeAssert from './ErrorCodeAssert';

export default function CloseCustomDialogErrorCodeTest() {
  describe('CloseCustomDialogErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] CloseCustomDialogErrorCodeTest beforeEach');
    router.clear();
    await router.pushUrl({ url: 'MainAbility/pages/dialogErrorCode/closeCustomDialog/CloseCustomDialogErrorCodeTest' });
    await CommonFunc.sleep(2500);
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
      let btn = await driver.findComponent(ON.id('CloseCustomDialogErrorCodeTest_btn_no_args'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('CloseCustomDialogErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('CloseCustomDialogErrorCodeTest_btn_target_null'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_NULL_0100] status=' + status);
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
      let btn = await driver.findComponent(ON.id('CloseCustomDialogErrorCodeTest_btn_not_opened'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('CloseCustomDialogErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('CloseCustomDialogErrorCodeTest_btn_invalid_id'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('CloseCustomDialogErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('CloseCustomDialogErrorCodeTest_btn_dismiss_content'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('CloseCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_CLOSECD_BY_CONTENT_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });
  });
}
