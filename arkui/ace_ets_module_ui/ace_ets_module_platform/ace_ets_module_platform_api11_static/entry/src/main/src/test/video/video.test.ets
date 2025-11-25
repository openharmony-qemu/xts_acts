'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
interface EventMessage {
  result: string
}
export default function videoOnFullscreenChangeJsunit() {
  describe('videoOnFullscreenChangeTest', () => {
    beforeAll(() => {
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/video/videoApI",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get video state success " + JSON.stringify(pages));
        if (!("videoApI" == pages.name)) {
          console.info("get video state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push video page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("videoOnFullscreenChange after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testvideoOnFullscreenChangeStatic0001
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0001
     */
    it('testvideoOnFullscreenChangeStatic0001', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("600.00vp");
      console.info("[testvideoOnFullscreenChange0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testvideoOnFullscreenChangeStatic0002
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0002
     */
    it('testvideoOnFullscreenChangeStatic0002', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("400.00vp");
      console.info("[testvideoOnFullscreenChange0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testvideoOnFullscreenChangeStatic0003
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0003
     */
    it('testvideoOnFullscreenChangeStatic0003', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0003] component fontSize strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0003] fontSize value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testvideoOnFullscreenChangeStatic0004
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0004
     */
    it('testvideoOnFullscreenChangeStatic0004', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0004] component opacity strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testvideoOnFullscreenChange0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testvideoOnFullscreenChangeStatic0005
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0005
     */
    it('testvideoOnFullscreenChangeStatic0005', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0005] component align strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
      console.info("[testvideoOnFullscreenChange0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testvideoOnFullscreenChangeStatic0006
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0006
     */
    it('testvideoOnFullscreenChangeStatic0006', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0006] component fontColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0006] fontColor value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testvideoOnFullscreenChangeStatic0007
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0007
     */
    it('testvideoOnFullscreenChangeStatic0007', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0007] lineHeight value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testvideoOnFullscreenChangeStatic0009
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0009
     */
    it('testvideoOnFullscreenChangeStatic0009', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0009] component padding strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("0.00vp");
      console.info("[testvideoOnFullscreenChange0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testvideoOnFullscreenChangeStatic0010
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0010
     */
    it('testvideoOnFullscreenChangeStatic0010', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0010] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Video');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign')).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0010] textAlign value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));

    });

    it('testvideoOnFullscreenChangeStatic0011', Level.LEVEL1, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0011 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60227,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (eventData: events_emitter.EventData) => {
        try {
          console.info("callback success");
          console.info("eventData.data.result result is: " + (eventData.data as EventMessage)?.result);
          expect((eventData.data as EventMessage)?.result).assertEqual("success");
          console.info("video_101 end: ");
        } catch (err) {
          console.info("video_101 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(innerEvent, callback);
        await Utils.sleep(500);
        console.info("video_101 click result is: " + JSON.stringify(inspector.sendEventByKey('fullScreen', 10, "")));
        await Utils.sleep(2000);

      } catch (err) {
        console.info("video_101 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
