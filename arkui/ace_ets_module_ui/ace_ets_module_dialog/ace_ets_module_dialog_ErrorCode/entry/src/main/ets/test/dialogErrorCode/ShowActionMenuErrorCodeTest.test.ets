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

export default function ShowActionMenuErrorCodeTest() {
  describe('ShowActionMenuErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] ShowActionMenuErrorCodeTest beforeEach');
    router.clear();
    await router.pushUrl({ url: 'MainAbility/pages/dialogErrorCode/showActionMenu/ShowActionMenuErrorCodeTest' });
    await CommonFunc.sleep(2500);
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
      let btn = await driver.findComponent(ON.id('ShowActionMenuErrorCodeTest_btn_no_args'));

      await btn.click();
      await CommonFunc.sleep(1500);
      let status: string = ErrorCodeAssert.readStatus('ShowActionMenuErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('ShowActionMenuErrorCodeTest_btn_null'));

      await btn.click();
      await CommonFunc.sleep(1500);
      let status: string = ErrorCodeAssert.readStatus('ShowActionMenuErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('ShowActionMenuErrorCodeTest_btn_number'));

      await btn.click();
      await CommonFunc.sleep(1500);
      let status: string = ErrorCodeAssert.readStatus('ShowActionMenuErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('ShowActionMenuErrorCodeTest_btn_empty_buttons'));

      await btn.click();
      await CommonFunc.sleep(1500);
      let status: string = ErrorCodeAssert.readStatus('ShowActionMenuErrorCodeTest');
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
      let btn = await driver.findComponent(ON.id('ShowActionMenuErrorCodeTest_btn_normal'));

      await btn.click();
      await CommonFunc.sleep(1500);
      let status: string = ErrorCodeAssert.readStatus('ShowActionMenuErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_ACTIONMENU_NORMAL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });
  });
}
