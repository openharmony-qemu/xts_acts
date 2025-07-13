/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { vp2px } from "@ohos.arkui.component";

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ImageAdvancedTest() {

  describe('ImageAdvancedTest', () => {

    const routerPush = async (target: string) => {
      let options: router.RouterOptions = {
        url: `MainAbility/pages/image/imageAdvanced/${target}`,
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          // let result = router.pushUrl(options);
          routerInstance.pushUrl(options);
          console.info(`router options url is ${options.url}`);
          await CommonFunc.sleep(1000);
          // console.info(`push ${target} page result:` + JSON.stringify(result));
          console.info(`o page name is ${pages.name}`);
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    beforeAll(() => {
      console.info("aboutToRecycleiamge beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("ace.ets.module.Image01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("after each called");
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0050
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0050
     * @tc.desc   : src:base64,check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0050', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0050] START');
      await routerPush("imageAltBase64")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('loadingResultAlt');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0050] component obj is: " + JSON.stringify(obj));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0050] obj.getElement('$attrs').getString('content') is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertContain('success');
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0050] END');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280
     * @tc.desc   : set aspectRatio 1.5,load 50*50 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] START');
      await routerPush("image01")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentOffsetX01');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0280] vp2px(1): " + vp2px(1));
      let strJson2 = inspector.getInspectorByKey('contentOffsetY01');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      let strJson3 = inspector.getInspectorByKey('contentHeight01');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] component obj3 is: " + JSON.stringify(obj3));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] obj3.getElement('$attrs').getString('content') is: " +
      obj3.getElement('$attrs').getString('content'));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - vp2px(1)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - vp2px(1)) <= 1).assertTrue();
      expect(Math.abs(Number(obj3.getElement('$attrs').getString('content'))) >= 97).assertTrue();
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0280] END');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0290
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0290
     * @tc.desc   : set aspectRatio 0.5,load 50*50 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0290', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0290] START');
      await routerPush("image02")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentHeight02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0290] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0290] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content'))) >= 297).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300
     * @tc.desc   : set border width 10,load 80*80 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] START');
      await routerPush("image03")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentHeight03');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] vp2px(80): " + vp2px(80));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX03');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0300] vp2px(10): " + vp2px(10));
      let round = Math.round(vp2px(10))
      let vp2px10 = Math.abs(vp2px(10) - round) < 0.001 ? round : Math.floor(vp2px(10))
      let contentHeigt = Number(obj1.getElement('$attrs').getString('content'))
      let imageContentHeight = vp2px(100) - vp2px10 * 2
      expect(Math.abs(contentHeigt - imageContentHeight) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - vp2px(10)) <= 1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310
     * @tc.desc   : set border width 20,load 80*80 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0310', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] START');
      await routerPush("image04")
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('contentHeight04');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] vp2px(60): " + vp2px(60));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX04');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0310] vp2px(20): " + vp2px(20));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - vp2px(60)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - vp2px(20)) <= 1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320
     * @tc.desc   : set padding 10,load 80*80 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0320', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] START');
      await routerPush("image05")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentHeight05');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] vp2px(80): " + vp2px(80));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX05');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0320] vp2px(10): " + vp2px(10));
      let round = Math.round(vp2px(10))
      let vp2px10 = Math.abs(vp2px(10) - round) < 0.001 ? round : Math.floor(vp2px(10))
      let contentHeigt = Number(obj1.getElement('$attrs').getString('content'))
      let imageContentHeight = vp2px(100) - vp2px10 * 2
      expect(Math.abs(contentHeigt - imageContentHeight) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - vp2px(10)) <= 1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330
     * @tc.desc   : set padding 20,load 80*80 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0330', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] START');
      await routerPush("image06")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentHeight06');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] vp2px(60): " + vp2px(60));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX06');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0330] vp2px(20): " + vp2px(20));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - vp2px(60)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - vp2px(20)) <= 1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340
     * @tc.desc   : set clip,load 50*50 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0340', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340] START');
      await routerPush("image07")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentHeight07');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340] vp2px(100): " + vp2px(100));
      let strJson2 = inspector.getInspectorByKey('contentOffsetX07');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0340] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      expect(Math.abs(Number(obj1.getElement('$attrs').getString('content')) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Number(obj2.getElement('$attrs').getString('content')) - vp2px(0)) <= 1).assertTrue();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350
     * @tc.desc   : set mask,load 50*50 image and check onComplete
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0350', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350] START');
      await routerPush("image08")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('contentOffsetY08');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      let strJson2 = inspector.getInspectorByKey('contentOffsetX08');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0350] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0360
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0360
     * @tc.desc   : citation rawfile
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0360', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0360] START');
      await routerPush("image09")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult09');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0360] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0360] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0370
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0370
     * @tc.desc   : citation resource
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0370', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0370] START');
      await routerPush("image10")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult10');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0370] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0370] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0380
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0380
     * @tc.desc   : citation base64
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0380', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0380] START');
      await routerPush("imageBase64")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResultBase64');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0380] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0380] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420
     * @tc.desc   : citation jpg,png,bmp,svg,gif
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0420', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] START');
      await routerPush("image14")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingJpg14');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      let strJson2 = inspector.getInspectorByKey('loadingPng14');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] obj2.getElement('$attrs').getString('content') is: " +
      obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertContain('success');
      let strJson3 = inspector.getInspectorByKey('loadingBmp14');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] component obj3 is: " + JSON.stringify(obj3));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] obj3.getElement('$attrs').getString('content') is: " +
      obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertContain('success');
      let strJson4 = inspector.getInspectorByKey('loadingSvg14');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] component obj4 is: " + JSON.stringify(obj4));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] obj4.getElement('$attrs').getString('content') is: " +
      obj4.getElement('$attrs').getString('content'));
      expect(obj4.getElement('$attrs').getString('content')).assertContain('success');
      let strJson5 = inspector.getInspectorByKey('loadingGif14');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] component obj5 is: " + JSON.stringify(obj5));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0420] obj5.getElement('$attrs').getString('content') is: " +
      obj5.getElement('$attrs').getString('content'));
      expect(obj5.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0430
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0430
     * @tc.desc   : citation internal img
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0430', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0430] START');
      await routerPush("image15")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult15');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0430] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0430] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0440
     * @tc.name   : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0440
     * @tc.desc   : Referencing using relative paths
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_static_0440', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0440] START');
      await routerPush("image16")
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('loadingResult16');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0440] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0440] obj1.getElement('$attrs').getString('content') is: " +
      obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertContain('success');
      done();
    });
  })
}
