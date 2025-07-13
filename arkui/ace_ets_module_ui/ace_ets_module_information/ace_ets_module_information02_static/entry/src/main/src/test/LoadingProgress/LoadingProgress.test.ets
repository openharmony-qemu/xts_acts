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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitUserAgent";

export default function loadingProgressJsunit() {
  describe('loadingProgressTest', () => {
    beforeAll(() => {
      console.info("loadingProgressTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/loadingProgress",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /**
     * @tc.number ArkUX_Stage_loadingProgress_attrs_0100
     * @tc.name Test the properties of components
     * @tc.desc Set color values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_loadingProgress_attrs_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_loadingProgress_attrs_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_loadingProgress_attrs_static_0100 component obj is: " + JSON.stringifyJsonElement(obj));
          expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF0000FF");
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0100 END ');
        } catch (err) {
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.number ArkUX_Stage_loadingProgress_attrs_0101
     * @tc.name Test the properties of components
     * @tc.desc Set enableLoading values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_loadingProgress_attrs_static_0101',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_loadingProgress_attrs_static_0101 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_0101');
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_loadingProgress_attrs_static_0101 component obj is: " + JSON.stringifyJsonElement(obj));
          expect(obj.getElement('$attrs').getString('enableLoading')).assertEqual("true");
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0101 END ');
        } catch (err) {
          console.info('ArkUX_Stage_loadingProgress_attrs_static_0101 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    /**
     * @tc.number ArkUX_Stage_loadingProgress_attrs_0102
     * @tc.name Test the properties of components
     * @tc.desc Change enableLoading values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUX_Stage_loadingProgress_attrs_static_0102',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_loadingProgress_attrs_static_0102 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>)
      await Utils.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('ArkUX_Stage_loadingProgress_attrs_0100'); //测试组件的key名称
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUX_Stage_loadingProgress_attrs_static_0102 component  is: " + JSON.stringifyJsonElement(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('enableLoading')).assertEqual("true"); //
      console.info('ArkUX_Stage_loadingProgress_attrs_static_0102 END');
      done();
    });
  })
}
