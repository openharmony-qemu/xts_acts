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
export default function getAttrsTest() {
  describe('getAttrsTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("getAttrsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/FrameNode/getAttrs",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get getAttrsTest state pages: " + JSON.stringify(pages));
        if (!("getAttrs" == pages.name)) {
          console.info("get getAttrsTest state pages.name: " + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push getAttrsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getAttrsTest page error: " + err);
           expect().assertFail();
      }
      //done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0100
     * @tc.name     getAttrsTest_static_0100
     * @tc.desc     getAttrsTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0100 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getPositionToWindow'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content') != '{"x":0,"y":0}').assertTrue();
      console.info('[getAttrsTest_static_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0200
     * @tc.name     getAttrsTest_static_0200
     * @tc.desc     getAttrsTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0200 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getPositionToParent'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content') != '{"x":0,"y":0}').assertTrue();
      console.info('[getAttrsTest_static_0200] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0300
     * @tc.name     getAttrsTest_static_0300
     * @tc.desc     getAttrsTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0300 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getMeasuredSize'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content') != '{"width":300,"height":50}').assertTrue();
      console.info('[getAttrsTest_static_0300] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0400
     * @tc.name     getAttrsTest_static_0400
     * @tc.desc     getAttrsTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0400 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getLayoutPosition'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content') != '{"x":0,"y":0}').assertTrue();
      console.info('[getAttrsTest_static_0400] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0500
     * @tc.name     getAttrsTest_static_0500
     * @tc.desc     getAttrsTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0500 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getUserConfigBorderWidth'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('"top":{"unit":1,"value":3}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"right":{"unit":1,"value":3}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"bottom":{"unit":1,"value":3}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"left":{"unit":1,"value":3}');
      console.info('[getAttrsTest_static_0500] END');
      done();
      
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0600
     * @tc.name     getAttrsTest_static_0600
     * @tc.desc     getAttrsTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0600 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getUserConfigPadding'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0600] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('"top":{"unit":1,"value":10}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"right":{"unit":1,"value":10}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"bottom":{"unit":1,"value":10}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"left":{"unit":1,"value":10}');
      console.info('[getAttrsTest_static_0600] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0700
     * @tc.name     getAttrsTest_static_0700
     * @tc.desc     getAttrsTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0700 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getUserConfigMargin'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertContain('"top":{"unit":1,"value":20}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"right":{"unit":1,"value":20}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"bottom":{"unit":1,"value":20}');
      expect(obj.getElement('$attrs').getString('content')).assertContain('"left":{"unit":1,"value":20}');
      console.info('[getAttrsTest_static_0700] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0800
     * @tc.name     getAttrsTest_static_0800
     * @tc.desc     getAttrsTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0800 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getUserConfigSize'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{"width":{"unit":1,"value":300},"height":{"unit":1,"value":50}}');
      console.info('[getAttrsTest_static_0800] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_0900
     * @tc.name     getAttrsTest_static_0900
     * @tc.desc     getAttrsTest_static_0900
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_0900 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getUniqueId'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_0900] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content') != "0").assertTrue();
      console.info('[getAttrsTest_static_0900] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_1000
     * @tc.name     getAttrsTest_static_1000
     * @tc.desc     getAttrsTest_static_1000
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_1000 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getCustomProperty'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_1000] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("undefined");
      console.info('[getAttrsTest_static_1000] END');
      done();
    });
    
    



    /**
     * @tc.number   getAttrsTest_static_1100
     * @tc.name     getAttrsTest_static_1100
     * @tc.desc     getAttrsTest_static_1100
     * @tc.level    Level.LEVEL0
     */
it('getAttrsTest_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getAttrsTest_static_1100 START');
      let driver = Driver.create()
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('XNodeTest await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('getCommonAttribute'));
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
      let strJson: string = inspector.getInspectorByKey('FrameNode_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getAttrsTest_static_1100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("false");
      console.info('[getAttrsTest_static_1100] END');
      done();
    });
  })
}