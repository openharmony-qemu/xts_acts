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



export default function comSizeAbilityTest_03() {
  describe('comSizeAbilityTest_03', () => {

    beforeEach(async (): Promise<void> => {
      console.info("comSizeAbilityTest_03 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_03'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_03 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_03 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)
          // await CommonFunc.sleep(1000);
          // console.info("push comSizeAbilityTest_03 success: " + JSON.stringify(result))
        }
      } catch (err) {
        console.error("push comSizeAbilityTest_03 page error: " + err)
        expect().assertFail()
      }
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_07
     * @tc.name     comSizeAbilityTestJsunit_static_07
     * @tc.desc     comSizeAbilityTestJsunit_static_07
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_07 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_03_to_1'));
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
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Circle_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Circle_Father");
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
      let button = await driver.findComponent(ON.id('Circle_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_07] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_07] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_07] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_07] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_07] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_07] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_07] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_07] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_07] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(310))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_07] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_08
     * @tc.name     comSizeAbilityTestJsunit_static_08
     * @tc.desc     comSizeAbilityTestJsunit_static_08
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_08 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_03_to_2'));
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
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Column_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Column_Father");
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
      let button = await driver.findComponent(ON.id('Column_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_08] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_08] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_08] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_08] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_08] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_08] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_08] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_08] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_08] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(160))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_08] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_09
     * @tc.name     comSizeAbilityTestJsunit_static_09
     * @tc.desc     comSizeAbilityTestJsunit_static_09
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_09', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_09 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_03_to_3'));
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
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Counter_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Counter_Father");
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
      let button = await driver.findComponent(ON.id('Counter_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_09] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_09] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_09] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_09] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_09] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_09] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_09] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_09] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_09] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_09] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_10
     * @tc.name     comSizeAbilityTestJsunit_static_10
     * @tc.desc     comSizeAbilityTestJsunit_static_10
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_10', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_10 START')
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_03_to_4'));
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
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Divider_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Divider_Father");
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
      let button = await driver.findComponent(ON.id('Divider_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_10] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_10] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_10] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_10] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_10] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_10] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_10] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_10] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_10] component Rotate is: " + JSON.stringify(Rotate))
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(130))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_10] END')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      done()
    })
  })
}