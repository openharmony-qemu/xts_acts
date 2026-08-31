'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, MouseButton, Point } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function renderNodeStateTest(): void {
  describe('renderNodeStateTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/renderNode/renderNodeState',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get renderNodeStateTest pages:' + JSON.stringify(pages));
        if (!('renderNodeState' == pages.name)) {
          console.info('get renderNodeStateTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push renderNodeStateTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('renderNodeStateTest afterEach sleep error: ' + err);
      }
      console.info('renderNodeStateTest after each called');
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_RENDER_NODE_STATE_0100
     * @tc.number SUB_ACE_ARKUI_RENDER_NODE_STATE_0100
     * @tc.desc   To test add nodeRenderState return RENDER_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RENDER_NODE_STATE_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ARKUI_RENDER_NODE_STATE_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let buttonAdd = await driver.findComponent(ON.id('addButton'));
      await (buttonAdd?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('renderText');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0100] title: ' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('收到的通知: RENDER_IN');
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0100] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_ARKUI_RENDER_NODE_STATE_0200
     * @tc.number SUB_ACE_ARKUI_RENDER_NODE_STATE_0200
     * @tc.desc   To test add nodeRenderState return RENDER_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RENDER_NODE_STATE_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ARKUI_RENDER_NODE_STATE_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let buttonAdd = await driver.findComponent(ON.id('addButton'));
      await (buttonAdd?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let textRender = await driver.findComponent(ON.text('blue'));
      await (textRender?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('renderText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0200] title: ' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('收到的通知: RENDER_OUT');
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0200] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_ARKUI_RENDER_NODE_STATE_0300
     * @tc.number SUB_ACE_ARKUI_RENDER_NODE_STATE_0300
     * @tc.desc   To test remove nodeRenderState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RENDER_NODE_STATE_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ARKUI_RENDER_NODE_STATE_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let textRender1 = await driver.findComponent(ON.text('green'));
      await (textRender1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let buttonRemove = await driver.findComponent(ON.id('removeButton'));
      await (buttonRemove?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('renderText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0300] title: ' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('收到的通知: ');
      console.info('[SUB_ACE_ARKUI_RENDER_NODE_STATE_0300] END');
      done();
    });
  })
}