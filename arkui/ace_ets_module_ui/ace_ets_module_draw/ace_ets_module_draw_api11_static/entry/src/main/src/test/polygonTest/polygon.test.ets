'use static';
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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function polygonNewJsunit() {
  describe('polygonNewJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polygon/polygon2',
      }
      try {
        const polygon = AppStorage.get<Router>("router") as Router
        polygon.clear();
        let pages = polygon.getState();
        console.info("get polygon state success " + JSON.stringify(pages));
        if (!("polygon2" == pages.name)) {
          console.info("get polygon state success " + JSON.stringify(pages.name));
          // let result = await polygon.pushUrl(options);
          polygon.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push polygon page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polygon page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('polygonNewJsunit sleep err: ' + JSON.stringify(err));
      }
      console.info("polygonNe after each called");
    });


    
    /**
     * @tc.number   testpolygonNe_static_0001
     * @tc.name     testpolygonNe_static_0001
     * @tc.desc     testpolygonNe_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testpolygonNe_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('polygonNe testpolygonNe_static_0001_static START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('polygonNewJsunit sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('Polygon');
      console.info("[testpolygonNe_static_0001_static] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Polygon');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00px");
      console.info("[testpolygonNe_static_0001_static] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testpolygonNe_static_0002
     * @tc.name     testpolygonNe_static_0002
     * @tc.desc     testpolygonNe_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testpolygonNe_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('polygonNe testpolygonNe_static_0002_static START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('polygonNewJsunit sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('Polygon');
      console.info("[testpolygonNe_static_0002_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Polygon');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00px");
      console.info("[testpolygonNe_static_0002_static] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });
  })
}
