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

export default function SafeAreaInsetAbnormalTest1() {
  describe('SafeAreaInsetAbnormalTest1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetAbnormalTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetAbnormal1 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetAbnormal1" == pages.name)) {
          console.info("get SafeAreaInsetAbnormal1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetAbnormal1 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetAbnormalTest1 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100
     * @tc.desc   test negative vp spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_aSpacingHost');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_aSpacingBottom');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100] host height: ' + heightVp);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100] host.bottom - edge.bottom: '
          + px2vp(hostRect.bottom - edgeRect.bottom));
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200
     * @tc.desc   test negative px spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200 START');
        let eventData: events_emitter.EventData = {
          data: {
            "acase": 1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60314,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_aSpacingHost');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200] host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300
     * @tc.desc   test NaN spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300 START');
        let eventData: events_emitter.EventData = {
          data: {
            "acase": 2
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60314,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_aSpacingHost');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300] host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400
     * @tc.desc   test infinite spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400 START');
        let eventData: events_emitter.EventData = {
          data: {
            "acase": 3
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60314,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_aSpacingHost');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400] host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500
     * @tc.desc   test alignment 99 falls back to CENTER without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500 START');
        let eventData: events_emitter.EventData = {
          data: {
            "align": 99
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60311,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a5Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a5Main');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a5Bottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500] host.bottom - main.bottom: '
          + px2vp(hostRect.bottom - mainRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0500] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600
     * @tc.desc   test alignment -1 falls back to CENTER without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600 START');
        let eventData: events_emitter.EventData = {
          data: {
            "align": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60311,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a5Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a5Main');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a5Bottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600] host.bottom - main.bottom: '
          + px2vp(hostRect.bottom - mainRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest1_0600] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
