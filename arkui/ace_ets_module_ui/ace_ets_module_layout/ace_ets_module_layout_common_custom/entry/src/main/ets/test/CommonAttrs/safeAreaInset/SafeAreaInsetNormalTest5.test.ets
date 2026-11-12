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

export default function SafeAreaInsetNormalTest5() {
  describe('SafeAreaInsetNormalTest5', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNormalTest5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNormal5 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNormal5" == pages.name)) {
          console.info("get SafeAreaInsetNormal5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNormal5 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNormalTest5 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100
     * @tc.desc   test effective safe area is max of safeAreaPadding and edge occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n8Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n8Main');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n8Bottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100] host.bottom - main.bottom: '
          + px2vp(hostRect.bottom - mainRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100] host.bottom - edge.bottom: '
          + px2vp(hostRect.bottom - edgeRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 50)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 25)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200
     * @tc.desc   test start and end edge positions in LTR layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9Host');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9Start');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9End');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9Top');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200] start edge left: '
          + px2vp(startRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200] end edge right: '
          + px2vp(hostRect.right - endRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200] top edge left: '
          + px2vp(topRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(startRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.right - endRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(topRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300
     * @tc.desc   test start and end edges swap physical sides in RTL layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300 START');
        let eventData: events_emitter.EventData = {
          data: {
            "rtl": true
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60303,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
        await CommonFunc.sleep(1000);
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9Host');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9Start');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9End');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n9Top');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300] start edge right: '
          + px2vp(hostRect.right - startRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300] end edge left: '
          + px2vp(endRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300] top edge right: '
          + px2vp(hostRect.right - topRect.right));
        expect(Math.floor(Math.abs(px2vp(hostRect.right - startRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(endRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.right - topRect.right) - 5)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest5_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
