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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON } from '@ohos.UiTest'

export default function CanvasRenderingContext2DDirectionTest() {
  describe('CanvasRenderingContext2DDirectionTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CanvasRenderingContext2DDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/CanvasRenderingContext2DDirection",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get CanvasRenderingContext2DDirectionTest state pages:" + JSON.stringify(pages));
        if (!("CanvasRenderingContext2DDirection" == pages.name)) {
          console.info("get CanvasRenderingContext2DDirectionTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CanvasRenderingContext2DDirectionTest page error:" + err);
      }
      console.info("CanvasRenderingContext2DDirectionTest beforeEach end");
    });

    /**
     * @tc.number    CanvasRenderingContext2DDirectionTest_static_0100
     * @tc.name      CanvasRenderingContext2DDirectionTest_static_0100
     * @tc.desc      Test CanvasRenderingContext2D direction with value 'ltr' through Button click callback
     * @tc.level     Level.LEVEL1
     */
    it('CanvasRenderingContext2DDirectionTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CanvasRenderingContext2DDirectionTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DDirectionTestTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('text_direction_result');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DDirectionTestTest await err: ' + JSON.stringify(err));
      }
      console.info("[CanvasRenderingContext2DDirectionTest_static_0100] Initial content: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));

      let button = await driver.findComponent(ON.id('button_direction'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('CanvasRenderingContext2DDirectionTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DDirectionTestTest await err: ' + JSON.stringify(err));
      }

      strJson = inspector.getInspectorByKey('text_direction_result');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CanvasRenderingContext2DDirectionTestTest await err: ' + JSON.stringify(err));
      }
      console.info("[CanvasRenderingContext2DDirectionTest_static_0100] Result after click: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('content')))
        .assertEqual('"Result: direction set to ltr"');

      console.info('[CanvasRenderingContext2DDirectionTest_static_0100] END');
      done();
    });

  });
}