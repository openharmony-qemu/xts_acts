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

export default function OpenCustomDialogWithControllerErrorCodeTest() {
  describe('OpenCustomDialogWithControllerErrorCodeTest', () => {
  beforeEach(async (done: () => void): Promise<void> => {
    console.info('[ARKUI_DYN] OpenCustomDialogWithControllerErrorCodeTest beforeEach');
    router.clear();
    await router.pushUrl({ url: 'MainAbility/pages/dialogErrorCode/openCustomDialogWithController/OpenCustomDialogWithControllerErrorCodeTest' });
    await CommonFunc.sleep(2500);
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
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NULL_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('OpenCustomDialogWithControllerErrorCodeTest_btn_content_null'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('OpenCustomDialogWithControllerErrorCodeTest');
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
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('OpenCustomDialogWithControllerErrorCodeTest_btn_content_number'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('OpenCustomDialogWithControllerErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_CONTENT_NUM_0100] status=' + status);
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
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_DUP_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('OpenCustomDialogWithControllerErrorCodeTest_btn_duplicate'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('OpenCustomDialogWithControllerErrorCodeTest');
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
    it('SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100] START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('OpenCustomDialogWithControllerErrorCodeTest_btn_normal'));

      await btn.click();
      await CommonFunc.sleep(2000);
      let status: string = ErrorCodeAssert.readStatus('OpenCustomDialogWithControllerErrorCodeTest');
      console.info('[ARKUI_DYN][SUB_ARKUI_DIALOG_ERRCODE_OCDC_NORMAL_0100] status=' + status);
      expect(status).assertEqual('PASS');
      done();
    });
  });
}
