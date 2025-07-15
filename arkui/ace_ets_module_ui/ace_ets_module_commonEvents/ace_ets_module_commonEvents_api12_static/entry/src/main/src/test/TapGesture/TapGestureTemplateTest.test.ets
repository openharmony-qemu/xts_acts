/*
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON, loadAndSetUpUiTest} from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function TapGestureTemplateTest() {
  describe('TapGestureTemplateTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      console.info("TapGestureTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/TapGestureTemplate',
      }
      try {
        const router = AppStorage.get<Router>('router', Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get TapGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("TapGestureTemplate" == pages.name)) {
          console.info("get TapGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TapGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TapGestureTemplateTest page error:" + err);
      }
      console.info("TapGestureTemplateTest beforeEach end");
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("TapGestureTemplateTest after each called");
    });

    /**
     * @tc.number
    * @tc.name      TapGestureTemplateTest_0010
     * @tc.desc      api test TapGesture
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('TapGestureTemplateTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TapGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let FatherObj = CommonFunc.getComponentRectOnScreen('TapGestureTemplate_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('TapGestureTemplateTest_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('TapGestureTemplate_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('TapGestureTemplateTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('TapGestureTemplateTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))
      let timeSpace: int = 3000
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(timeSpace);
      let timeBefore:number = Date.now();
      await driver.click(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      let timeAfter:number = Date.now();
      await CommonFunc.sleep(3000);
      let text1 = inspector.getInspectorByKey('TapGestureTemplate_Text01');
      let obj1 = JSON.parseJsonElement(text1);
      let time1: number = Number(obj1.getElement('$attrs').getString('content'))
      console.log('TapGestureTemplateTest_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),time1)
      let text2 = inspector.getInspectorByKey('TapGestureTemplate_Text02');
      let obj2 = JSON.parseJsonElement(text2);
      let time2: number = Number(obj2.getElement('$attrs').getString('content'));
      console.log('TapGestureTemplateTest_0010 obj2 time $attrs content',time1,time2);
      console.log('TapGestureTemplateTest_0010 obj2 time time2-time1',time2 - time1);
      console.log('TapGestureTemplateTest_0010 obj2 time timeBefore timeAfter',timeAfter, timeBefore);
      console.log('TapGestureTemplateTest_0010 obj2 time timeSpace',timeSpace);
      let flag: number = time2 - time1 - timeSpace * 1000000 - (timeAfter - timeBefore)*1000000
      console.log('TapGestureTemplateTest_0010 flag',flag)
      console.log('TapGestureTemplateTest_0010 timeAfter - timeBefore:',timeAfter - timeBefore)
      expect( flag <= (16 * 1000000)).assertTrue();
      console.info('TapGestureTemplateTest_0010 END');
      done();
    });

  })
}
