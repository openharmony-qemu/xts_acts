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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
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
import { MessageManager, Callback, Message } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { MarqueeManager } from '../../../ets/MainAbility/pages/marquee/marqueeUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const waitUiReadyMs = 1000;

export default function marqueeUIJsunit() {
  describe('marqueeUIJsunit', () => {
    beforeAll(() => {
      console.info("marqueeUIJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("marqueeUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/marqueeUIJsunit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get marqueeUIJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get marqueeUIJsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push marqueeUIJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marqueeUIJsunit page error:" + err);
      }
      console.info("marqueeUIJsunit beforeEach end");
    });

    it('marqueeUIJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the marquee component and test attribute
      let strJson = inspector.getInspectorByKey('marquee');
      console.info('marqueeUIJsunit_static_0100 hhe');
      const obj = JSON.parseJsonElement(strJson);
      // to confirm allowScale
      console.info('marqueeUIJsunit_static_0100 component obj is: ' + obj.getElement('$attrs').getString('allowScale'));
      expect(obj.getElement('$attrs').getString('start')).assertEqual('false');
      // const uiContext = new UIContext();
      // expect(Math.abs(obj.getElement('$attrs').getDouble('step') - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(obj.getElement('$attrs').getString('loop')).assertEqual('2');
      expect(obj.getElement('$attrs').getString('fromStart')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('src')).assertEqual('Running Marquee starts rolling');
      done();
    });

    it('marqueeUIJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0200 START');
      // modify the type attribute normal value of marquee dynamically
      const marqueeManager = AppStorage.get<MarqueeManager>("marqueeManager", Type.from<MarqueeManager>()) as MarqueeManager
      marqueeManager.message.notify({name: 'fromStart', value: true});
      await CommonFunc.sleep(200);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('marquee');
      const obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('fromStart')).assertEqual('true');
      done();
    });

    it('marqueeUIJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      //  test event
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('start'));
      await driver.delayMs(waitUiReadyMs);
      btn?.click();
      await driver.delayMs(5000);
      // check the test event
      let ttx = await driver.findComponent(ON.id('text1'));
      let txt = await (ttx?.getText() as Promise<string>);
      console.info("[marqueeUIJsunit_static_0300'] component obj is: " + txt);
      expect(txt == 'onStart').assertTrue();
      let ttxx = await driver.findComponent(ON.id('text2'));
      let txtt = await (ttxx?.getText() as Promise<string>);
      console.info("[marqueeUIJsunit_static_0300'] component obj2 is: " + txtt);
      expect(txtt == 'onBounce').assertTrue();
      await driver.delayMs(1000);
      let ttxxx = await driver.findComponent(ON.id('text3'));
      let txttt = await (ttxxx?.getText() as Promise<string>);
      console.info("[marqueeUIJsunit_static_0300'] component obj3 is: " + txttt);
      expect(txttt == 'onFinish').assertTrue();
      done();
    });

    it('marqueeUIJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0300 START');
      await CommonFunc.sleep(100);
      // modify the values partly attribute illegal value of marguee dynamically
      const marqueeManager = AppStorage.get<MarqueeManager>("marqueeManager", Type.from<MarqueeManager>()) as MarqueeManager
      marqueeManager.message.notify({name: 'loop', value: -30})
      await CommonFunc.sleep(1000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('marquee');
      const obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('loop')).assertEqual('-1');
      done();
    });

    it('marqueeUIJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0400 START');
      // modify the type attribute normal value of marquee dynamically
      const marqueeManager = AppStorage.get<MarqueeManager>("marqueeManager", Type.from<MarqueeManager>()) as MarqueeManager
      marqueeManager.message.notify({name: 'step', value: 50})
      await CommonFunc.sleep(200);
      // check the value of changed parameter
      let strJson = inspector.getInspectorByKey('marquee');
      const obj = JSON.parseJsonElement(strJson);
      // const uiContext = new UIContext();
      // expect(Math.abs(obj.getElement('$attrs').getDouble('step') - uiContext.vp2px(50)) <= 1).assertTrue();
      done();
    });

    it('marqueeUIJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0600 START');
      // modify the values partly attribute illegal value of marguee dynamically
      const marqueeManager = AppStorage.get<MarqueeManager>("marqueeManager", Type.from<MarqueeManager>()) as MarqueeManager
      marqueeManager.message.notify({name: 'step', value: -30});
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('marquee');
      const obj = JSON.parseJsonElement(strJson);
      // const uiContext = new UIContext();
      // expect(Math.abs(obj.getElement('$attrs').getDouble('step') - uiContext.vp2px(6)) <= 1).assertTrue();
      done();
    });

    it('marqueeUIJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0700 START');
      // modify the type attribute normal value of marquee dynamically
      const marqueeManager = AppStorage.get<MarqueeManager>("marqueeManager", Type.from<MarqueeManager>()) as MarqueeManager
      marqueeManager.message.notify({name: 'loop', value: 2});
      await CommonFunc.sleep(100);
      let strJson = inspector.getInspectorByKey('marquee');
      const obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('loop')).assertEqual('2');
      done();
    });

    it('marqueeUIJsunit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('marqueeUIJsunit_static_0800 START');
      // modify the type attribute normal value of marquee dynamically
      const marqueeManager = AppStorage.get<MarqueeManager>("marqueeManager", Type.from<MarqueeManager>()) as MarqueeManager
      marqueeManager.message.notify({name: 'src', value: 'Running Marquee starts rolling'});
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('marquee');
      const obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('src')).assertEqual('Running Marquee starts rolling');
      done();
    });
  })
}