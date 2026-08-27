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

export default function rectNeJsunit() {
  describe('rectNeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rect/rect',
      }
      try {
        const rect = AppStorage.get<Router>("router") as Router
        rect.clear();
        let pages = rect.getState();
        console.info("get rect state success " + JSON.stringify(pages));
        if (!("rect" == pages.name)) {
          console.info("get rect state success " + JSON.stringify(pages.name));
          // let result = await rect.pushUrl(options);
          rect.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push rect page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rect page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('rectTest sleep err: ' + JSON.stringify(err));
      }
      console.info("rectNe after each called");
    });


    
    /**
     * @tc.number   testrectNe_static_0001
     * @tc.name     testrectNe_static_0001
     * @tc.desc     testrectNe_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testrectNe_static_0001', Level.LEVEL0, async (): Promise<void> => {
      console.info('rectNe testrectNe_static_0001 START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('rectTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('Rect');
      console.info("[testrectNe_static_0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Rect');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("90.00%");
      console.info("[testrectNe_static_0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    
    /**
     * @tc.number   testrectNe_static_0002
     * @tc.name     testrectNe_static_0002
     * @tc.desc     testrectNe_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testrectNe_static_0002', Level.LEVEL0, async (): Promise<void> => {
      console.info('rectNe testrectNe_static_0002 START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('rectTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('Rect');
      console.info("[testrectNe_static_0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Rect');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("50.00px");
      console.info("[testrectNe_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });
  })
}
