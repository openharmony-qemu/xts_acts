'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import accessibility from '@ohos.accessibility';
import componentUtils from '@ohos.arkui.componentUtils';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';



export default function comSizeAbilityTest_07() {
  describe('comSizeAbilityTest_07', () => {

    console.info("comSizeAbilityTest_07 beforeAll start");


    beforeEach(() => {
      console.info("comSizeAbilityTest_07 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_07'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_07 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_07 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push comSizeAbilityTest_07 page error: " + err)
        expect().assertFail()
      }
    })


    /**
     * @tc.number   comSizeAbilityTestJsunit_static_20
     * @tc.name     comSizeAbilityTestJsunit_static_20
     * @tc.desc     comSizeAbilityTestJsunit_static_20
     * @tc.level    Level.LEVEL0
     */
    it('comSizeAbilityTestJsunit_static_20', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_20 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      if (AppStorage.get<number>("winLeft") == 0) {
        let driver = Driver.create();
        let button1 = await driver.findComponent(ON.id('btn_MenuItemGroup'))
        try {
          await (button1?.click() as Promise<void>);
        } catch (err) {
          console.info('xxxTest await err: ' + JSON.stringify(err));
        }
        try {
          await CommonFunc.sleep(2000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("MenuItemGroup_Size");
        let Translate = modePosition.translate
        let Transform = modePosition.transform
        let Scale = modePosition.scale
        let Rotate = modePosition.rotate
        console.info("[comSizeAbilityTestJsunit_static_20] component Translate is: " + JSON.stringify(Translate))
        console.info("[comSizeAbilityTestJsunit_static_20] component Transform is: " + JSON.stringify(Transform))
        console.info("[comSizeAbilityTestJsunit_static_20] component Scale is: " + JSON.stringify(Scale))
        console.info("[comSizeAbilityTestJsunit_static_20] component Rotate is: " + JSON.stringify(Rotate))
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
        expect(JSON.stringify(Translate.x)).assertEqual('1');
        expect(JSON.stringify(Translate.y)).assertEqual('1');
        expect(JSON.stringify(Translate.z)).assertEqual('1');
        // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
        expect(JSON.stringify(Scale.x)).assertEqual('1');
        expect(JSON.stringify(Scale.y)).assertEqual('1');
        expect(JSON.stringify(Scale.z)).assertEqual('1');
        expect(JSON.stringify(Scale.centerX)).assertEqual('1');
        expect(JSON.stringify(Scale.centerY)).assertEqual('1');
        // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
        expect(JSON.stringify(Rotate.x)).assertEqual('1');
        expect(JSON.stringify(Rotate.y)).assertEqual('1');
        expect(JSON.stringify(Rotate.z)).assertEqual('1');
        expect(JSON.stringify(Rotate.angle)).assertEqual('0');
        expect(JSON.stringify(Rotate.centerX)).assertEqual('1');
        expect(JSON.stringify(Rotate.centerY)).assertEqual('1');
        // expect(JSON.stringify(Transform)).assertEqual('[[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]]');
      }
      console.info('[comSizeAbilityTestJsunit_static_20] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })


    /**
     * @tc.number   comSizeAbilityTestJsunit_static_21
     * @tc.name     comSizeAbilityTestJsunit_static_21
     * @tc.desc     comSizeAbilityTestJsunit_static_21
     * @tc.level    Level.LEVEL0
     */
    it('comSizeAbilityTestJsunit_static_21', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_21 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      if (AppStorage.get<number>("winLeft") == 0) {
        let driver = Driver.create();
        let button1 = await driver.findComponent(ON.id('btn_MenuItem'))
        try {
          await (button1?.click() as Promise<void>);
        } catch (err) {
          console.info('xxxTest await err: ' + JSON.stringify(err));
        }
        console.log('test start click ' + JSON.stringify(button1))
        try {
          await CommonFunc.sleep(2000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("MenuItem_Size");
        let Size = modePosition.size
        let SizeWidth = Size.width
        let SizeHeight = Size.height
        let Translate = modePosition.translate
        let Transform = modePosition.transform
        let Scale = modePosition.scale
        let Rotate = modePosition.rotate
        console.info("[comSizeAbilityTestJsunit_static_21] component Size is: " + JSON.stringify(Size))
        console.info("[comSizeAbilityTestJsunit_static_21] component Translate is: " + JSON.stringify(Translate))
        console.info("[comSizeAbilityTestJsunit_static_21] component Transform is: " + JSON.stringify(Transform))
        console.info("[comSizeAbilityTestJsunit_static_21] component Scale is: " + JSON.stringify(Scale))
        console.info("[comSizeAbilityTestJsunit_static_21] component Rotate is: " + JSON.stringify(Rotate))
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(90))) <= 1).assertTrue();
        expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(90))) <= 1).assertTrue();
        // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
        expect(JSON.stringify(Translate.x)).assertEqual('1');
        expect(JSON.stringify(Translate.y)).assertEqual('1');
        expect(JSON.stringify(Translate.z)).assertEqual('1');
        // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
        expect(JSON.stringify(Scale.x)).assertEqual('1');
        expect(JSON.stringify(Scale.y)).assertEqual('1');
        expect(JSON.stringify(Scale.z)).assertEqual('1');
        expect(JSON.stringify(Scale.centerX)).assertEqual('1');
        expect(JSON.stringify(Scale.centerY)).assertEqual('1');
        // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
        expect(JSON.stringify(Rotate.x)).assertEqual('1');
        expect(JSON.stringify(Rotate.y)).assertEqual('1');
        expect(JSON.stringify(Rotate.z)).assertEqual('1');
        expect(JSON.stringify(Rotate.angle)).assertEqual('0');
        expect(JSON.stringify(Rotate.centerX)).assertEqual('1');
        expect(JSON.stringify(Rotate.centerY)).assertEqual('1');
        // expect(JSON.stringify(Transform)).assertEqual('[[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]]');
      }
      console.info('[comSizeAbilityTestJsunit_static_21] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })


    /**
     * @tc.number   comSizeAbilityTestJsunit_static_22
     * @tc.name     comSizeAbilityTestJsunit_static_22
     * @tc.desc     comSizeAbilityTestJsunit_static_22
     * @tc.level    Level.LEVEL0
     */
    it('comSizeAbilityTestJsunit_static_22', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_22 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      if (AppStorage.get<number>("winLeft") == 0) {
        let driver = Driver.create();
        let button1 = await driver.findComponent(ON.id('btn_Menu'))
        try {
          await (button1?.click() as Promise<void>);
        } catch (err) {
          console.info('xxxTest await err: ' + JSON.stringify(err));
        }
        try {
          await CommonFunc.sleep(2000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Menu_Size");
        let Size = modePosition.size
        let SizeWidth = Size.width
        let SizeHeight = Size.height
        let Translate = modePosition.translate
        let Transform = modePosition.transform
        let Scale = modePosition.scale
        let Rotate = modePosition.rotate
        console.info("[comSizeAbilityTestJsunit_static_22] component Size is: " + JSON.stringify(Size))
        console.info("[comSizeAbilityTestJsunit_static_22] component Translate is: " + JSON.stringify(Translate))
        console.info("[comSizeAbilityTestJsunit_static_22] component Transform is: " + JSON.stringify(Transform))
        console.info("[comSizeAbilityTestJsunit_static_22] component Scale is: " + JSON.stringify(Scale))
        console.info("[comSizeAbilityTestJsunit_static_22] component Rotate is: " + JSON.stringify(Rotate))
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
        expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
        // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
        expect(JSON.stringify(Translate.x)).assertEqual('1');
        expect(JSON.stringify(Translate.y)).assertEqual('1');
        expect(JSON.stringify(Translate.z)).assertEqual('1');
        // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
        expect(JSON.stringify(Scale.x)).assertEqual('1');
        expect(JSON.stringify(Scale.y)).assertEqual('1');
        expect(JSON.stringify(Scale.z)).assertEqual('1');
        expect(JSON.stringify(Scale.centerX)).assertEqual('1');
        expect(JSON.stringify(Scale.centerY)).assertEqual('1');
        // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
        expect(JSON.stringify(Rotate.x)).assertEqual('1');
        expect(JSON.stringify(Rotate.y)).assertEqual('1');
        expect(JSON.stringify(Rotate.z)).assertEqual('1');
        expect(JSON.stringify(Rotate.angle)).assertEqual('0');
        expect(JSON.stringify(Rotate.centerX)).assertEqual('1');
        expect(JSON.stringify(Rotate.centerY)).assertEqual('1');
        // expect(JSON.stringify(Transform)).assertEqual('[[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]]');
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
        await (driver?.click(Math.round(AppStorage.get<number>("winLeft") as number + uiContext.vp2px(200)).toInt(),
          Math.round(AppStorage.get<number>("winTop") as number + uiContext.vp2px(200)).toInt()) as Promise<void>);
        try {
          await CommonFunc.sleep(1000);
        } catch (err) {
          console.info('xxxTest sleep err: ' + JSON.stringify(err));
        }
      }
      console.info('[comSizeAbilityTestJsunit_static_22] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })
  })
}