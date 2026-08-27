'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level, afterEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function FrameNodeCreateRadioNode() {
  describe('FrameNodeCreateRadioNode', () => {
    beforeEach(async () => {
      console.info("FrameNodeCreateRadioNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/FrameNodeCreateRadioNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FrameNodeCreateRadioNode state pages:" + JSON.stringify(pages));
        if (!("FrameNodeCreateRadioNode" == pages.name)) {
          console.info("get FrameNodeCreateRadioNode pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FrameNodeCreateRadioNode page error:" + err);
      }
      console.info("FrameNodeCreateRadioNode beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      console.info("FrameNodeCreateRadioNode after each called");
    });
        
    /**
     * @tc.name     FrameNodeCreateRadioNode_static_0100
     * @tc.number   SUB_ARKUI_API_FrameNodeCreateRadioNode_static_0100
     * @tc.desc     FrameNodeCreateRadioNode_static_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUM
     * @tc.level    Level.LEVEL0
     */
it('FrameNodeCreateRadioNode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FrameNodeCreateRadioNode_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.waitForComponent(ON.id('error_radio_id'), 3000) as Component;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('error_radio_key');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      console.info('[FrameNodeCreateRadioNode_static_0100] content1:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('createRadioNode success');
      
      try {
        await button.click();
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      strJson = inspector.getInspectorByKey('error_radio_key');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateRadioNodeTest await err: ' + JSON.stringify(err));
      }
      obj = JSON.parseJsonElement(strJson);
      console.info('[FrameNodeCreateRadioNode_static_0100] content2:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('change radio backgroundColor error');
      console.info('[FrameNodeCreateRadioNode_static_0100] END');
      done();
    });
  })
}