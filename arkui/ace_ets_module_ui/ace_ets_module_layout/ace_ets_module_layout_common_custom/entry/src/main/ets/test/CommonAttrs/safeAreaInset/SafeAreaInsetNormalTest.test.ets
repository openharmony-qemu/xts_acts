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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../MainAbility/common/Common';

class SafeAreaInsetRect {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

function getRectInfo(key: string): SafeAreaInsetRect {
  let rect = CommonFunc.getComponentRect(key);
  let info = new SafeAreaInsetRect();
  info.left = rect.left;
  info.top = rect.top;
  info.right = rect.right;
  info.bottom = rect.bottom;
  return info;
}

async function goToPage(url: string, pageName: string) {
  try {
    router.clear();
    let pages = router.getState();
    if (!(pageName == pages.name)) {
      let options: router.RouterOptions = {
        url: url
      }
      let result = await router.replaceUrl(options);
      await CommonFunc.sleep(2000);
      console.info("push " + pageName + " page success " + JSON.stringify(result));
    }
  } catch (err) {
    console.error("push " + pageName + " page error: " + err);
  }
}

export default function SafeAreaInsetNormalTest() {
  describe('SafeAreaInsetNormalTest', () => {
    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0100
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0100
     * @tc.desc   test SafeAreaInsetAlignment enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0100 START');
      expect(SafeAreaInsetAlignment.START).assertEqual(0);
      expect(SafeAreaInsetAlignment.CENTER).assertEqual(1);
      expect(SafeAreaInsetAlignment.END).assertEqual(2);
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0200
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0200
     * @tc.desc   test safeAreaInset with valid bottom edge config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_1', 'SafeAreaInsetNormal_1');
      let strJson = getInspectorByKey('SafeAreaInsetNormal_n1Host');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] n1Host $attrs.safeAreaInset: ' + obj.$attrs.safeAreaInset);

      let hostRect = getRectInfo('SafeAreaInsetNormal_n1Host');
      let mainRect = getRectInfo('SafeAreaInsetNormal_n1Main');
      let edgeRect = getRectInfo('SafeAreaInsetNormal_n1Bottom');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] main.top - host.top: ' + px2vp(mainRect.top - hostRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] host.bottom - main.bottom: ' + px2vp(hostRect.bottom - mainRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] host.bottom - edge.bottom: ' + px2vp(hostRect.bottom - edgeRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] edge height: ' + px2vp(edgeRect.bottom - edgeRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0200] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(edgeRect.bottom - edgeRect.top) - 15)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0300
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0300
     * @tc.desc   test safeAreaInset with four edges config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_1', 'SafeAreaInsetNormal_1');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n2Host');
      let mainRect = getRectInfo('SafeAreaInsetNormal_n2Main');
      let topRect = getRectInfo('SafeAreaInsetNormal_n2Top');
      let endRect = getRectInfo('SafeAreaInsetNormal_n2End');
      let bottomRect = getRectInfo('SafeAreaInsetNormal_n2Bottom');
      let startRect = getRectInfo('SafeAreaInsetNormal_n2Start');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] main width: ' + px2vp(mainRect.right - mainRect.left));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      expect(Math.floor(Math.abs(px2vp(mainRect.right - mainRect.left) - 66)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 60)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.left - hostRect.left) - 17)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.right - mainRect.right) - 17)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 15)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 15)) <= 1).assertTrue();
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] top edge top: ' + px2vp(topRect.top - hostRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] top edge left: ' + px2vp(topRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(topRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(topRect.left - hostRect.left) - 5)) <= 1).assertTrue();
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] end edge right: ' + px2vp(hostRect.right - endRect.right));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] end edge top: ' + px2vp(endRect.top - hostRect.top));
      expect(Math.floor(Math.abs(px2vp(hostRect.right - endRect.right) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(endRect.top - hostRect.top) - 30)) <= 1).assertTrue();
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] bottom edge bottom: ' + px2vp(hostRect.bottom - bottomRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] bottom edge right: ' + px2vp(hostRect.right - bottomRect.right));
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - bottomRect.bottom) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.right - bottomRect.right) - 5)) <= 1).assertTrue();
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] start edge left: ' + px2vp(startRect.left - hostRect.left));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0300] start edge top: ' + px2vp(startRect.top - hostRect.top));
      expect(Math.floor(Math.abs(px2vp(startRect.left - hostRect.left) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(startRect.top - hostRect.top) - 30)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0400
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0400
     * @tc.desc   test safeAreaInset with SafeAreaInsetAlignment.START on top edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0400', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0400 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_2', 'SafeAreaInsetNormal_2');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n3StartEndHost');
      let edgeRect = getRectInfo('SafeAreaInsetNormal_n3StartTop');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0400] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0400] edge.top - host.top: ' + px2vp(edgeRect.top - hostRect.top));
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(edgeRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0500
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0500
     * @tc.desc   test safeAreaInset with SafeAreaInsetAlignment.CENTER on top edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0500', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0500 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_2', 'SafeAreaInsetNormal_2');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n3CenterHost');
      let edgeRect = getRectInfo('SafeAreaInsetNormal_n3CenterTop');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0500] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 35)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0600
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0600
     * @tc.desc   test safeAreaInset with SafeAreaInsetAlignment.END on bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0600', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0600 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_2', 'SafeAreaInsetNormal_2');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n3StartEndHost');
      let edgeRect = getRectInfo('SafeAreaInsetNormal_n3EndBottom');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0600] host.right - edge.right: ' + px2vp(hostRect.right - edgeRect.right));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0600] host.bottom - edge.bottom: ' + px2vp(hostRect.bottom - edgeRect.bottom));
      expect(Math.floor(Math.abs(px2vp(hostRect.right - edgeRect.right) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0600 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0700
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0700
     * @tc.desc   test safeAreaInset with default alignment on bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0700', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0700 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_2', 'SafeAreaInsetNormal_2');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n3CenterHost');
      let edgeRect = getRectInfo('SafeAreaInsetNormal_n3DefaultBottom');
      let mainRect = getRectInfo('SafeAreaInsetNormal_n3CenterMain');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0700] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0700] main.top - host.top: ' + px2vp(mainRect.top - hostRect.top));
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 35)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 15)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0700 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0800
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0800
     * @tc.desc   test wrapContent host height with bottom edge and safeAreaPadding 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0800', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0800 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n4Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0800] n4 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 55)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0800 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_0900
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_0900
     * @tc.desc   test wrapContent host height with bottom edge and safeAreaPadding 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_0900', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0900 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n4Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_0900] n4 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 60)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_0900 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1000
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1000
     * @tc.desc   test spacing with vp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1000', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1000 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1000] n5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 55)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1000 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1100
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1100
     * @tc.desc   test spacing with px unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1100 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n5Host');
      let heightPx = hostRect.bottom - hostRect.top;
      let expectedPx = vp2px(52) + 3;
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1100] n5 host heightPx: ' + heightPx + ', expectedPx: ' + expectedPx);
      expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1200
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1200
     * @tc.desc   test spacing with fp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n5Host');
      let heightPx = hostRect.bottom - hostRect.top;
      let expectedPx = vp2px(52) + fp2px(3);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1200] n5 host heightPx: ' + heightPx + ', expectedPx: ' + expectedPx);
      expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1300
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1300
     * @tc.desc   test spacing with lpx unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n5Host');
      let heightPx = hostRect.bottom - hostRect.top;
      let expectedPx = vp2px(52) + lpx2px(3);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1300] n5 host heightPx: ' + heightPx + ', expectedPx: ' + expectedPx);
      expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1400
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1400
     * @tc.desc   test default spacing 0vp when spacing is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1400', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1400 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_3', 'SafeAreaInsetNormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1400] n5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1500
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1500
     * @tc.desc   test wrapContent host height with top and bottom edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1500', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1500 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_4', 'SafeAreaInsetNormal_4');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n6Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1500] n6 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1600
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1600
     * @tc.desc   test replacing config with only top provided clears bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1600', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1600 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_4', 'SafeAreaInsetNormal_4');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n6Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1600] n6 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1600 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1700
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1700
     * @tc.desc   test passing undefined resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1700', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1700 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_4', 'SafeAreaInsetNormal_4');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n6Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1700] n6 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1700 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1800
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1800
     * @tc.desc   test providing full config again restores both edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1800', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1800 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_4', 'SafeAreaInsetNormal_4');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n6Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1800] n6 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1800 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_1900
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_1900
     * @tc.desc   test replacing top edge content updates occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_1900', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1900 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_4', 'SafeAreaInsetNormal_4');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n6Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_1900] n6 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 73)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_1900 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_2000
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_2000
     * @tc.desc   test edge content margin counts into occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_2000', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2000 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_4', 'SafeAreaInsetNormal_4');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n7Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2000] n7 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 59)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2000 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_2100
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_2100
     * @tc.desc   test effective safe area is max of safeAreaPadding and edge occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_2100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2100 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_5', 'SafeAreaInsetNormal_5');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n8Host');
      let mainRect = getRectInfo('SafeAreaInsetNormal_n8Main');
      let edgeRect = getRectInfo('SafeAreaInsetNormal_n8Bottom');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2100] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2100] host.bottom - main.bottom: ' + px2vp(hostRect.bottom - mainRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2100] host.bottom - edge.bottom: ' + px2vp(hostRect.bottom - edgeRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2100] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 50)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 25)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_2200
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_2200
     * @tc.desc   test start and end edge positions in LTR layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_2200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_5', 'SafeAreaInsetNormal_5');
      let hostRect = getRectInfo('SafeAreaInsetNormal_n9Host');
      let startRect = getRectInfo('SafeAreaInsetNormal_n9Start');
      let endRect = getRectInfo('SafeAreaInsetNormal_n9End');
      let topRect = getRectInfo('SafeAreaInsetNormal_n9Top');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2200] start edge left: ' + px2vp(startRect.left - hostRect.left));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2200] end edge right: ' + px2vp(hostRect.right - endRect.right));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2200] top edge left: ' + px2vp(topRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(startRect.left - hostRect.left) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.right - endRect.right) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(topRect.left - hostRect.left) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Normal_2300
     * @tc.number SUB_ACE_SAFEAREAINSET_Normal_2300
     * @tc.desc   test start and end edges swap physical sides in RTL layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Normal_2300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal_5', 'SafeAreaInsetNormal_5');
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
      let hostRect = getRectInfo('SafeAreaInsetNormal_n9Host');
      let startRect = getRectInfo('SafeAreaInsetNormal_n9Start');
      let endRect = getRectInfo('SafeAreaInsetNormal_n9End');
      let topRect = getRectInfo('SafeAreaInsetNormal_n9Top');
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2300] start edge right: ' + px2vp(hostRect.right - startRect.right));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2300] end edge left: ' + px2vp(endRect.left - hostRect.left));
      console.info('[SUB_ACE_SAFEAREAINSET_Normal_2300] top edge right: ' + px2vp(hostRect.right - topRect.right));
      expect(Math.floor(Math.abs(px2vp(hostRect.right - startRect.right) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(endRect.left - hostRect.left) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.right - topRect.right) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Normal_2300 END');
      done();
    });
  })
}
