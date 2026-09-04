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

import accessibility from '@ohos.accessibility';
import componentUtils from '@ohos.arkui.componentUtils';
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';



export default function comSizeAbilityTest_16() {
  describe('comSizeAbilityTest_16', () => {
    beforeEach(async (): Promise<void> => {
      console.info("comSizeAbilityTest_16 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_16'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_16 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_16 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)
          // await CommonFunc.sleep(1000);
          // console.info("push comSizeAbilityTest_16 success: " + JSON.stringify(result))
        }
      } catch (err) {
        console.error("push comSizeAbilityTest_16 page error: " + err)
        expect().assertFail()
      }
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_41
     * @tc.name     comSizeAbilityTestJsunit_static_41
     * @tc.desc     comSizeAbilityTestJsunit_static_41
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_41', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_41 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_16_to_1'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Tab_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Tab_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('Tab_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_41] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_41] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_41] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_41] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_41] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_41] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_41] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_41] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_41] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(240))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(140))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_41] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_42
     * @tc.name     comSizeAbilityTestJsunit_static_42
     * @tc.desc     comSizeAbilityTestJsunit_static_42
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_42', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_42 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_16_to_2'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("TextArea_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("TextArea_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('TextArea_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_42] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_42] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_42] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_42] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_42] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_42] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_42] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_42] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_42] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(120))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_42] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_43
     * @tc.name     comSizeAbilityTestJsunit_static_43
     * @tc.desc     comSizeAbilityTestJsunit_static_43
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_43', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_43 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_16_to_3'));
      try {
        await (btn?.click() as Promise<void>);
      } catch (err) {
        console.info('xxxTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("TextClock_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("TextClock_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('TextClock_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_43] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_43] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_43] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_43] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_43] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_43] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_43] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_43] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_43] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(145))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(110))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_43] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })
  })
}