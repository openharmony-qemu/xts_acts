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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import { MessageManager, Callback, GlobalMessage } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';
import { ImageRepeat, ImageFit } from '@ohos.arkui.component'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function imageOneJsunit() {
  describe('imageOneJsunit', () => {
    beforeAll(() => {
      console.info("imageOneJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/imageOne",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageOneJsunit state pages:" + JSON.stringify(pages));
        if (!("imageOne" == pages.name)) {
          console.info("get imageOneJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageOneJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageOneJsunit page error:" + err);
      }
      console.info("imageOneJsunit beforeEach end");
    });


    it('imageOneJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0100 component obj is: ' + obj.getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test3.png');

      let strJson2 = inspector.getInspectorByKey('objectFit');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_0100 component obj2 is: ' + obj2.getElement('$attrs').getString('objectFit'));
      expect(obj2.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.None');

      let strJson3 = inspector.getInspectorByKey('repeat');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_0100 component obj3 is: ' + obj3.getElement('$attrs').getString('objectRepeat'));
      expect(obj.getElement('$attrs').getString('objectRepeat')).assertEqual('ImageRepeat.NoRepeat');
      done();
    });

    it('imageOneJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the image format
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample1', Type.from<GlobalMessage>());
      globalMessage?.message.notify({
        name: 'imageNamePng', value: 'test2.svg'
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0200 component obj is: ' + obj.getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test2.svg');

      globalMessage?.message.notify({
        name: 'imageNamePng', value: 'test.gif'
      });
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('image1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_0200 component obj2 is: ' + obj2.getElement('$attrs').getString('src'));
      expect(obj2.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test.gif');

      globalMessage?.message.notify({
        name: 'imageNamePng', value: 'bm.bmp'
      });
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('image1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_0100 component obj3 is: ' + obj3.getElement('$attrs').getString('src'));
      expect(obj3.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/bm.bmp');

      globalMessage?.message.notify({
        name: 'imageNamePng', value: 'bm.jpg'
      });
      await CommonFunc.sleep(1000);
      let strJson4 = inspector.getInspectorByKey('image1');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('textimageOneJsunit_0100 component obj4 is: ' + obj4.getElement('$attrs').getString('src'));
      expect(obj4.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/bm.jpg');
      done();
    });

    it('imageOneJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the image of not exit
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample1', Type.from<GlobalMessage>());
      globalMessage?.message.notify({
        name: 'imageNamePng', value: 'aaa.png'
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0300 component obj is: ' + obj.getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/aaa.png');
      done();
    });

    it('imageOneJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the enum of objectFit
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample1', Type.from<GlobalMessage>()) as GlobalMessage;
      globalMessage?.message.notify({
        name: 'objectFit', value: ImageFit.Cover
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('objectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0400 component obj is: ' + obj.getElement('$attrs').getString('objectFit'));
      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Cover');

      globalMessage?.message.notify({
        name: 'objectFit', value: ImageFit.Auto
      });
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('objectFit');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_0400 component obj2 is: ' + obj2.getElement('$attrs').getString('objectFit'));
      expect(obj2.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Auto');

      globalMessage?.message.notify({
        name: 'objectFit', value: ImageFit.Fill
      });
      await CommonFunc.sleep(500);
      let strJson3 = inspector.getInspectorByKey('objectFit');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_0400 component obj3 is: ' + obj3.getElement('$attrs').getString('objectFit'));
      expect(obj3.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Fill');

      globalMessage?.message.notify({
        name: 'objectFit', value: ImageFit.ScaleDown
      });
      await CommonFunc.sleep(500);
      let strJson4 = inspector.getInspectorByKey('objectFit');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('textimageOneJsunit_0400 component obj4 is: ' + obj4.getElement('$attrs').getString('objectFit'));
      expect(obj4.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.ScaleDown');

      globalMessage?.message.notify({
        name: 'objectFit', value: ImageFit.None
      });

      await CommonFunc.sleep(500);
      let strJson5 = inspector.getInspectorByKey('objectFit');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info('textimageOneJsunit_0400 component obj5 is: ' + obj5.getElement('$attrs').getString('objectFit'));
      expect(obj5.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.None');

      globalMessage?.message.notify({
        name: 'objectFit', value: ImageFit.Contain
      });
      await CommonFunc.sleep(500);
      let strJson6 = inspector.getInspectorByKey('objectFit');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info('textimageOneJsunit_0400 component obj6 is: ' + obj6.getElement('$attrs').getString('objectFit'));
      expect(obj6.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Contain');
      done();
    });

    it('imageOneJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the illegal enum of objectFit
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample1', Type.from<GlobalMessage>());
      globalMessage?.message.notify({
        name: 'objectFit', value: 9
      });
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0500 component obj is: ' + obj.getElement('$attrs').getString('objectFit'));
      expect(obj.getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Cover');
      done();
    });

    it('imageOneJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // test the enum of ImageRepeat
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample1', Type.from<GlobalMessage>());
      globalMessage?.message.notify({
        name: 'objectRepeat', value: ImageRepeat.X
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0600 component obj is: ' + obj.getElement('$attrs').getString('objectRepeat'));
      expect(obj.getElement('$attrs').getString('objectRepeat')).assertEqual('ImageRepeat.X');

      globalMessage?.message.notify({
        name: 'objectRepeat', value: ImageRepeat.Y
      });

      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('repeat');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('textimageOneJsunit_0600 component obj1 is: ' + obj1.getElement('$attrs').getString('objectRepeat'));
      expect(obj1.getElement('$attrs').getString('objectRepeat')).assertEqual('ImageRepeat.Y');

      globalMessage?.message.notify({
        name: 'objectRepeat', value: ImageRepeat.XY
      });
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('repeat');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_0600 component obj2 is: ' + obj2.getElement('$attrs').getString('objectRepeat'));
      expect(obj2.getElement('$attrs').getString('objectRepeat')).assertEqual('ImageRepeat.XY');

      globalMessage?.message.notify({
        name: 'objectRepeat', value: ImageRepeat.NoRepeat
      });
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('repeat');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_0600 component obj3 is: ' + obj3.getElement('$attrs').getString('objectRepeat'));
      expect(obj3.getElement('$attrs').getString('objectRepeat')).assertEqual('ImageRepeat.NoRepeat');
      done();
    });

    it('imageOneJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // test the illegal enum of ImageRepeat
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample1', Type.from<GlobalMessage>());
      globalMessage?.message.notify({
        name: 'objectRepeat', value: undefined
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_0700 component obj is: ' + obj.getElement('$attrs').getString('objectRepeat'));
      expect(obj.getElement('$attrs').getString('objectRepeat')).assertEqual('ImageRepeat.NoRepeat');
      done();
    });
  })
}
