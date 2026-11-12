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

export default function SafeAreaInsetNullUndefinedTest2() {
  describe('SafeAreaInsetNullUndefinedTest2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNullUndefinedTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNullUndefined2 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNullUndefined2" == pages.name)) {
          console.info("get SafeAreaInsetNullUndefined2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNullUndefined2 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNullUndefinedTest2 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100
     * @tc.desc   test wrapContent host height with valid top and bottom edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100] START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200
     * @tc.desc   test undefined bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60321,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300
     * @tc.desc   test undefined top edge config clears top edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 2
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60321,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 55)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400
     * @tc.desc   test null bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 3
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60321,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500
     * @tc.desc   test null top and bottom edge configs clear both edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 4
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60321,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0500] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600
     * @tc.desc   test passing undefined after valid config resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 5
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60321,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0600] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700
     * @tc.desc   test passing null after valid config resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 6
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60321,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700] u5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0700] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800
     * @tc.desc   test undefined spacing falls back to 0vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800] START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u6aHost');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800] u6a host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest2_0800] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
