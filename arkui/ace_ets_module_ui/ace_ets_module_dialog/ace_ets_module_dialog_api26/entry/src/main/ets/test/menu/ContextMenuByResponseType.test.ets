/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function ContextMenuByResponseType() {
  describe('ContextMenuByResponseType', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] ContextMenuByResponseType beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('ContextMenuByResponseType', 'MainAbility/pages/menu/ContextMenuByResponseType');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] ContextMenuByResponseType afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] ContextMenuByResponseType afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0100
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0100
     * @tc.desc bindContextMenuByResponseType MenuElement LongPress shows items
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_resp_type_longpress'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('RespCopy'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0200
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0200
     * @tc.desc bindContextMenuByResponseType CustomBuilder LongPress shows items
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_resp_type_custom'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('CustomRespA'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0300
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0300
     * @tc.desc bindContextMenuByResponseType with placement options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_resp_type_options'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('RespPaste'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0400
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0400
     * @tc.desc bindContextMenuByResponseType MenuElement click action updates state
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_resp_type_longpress'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('RespShare'));
      expect(node !== null).assertTrue();
      let item = await driver.findComponent(ON.text('RespShare'));
      await item.click();
      await CommonFunc.sleep(200);
      let label = await driver.findComponent(ON.id('resp_last_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt === 'last=RespShare').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0400 END');
      done();
    });

  });
}
