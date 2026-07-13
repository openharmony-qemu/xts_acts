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

export default function UpdateCustomDialogErrorCodeTest() {
  describe('UpdateCustomDialogErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] UpdateCustomDialogErrorCodeTest beforeEach');
    router.clear();
    const pageUrl =
      'MainAbility/pages/dialogErrorCode/updateCustomDialog/UpdateCustomDialogErrorCodeTest';
    await router.pushUrl({ url: pageUrl });
    await CommonFunc.sleep(2500);
    done();
  });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CONTENT_NULL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CONTENT_NULL_0100
     * @tc.desc   update content=null 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CONTENT_NULL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CONTENT_NULL_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UpdateCustomDialogErrorCodeTest_btn_content_null'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('UpdateCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CONTENT_NULL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NO_ARGS_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NO_ARGS_0100
     * @tc.desc   update 不传参数返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NO_ARGS_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NO_ARGS_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UpdateCustomDialogErrorCodeTest_btn_no_args'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('UpdateCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NO_ARGS_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_DISPOSED_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_DISPOSED_0100
     * @tc.desc   disposed content 返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_DISPOSED_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_DISPOSED_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UpdateCustomDialogErrorCodeTest_btn_disposed'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('UpdateCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_DISPOSED_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NOT_OPEN_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NOT_OPEN_0100
     * @tc.desc   未打开 content 返回103303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NOT_OPEN_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NOT_OPEN_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UpdateCustomDialogErrorCodeTest_btn_not_opened'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('UpdateCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NOT_OPEN_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CLOSED_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CLOSED_0100
     * @tc.desc   已关闭 content 返回103303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CLOSED_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CLOSED_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UpdateCustomDialogErrorCodeTest_btn_already_closed'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('UpdateCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_CLOSED_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NORMAL_0100
     * @tc.name   SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NORMAL_0100
     * @tc.desc   正常 update 返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NORMAL_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NORMAL_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('UpdateCustomDialogErrorCodeTest_btn_normal'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('UpdateCustomDialogErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_UPDATECD_NORMAL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });
  });
}
