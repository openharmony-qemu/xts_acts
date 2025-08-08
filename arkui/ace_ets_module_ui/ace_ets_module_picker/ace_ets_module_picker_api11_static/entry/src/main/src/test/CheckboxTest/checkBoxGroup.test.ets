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
import events_emitter from '@ohos.events.emitter'
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

export default function checkBoxGroupPartJsunit() {
  describe('checkBoxGroupPartTest', () => {

    beforeAll(() => {
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Checkbox/checkBoxGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBoxGroup state pages:" + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get checkBoxGroup pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push checkBoxGroup page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBoxGroup page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("checkBoxGroupPart after each called");
    });
/**
     * @tc.number testcheckBoxGroupPart0011_static
     * @tc.name testcheckBoxGroupPart0011_static
     * @tc.desc testcheckBoxGroupPart0011_static
     */
    it('testcheckBoxGroupPart0011_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupPart testcheckBoxGroupPart0011 START');
      await Utils.sleep(2000);
      try {
        console.info("testcheckBoxGroupPart0011_static click result is: " + JSON.stringify(inspector.sendEventByKey('CheckboxGroup', 10, "")));
        await Utils.sleep(2000);
        let strJson: string = inspector.getInspectorByKey('Checkbox2');
        console.info("[testcheckBoxGroupPart0011] component select strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$type')).assertEqual('Checkbox');
        expect(obj.getElement('$attrs').getString('select')).assertEqual("false");
      } catch (err) {
        console.info("testcheckBoxGroupPart0011_static on click err : " + JSON.stringify(err));
      }
      console.info('testcheckBoxGroupPart0011 END');
      console.info("testcheckBoxGroup0001_static click result is: " + JSON.stringify(inspector.sendEventByKey('CheckboxGroup', 10, "")));
      done();
    });
/**
     * @tc.number testcheckBoxGroup0001_static
     * @tc.name testcheckBoxGroup0001_static
     * @tc.desc testcheckBoxGroup0001_static
     */
    it('testcheckBoxGroup0001_static', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroup testcheckBoxGroup0001_static START');
      await Utils.sleep(2000);
      try {
        console.info("testcheckBoxGroup0001_static click result is: " + JSON.stringify(inspector.sendEventByKey('CheckboxGroup', 10, "")));
        await Utils.sleep(2000);
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60301,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testcheckBoxGroup0001_static get event state result is: " + JSON.stringify(eventData));
          //expect(eventData.data?.['STATUS']).assertEqual(2);

        }
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testcheckBoxGroup0001_static on click err : " + JSON.stringify(err));
      }
      console.info('testcheckBoxGroup0001_static END');
      done();
    })
  })
}

