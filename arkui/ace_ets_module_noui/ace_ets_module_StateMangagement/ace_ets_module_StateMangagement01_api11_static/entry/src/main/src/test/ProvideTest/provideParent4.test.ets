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
import router from '@ohos.router';
import { describe, expect, beforeEach, afterEach, afterAll, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';


export default function provideParent4() {
  describe('provideParent4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("provideParent4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provide/provideParent4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get provideParent4 state pages:" + JSON.stringify(pages));
        if (!("provideParent4" == pages.name)) {
          console.info("get provideParent4 pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push provideParent4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push provideParent4 page error:" + err);
      }
      console.info("provideParent4 beforeEach end");
    });

    
    
/**
     * @tc.number   provideParentFourTest_static_0100
     * @tc.name     provideParentFourTest_static_0100
     * @tc.desc     provideParentFourTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('provideParentFourTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provideParentFourTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('provideParent4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[provideParentFourTest_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[provideParentFourTest_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('reviewVotes(10), give +1');
      console.info('[provideParentFourTest_static_0100] END');
      done();
    });


  })
}

