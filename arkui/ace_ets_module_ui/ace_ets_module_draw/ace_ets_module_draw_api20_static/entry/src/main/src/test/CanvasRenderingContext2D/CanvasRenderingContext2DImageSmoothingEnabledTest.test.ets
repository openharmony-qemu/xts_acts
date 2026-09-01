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

export default function CanvasRenderingContext2DImageSmoothingEnabledTest() {
  describe('CanvasRenderingContext2DImageSmoothingEnabledTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CanvasRenderingContext2DImageSmoothingEnabledTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasRenderingContext2DImageSmoothingEnabled",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DImageSmoothingEnabledTest state pages:" + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DImageSmoothingEnabled" == pages.name)) {
          console.info("get CanvasRenderingContext2DImageSmoothingEnabledTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DImageSmoothingEnabledTest page error:" + err);
      }
      console.info("CanvasRenderingContext2DImageSmoothingEnabledTest beforeEach end");
    });

    /**
     * @tc.number    CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100
     * @tc.name      CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100
     * @tc.desc      Test CanvasRenderingContext2D imageSmoothingEnabled with value false through Button click callback
     * @tc.level     Level.LEVEL1
     */
    it('CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DImageSmoothingEnabledTestTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('text_imageSmoothingEnabled_result');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DImageSmoothingEnabledTestTest await err: ' + JSON.stringify(err));
      }
      console.info("[CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100] Initial content: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let button = await driver.findComponent(ON.id('button_imageSmoothingEnabled_false'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('CanvasRenderingContext2DImageSmoothingEnabledTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DImageSmoothingEnabledTestTest await err: ' + JSON.stringify(err));
      }

      strJson = inspector.getInspectorByKey('text_imageSmoothingEnabled_result');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DImageSmoothingEnabledTestTest await err: ' + JSON.stringify(err));
      }
      console.info("[CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100] Result after click: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('content')))
        .assertEqual('"Result: false"');

      console.info('[CanvasRenderingContext2DImageSmoothingEnabledTest_static_0100] END');
      done();
    });

  });
}