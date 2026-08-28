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


export default function provideComponent2() {
  describe('provideComponent2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("provideComponent2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Provide/provideComponent2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get provideComponent2 state pages:" + JSON.stringify(pages));
        if (!("provideComponent2" == pages.name)) {
          console.info("get provideComponent2 pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push provideComponent2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push provideComponent2 page error:" + err);
      }
      console.info("provideComponent2 beforeEach end");
    });

    
    
/**
     * @tc.number   provideComponentTwoTest_static_0100
     * @tc.name     provideComponentTwoTest_static_0100
     * @tc.desc     provideComponentTwoTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('provideComponentTwoTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provideComponentTwoTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('provideComponent2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[provideComponentTwoTest_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[provideComponentTwoTest_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('reviewVotes(5), give +1');
      console.info('[provideComponentTwoTest_static_0100] END');
      done();
    });


  })
}

