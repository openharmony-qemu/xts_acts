'use static';
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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function maintainPosition() {
  describe('maintainPosition', () => {
    beforeAll(() => {
      console.info("maintainPosition beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.api20.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    
    beforeEach(async (): Promise<void> => {
      console.info("maintainPosition beforeEach start");
      const maintainPosition = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/maintainPosition",
      }
      try {
        let pages = maintainPosition.getState();
        console.info("get maintainPosition state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/Swiper/maintainPosition" == pages.name)) {
          console.info("get maintainPosition pages.name:" + JSON.stringify(pages.name));
          maintainPosition.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push maintainPosition page error:" + err);
      }
      console.info("maintainPosition beforeEach end");
    });

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });

    
    /*
     * @tc.number   maintainPosition_static_0100
     * @tc.name     maintainPosition_static_0100
     * @tc.desc     maintainPosition_static_0100
     * @tc.level    Level.LEVEL0
     */
it('maintainPosition_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maintainPosition_static_0100] START');
      await CommonFunc.sleep(1000);
      //maintainVisibleContentPosition false
      let driver = Driver.create();
      await driver.assertComponentExist(ON.text('5'));

      let btnAdd = await driver.findComponent(ON.id('maintain_swiper_add'));
      await (btnAdd?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_static_0100] swiper 4');
      await driver.assertComponentExist(ON.text('4'));
      let strJson = inspector.getInspectorByKey('swiper_maintain_index');
      console.info("[maintainPosition_static_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Swiper: 5');

      //reset
      let btnDel = await driver.findComponent(ON.id('maintain_swiper_del'));
      await (btnDel?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   maintainPosition_static_0200
     * @tc.name     maintainPosition_static_0200
     * @tc.desc     maintainPosition_static_0200
     * @tc.level    Level.LEVEL0
     */
it('maintainPosition_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maintainPosition_static_0200] START');
      await CommonFunc.sleep(1000);
      //maintainVisibleContentPosition true
      let driver = Driver.create();
      await driver.assertComponentExist(ON.text('5'));
      
      let btnTrue = await driver.findComponent(ON.id('maintain_swiper_true'));
      await (btnTrue?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let btnAdd = await driver.findComponent(ON.id('maintain_swiper_add'));
      await (btnAdd?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_static_0200] swiper 5');
      await driver.assertComponentExist(ON.text('5'));
      let strJson = inspector.getInspectorByKey('swiper_maintain_index');
      console.info("[maintainPosition_static_0200] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Swiper: 6');
      
      //reset
      let btnTrueDel = await driver.findComponent(ON.id('maintain_swiper_del'));
      await (btnTrueDel?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maintainPosition_static_0200] END');
      done();
    });
  })
}