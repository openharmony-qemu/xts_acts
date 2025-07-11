/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { vp2px } from '@ohos.arkui.component';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import componentUtils from '@ohos.arkui.componentUtils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonAttrsLayout.api11/EntryAbility';

export default function comSizeAbilityTest_01() {
  describe('comSizeAbilityTest_01', () => {
    beforeAll(() => {
      console.info("comSizeAbilityTest_01 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(()  => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info('[comSizeAbilityTest_01] enable success');
      // }).catch((err: object) => {
      //   console.error(`[comSizeAbilityTest_01] failed to enable, ${err}`)
      // })

      console.info("comSizeAbilityTest_01 beforeEach start 222")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_01'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info("get comSizeAbilityTest_01 state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTest_01 state pages.name: " + JSON.stringify(pages.name))
          routerInstance.pushUrl(options)
          // console.info("push comSizeAbilityTest_01 success: " + JSON.stringify(result))
        }
      } catch (err) {
        console.error("push comSizeAbilityTest_01 page error: " + err)
        expect().assertFail()
      }
    })
    /* *
        * @tc.number: comSizeAbilityTestJsunit_static_02
        * @tc.name  : comSizeAbilityTestJsunit_static_02
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_02 START')
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_01_to_1'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // let modePosition: componentUtils.ComponentInfo = componentUtils.getRectangleById("Badge_Size");
      // let Size = modePosition.size
      // let SizeWidth = Size.width
      // let SizeHeight = Size.height
      // let LocalOffset = modePosition.localOffset
      // let WindowOffset = modePosition.windowOffset
      // let ScreenOffset = modePosition.screenOffset
      // let Translate = modePosition.translate
      // let Transform = modePosition.transform
      // let Scale = modePosition.scale
      // let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('Badge_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_02] component rect is: " + JSON.stringify(rect))
      // console.info("[comSizeAbilityTestJsunit_static_02] component Size is: " + JSON.stringify(Size))
      // console.info("[comSizeAbilityTestJsunit_static_02] component LocalOffset is: " + JSON.stringify(LocalOffset))
      // console.info("[comSizeAbilityTestJsunit_static_02] component WindowOffset is: " + JSON.stringify(WindowOffset))
      // console.info("[comSizeAbilityTestJsunit_static_02] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      // console.info("[comSizeAbilityTestJsunit_static_02] component Translate is: " + JSON.stringify(Translate))
      // console.info("[comSizeAbilityTestJsunit_static_02] component Transform is: " + JSON.stringify(Transform))
      // console.info("[comSizeAbilityTestJsunit_static_02] component Scale is: " + JSON.stringify(Scale))
      // console.info("[comSizeAbilityTestJsunit_static_02] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      // expect(Math.abs(SizeWidth - Math.round(vp2px(170))) <= 1).assertTrue();
      // expect(Math.abs(SizeHeight - Math.round(vp2px(120))) <= 1).assertTrue();
      // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      // expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_static_02] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: comSizeAbilityTestJsunit_static_03
        * @tc.name  : comSizeAbilityTestJsunit_static_03
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_03 START')
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_01_to_2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // let modePosition: componentUtils.ComponentInfo = componentUtils.getRectangleById("Button_Size");
      // let Size = modePosition.size
      // let SizeWidth = Size.width
      // let SizeHeight = Size.height
      // let LocalOffset = modePosition.localOffset
      // let WindowOffset = modePosition.windowOffset
      // let ScreenOffset = modePosition.screenOffset
      // let Translate = modePosition.translate
      // let Transform = modePosition.transform
      // let Scale = modePosition.scale
      // let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('Button_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_03] component rect is: " + JSON.stringify(rect))
      // console.info("[comSizeAbilityTestJsunit_static_03] component Size is: " + JSON.stringify(Size))
      // console.info("[comSizeAbilityTestJsunit_static_03] component LocalOffset is: " + JSON.stringify(LocalOffset))
      // console.info("[comSizeAbilityTestJsunit_static_03] component WindowOffset is: " + JSON.stringify(WindowOffset))
      // console.info("[comSizeAbilityTestJsunit_static_03] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      // console.info("[comSizeAbilityTestJsunit_static_03] component Translate is: " + JSON.stringify(Translate))
      // console.info("[comSizeAbilityTestJsunit_static_03] component Transform is: " + JSON.stringify(Transform))
      // console.info("[comSizeAbilityTestJsunit_static_03] component Scale is: " + JSON.stringify(Scale))
      // console.info("[comSizeAbilityTestJsunit_static_03] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      // expect(Math.abs(SizeWidth - Math.round(vp2px(90))) <= 1).assertTrue();
      // expect(Math.abs(SizeHeight - Math.round(vp2px(90))) <= 1).assertTrue();
      // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      // expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_static_03] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: comSizeAbilityTestJsunit_static_04
        * @tc.name  : comSizeAbilityTestJsunit_static_04
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('comSizeAbilityTestJsunit_static_04 START')
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('comSizeAbilityTest_01_to_3'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // let modePosition: componentUtils.ComponentInfo = componentUtils.getRectangleById("Canvas_Size");
      // let modePosition1: componentUtils.ComponentInfo = componentUtils.getRectangleById("Canvas_Father");
      // let Size = modePosition.size
      // let SizeWidth = Size.width
      // let SizeHeight = Size.height
      // let LocalOffset = modePosition1.localOffset
      // let WindowOffset = modePosition.windowOffset
      // let ScreenOffset = modePosition.screenOffset
      // let Translate = modePosition.translate
      // let Transform = modePosition.transform
      // let Scale = modePosition.scale
      // let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('Canvas_Size'));
      let rect = await (button!.getBounds() as Promise<Rect>)
      console.info("[comSizeAbilityTestJsunit_static_04] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_static_04] component rect_left is: " + Math.round(rect.left))
      console.info("[comSizeAbilityTestJsunit_static_04] component rect_top is: " + rect.top)
      // console.info("[comSizeAbilityTestJsunit_static_04] component Size is: " + JSON.stringify(Size))
      // console.info("[comSizeAbilityTestJsunit_static_04] component LocalOffset is: " + JSON.stringify(LocalOffset))
      // console.info("[comSizeAbilityTestJsunit_static_04] component WindowOffset is: " + JSON.stringify(WindowOffset))
      // console.info("[comSizeAbilityTestJsunit_static_04] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      // console.info("[comSizeAbilityTestJsunit_static_04] component Translate is: " + JSON.stringify(Translate))
      // console.info("[comSizeAbilityTestJsunit_static_04] component Transform is: " + JSON.stringify(Transform))
      // console.info("[comSizeAbilityTestJsunit_static_04] component Scale is: " + JSON.stringify(Scale))
      // console.info("[comSizeAbilityTestJsunit_static_04] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      // expect(Math.abs(SizeWidth - Math.round(vp2px(211))) <= 1).assertTrue();
      // expect(Math.abs(SizeHeight - Math.round(vp2px(140))) <= 1).assertTrue();
      // expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      // expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      // expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      // expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_static_04] END')
      await CommonFunc.sleep(1000);
      done()
    })
  })
}