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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility } from '../Util.test';

export default function ApiCommponentAdd02Jsunit() {
  describe('ApiCommponentAdd02Jsunit', () => {

    beforeAll(() => {
      console.info("ApiCommponentAdd02Jsunit beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("ApiCommponentAdd02Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/loadingprogrees_add02",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ApiCommponentAdd02Jsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ApiCommponentAdd02Jsunit pages.name:" + '');
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ApiCommponentAdd02Jsunit page error:" + err);
      }
      console.info("ApiCommponentAdd02Jsunit beforeEach end");
    });

    /*
     * @tc.number   ApiCommponentAdd02Jsunit_static_0900
     * @tc.name     ApiCommponentAdd02Jsunit_static_0900
     * @tc.desc     ApiCommponentAdd02Jsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ApiCommponentAdd02Jsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.info('ApiCommponentAdd02Jsunit_static_0900 START');
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      routerInstance.pushUrl({
        url: 'MainAbility/pages/Scroll/waterflow_add',
      }).then(() => {
        
      }).catch((err: BusinessError):void => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('waterflowAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ApiCommponentAdd02Jsunit_static_0900'] component obj is: " + obj.getElement('$attrs').getString('enableScrollInteraction'));
      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertTrue();
      done();
    });
  })
}