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

import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function shapeTest() {
  describe('shapeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("shapeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/shapePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get shapeTest state pages:" + JSON.stringify(pages));
        if (!("shapePage" == pages.name)) {
          console.info("get shapeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push shapeTest page error:" + err);
      }
      console.info("shapeTest beforeEach end");
    });

    afterEach(async () => {
    });


    
    
/**
     * @tc.number   shapeTest_static_0100
     * @tc.name     shapeTest_static_0100
     * @tc.desc     shapeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('shapeTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('shapeTest_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('shapeTest sleep err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('shapePage_image');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('shapeTest sleep err: ' + JSON.stringify(err));
      }
      let obj = JSON.parseJsonElement(strJson);
      console.info("[shapeTest_0100] strJson:" + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('Image');

      console.info('shapeTest_0100 END');
      done();
    });
  })
}