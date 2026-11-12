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

export default function SafeAreaInsetAbnormalTest3() {
  describe('SafeAreaInsetAbnormalTest3', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetAbnormalTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetAbnormal3 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetAbnormal3" == pages.name)) {
          console.info("get SafeAreaInsetAbnormal3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetAbnormal3 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetAbnormalTest3 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100
     * @tc.desc   test edge config with empty build result clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a8Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100] a8 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200
     * @tc.desc   test valid top and bottom config baseline before abnormal options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a9Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200] a9 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300
     * @tc.desc   test safeAreaInset with number parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300 START');
        let eventData: events_emitter.EventData = {
          data: {
            "opt": 5
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60312,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a9Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300] a9 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400
     * @tc.desc   test safeAreaInset with string parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400 START');
        let eventData: events_emitter.EventData = {
          data: {
            "opt": "abc"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60312,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a9Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400] a9 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500
     * @tc.desc   test safeAreaInset with array parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500 START');
        let eventData: events_emitter.EventData = {
          data: {
            "opt": []
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60312,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a9Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500] a9 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0500] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600
     * @tc.desc   test safeAreaInset with object without valid edges resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600 START');
        let eventData: events_emitter.EventData = {
          data: {
            "opt": {}
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60312,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a9Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600] a9 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest3_0600] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
