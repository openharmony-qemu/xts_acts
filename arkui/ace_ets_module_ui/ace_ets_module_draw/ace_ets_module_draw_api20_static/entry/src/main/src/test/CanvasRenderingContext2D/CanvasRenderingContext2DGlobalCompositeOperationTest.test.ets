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

import { describe, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON } from '@ohos.UiTest'
import { CanvasRenderingContext2D, RenderingContextSettings } from '@ohos.arkui.component';

export default function CanvasRenderingContext2DGlobalCompositeOperationTest() {
  describe('CanvasRenderingContext2DGlobalCompositeOperationTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CanvasRenderingContext2DGlobalCompositeOperationTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasRenderingContext2DGlobalCompositeOperation",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DGlobalCompositeOperationTest state pages:" + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DGlobalCompositeOperation" == pages.name)) {
          console.info("get CanvasRenderingContext2DGlobalCompositeOperationTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DGlobalCompositeOperationTest page error:" + err);
      }
      console.info("CanvasRenderingContext2DGlobalCompositeOperationTest beforeEach end");
    });

    /**
     * @tc.number    CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100
     * @tc.name      CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100
     * @tc.desc      Test CanvasRenderingContext2D globalCompositeOperation with value destination-over through Button click callback
     * @tc.level     Level.LEVEL1
     */
    it('CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DGlobalCompositeOperationTestTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('text_globalCompositeOperation_result');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DGlobalCompositeOperationTestTest await err: ' + JSON.stringify(err));
      }
      console.info("[CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100] Initial content: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let button = await driver.findComponent(ON.id('button_globalCompositeOperation_destinationover'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('CanvasRenderingContext2DGlobalCompositeOperationTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DGlobalCompositeOperationTestTest await err: ' + JSON.stringify(err));
      }

      let strJson1 = inspector.getInspectorByKey('canvas_globalCompositeOperation_sourceover');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100] type is: " + JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('Canvas');

      console.info('[CanvasRenderingContext2DGlobalCompositeOperationTest_static_0100] END');
      done();
    });

  });
}