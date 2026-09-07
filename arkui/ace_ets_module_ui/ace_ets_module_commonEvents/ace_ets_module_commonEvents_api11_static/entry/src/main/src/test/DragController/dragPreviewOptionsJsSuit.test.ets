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

import emitter from '@ohos.events.emitter'
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function dragPreviewOptionsJsSuit() {
  describe('dragPreviewOptionsJsSuit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("dragPreviewOptionsJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/dragPreviewOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dragPreviewOptionsJsSuit state pages:" + JSON.stringify(pages));
        if (!("dragPreviewOptions" == pages.name)) {
          console.info("get dragPreviewOptionsJsSuit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dragPreviewOptionsJsSuit page error:" + err);
      }
      console.info("dragPreviewOptionsJsSuit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });


    
    
/**
     * @tc.number   dragPreviewOptionsJsSuit_static_0100
     * @tc.name     dragPreviewOptionsJsSuit_static_0100
     * @tc.desc     dragPreviewOptionsJsSuit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('dragPreviewOptionsJsSuit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[dragPreviewOptionsJsSuit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey("dragPreviewOption");
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[dragPreviewOptionsJsSuit_0100] obj is: " + obj.getElement('$attrs').getString('height'));
      expect(obj.getElement('$attrs').getString('height') == '150.00vp').assertTrue();
      console.info('[dragPreviewOptionsJsSuit_0100] END');
      done();
    });
  })
}


