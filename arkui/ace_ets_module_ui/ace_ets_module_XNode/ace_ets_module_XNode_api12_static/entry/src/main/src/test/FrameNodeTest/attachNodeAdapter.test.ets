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
import { describe, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function attachNodeAdapterTest() {
  describe('attachNodeAdapterTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("attachNodeAdapterTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/attachNodeAdapter",
      }
      // try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get attachNodeAdapterTest state pages: " + JSON.stringify(pages));
        if (!("attachNodeAdapter" == pages.name)) {
          console.info("get attachNodeAdapterTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push attachNodeAdapterTest success: " + JSON.stringify(result));
        }
      // } catch (err) {
      //   console.error("push attachNodeAdapterTest page error: " + err);
      //      expect().assertFail();
      // }
      //done();
    });
    
    



    /**
     * @tc.number   onCreateChildTest_static_0010
     * @tc.name     onCreateChildTest_static_0010
     * @tc.desc     onCreateChildTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('onCreateChildTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('onCreateChildTest_0010 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(500);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('onCreateChild_id'));
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('onCreateChild_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onCreateChildTest_static_0010] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('onCreateChild succ');
      console.info('[onCreateChildTest_static_0010] END');
      done();
    });
    
    



    /**
     * @tc.number   onDisposeChildTest_static_0020
     * @tc.name     onDisposeChildTest_static_0020
     * @tc.desc     onDisposeChildTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('onDisposeChildTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('onDisposeChildTest_static_0020 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(500);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('attachNodeAdapterReload'));
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button1 = await driver.findComponent(ON.id('onDisposeChild_id'));
      try {
      await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('onDisposeChild_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onDisposeChildTest_static_0020] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('onDisposeChild succ');
      console.info('[onDisposeChildTest_static_0020] END');
      done();
    });
    
    



    /**
     * @tc.number   onUpdateChildTest_static_0030
     * @tc.name     onUpdateChildTest_static_0030
     * @tc.desc     onUpdateChildTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('onUpdateChildTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('onUpdateChildTest_static_0030 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(500);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('attachNodeAdapterReload'));
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button1 = await driver.findComponent(ON.id('onUpdateChild_id'));
      try {
      await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('onUpdateChild_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onUpdateChildTest_static_0030] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('onUpdateChild succ');
      console.info('[onUpdateChildTest_static_0030] END');
      done();
    });
    
    



    /**
     * @tc.number   attachNodeAdapterTest_static_0040
     * @tc.name     attachNodeAdapterTest_static_0040
     * @tc.desc     attachNodeAdapterTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('attachNodeAdapterTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('attachNodeAdapterTest_static_0040 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(500);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button1 = await driver.findComponent(ON.id('attachNodeAdapter_id'));
      try {
      await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('attachNodeAdapter_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[attachNodeAdapterTest_static_0040] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('50');
      console.info('[attachNodeAdapterTest_static_0040] END');
      done();
    });
    
    



    /**
     * @tc.number   detachNodeAdapterTest_static_0050
     * @tc.name     detachNodeAdapterTest_static_0050
     * @tc.desc     detachNodeAdapterTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('detachNodeAdapterTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('detachNodeAdapterTest_static_0050 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(500);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button1 = await driver.findComponent(ON.id('detachNodeAdapter_id'));
      try {
      await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('detachNodeAdapter_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[detachNodeAdapterTest_static_0050] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('0');
      console.info('[detachNodeAdapterTest_static_0050] END');
      done();
    });
  })
}