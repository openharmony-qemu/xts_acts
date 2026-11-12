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

export default function SafeAreaInsetNormalTest3() {
  describe('SafeAreaInsetNormalTest3', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNormalTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNormal3 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNormal3" == pages.name)) {
          console.info("get SafeAreaInsetNormal3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNormal3 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNormalTest3 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100
     * @tc.desc   test wrapContent host height with bottom edge and safeAreaPadding 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n4Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100] n4 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 55)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200
     * @tc.desc   test wrapContent host height with bottom edge and safeAreaPadding 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200 START');
        let eventData: events_emitter.EventData = {
          data: {
            "large": true
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60301,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n4Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200] n4 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 60)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300
     * @tc.desc   test spacing with vp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300] n5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 55)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400
     * @tc.desc   test spacing with px unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400 START');
        let eventData: events_emitter.EventData = {
          data: {
            "unit": 1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60304,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n5Host');
        let heightPx = hostRect.bottom - hostRect.top;
        let expectedPx = vp2px(52) + 3;
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400] n5 host heightPx: ' + heightPx
          + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500
     * @tc.desc   test spacing with fp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500 START');
        let eventData: events_emitter.EventData = {
          data: {
            "unit": 2
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60304,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n5Host');
        let heightPx = hostRect.bottom - hostRect.top;
        let expectedPx = vp2px(52) + fp2px(3);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500] n5 host heightPx: ' + heightPx
          + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0500] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600
     * @tc.desc   test spacing with lpx unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600 START');
        let eventData: events_emitter.EventData = {
          data: {
            "unit": 3
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60304,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n5Host');
        let heightPx = hostRect.bottom - hostRect.top;
        let expectedPx = vp2px(52) + lpx2px(3);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600] n5 host heightPx: ' + heightPx
          + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0600] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700
     * @tc.desc   test default spacing 0vp when spacing is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700 START');
        let eventData: events_emitter.EventData = {
          data: {
            "unit": 4
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60304,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n5Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700] n5 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest3_0700] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
