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

import { afterEach, beforeEach, describe, expect, it, Level ,beforeAll} from '../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
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
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import { SpanExampleManager } from '../../../ets/MainAbility/pages/span/spanUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { TextCase, TextDecorationType, Color } from '@ohos.arkui.component';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const waitUiReadyMs = 1000;

export default function spanUIJsunit() {
  describe('spanUIJsunit', () => {
    beforeAll(() => {
      console.info("spanUIJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("spanUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/spanUIJsunit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get spanUIJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get spanUIJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push spanUIJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push spanUIJsunit page error:" + err);
      }
      console.info("spanUIJsunit beforeEach end");
    });

    it('spanUIJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the sapn component and test attribute
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0100 component obj is:' + obj.getElement('$attrs').getString('content') + "--" +
      obj.getElement('$attrs').getString('textCase') + "---" + obj.getElement('$attrs').getString('letterSpacing') +
        "--" + obj.getElement('$attrs').getString('fontSize') + "--" +
      obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('I am Underline-span');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.Normal');
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('10.00fp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.Underline","color":"#FFFFCCEE",' +
          '"style":"TextDecorationStyle.SOLID"}');
      console.info('spanUIJsunit_static_0100 END');
      done();
    });

    it('spanUIJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the content and textCase attribute normal value  dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'content', value: 'I am test'
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'textCase', value: TextCase.LowerCase
      })
      await CommonFunc.sleep(300);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('I am test');
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.LowerCase');
      done();
    });

    it('spanUIJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute enum textCase value of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'textCase', value: TextCase.UpperCase
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getString('textCase'));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
      done();
    });

    it('spanUIJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      // modify the values illegal attribute enum textCase value of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'textCase', value: 5
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getString('textCase'));
      expect(obj.getElement('$attrs').getString('textCase')).assertEqual('TextCase.UpperCase');
      done();
    });

    it('spanUIJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      // modify the normal values letter space and fontSize of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'fontSize', value: 20
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'letterSpacing', value: 25
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0500 component obj is: ' + obj.getElement('$attrs').getString('letterSpacing') +
        "----" + obj.getElement('$attrs').getString('fontSize'));
      expect(obj.getElement('$attrs').getString('letterSpacing')).assertEqual('25.00fp');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      done();
    });

    it('spanUIJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'type', value: TextDecorationType.None
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'color', value: '#FFAACC'
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0600 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.None","color":"#FFFFAACC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    it('spanUIJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'type', value: TextDecorationType.Overline
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0700 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.Overline","color":"#FFFFAACC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      spanExampleManager.message.notify({
        name: 'type', value: TextDecorationType.LineThrough
      })
      await CommonFunc.sleep(300);
      let strJson2 = inspector.getInspectorByKey('testSpan');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('spanUIJsunit_static_0700 component obj2 is: ' + obj2.getElement('$attrs').getString('decoration'));
      expect(obj2.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFFFAACC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    it('spanUIJsunit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0800 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'color', value: Color.Green
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0800 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FF008000",' +
          '"style":"TextDecorationStyle.SOLID"}');
      spanExampleManager.message.notify({
        name: 'color', value: 'rgb(238, 130, 238)'
      })
      await CommonFunc.sleep(300);
      let strJson2 = inspector.getInspectorByKey('testSpan');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('spanUIJsunit_static_0800 component obj2 is: ' + obj2.getElement('$attrs').getString('decoration'));
      expect(obj2.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.LineThrough","color":"#FFEE82EE",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });

    it('spanUIJsunit_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('spanUIJsunit_static_0900 START');
      await CommonFunc.sleep(1000);
      // modify the values decoration attribute  of span illegal dynamically
      const spanExampleManager = AppStorage.get<SpanExampleManager>("spanExampleManager", Type.from<SpanExampleManager>()) as SpanExampleManager
      spanExampleManager.message.notify({
        name: 'type', value: 8
      })
      await CommonFunc.sleep(300);
      spanExampleManager.message.notify({
        name: 'color', value: '#FCC'
      })
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('testSpan');
      let obj = JSON.parseJsonElement(strJson);
      console.info('spanUIJsunit_static_0900 component obj is: ' + obj.getElement('$attrs').getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual('{"type":"TextDecorationType.None","color":"#FFFFCCCC",' +
          '"style":"TextDecorationStyle.SOLID"}');
      done();
    });
  })
}