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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, ComponentUtils, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';



export default function onPlaceChildren1() {
  describe('onPlaceChildren1', () => {
    beforeEach(() => {
      console.info("onPlaceChildren1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PlaceChildren/onPlaceChildren1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onPlaceChildren1 state pages: " + JSON.stringify(pages));
        if (!("onPlaceChildren1" == pages.name)) {
          console.info("get onPlaceChildren1 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push onPlaceChildren1 page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   onPlaceChildren1_static_001
     * @tc.name     onPlaceChildren1_static_001
     * @tc.desc     onPlaceChildren1_static_001
     * @tc.level    Level.LEVEL0
     */
it('onPlaceChildren1_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onPlaceChildren1_static_001] START');
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let MaxHeightText1: string = JSON.parseJsonElement(inspector.getInspectorByKey('constraint_maxHeight1'))
        .getElement('$attrs')
        .getString('content');
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.log('maxHeight111 is ' + MaxHeightText1);
      expect(Math.abs(Number(MaxHeightText1) - 600) <= 1).assertTrue();
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let MinHeightText1: string = JSON.parseJsonElement(inspector.getInspectorByKey('constraint_minHeight1'))
        .getElement('$attrs')
        .getString('content');
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.log('minHeight111 is ' + MinHeightText1);
      expect(Math.abs(Number(MinHeightText1) - 0) <= 1).assertTrue();
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let MaxWidthText1: string = JSON.parseJsonElement(inspector.getInspectorByKey('constraint_maxWidth1'))
        .getElement('$attrs')
        .getString('content');
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.log('maxWidth111 is' + MaxWidthText1);
      expect(Math.abs(Number(MaxWidthText1) - 500) <= 1).assertTrue();
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let MinWidthText1: string = JSON.parseJsonElement(inspector.getInspectorByKey('constraint_minWidth1'))
        .getElement('$attrs')
        .getString('content');
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.log('minWidth111 is' + MinWidthText1);
      expect(Math.abs(Number(MinWidthText1) - 0) <= 1).assertTrue();
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info('[onPlaceChildren1_static_001] END');
      done();
    });
  })
}
