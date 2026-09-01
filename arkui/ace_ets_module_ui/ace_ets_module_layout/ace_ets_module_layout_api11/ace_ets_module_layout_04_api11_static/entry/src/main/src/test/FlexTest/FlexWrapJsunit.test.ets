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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import router from '@ohos.router';
import { ResourceColor,Length } from '@ohos.arkui.component'

import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function flexWrapJsunit() {
  describe('flexWrapJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/flexWrap',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexWrap state pages:" + "");
        if (!("flexWrap" == pages.name)) {
          console.info("get flexWrap state pages.name:" + "");
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push flexWrap page error:" + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      try {
      await Utils.sleep(1000);
      } catch (err) {
      console.info('flexWrapJsunitTest await err: ' + JSON.stringify(err));
      }
      console.info("flexWrap after each called");
    });

/**
     * @tc.number   flexWrap_static_0100
     * @tc.name     flexWrap_static_0100
     * @tc.desc     flexWrap_static_0100
     * @tc.level    Level.LEVEL0
     */
it('flexWrap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexWrap_static_0100 START');
      let strJson = inspector.getInspectorByKey('WrapReverse');
      console.info("flexWrap_static_0100 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexWrap_static_0100 component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual("Text");
     expect(obj.getElement('$attrs').getString('width')).assertEqual("20.00%");
      console.info('flexWrap_static_0100 END');
      done();
    });

/**
     * @tc.number   flexWrap_static_0200
     * @tc.name     flexWrap_static_0200
     * @tc.desc     flexWrap_static_0200
     * @tc.level    Level.LEVEL0
     */
it('flexWrap_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexWrap_static_0200 START');
      let strJson = inspector.getInspectorByKey('WrapReverse');
      console.info("flexWrap_static_0200 component strJson:" + strJson);
     let obj = JSON.parseJsonElement(strJson);
     console.info("flexWrap_static_0200 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('height')).assertEqual("40.00vp");
     expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFD2B48C");
      console.info('flexWrap_static_0200 END');
      done();
    });

/**
     * @tc.number   flexWrap_static_0300
     * @tc.name     flexWrap_static_0300
     * @tc.desc     flexWrap_static_0300
     * @tc.level    Level.LEVEL0
     */
it('flexWrap_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('flexWrap_static_0300 START');
      try {
        AppStorage.setOrCreate<Length>('sWidth',"40%")
        AppStorage.setOrCreate<Length>('sHeight',"70")
        AppStorage.setOrCreate<ResourceColor>('sBackgroundColor',0xF5DEB3)
      } catch (err) {
        console.log("flexWrap_static_0300 change component data error: " + (err as Error)?.message);
      }
      try {
      await Utils.sleep(3000);
      } catch (err) {
      console.info('flexWrapJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJsonNew = inspector.getInspectorByKey('WrapReverse');
     let objNew = JSON.parseJsonElement(strJsonNew);
     console.info("flexWrap_static_0300 component objNew is: " + JSON.stringify(objNew));
     expect(objNew.getElement('$attrs').getString('width')).assertEqual('40.00%');
     expect(objNew.getElement('$attrs').getString('height')).assertEqual('70.00vp');
     expect(objNew.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFF5DEB3");
      console.info('flexWrap_static_0300 END');
      done();
      });
  })
}