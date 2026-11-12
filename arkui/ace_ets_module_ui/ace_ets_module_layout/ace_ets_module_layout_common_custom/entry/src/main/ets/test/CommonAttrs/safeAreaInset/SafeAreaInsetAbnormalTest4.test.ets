/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../MainAbility/common/Common';

export default function SafeAreaInsetAbnormalTest4() {
  describe('SafeAreaInsetAbnormalTest4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetAbnormalTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetAbnormal4 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetAbnormal4" == pages.name)) {
          console.info("get SafeAreaInsetAbnormal4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetAbnormal4 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetAbnormalTest4 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100
     * @tc.desc   test valid top and bottom baseline before abnormal bottom config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a10Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100] a10 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200
     * @tc.desc   test illegal content in bottom edge clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200 START');
        let eventData: events_emitter.EventData = {
          data: {
            "cfg": {
              "content": "abc"
            }
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60313,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a10Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200] a10 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300
     * @tc.desc   test null bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300 START');
        let eventData: events_emitter.EventData = {
          data: {
            "cfg": null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60313,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a10Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300] a10 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400
     * @tc.desc   test undefined bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400 START');
        let eventData: events_emitter.EventData = {
          data: {}
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60313,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a10Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400] a10 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest4_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
