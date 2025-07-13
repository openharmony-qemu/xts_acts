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
import { ImageRenderMode, ImageInterpolation, Color } from '@ohos.arkui.component';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;

export default function imageTwoJsunit() {
  describe('imageTwoJsunit', () => {
    beforeAll(() => {
      console.info("imageTwoJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/image/imageTwo",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageTwoJsunit state pages:" + JSON.stringify(pages));
        if (!("imageTwo" == pages.name)) {
          console.info("get imageTwoJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageTwoJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageTwoJsunit page error:" + err);
      }
      console.info("imageTwoJsunit beforeEach end");
    });


    it('imageTwoJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0100 component obj is: ' + obj.getElement('$attrs').getString('renderMode') + "--" +
      obj.getElement('$attrs').getString('interpolation') + "--" + obj.getElement('$attrs').getString('fillColor') +
        "---" +
      obj.getElement('$attrs').getString('autoResize') + "---" + obj.getElement('$attrs').getString('syncLoad') +
        "----" + obj.getElement('$attrs').getString('copyOption') + "--" +
      obj.getElement('$attrs').getString('colorFilter') + "--" + obj.getElement('$attrs').getString('draggable'));
      expect(obj.getElement('$attrs').getString('renderMode')).assertEqual('ImageRenderMode.Original');
      expect(obj.getElement('$attrs').getString('interpolation')).assertEqual('ImageInterpolation.None');
      expect(obj.getElement('$attrs').getString('fillColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('autoResize')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('syncLoad')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      expect(obj.getElement('$attrs').getString('colorFilter'))
        .assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ' +
          '1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 ' +
          '0.000000 1.000000 0.000000 ');
      expect(obj.getElement('$attrs').getString('draggable')).assertEqual('false');
      done();
    });

    it('imageTwoJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the image rendermode

      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample2', Type.from<GlobalMessage>())
      globalMessage?.message.notify({
        name: 'renderMode', value: ImageRenderMode.Template
      });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0200 component obj is: ' + obj.getElement('$attrs').getString('renderMode'));
      expect(obj.getElement('$attrs').getString('renderMode')).assertEqual('ImageRenderMode.Template');
      done();
    });

    it('imageTwoJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the image rendermode

      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample2', Type.from<GlobalMessage>())
      globalMessage?.message.notify({
        name: 'renderMode', value: undefined
      });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0300 component obj is: ' + obj.getElement('$attrs').getString('renderMode'));
      expect(obj.getElement('$attrs').getString('renderMode')).assertEqual('ImageRenderMode.Original');
      done();
    });

    it('imageTwoJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the enum of interpolation
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample2', Type.from<GlobalMessage>())
      globalMessage?.message.notify({
        name: 'interpolation', value: ImageInterpolation.Low
      });
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0300  component obj is: ' + obj.getElement('$attrs').getString('interpolation'));
      expect(obj.getElement('$attrs').getString('interpolation')).assertEqual('ImageInterpolation.Low');
      globalMessage?.message.notify({
        name: 'interpolation', value: ImageInterpolation.Medium
      });
      await CommonFunc.sleep(300);
      let strJson2 = inspector.getInspectorByKey('image1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageTwoJsunit_0400  component obj2 is: ' + obj2.getElement('$attrs').getString('interpolation'));
      expect(obj2.getElement('$attrs').getString('interpolation')).assertEqual('ImageInterpolation.Medium');
      globalMessage?.message.notify({
        name: 'interpolation', value: ImageInterpolation.High
      });
      await CommonFunc.sleep(300);
      let strJson3 = inspector.getInspectorByKey('image1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('imageTwoJsunit_0400  component obj3 is: ' + obj3.getElement('$attrs').getString('interpolation'));
      expect(obj3.getElement('$attrs').getString('interpolation')).assertEqual('ImageInterpolation.High');
      done();
    });

    it('imageTwoJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the enum of interpolation
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample2', Type.from<GlobalMessage>())
      globalMessage?.message.notify({
        name: 'interpolation', value: undefined
      });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0500  component obj is: ' + obj.getElement('$attrs').getString('interpolation'));
      expect(obj.getElement('$attrs').getString('interpolation')).assertEqual('ImageInterpolation.None');
      done();
    });

    it('imageTwoJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0600 START');
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('ImageExample2', Type.from<GlobalMessage>())
      globalMessage?.message.notify({
        name: 'fillColor', value: "#FFEEAA"
      });
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageOneJsunit_0600 component obj is: ' + obj.getElement('$attrs').getString('fillColor'));
      expect(obj.getElement('$attrs').getString('fillColor')).assertEqual('#FFFFEEAA');
      globalMessage?.message.notify({
        name: 'fillColor', value: "rgb(238, 130, 238)"
      });
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('image1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageTwoJsunit_0600  component obj2 is: ' + obj2.getElement('$attrs').getString('fillColor'));
      expect(obj2.getElement('$attrs').getString('fillColor')).assertEqual('#FFEE82EE');
      globalMessage?.message.notify({
        name: 'fillColor', value: Color.Green
      });
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('image1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('imageTwoJsunit_0600  component obj3 is: ' + obj3.getElement('$attrs').getString('fillColor'));
      expect(obj3.getElement('$attrs').getString('fillColor')).assertEqual('#FF008000');
      done();
    });
  })
}