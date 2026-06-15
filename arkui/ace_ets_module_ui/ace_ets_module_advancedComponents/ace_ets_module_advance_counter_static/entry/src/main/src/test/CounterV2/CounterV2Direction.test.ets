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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import { Driver, ON, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';


export default function CounterV2DirectionTest() {
  describe('CounterV2DirectionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CounterV2DirectionTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.counter.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("CounterV2DirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/CounterV2Direction',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CounterV2DirectionTest state pages:" + JSON.stringify(pages));
        if (!("CounterV2Direction" == pages.name)) {
          console.info("get CounterV2DirectionTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CounterV2DirectionTest page error:" + err);
      }
      console.info("CounterV2DirectionTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('chipDirectionTest after each called');
    });

    
    
    /**
     * @tc.number   SUB_ARKUI_API_CounterV2Direction_static_0100
     * @tc.name     SUB_ARKUI_API_CounterV2Direction_static_0100
     * @tc.desc     SUB_ARKUI_API_CounterV2Direction_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ARKUI_API_CounterV2Direction_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log("[SUB_ARKUI_API_CounterV2Direction_static_0100] START");
      const driver = Driver.create();
      let buttonAuto = await driver.findComponent(ON.id("Auto"));
      await (buttonAuto?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.log("[SUB_ARKUI_API_CounterV2Direction_static_0100] click Auto");
      const lable = await driver.findComponent(ON.text("价格"));
      const rect1 = await (lable!.getBounds() as Promise<Rect>);
      console.log("[SUB_ARKUI_API_CounterV2Direction_static_0100] ", " rect:" + JSON.stringify(rect1));
      let buttonRtl = await driver.findComponent(ON.id("Rtl"));
      await (buttonRtl?.click() as Promise<void>);
      console.log("[CounterV2DirectionTest_0100] ", "click Rtl");
      await CommonFunc.sleep(1000);
      let lable2 = await driver.findComponent(ON.text("价格"));
      const rect2 = await (lable2!.getBounds() as Promise<Rect>);
      console.log("[SUB_ARKUI_API_CounterV2Direction_static_0100] ", " rect:" + JSON.stringify(rect2));
      expect(rect1?.left == rect2?.left).assertFalse();
      console.log("[SUB_ARKUI_API_CounterV2Direction_static_0100] END");
      done();
    });
  })
}