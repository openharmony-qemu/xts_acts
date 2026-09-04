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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';


export default function conSizeGroup2() {
  describe('conSizeGroup2', () => {

    beforeEach(async (): Promise<void> => {
      console.info("conSizeGroup2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/conSizeGroup2",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get conSizeGroup2 state pages:" + JSON.stringify(pages));
        if (!("conSizeGroup2" == pages.name)) {
          console.info("get conSizeGroup2 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push conSizeGroup2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push conSizeGroup2 page error:" + err);
      }
      console.info("conSizeGroup2 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("conSizeGroup2 after each called");
    });


    
    /**
     * @tc.number   conSizeGroup2_static_0100
     * @tc.name     conSizeGroup2_static_0100
     * @tc.desc     conSizeGroup2_static_0100
     * @tc.level    Level.LEVEL1
     */
it('conSizeGroup2_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[conSizeGroup2_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('group_constraintSize_2');
      console.info("[conSizeGroup2_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[conSizeGroup2_static_0100] height: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('height')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('200.00vp');
      console.info('[conSizeGroup2_static_0100] END');
      done();
    });
  })
}
