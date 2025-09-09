/**
 *  Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const uiContext = new UIContext();


export default function HoverJsunit11() {
  describe('HoverJsunit11', () => {
    beforeAll(() => {
      console.info("HoverJsunit11 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("HoverJsunit11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Hover/Hover11',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get HoverJsunit11 state pages:" + JSON.stringify(pages));
        if (!("Hover11" == pages.name)) {
          console.info("get HoverJsunit11 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push HoverJsunit11 page error:" + err);
      }
      console.info("HoverJsunit11 beforeEach end");
    });


    /*
     * @tc.number    HoverJsunit11_static_0100
     * @tc.name      HoverJsunit11_static_0100
     * @tc.desc      HoverJsunit11_static_0100
     * @tc.level     2
     */
    it('HoverJsunit11_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HoverJsunit11_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);

      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover11');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit11_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit11_static_0100] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('AtrueBfalse');
      console.info('[HoverJsunit11_static_0100] END');
      done();
    });


    /*
     * @tc.number    HoverJsunit11_static_0200
     * @tc.name      HoverJsunit11_static_0200
     * @tc.desc      HoverJsunit11_static_0200
     * @tc.level     2
     */
    it('HoverJsunit11_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HoverJsunit11_static_0200 START');
      let driver = Driver.create()
      let buttonCl = await driver.findComponent(ON.id('columnB11'));
      await CommonFunc.sleep(500);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo({
        x: Math.round(point.x + UIContext.getFocusedUIContext()!.vp2px(100)) as Int,
        y: Math.round(point.y + UIContext.getFocusedUIContext()!.vp2px(100)) as Int
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover11');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit11_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit11_static_0200] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('AfalseBtrue');
      console.info('[HoverJsunit11_static_0200] END');
      done();
    });


    /*
     * @tc.number    HoverJsunit11_static_0300
     * @tc.name      HoverJsunit11_static_0300
     * @tc.desc      HoverJsunit11_static_0300
     * @tc.level     2
     */
    it('HoverJsunit11_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HoverJsunit11_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let colum = CommonFunc.getComponentRectOnScreen('columnB11');
      let top = colum.top
      let bottom = colum.bottom
      let left = colum.left
      let right = colum.right
      await driver.mouseMoveTo({ x: Math.round((left + right) / 2) as Int, y: Math.round((top + bottom) / 2) as Int })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover11');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit11_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit11_static_0300] title: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('AfalseBtrue');
      console.info('[HoverJsunit11_static_0300] END');
      done();
    });


  })
}
