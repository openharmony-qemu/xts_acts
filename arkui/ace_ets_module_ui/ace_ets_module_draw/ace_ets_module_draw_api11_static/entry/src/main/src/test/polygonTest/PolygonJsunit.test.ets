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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function polygonJsunit() {
  describe('appInfoTest_four_6', () => {
    beforeEach(async (): Promise<void> => {
      console.info("polygon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polygon/polygon',
      }
      try {
        const polygon = AppStorage.get<Router>("router") as Router
        polygon.clear();
        let pages = polygon.getState();
        console.info("get polygon state pages:" + JSON.stringify(pages));
        if (!("polygon" == pages.name)) {
          console.info("get polygon state pages.name:" + JSON.stringify(pages.name));
          // let result = await polygon.pushUrl(options);
          polygon.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push polygon page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polygon page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('polygonTest sleep err: ' + JSON.stringify(err));
      }
      console.info("polygon after each called");
    });

    
    /**
     * @tc.number   testPolygon_static_001
     * @tc.name     testPolygon_static_001
     * @tc.desc     testPolygon_static_001
     * @tc.level    Level.LEVEL0
     */
it('testPolygon_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[testPolygon_static_001] START');
        await CommonFunc.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('polygon');
        console.info("[testPolygon_static_001] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
        console.info('[testPolygon_static_001] END');
        done();
      }catch(err) {
        expect().assertFail();
      }
    });
  })
}
