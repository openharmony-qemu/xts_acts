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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
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

export default function checkBoxGroupSelectAllJsunit() {
  describe('checkBoxGroupSelectAllTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroup/checkBoxGroup2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBoxGroup state pages:" + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get checkBoxGroup pages.name:" + JSON.stringify(pages.name));


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push checkBoxGroup page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("checkBoxGroupSelectAll after each called");
    });



    /*
     * @tc.number   testcheckBoxGroupSelectAll0001_static
     * @tc.name     testcheckBoxGroupSelectAll0001_static
     * @tc.desc     testcheckBoxGroupSelectAll0001_static
     * @tc.level    Level.LEVEL1
     */
    it('testcheckBoxGroupSelectAll0001_static', Level.LEVEL1, async () => {
      console.info('checkBoxGroupSelectAll testcheckBoxGroupSelectAll0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('CheckboxGroup');
      console.info("[testcheckBoxGroupSelectAll0001] component selectedColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$type')).assertEqual('CheckboxGroup');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual("#FFED6F21");
      console.info("[testcheckBoxGroupSelectAll0001] selectedColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor'));

    });



    /*
     * @tc.number   testcheckBoxGroupSelectAll0002_static
     * @tc.name     testcheckBoxGroupSelectAll0002_static
     * @tc.desc     testcheckBoxGroupSelectAll0002_static
     * @tc.level    Level.LEVEL1
     */
    it('testcheckBoxGroupSelectAll0002_static', Level.LEVEL1, async () => {
      console.info('checkBoxGroupSelectAll testcheckBoxGroupSelectAll0002 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "isSelect": false
          } as Record<String, RecordData>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60203,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testcheckBoxGroupSelectAll0002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testcheckBoxGroupSelectAll0002] change component data error: " + (err as Error).message);
      }
      await Utils.sleep(2000);

      let strJson = inspector.getInspectorByKey('CheckboxOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testcheckBoxGroupSelectAll0002] obj is: " + JSON.stringify(obj));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual("#FF39A2DB");
      console.info("[testcheckBoxGroupSelectAll0002] selectedColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor'));
      console.info('testcheckBoxGroupSelectAll0002 END');

    });
  })
}
