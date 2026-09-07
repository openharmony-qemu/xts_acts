'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import Utils from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';


export default function gridRowXlJsunit() {
  describe('gridRowXlTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridRow',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gridRow state success " + JSON.stringify(pages));
        if (!("gridRow" == pages.name)) {
          console.info("get gridRow state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push gridRow page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridRow page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("gridRowXl after each called");
    });


    
    /**
     * @tc.number   testgridRowXl_static_0001
     * @tc.name     testgridRowXl_static_0001
     * @tc.desc     testgridRowXl_static_0001
     * @tc.level    Level.LEVEL1
     */
it('testgridRowXl_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('gridRowXl testgridRowXl_static_0001 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('GridRowColumnOption——xl');
      console.info("[testgridRowXl_static_0001] component backgroundColor strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('GridRow');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor'))
        .assertEqual("Color.Red");
      console.info("[testgridRowXl_static_0001] backgroundColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundColor'));
      done();
    });
  })
}
