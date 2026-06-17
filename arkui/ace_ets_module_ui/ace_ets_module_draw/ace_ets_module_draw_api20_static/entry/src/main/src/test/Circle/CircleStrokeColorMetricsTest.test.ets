'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON } from '@ohos.UiTest'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { CanvasRenderingContext2D, RenderingContextSettings } from '@ohos.arkui.component';

export default function CircleStrokeColorMetricsTest() {
  describe('CircleStrokeColorMetricsTest', () => {
    beforeAll(async () => {
      console.info("CircleStrokeColorMetricsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.drawAPI20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("CircleStrokeColorMetricsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Circle/CircleStrokeColorMetrics",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CircleStrokeColorMetrics state pages:" + JSON.stringify(pages));
        if (!("CircleStrokeColorMetrics" == pages.name)) {
          console.info("get CircleStrokeColorMetrics pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CircleStrokeColorMetrics page error:" + err);
      }
      console.info("CircleStrokeColorMetrics beforeEach end");
    });

    /**
     * @tc.name   CircleStrokeColorMetricsTest_0100
     * @tc.number SUB_ARKUI_API_CircleStrokeColorMetricsTest_0100
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CircleStrokeColorMetricsTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CircleStrokeColorMetricsTest_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(2000);

      let button1 = await driver.findComponent(ON.id('ChangeCircleColorRed'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let button2 = await driver.findComponent(ON.id('ChangeCircleColorGreen'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let button3 = await driver.findComponent(ON.id('ChangeCircleColorBlue'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let button4 = await driver.findComponent(ON.id('ChangeCircleColorWhite'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let button5 = await driver.findComponent(ON.id('ChangeCircleColorReduce'));
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let button6 = await driver.findComponent(ON.id('ChangeCircleColorAdd'));
      await (button6?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let strJson1 = inspector.getInspectorByKey('CircleStrokeColorMetrics1');
      expect(JSON.parseJsonElement(strJson1).getString('$type')).assertEqual('Circle');
      let strJson2 = inspector.getInspectorByKey('CircleStrokeColorMetrics2');
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Circle');

      console.info('[CircleStrokeColorMetricsTest_0100] END');
      done();
    });

  });
}                                                                                                                                                   