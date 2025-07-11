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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from "@ohos.arkui.inspector";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function progressJsunit() {


  describe('progressTest', () => {
    beforeAll(() => {
      console.info("progressTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Progress after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0960
     * @tc.name testGetProgressAttr_static_010
     * @tc.desc aceEtsTest
     */
    it('testGetProgressAttr_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr START');
      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      let objConstructor = obj.getElement('$attrs').getElement('constructor');
      console.log("progress constructor is " + objConstructor);
      expect(obj.getElement('$attrs').getElement('value')).assertEqual(3.000000.toFixed(6));
      expect(obj.getElement('$type')).assertEqual('Progress');
      expect(obj.getElement('$attrs').getElement('color')).assertEqual("#FF0000FF");
      expect(obj.getElement('$attrs').getElement('width')).assertEqual("50.00vp");
      expect(obj.getElement('$attrs').getElement('height')).assertEqual("70.00vp");
      expect(objConstructor.getElement('total')).assertEqual(40.000000.toFixed(6));
      expect(objConstructor.getElement('type')).assertEqual("ProgressStyle.Linear");
      console.info('testGetProgressAttr END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0970
     * @tc.name testGetProgressAttr_static_020
     * @tc.desc aceEtsTest
     */
    it('testGetProgressAttr_static_020', 0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr2 START');
      let strJson = inspector.getInspectorByKey('progress2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));
      let objConstructor = obj.getElement('$attrs').getElement('constructor');
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getElement('type')).assertEqual("ProgressStyle.Eclipse");
      console.info('testGetProgressAttr2 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0970
     * @tc.name testGetProgressAttr_static_030
     * @tc.desc aceEtsTest
     */
    it('testGetProgressAttr_static_030', 0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr3 START');
      let strJson = inspector.getInspectorByKey('progress3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));
      let objConstructor = obj.getElement('$attrs').getElement('constructor');
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getElement('type')).assertEqual("ProgressStyle.Ring");
      console.info('testGetProgressAttr3 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0970
     * @tc.name testGetProgressAttr040
     * @tc.desc aceEtsTest
     */
    it('testGetProgressAttr_static_040', 0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr4 START');
      let strJson = inspector.getInspectorByKey('progress4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));
      let objConstructor = obj.getElement('$attrs').getElement('constructor');
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getElement('type')).assertEqual("ProgressStyle.ScaleRing");
      console.info('testGetProgressAttr4 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0970
     * @tc.name testGetProgressAttr050
     * @tc.desc aceEtsTest
     */
    it('testGetProgressAttr_static_050', 0, async (done: () => void): Promise<void> => {
      console.info('testGetProgressAttr5 START');
      let strJson = inspector.getInspectorByKey('progress5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringifyJsonElement(obj));
      let objConstructor = obj.getElement('$attrs').getElement('constructor');
      console.log("progress constructor is " + objConstructor);
      expect(objConstructor.getElement('type')).assertEqual("ProgressStyle.Capsule");
      console.info('testGetProgressAttr5 END');
      done();
    });
  })
}
