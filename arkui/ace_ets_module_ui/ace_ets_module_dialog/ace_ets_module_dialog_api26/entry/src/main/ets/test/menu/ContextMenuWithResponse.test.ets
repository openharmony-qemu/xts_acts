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

export default function ContextMenuWithResponse() {
  describe('ContextMenuWithResponse', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] ContextMenuWithResponse beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('ContextMenuWithResponse', 'MainAbility/pages/menu/ContextMenuWithResponse');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] ContextMenuWithResponse afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] ContextMenuWithResponse afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0100
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0100
     * @tc.desc bindContextMenuWithResponse MenuElement LongPress
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_with_resp_elements'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('WithCopy'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0200
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0200
     * @tc.desc bindContextMenuWithResponse CustomBuilderT LongPress
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_with_resp_builder'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('LongPressItem'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0300
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0300
     * @tc.desc bindContextMenuWithResponse options placement Top
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_with_resp_options'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('WithDelete'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0400
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0400
     * @tc.desc bindContextMenuWithResponse item click updates lastAction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_with_resp_elements'));
      expect(btn !== null).assertTrue();
      await btn.longClick();
      await CommonFunc.sleep(1000);
      let item = await driver.findComponent(ON.text('WithCopy'));
      expect(item !== null).assertTrue();
      await item.click();
      await CommonFunc.sleep(200);
      let label = await driver.findComponent(ON.id('with_resp_last_action'));
      let txt = await label.getText();
      expect(txt === 'last=WithCopy').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0400 END');
      done();
    });

  });
}
