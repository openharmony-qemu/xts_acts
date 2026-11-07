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

export default function SafeAreaInsetNullUndefinedTest() {
  describe('SafeAreaInsetNullUndefinedTest', () => {
    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0100
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0100
     * @tc.desc   test main content layout without calling safeAreaInset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0100 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_1', 'SafeAreaInsetNullUndefined_1');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u1Host');
      let mainRect = getRectInfo('SafeAreaInsetNullUndefined_u1Main');
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0100] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0100] main.top - host.top: ' + px2vp(mainRect.top - hostRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0100] host.bottom - main.bottom: ' + px2vp(hostRect.bottom - mainRect.bottom));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0200
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0200
     * @tc.desc   test safeAreaInset with undefined parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_1', 'SafeAreaInsetNullUndefined_1');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u2Host');
      let mainRect = getRectInfo('SafeAreaInsetNullUndefined_u2Main');
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0200] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0300
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0300
     * @tc.desc   test safeAreaInset with null parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_1', 'SafeAreaInsetNullUndefined_1');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u2Host');
      let mainRect = getRectInfo('SafeAreaInsetNullUndefined_u2Main');
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0300] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0400
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0400
     * @tc.desc   test safeAreaInset with null bottom edge config clears bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0400', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0400 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_1', 'SafeAreaInsetNullUndefined_1');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u2Host');
      let mainRect = getRectInfo('SafeAreaInsetNullUndefined_u2Main');
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0400] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0500
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0500
     * @tc.desc   test wrapContent host height with valid top and bottom edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0500', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0500 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0500] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 67)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0600
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0600
     * @tc.desc   test undefined bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0600', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0600 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0600] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0600 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0700
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0700
     * @tc.desc   test undefined top edge config clears top edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0700', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0700 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0700] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 55)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0700 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0800
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0800
     * @tc.desc   test null bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0800', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0800 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0800] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0800 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_0900
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_0900
     * @tc.desc   test null top and bottom edge configs clear both edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_0900', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0900 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_0900] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_0900 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1000
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1000
     * @tc.desc   test passing undefined after valid config resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1000', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1000 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1000] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1000 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1100
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1100
     * @tc.desc   test passing null after valid config resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1100 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
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
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u5Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1100] u5 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1200
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1200
     * @tc.desc   test undefined spacing falls back to 0vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_2', 'SafeAreaInsetNullUndefined_2');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u6aHost');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1200] u6a host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1300
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1300
     * @tc.desc   test omitted spacing falls back to 0vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_3', 'SafeAreaInsetNullUndefined_3');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u6bHost');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1300] u6b host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 52)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1400
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1400
     * @tc.desc   test undefined alignment falls back to CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1400', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1400 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_3', 'SafeAreaInsetNullUndefined_3');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u7aHost');
      let mainRect = getRectInfo('SafeAreaInsetNullUndefined_u7aMain');
      let edgeRect = getRectInfo('SafeAreaInsetNullUndefined_u7aBottom');
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1400] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1400] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1500
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1500
     * @tc.desc   test omitted alignment falls back to CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1500', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1500 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_4', 'SafeAreaInsetNullUndefined_4');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u7bHost');
      let mainRect = getRectInfo('SafeAreaInsetNullUndefined_u7bMain');
      let edgeRect = getRectInfo('SafeAreaInsetNullUndefined_u7bBottom');
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1500] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1500] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_NullUndefined_1600
     * @tc.number SUB_ACE_SAFEAREAINSET_NullUndefined_1600
     * @tc.desc   test all four edges set to undefined reset all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_NullUndefined_1600', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1600 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined_4', 'SafeAreaInsetNullUndefined_4');
      let hostRect = getRectInfo('SafeAreaInsetNullUndefined_u8Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_NullUndefined_1600] u8 host height: ' + heightVp);
      expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_NullUndefined_1600 END');
      done();
    });
  })
}
