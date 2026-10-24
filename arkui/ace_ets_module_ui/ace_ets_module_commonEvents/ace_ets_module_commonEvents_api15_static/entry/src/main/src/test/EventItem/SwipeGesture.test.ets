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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON, PointerMatrix } from '@kit.TestKit';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

let displayID: Int = AppStorage.get<number>('displayID')?.toInt() ?? 0
export default function swipeGestureEventTest() {
  describe('swipeGestureEvent', () => {
    beforeEach(async (): Promise<void> => {
      console.info('swipeGestureEvent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EventItem/SwipeGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get swipeGestureEvent state pages: ' + JSON.stringify(pages));
        if (!('SwipeGesture' == pages.name)) {
          console.info('get swipeGestureEvent state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push swipeGestureEvent page error: ' + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   SwipeGesture1_static_0100
     * @tc.name     SwipeGesture1_static_0100
     * @tc.desc     SwipeGesture1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SwipeGesture1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SwipeGesture1_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let colum = CommonFunc.getComponentRectOnScreen('SwipeGesture1');
      await CommonFunc.sleep(1000);
      let top = colum.top
      let left = colum.left
      let areaWidth = colum.right - colum.left
      let areaHeight = colum.bottom - colum.top
      console.log('test start get data is:' + colum.top + '[]' + colum.left)
      console.log('test start get data is:' + Math.round(left + areaWidth * 0.2) +
        '[]' + Math.round(top + areaHeight * 0.2) + '[]' +
      Math.round(left + areaWidth * 0.8) + '[]' + Math.round(top + areaHeight * 0.8) + '[]' + 600)

      await driver.swipeBetween({x: Math.round(left + areaWidth * 0.2).toInt(), y: Math.round(top + areaHeight * 0.2).toInt(), displayId: displayID}, {x: Math.round(left + areaWidth * 0.8).toInt(), y: Math.round(top + areaHeight * 0.8).toInt(), displayId: displayID}, 600 as Int)

      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('value');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SwipeGesture1_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SwipeGesture1_static_0100] title: ' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual(displayID + '');
      console.info('[SwipeGesture1_static_0100] END');
      done();
    });

  })
}

