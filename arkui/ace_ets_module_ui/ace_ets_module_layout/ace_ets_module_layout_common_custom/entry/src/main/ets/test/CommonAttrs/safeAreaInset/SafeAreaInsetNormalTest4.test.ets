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

export default function SafeAreaInsetNormalTest4() {
  describe('SafeAreaInsetNormalTest4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNormalTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNormal4 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNormal4" == pages.name)) {
          console.info("get SafeAreaInsetNormal4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNormal4 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNormalTest4 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100
     * @tc.desc   test wrapContent host height with top and bottom edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n6Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100] n6 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200
     * @tc.desc   test replacing config with only top provided clears bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200 START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60302,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n6Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200] n6 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300
     * @tc.desc   test passing undefined resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300 START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 2
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60302,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n6Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300] n6 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400
     * @tc.desc   test providing full config again restores both edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400 START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 3
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60302,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n6Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400] n6 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500
     * @tc.desc   test replacing top edge content updates occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500 START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 4
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60302,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n6Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500] n6 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 73)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0500] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600
     * @tc.desc   test edge content margin counts into occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n7Host');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n7Bottom');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600] n7 host height: ' + heightVp);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600] host.bottom - edge.bottom: '
          + px2vp(hostRect.bottom - edgeRect.bottom));
        expect(Math.floor(Math.abs(heightVp - 59)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 7)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest4_0600] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
