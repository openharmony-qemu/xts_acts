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

export default function DragActionJsunit() {
  describe('DragActionJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("DragActionJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/DragAction',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DragActionJsunit state pages:" + JSON.stringify(pages));
        if (!("DragAction" == pages.name)) {
          console.info("get DragActionJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push DragActionJsunit page error:" + err);
      }
      console.info("DragActionJsunit beforeEach end");
    });


    
    
/**
     * @tc.number   DragActionJsunit_static_0100
     * @tc.name     DragActionJsunit_static_0100
     * @tc.desc     DragActionJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('DragActionJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[DragActionJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_value');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[DragActionJsunit_0100] obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content') == 'DragAction').assertTrue();
      console.info('[DragActionJsunit_0100] END');
      done();
    });
  })
}