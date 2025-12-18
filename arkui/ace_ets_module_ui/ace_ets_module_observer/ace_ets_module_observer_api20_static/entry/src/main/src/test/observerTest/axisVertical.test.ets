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
import emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function axisVertical() {
  describe('axisVertical', () => {
    beforeAll(() => {
      console.info("axisVertical beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.observer20.static", "EntryAbility");
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("axisVertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/axisVertical",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get axisVertical state pages:" + JSON.stringify(pages));
        if (!("axisVertical" == pages.name)) {
          console.info("get axisVertical pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push axisVertical page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push axisVertical page error:" + err);
      }
      console.info("axisVertical beforeEach end");
    });

    
    /*
     * @tc.number   axisVertical_static_0100
     * @tc.name     axisVertical_static_0100
     * @tc.desc     axisVertical_static_0100
     * @tc.level    Level.LEVEL0
     */
it('axisVertical_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[axisVertical_0100] START');
      let driver = Driver.create()
      console.info('[axisVertical_0100] START++++++++++++++');
      let btn1 = await driver.findComponent(ON.id('axisVertical_on')); //获取不到按钮
      console.info('[axisVertical_0100] START++++++++++++++',btn1);
      await CommonFunc.sleep(2500);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let swipeScroll = CommonFunc.getComponentRectOnScreen('axisVertical');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("axisVertical_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await (driver.swipe(Math.round(left + width/2) as int,Math.round(top + height*0.8) as int,Math.round(left + width/2) as int,Math.round(top + height*0.2)as int) as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('scroll_axisVertical_id');
      console.info("[axisVertical_0100] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('id: axisVertical');

      let strJson2 = inspector.getInspectorByKey('scroll_axis_vertical');
      console.info("[axisVertical_0100] content2: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      //expect(JSON.parse(strJson2).$attrs.content).assertEqual('axis: Axis.Vertical');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('axis: 0');

      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('axisVertical_off'));
      await CommonFunc.sleep(500);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[axisVertical_0100] END');
      done();
    });
  })
}
