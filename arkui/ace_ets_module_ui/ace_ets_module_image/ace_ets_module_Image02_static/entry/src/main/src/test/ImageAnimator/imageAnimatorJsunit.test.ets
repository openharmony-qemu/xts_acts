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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback, GlobalMessage } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Utils.test';
import {
  AnimationStatus,
  FillMode,
  ImageAnimator,
} from '@ohos.arkui.component'

const waitUiReadyMs = 1000;

export default function imageAniamtorJsunit() {
  describe('imageAniamtorJsunit', () => {
    beforeAll(() => {
      console.info("imageAniamtorJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageAniamtorJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/imageAnimator',
      }
      try {
        const router = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get imageAniamtorJsunit state pages:" + JSON.stringify(pages));
        if (!("imageAnimator" == pages.name)) {
          console.info("get imageAniamtor state pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          // console.info("push imageAniamtorJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageAniamtorJsunit page error:" + err);
        expect().assertFail();
      }
      // done();
    });

    it('imageAniamtorJsunit_static_0100', Level.LEVEL1, async (done: () => void) => {
      console.info('[imageAnimatorJsunit_0100] START');
      await CommonFunc.sleep(1000);
      // get the text imageAnimator component and test attribute
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageAnimatorJsunit_0100] component obj is: ' + JSON.stringifyJsonElement(obj));
      console.info('[imageAnimatorJsunit_0100] images: ' + obj.getElement('$attrs').getElement('images'))
      console.info('[imageAnimatorJsunit_0100] state: ' + obj.getElement('$attrs').getElement('state'))
      console.info('[imageAnimatorJsunit_0100] duration: ' + obj.getElement('$attrs').getElement('duration'))
      console.info('[imageAnimatorJsunit_0100] reverse: ' + obj.getElement('$attrs').getElement('reverse'))
      console.info('[imageAnimatorJsunit_0100] fixedSize: ' + obj.getElement('$attrs').getElement('fixedSize'))
      console.info('[imageAnimatorJsunit_0100] fillMode: ' + obj.getElement('$attrs').getElement('fillMode'))
      console.info('[imageAnimatorJsunit_0100] iterations: ' + obj.getElement('$attrs').getElement('iterations'))
      expect(obj.getElement('$attrs').getElement('images')).assertEqual('[{"src":"resource://RAWFILE/img1.png","left":"20.00vp","top":"20.00vp","width":"20.00vp","height":"20.00vp","duration":"0"},{"src":"resource://RAWFILE/img2.png","left":"20.00vp","top":"20.00vp","width":"30.00vp","height":"20.00vp","duration":"0"},{"src":"resource://RAWFILE/img3.png","left":"20.00vp","top":"20.00vp","width":"20.00vp","height":"20.00vp","duration":"0"}]');
      expect(obj.getElement('$attrs').getElement('state')).assertEqual('AnimationStatus.Initial');
      expect(obj.getElement('$attrs').getElement('reverse')).assertEqual('false');
      expect(obj.getElement('$attrs').getElement('fixedSize')).assertEqual('true');
      expect(obj.getElement('$attrs').getElement('fillMode')).assertEqual('FillMode.None');
      expect(obj.getElement('$attrs').getElement('iterations')).assertEqual('1');
      expect(obj.getElement('$attrs').getElement('duration')).assertEqual('2000');
      console.info('[imageAnimatorJsunit_0100] END');
      done();
    });

    it('imageAniamtorJsunit_static_0200', Level.LEVEL1, async (done: () => void) => {
      console.info('[imageAniamtorJsunit_static_0200] START');
      // test the enum of state of animator
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('ImageAnimatorExample', Type.from<GlobalMessage>());
      globalMessage?.message.notify({name:'state',value:AnimationStatus.Running});

      await CommonFunc.sleep(800);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageAniamtorJsunit_static_0200] component obj is: ' + obj.getElement('$attrs').getElement('state'));
      expect(obj.getElement('$attrs').getElement('state')).assertEqual('AnimationStatus.Running');
      
      globalMessage?.message.notify({name:'state',value:AnimationStatus.Paused});

      await CommonFunc.sleep(800);
      let strJson2 = inspector.getInspectorByKey('imageAnimator');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[imageAniamtorJsunit_static_0200] component obj2 is: ' + obj2.getElement('$attrs').getElement('state'));
      expect(obj2.getElement('$attrs').getElement('state')).assertEqual('AnimationStatus.Paused');

      globalMessage?.message.notify({name:'state',value:AnimationStatus.Stopped})

      await CommonFunc.sleep(800);
      let strJson3 = inspector.getInspectorByKey('imageAnimator');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[imageAniamtorJsunit_static_0200] component obj3 is: ' + obj3.getElement('$attrs').getElement('state'));
      expect(obj3.getElement('$attrs').getElement('state')).assertEqual('AnimationStatus.Stopped');
      console.info('[imageAniamtorJsunit_static_0200] END');
      done();
    });

    it('imageAniamtorJsunit_static_0300', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAniamtorJsunit_static_0300 START');
      // test the illegal value of imageAnimator
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('ImageAnimatorExample', Type.from<GlobalMessage>());
      globalMessage?.message.notify({name:'state',value:4});

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAniamtorJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getElement('state'));
      expect(obj.getElement('$attrs').getElement('state')).assertEqual('AnimationStatus.Initial');
      done();
    });

    it('imageAniamtorJsunit_static_0400', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAniamtorJsunit_static_0400 START');
      // test the value of FillMode
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('ImageAnimatorExample', Type.from<GlobalMessage>());
      globalMessage?.message.notify({name:'fillMode',value:FillMode.Forwards});

      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAniamtorJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getElement('fillMode'));
      expect(obj.getElement('$attrs').getElement('fillMode')).assertEqual('FillMode.Forwards');
      
      globalMessage?.message.notify({name:'fillMode',value:FillMode.Backwards});

      await CommonFunc.sleep(5000);
      let strJson2 = inspector.getInspectorByKey('imageAnimator');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageAniamtorJsunit_static_0400 component obj2 is: ' + obj2.getElement('$attrs').getElement('fillMode'));
      expect(obj2.getElement('$attrs').getElement('fillMode')).assertEqual('FillMode.Backwards');
      
      globalMessage?.message.notify({name:'fillMode',value:FillMode.Both});

      await CommonFunc.sleep(5000);
      let strJson3 = inspector.getInspectorByKey('imageAnimator');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('imageAniamtorJsunit_static_0400 component obj3 is: ' + obj3.getElement('$attrs').getElement('fillMode'));
      expect(obj3.getElement('$attrs').getElement('fillMode')).assertEqual('FillMode.Both');
      done();
    });

    it('imageAniamtorJsunit_static_0500', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAniamtorJsunit_static_0500 START');
      // test the illegal value of imageAnimator
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('ImageAnimatorExample', Type.from<GlobalMessage>());
      globalMessage?.message.notify({name:'fillMode',value:8});

      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAniamtorJsunit_static_0500 component obj is: ' + obj.getElement('$attrs').getElement('fillMode'));
      expect(obj.getElement('$attrs').getElement('fillMode')).assertEqual('FillMode.Forwards');
      done();
    });

    it('imageAniamtorJsunit_static_0600', Level.LEVEL1, async (done: () => void) => {
      console.info('[imageAniamtorJsunit_static_0600] START');
      // test the boolean attribute  of imageAnimator
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<GlobalMessage>('ImageAnimatorExample', Type.from<GlobalMessage>());
      globalMessage?.message.notify({name:'duration',value:700});

      await CommonFunc.sleep(1000);
      globalMessage?.message.notify({name:'reverse',value:true});

      await CommonFunc.sleep(1000);
   
      globalMessage?.message.notify({name:'fixedSize',value:false});

      await CommonFunc.sleep(1000);
      globalMessage?.message.notify({name:'iterations',value:2});
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('imageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[imageAniamtorJsunit_static_0600] component obj is: ' + obj.getElement('$attrs').getElement('duration')
      + "---" + obj.getElement('$attrs').getElement('reverse') + "---" + obj.getElement('$attrs').getElement('fixedSize') + "----" + obj.getElement('$attrs').getElement('iterations'));
      expect(obj.getElement('$attrs').getElement('duration')).assertEqual('700');
      expect(obj.getElement('$attrs').getElement('reverse')).assertEqual('true');
      expect(obj.getElement('$attrs').getElement('fixedSize')).assertEqual('false');
      expect(obj.getElement('$attrs').getElement('iterations')).assertEqual('2');
      console.info('[imageAniamtorJsunit_static_0600] END');
      done();
    });

    it('imageAniamtorJsunit_static_0700', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAniamtorJsunit_static_0700 START');
      // test the image event start and Finish
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('start'));
      await CommonFunc.sleep(1000);
      expect(btn != null).assertTrue();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('t1');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[imageAniamtorJsunit_static_0700] obj: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('start');
      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('t5');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[imageAniamtorJsunit_static_0700] obj1: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getElement('content')).assertEqual('onFinish');
      console.info('imageAniamtorJsunit_static_0700 END');
      done();
    });

    it('imageAniamtorJsunit_static_0800', Level.LEVEL1, async (done: () => void) => {
      console.info('imageAniamtorJsunit_static_0370 START');
      // test the image event of pause and repeat
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('infinite'));
      await CommonFunc.sleep(1000);
      expect(btn != null).assertTrue();
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('start'));
      expect(btn2 != null).assertTrue();
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('t3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageAnimatorJsunit_0800 component obj is: '+ obj.getElement('$attrs').getElement('content'));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('onRepeat');

      let btn3 = await driver.findComponent(ON.id('pause'));
      expect(btn3 != null).assertTrue();
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('t2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageAnimatorJsunit_0800 component obj2 is: '+ obj2.getElement('$attrs').getElement('content'));
      expect(obj2.getElement('$attrs').getElement('content')).assertEqual('pause');
      done();
    });
  })
}