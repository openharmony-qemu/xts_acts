/**
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
import inspector from '@ohos.arkui.inspector'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let flexGrow = 3;
let compareFlexGrow = 1;
const uiContext = new UIContext();
export default function frameNodeGetInterfaceTest() {
  describe('frameNodeGetInterfaceTest', () => {
    beforeAll(() => {
      console.info("frameNodeGetInterfaceTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.FrameNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("frameNodeGetInterfaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/frameNodeTestGetInterface",
      }
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeTestGetInterface state pages: " + JSON.stringify(pages));
        if (!("frameNodeTestGetInterface" == pages.name)) {
          console.info("get frameNodeTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options)
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          // console.info("push frameNodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeTest page error: " + err);
        expect().assertFail();
      }
    });
    /**
     * @tc.number frameNodeGetNodeType
     * @tc.name frameNodeGetInterfaceTest_0100
     * @tc.desc getNodeType Test
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('frameNodeGetInterfaceTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeGetInterfaceTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      // invoke getNodeType interface
      let button = await driver.findComponent(ON.id('getNodeTypeKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = inspector.getInspectorByKey('resultKey');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeGetInterfaceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result CustomFrameNode');
      console.info('[frameNodeGetInterfaceTest_0100] END');
      done();
    });
    /**
     * @tc.number frameNodeGetOpacity
     * @tc.name frameNodeGetInterfaceTest_0200
     * @tc.desc getOpacity test
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('frameNodeGetInterfaceTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeGetInterfaceTest_0200  START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      // invoke getOpacity interface
      let button = await driver.findComponent(ON.id('getOpacityKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = inspector.getInspectorByKey('resultKey');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeGetInterfaceTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result 1');
      console.info('[frameNodeGetInterfaceTest_0200] END');
      done();
    });
    /**
     * @tc.number frameNodeGetVisible
     * @tc.name frameNodeGetInterfaceTest_0300
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('frameNodeGetInterfaceTest_static_0300', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeGetInterfaceTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      // invoke isVisible interface
      let button = await driver.findComponent(ON.id('isVisibleKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = inspector.getInspectorByKey('resultKey');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeGetInterfaceTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result true');
      console.info('[frameNodeGetInterfaceTest_0300] END');
      done();
    });
    /**
     * @tc.number frameNodeIsClipToFrame
     * @tc.name frameNodeGetInterfaceTest_0400
     * @tc.desc testIsClipToFrame
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('frameNodeGetInterfaceTest_static_0400', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeGetInterfaceTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      // invoke isCliptoFrame interface
      let button = await driver.findComponent(ON.id('isCliptoFrameKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = inspector.getInspectorByKey('resultKey');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeGetInterfaceTest_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result false');
      console.info('[frameNodeGetInterfaceTest_0400] END');
      done();
    });
    /**
     * @tc.number frameNodeIsAttached
     * @tc.name frameNodeGetInterfaceTest_0500
     * @tc.desc testIsIsAttached
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('frameNodeGetInterfaceTest_static_0500', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeGetInterfaceTest_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      // invoke IsAttached interface
      let button = await driver.findComponent(ON.id('isAttachedKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = inspector.getInspectorByKey('resultKey');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeGetInterfaceTest_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result true');
      console.info('[frameNodeGetInterfaceTest_0500] END');
      done();
    });
    /**
     * @tc.number frameNodeGetInspectorInfo
     * @tc.name frameNodeGetInterfaceTest_0600
     * @tc.desc testGetInspectorInfo
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('frameNodeGetInterfaceTest_static_0600', Level.LEVEL0, async (done: ()=>void) => {
      console.info('frameNodeGetInterfaceTest_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      // invoke GetInspectorInfo interface
      let button = await driver.findComponent(ON.id('getInspectorInfoKey'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // test the interface data
      let strJson = inspector.getInspectorByKey('resultKey');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[frameNodeGetInterfaceTest_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain("$attrs")
      console.info('[frameNodeGetInterfaceTest_0600] END');
      done();
    });
  })
}