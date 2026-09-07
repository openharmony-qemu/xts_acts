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

export default function comSizeAbilityTest_14() {
  describe('comSizeAbilityTest_14', () => {

    beforeEach(() => {
      console.info("comSizeAbilityTest_14 beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_14'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_14 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_14 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push comSizeAbilityTest_14 page error: " + err)
      }
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_37
     * @tc.name     comSizeAbilityTestJsunit_static_37
     * @tc.desc     comSizeAbilityTestJsunit_static_37
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_37', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      console.info('comSizeAbilityTestJsunit_static_37 START')
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("SideBarContainer_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("SideBarContainer_Father");
      console.log('modePosition is: ' + modePosition + 'modePosition1 ins: ' + modePosition1)
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
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('SideBarContainer_Size'));
      let rect = await (button?.getBounds() as Promise<Rect>);
      console.info("[comSizeAbilityTestJsunit_static_37] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_37] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_37] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_37] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_37] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_37] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_37] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_37] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_37] component Rotate is: " + JSON.stringify(Rotate))
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(260))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(uiContext.vp2px(130))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_37] END')
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_38
     * @tc.name     comSizeAbilityTestJsunit_static_38
     * @tc.desc     comSizeAbilityTestJsunit_static_38
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_38', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_38 START')
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Slider_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Slider_Father");
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
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Slider_Size'));
      let rect = await (button?.getBounds() as Promise<Rect>);
      console.info("[comSizeAbilityTestJsunit_static_38] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_38] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_38] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_38] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_38] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_38] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_38] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_38] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_38] component Rotate is: " + JSON.stringify(Rotate))
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(160))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_38] END')
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      done()
    })

    
    /**
     * @tc.number   comSizeAbilityTestJsunit_static_39
     * @tc.name     comSizeAbilityTestJsunit_static_39
     * @tc.desc     comSizeAbilityTestJsunit_static_39
     * @tc.level    Level.LEVEL0
     */
it('comSizeAbilityTestJsunit_static_39', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_39 START')
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const componentUtils1: ComponentUtils = uiContext.getComponentUtils() as ComponentUtils;
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      let modePosition: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Stack_Size");
      let modePosition1: componentUtils.ComponentInfo = componentUtils1.getRectangleById("Stack_Father");
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
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Stack_Size'));
      let rect = await (button?.getBounds() as Promise<Rect>);
      console.info("[comSizeAbilityTestJsunit_static_39] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_39] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_static_39] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_static_39] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_static_39] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_static_39] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_static_39] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_static_39] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_static_39] component Rotate is: " + JSON.stringify(Rotate))
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      expect(Math.abs(SizeWidth - Math.round(uiContext.vp2px(120))) <= 1).assertTrue();
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
      console.info('[comSizeAbilityTestJsunit_static_39] END')
      try { await CommonFunc.sleep(1000); } catch (err) { console.info('comSizeAbilityTest_14 sleep err: ' + JSON.stringify(err)); }
      done()
    })
  })
}