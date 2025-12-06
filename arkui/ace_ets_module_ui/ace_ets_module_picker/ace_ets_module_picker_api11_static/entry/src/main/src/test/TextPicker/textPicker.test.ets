'use static';
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function textPickerDefaultPickerItemHeightJsunit() {
  describe('textPickerDefaultPickerItemHeightTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/textPicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textPicker state pages:" + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textPicker pages.name:" + JSON.stringify(pages.name));


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textPicker page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("textPickerDefaultPickerItemHeight after each called");
    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0001_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0001_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0001_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0001_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0001_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0001_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      console.info("[testtextPickerDefaultPickerItemHeight0001_static] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
      let numberWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('width').slice(0,-2);
      let numberValue = Number((parseFloat(numberWidth) - 112.00).toFixed(2));
      console.info("[testtextPickerDefaultPickerItemHeight0001_static] width value numberValue:" + numberValue);
      expect(Math.abs(numberValue) <= 0.01).assertTrue();
    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0002_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0002_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0002_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0002_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0002_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0002_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      let numberValue = UIContext.getFocusedUIContext()!.vp2px(parseFloat(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'))) -
        parseFloat(JSON.parseJsonElement(strJson).getElement('$attrs').getString('defaultPickerItemHeight')) * 5
      expect(Math.abs(numberValue) <= 1).assertTrue();
      console.info("[testtextPickerDefaultPickerItemHeight0002_static] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0003_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0003_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0003_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0003_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0003_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0003_static] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0003_static] fontSize value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('fontSize'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0004_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0004_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0004_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0004_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0004_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0004_static] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity')).assertEqual(1);
      console.info("[testtextPickerDefaultPickerItemHeight0004_static] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0005_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0005_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0005_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0005_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0005_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0005_static] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
      console.info("[testtextPickerDefaultPickerItemHeight0005_static] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0006_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0006_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0006_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0006_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0006_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0006_static] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0006_static] fontColor value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('fontColor'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0007_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0007_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0007_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0007_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0007_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0007_static] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0007_static] lineHeight value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('lineHeight'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0009_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0009_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0009_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0009_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0009_static] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("0.00vp");
      console.info("[testtextPickerDefaultPickerItemHeight0009_static] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0010_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0010_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0010_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0010_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0010_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0010_static] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual(undefined);
      console.info("[testtextPickerDefaultPickerItemHeight0010_static] textAlign value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('textAlign'));

    });



    /*
     * @tc.number   testtextPickerDefaultPickerItemHeight0011_static
     * @tc.name     testtextPickerDefaultPickerItemHeight0011_static
     * @tc.desc     testtextPickerDefaultPickerItemHeight0011_static
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight0011_static', Level.LEVEL1, async () => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight0011_static START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight0011_static] component defaultPickerItemHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('defaultPickerItemHeight')).assertEqual("80.00px");
      console.info("[testtextPickerDefaultPickerItemHeight0011_static] defaultPickerItemHeight value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('defaultPickerItemHeight'));

    });
  })
}
