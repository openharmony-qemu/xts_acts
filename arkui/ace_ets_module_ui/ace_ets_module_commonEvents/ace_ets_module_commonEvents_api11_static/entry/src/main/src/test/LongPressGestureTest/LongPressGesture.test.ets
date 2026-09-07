'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

export default function longPressGestureJsunit() {
  describe('longPressGestureJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("longPressGestureJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPressGesture/longPressGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get longPressGestureJsunit state pages:" + JSON.stringify(pages));
        if (!("longPressGesture" == pages.name)) {
          console.info("get longPressGestureJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push longPressGestureJsunit page error:" + err);
      }
      console.info("longPressGestureJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("longPressGesture after each called");
    });


    
    /**
     * @tc.number   testLongPressGesture_static_01
     * @tc.name     testLongPressGesture_static_01
     * @tc.desc     testLongPressGesture_static_01
     * @tc.level    Level.LEVEL0
     */
it('testLongPressGesture_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLongPressGesture01] START');
      await CommonFunc.sleep(1000);
      let callback = (eventData: emitter.EventData) => {
        console.info("testLongPressGesture01 get event state result is: " + JSON.stringify(eventData));
        // expect(eventData.data?.['ACTION']).assertEqual('onAction')
        done();
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 125,
        priority: emitter.EventPriority.LOW
      }
      try {
        console.info("testLongPressGesture01 on emitter on");
        emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("testLongPressGesture01 on emitter err : " + JSON.stringify(err));
      }
      console.info("testLongPressGesture01 sendEventByKey result: " +
      JSON.stringify(inspector.sendEventByKey('flex', 11, "")));
      await CommonFunc.sleep(1000);
      console.info('testLongPressGesture01 END');
      done();
    });


    
    /**
     * @tc.number   testLongPressGesture_static_02
     * @tc.name     testLongPressGesture_static_02
     * @tc.desc     testLongPressGesture_static_02
     * @tc.level    Level.LEVEL0
     */
it('testLongPressGesture_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testLongPressGesture02] START');
      await CommonFunc.sleep(1000);
      let callback = (eventData: emitter.EventData) => {
        console.info("testLongPressGesture02 get event state result is: " + JSON.stringify(eventData));
        const data: Record<String,RecordData> =
          eventData.data as Record<String,RecordData>
        expect(data['ACTION']).assertEqual('onActionEnd')
        done();
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 126,
        priority: emitter.EventPriority.LOW
      }
      try {
        console.info("testLongPressGesture02 on emitter on");
        emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("testLongPressGesture02 on emitter err : " + JSON.stringify(err));
      }
      const strJson = inspector.sendEventByKey('flex', 11, "")
      console.info("testLongPressGesture02 sendEventByKey result: " + JSON.stringify(strJson));
      await CommonFunc.sleep(1000);
      console.info('testLongPressGesture02 END');
    });
  })
}
