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

export default function SafeAreaInsetNullUndefinedTest1() {
  describe('SafeAreaInsetNullUndefinedTest1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNullUndefinedTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNullUndefined1 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNullUndefined1" == pages.name)) {
          console.info("get SafeAreaInsetNullUndefined1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNullUndefined1 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNullUndefinedTest1 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100
     * @tc.desc   test main content layout without calling safeAreaInset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100] START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u1Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u1Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100] main.top - host.top: '
          + px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100] host.bottom - main.bottom: '
          + px2vp(hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200
     * @tc.desc   test safeAreaInset with undefined parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200] START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u2Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300
     * @tc.desc   test safeAreaInset with null parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60322,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u2Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400
     * @tc.desc   test safeAreaInset with null bottom edge config clears bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400] START');
        let eventData: events_emitter.EventData = {
          data: {
            "mode": 2
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60322,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u2Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest1_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
