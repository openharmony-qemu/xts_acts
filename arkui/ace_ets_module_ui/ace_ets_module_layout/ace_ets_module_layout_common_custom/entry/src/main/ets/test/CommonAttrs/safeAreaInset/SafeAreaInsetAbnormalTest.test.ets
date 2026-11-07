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

export default function SafeAreaInsetAbnormalTest() {
  describe('SafeAreaInsetAbnormalTest', () => {
    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0100
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0100
     * @tc.desc   test negative vp spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0100 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_1', 'SafeAreaInsetAbnormal_1');
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_aSpacingHost');
      let edgeRect = getRectInfo('SafeAreaInsetAbnormal_aSpacingBottom');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0100] host height: ' + heightVp);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0100] host.bottom - edge.bottom: ' + px2vp(hostRect.bottom - edgeRect.bottom));
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      expect(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0200
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0200
     * @tc.desc   test negative px spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_1', 'SafeAreaInsetAbnormal_1');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_aSpacingHost');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0200] host height: ' + heightVp);
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0300
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0300
     * @tc.desc   test NaN spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_1', 'SafeAreaInsetAbnormal_1');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_aSpacingHost');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0300] host height: ' + heightVp);
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0400
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0400
     * @tc.desc   test infinite spacing falls back to 0vp without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0400', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0400 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_1', 'SafeAreaInsetAbnormal_1');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_aSpacingHost');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0400] host height: ' + heightVp);
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0500
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0500
     * @tc.desc   test alignment 99 falls back to CENTER without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0500', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0500 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_1', 'SafeAreaInsetAbnormal_1');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a5Host');
      let mainRect = getRectInfo('SafeAreaInsetAbnormal_a5Main');
      let edgeRect = getRectInfo('SafeAreaInsetAbnormal_a5Bottom');
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0500] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0500] host.bottom - main.bottom: ' + px2vp(hostRect.bottom - mainRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0500] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51) <= 1).assertTrue();
      expect(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24) <= 1).assertTrue();
      expect(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0600
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0600
     * @tc.desc   test alignment -1 falls back to CENTER without clearing edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0600', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0600 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_1', 'SafeAreaInsetAbnormal_1');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a5Host');
      let mainRect = getRectInfo('SafeAreaInsetAbnormal_a5Main');
      let edgeRect = getRectInfo('SafeAreaInsetAbnormal_a5Bottom');
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0600] main height: ' + px2vp(mainRect.bottom - mainRect.top));
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0600] host.bottom - main.bottom: ' + px2vp(hostRect.bottom - mainRect.bottom));
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0600] edge.left - host.left: ' + px2vp(edgeRect.left - hostRect.left));
      expect(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51) <= 1).assertTrue();
      expect(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24) <= 1).assertTrue();
      expect(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0600 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0700
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0700
     * @tc.desc   test edge config with undefined content clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0700', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0700 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_2', 'SafeAreaInsetAbnormal_2');
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a6Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0700] a6 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0700 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0800
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0800
     * @tc.desc   test edge config with null content clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0800', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0800 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_2', 'SafeAreaInsetAbnormal_2');
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a7Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0800] a7 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0800 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_0900
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_0900
     * @tc.desc   test edge config with empty build result clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_0900', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0900 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_3', 'SafeAreaInsetAbnormal_3');
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a8Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_0900] a8 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_0900 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1000
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1000
     * @tc.desc   test valid top and bottom config baseline before abnormal options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1000', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1000 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_3', 'SafeAreaInsetAbnormal_3');
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a9Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1000] a9 host height: ' + heightVp);
      expect(Math.abs(heightVp - 67) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1000 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1100
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1100
     * @tc.desc   test safeAreaInset with number parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1100', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1100 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_3', 'SafeAreaInsetAbnormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a9Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1100] a9 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1200
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1200
     * @tc.desc   test safeAreaInset with string parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1200', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1200 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_3', 'SafeAreaInsetAbnormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a9Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1200] a9 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1300
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1300
     * @tc.desc   test safeAreaInset with array parameter resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1300', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1300 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_3', 'SafeAreaInsetAbnormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a9Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1300] a9 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1400
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1400
     * @tc.desc   test safeAreaInset with object without valid edges resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1400', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1400 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_3', 'SafeAreaInsetAbnormal_3');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a9Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1400] a9 host height: ' + heightVp);
      expect(Math.abs(heightVp - 40) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1500
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1500
     * @tc.desc   test valid top and bottom baseline before abnormal bottom config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1500', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1500 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_4', 'SafeAreaInsetAbnormal_4');
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a10Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1500] a10 host height: ' + heightVp);
      expect(Math.abs(heightVp - 67) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1600
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1600
     * @tc.desc   test illegal content in bottom edge clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1600', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1600 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_4', 'SafeAreaInsetAbnormal_4');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a10Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1600] a10 host height: ' + heightVp);
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1600 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1700
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1700
     * @tc.desc   test null bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1700', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1700 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_4', 'SafeAreaInsetAbnormal_4');
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
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a10Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1700] a10 host height: ' + heightVp);
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1700 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Abnormal_1800
     * @tc.number SUB_ACE_SAFEAREAINSET_Abnormal_1800
     * @tc.desc   test undefined bottom edge config clears bottom edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Abnormal_1800', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1800 START');
      await goToPage('MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal_4', 'SafeAreaInsetAbnormal_4');
      let eventData: events_emitter.EventData = {
        data: {}
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60313,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.emit(innerEvent, eventData);
      await CommonFunc.sleep(1000);
      let hostRect = getRectInfo('SafeAreaInsetAbnormal_a10Host');
      let heightVp = px2vp(hostRect.bottom - hostRect.top);
      console.info('[SUB_ACE_SAFEAREAINSET_Abnormal_1800] a10 host height: ' + heightVp);
      expect(Math.abs(heightVp - 52) <= 1).assertTrue();
      console.info('SUB_ACE_SAFEAREAINSET_Abnormal_1800 END');
      done();
    });
  })
}
