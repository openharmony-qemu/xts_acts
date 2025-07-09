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


import { afterEach, beforeEach, describe, expect, it, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('');
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function scrollbarJsunit() {


  describe('scrollbarTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    /**
     * run before testcase
     */
    beforeEach(async (): Promise<void> => {
      console.info('[scrollbarTest] before each called')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollBar/ScrollBar',
      }
      const routerAlp = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      try {
        let pages = routerAlp.getState();
        console.info("[scrollbarTest] current page is: " + JSON.stringify(pages.name));
        if (!('ScrollBar' == pages.name)) {
          // let result = await routerAlp.pushUrl(options);
          routerAlp.pushUrl(options);
          // console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.info("push scrollBar page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[scrollbarTest] after each called');
      const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      router.clear();
      await sleep(1);
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1340
     * @tc.name testScrollbar010
     * @tc.desc aceEtsTest
     */
    it('testScrollbar010_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar010_static_01 START');
      let strJson = inspector.getInspectorByKey('scrollbar1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto');
      console.info('testScrollbar010_static_01 End');
      done();
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1350
     * @tc.name testScrollbar020
     * @tc.desc aceEtsTest
     */
    it('testScrollbar020_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar020_static_02 START');
      let strJson = inspector.getInspectorByKey('scrollbar2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.On');
      console.info('testScrollbar020_static_02 End');
      done();
    });


    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1360
     * @tc.name testScrollbar030
     * @tc.desc aceEtsTest
     */
    it('testScrollbar030_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar030_static_03 START');
      let strJson = inspector.getInspectorByKey('scrollbar3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Off')
      console.info('testScrollbar030_static_03 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1370
     * @tc.name testScrollbar040
     * @tc.desc aceEtsTest
     */
    it('testScrollbar040_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar040_static_04 START');
      let strJson = inspector.getInspectorByKey('scrollbar4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar4] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto')
      console.info('testScrollbar040_static_04 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1380
     * @tc.name testScrollbar050
     * @tc.desc aceEtsTest
     */
    it('testScrollbar050_static_05', 0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar050_static_05 START');
      let strJson = inspector.getInspectorByKey('scrollbar5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar5] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.On')
      console.info('testScrollbar050_static_05 End');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1390
     * @tc.name testScrollbar060
     * @tc.desc aceEtsTest
     */
    it('testScrollbar060_static_06', 0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar060_static_06 START');
      let strJson = inspector.getInspectorByKey('scrollbar6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar6] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Off')
      console.info('testScrollbar060_static_06 End');
      done();
    });
  })
}
