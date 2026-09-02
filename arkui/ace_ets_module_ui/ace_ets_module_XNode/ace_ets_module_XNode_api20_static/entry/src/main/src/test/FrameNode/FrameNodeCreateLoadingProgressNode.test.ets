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
export default function FrameNodeCreateLoadingProgressNode() {
  describe('FrameNodeCreateLoadingProgressNode', () => {
    beforeEach(async () => {
      console.info("FrameNodeCreateLoadingProgressNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/FrameNodeCreateLoadingProgressNode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FrameNodeCreateLoadingProgressNode state pages:" + JSON.stringify(pages));
        if (!("FrameNodeCreateLoadingProgressNode" == pages.name)) {
          console.info("get FrameNodeCreateLoadingProgressNode pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FrameNodeCreateLoadingProgressNode page error:" + err);
      }
      console.info("FrameNodeCreateLoadingProgressNode beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      console.info("FrameNodeCreateLoadingProgressNode after each called");
    });
        
    /**
     * @tc.name     FrameNodeCreateLoadingProgressNode_static_0100
     * @tc.number   SUB_ARKUI_API_FrameNodeCreateLoadingProgressNode_static_0100
     * @tc.desc     FrameNodeCreateLoadingProgressNode_static_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUM
     * @tc.level    Level.LEVEL0
     */
it('FrameNodeCreateLoadingProgressNode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FrameNodeCreateLoadingProgressNode_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.waitForComponent(ON.id('error_loadingProgress_id'), 3000) as Component;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('error_loadingProgress_key');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      console.info('[FrameNodeCreateLoadingProgressNode_static_0100] content1:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('createLoadingProgressNode success');
      
      try {
        await button.click();
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      strJson = inspector.getInspectorByKey('error_loadingProgress_key');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FrameNodeCreateLoadingProgressNodeTest await err: ' + JSON.stringify(err));
      }
      obj = JSON.parseJsonElement(strJson);
      console.info('[FrameNodeCreateLoadingProgressNode_static_0100] content2:' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('change loadingProgress backgroundColor error');
      console.info('[FrameNodeCreateLoadingProgressNode_static_0100] END');
      done();
    });
  })
}