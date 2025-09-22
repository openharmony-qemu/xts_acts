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


import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { Position } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function bindPopupOffsetTest() {
  describe('bindPopupOffsetTest', () => {
    
    beforeAll(() => {
      console.info("bindPopupOffsetTest beforeAll start")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      console.info("bindPopupOffsetTest beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/bindPopupOffset',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get bindPopupOffset state pages: " + JSON.stringify(pages));
        if (!("bindPopupOffset" == pages.name)) {
          console.info("get bindPopupOffset state pages.name: " + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push bindPopupOffset page error: " + err);
      }

    });
    afterEach(() => {
      
      
      
    })
    afterAll(() => {
      
      
    })


    /*
         * @tc.number   bindPopupOffsetTest_static_0100
         * @tc.name     bindPopupOffsetTest_static_0100
         * @tc.desc     bindPopupOffsetTest_static_0100
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0100 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12065,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: 10, y: 10
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0100 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('PopupOptions', 10, "")
        console.info("bindPopupOffsetTest_static_0100 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PopupOptions', 10, "")));
        console.info('bindPopupOffsetTest_static_0100 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_0200
         * @tc.name     bindPopupOffsetTest_static_0200
         * @tc.desc     bindPopupOffsetTest_static_0200
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0200 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12066,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0200 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: 10, y: 10
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0200 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('customPopup', 10, "")
        console.info("bindPopupOffsetTest_static_0200 click result is: " +
        JSON.stringify(inspector.sendEventByKey('customPopup', 10, "")));
        console.info('bindPopupOffsetTest_static_0200 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0200 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_0300
         * @tc.name     bindPopupOffsetTest_static_0300
         * @tc.desc     bindPopupOffsetTest_static_0300
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0300 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12067,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0300 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: 0, y: 0
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0300 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('PopupOptions00', 10, "")
        console.info("bindPopupOffsetTest_static_0300 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PopupOptions00', 10, "")));
        console.info('bindPopupOffsetTest_static_0300 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0300 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_0400
         * @tc.name     bindPopupOffsetTest_static_0400
         * @tc.desc     bindPopupOffsetTest_static_0400
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0400 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12068,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0400 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: 0, y: 50
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0400 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('PopupOptions050', 10, "")
        console.info("bindPopupOffsetTest_static_0400 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PopupOptions050', 10, "")));
        console.info('bindPopupOffsetTest_static_0400 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0400 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_0500
         * @tc.name     bindPopupOffsetTest_static_0500
         * @tc.desc     bindPopupOffsetTest_static_0500
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0500 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12069,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0500 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual(null);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0500 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('PopupOptionsnull', 10, "")
        console.info("bindPopupOffsetTest_static_0500 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PopupOptionsnull', 10, "")));
        console.info('bindPopupOffsetTest_static_0500 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0500 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
         * @tc.number   bindPopupOffsetTest_static_0600
         * @tc.name     bindPopupOffsetTest_static_0600
         * @tc.desc     bindPopupOffsetTest_static_0600
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0600 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12070,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0600 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: -10, y: -10
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0600 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('PopupOptions10', 10, "")
        console.info("bindPopupOffsetTest_static_0600 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PopupOptions10', 10, "")));
        console.info('bindPopupOffsetTest_static_0600 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0600 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_0700
         * @tc.name     bindPopupOffsetTest_static_0700
         * @tc.desc     bindPopupOffsetTest_static_0700
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0700 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12071,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0700 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: -10, y: -10
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0700 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('customPopup10', 10, "")
        console.info("bindPopupOffsetTest_static_0700 click result is: " +
        JSON.stringify(inspector.sendEventByKey('customPopup10', 10, "")));
        console.info('bindPopupOffsetTest_static_0700 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0700 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_0800
         * @tc.name     bindPopupOffsetTest_static_0800
         * @tc.desc     bindPopupOffsetTest_static_0800
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0800 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12072,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0800 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: 0, y: 0
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0800 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('customPopup00', 10, "")
        console.info("bindPopupOffsetTest_static_0800 click result is: " +
        JSON.stringify(inspector.sendEventByKey('customPopup00', 10, "")));
        console.info('bindPopupOffsetTest_static_0800 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0800 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bbindPopupOffsetTest_static_0900
         * @tc.name     bbindPopupOffsetTest_static_0900
         * @tc.desc     bbindPopupOffsetTest_static_0900
         * @tc.level    Level.LEVEL2
         */
    it('bbindPopupOffsetTest_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_0900 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12073,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_0900 get state result is: " + JSON.stringify(indexEvent));
          expect(((indexEvent.data) as Record<string, RecordData>)?.['offset']).assertEqual({
            x: 0, y: 50
          } as Position);
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_0900 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('customPopup050', 10, "")
        console.info("bindPopupOffsetTest_static_0900 click result is: " +
        JSON.stringify(inspector.sendEventByKey('customPopup050', 10, "")));
        console.info('bindPopupOffsetTest_static_0900 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_0900 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   bindPopupOffsetTest_static_1000
         * @tc.name     bindPopupOffsetTest_static_1000
         * @tc.desc     bindPopupOffsetTest_static_1000
         * @tc.level    Level.LEVEL2
         */
    it('bindPopupOffsetTest_static_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('bindPopupOffsetTest_static_1000 START');
      try {
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 12074,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (indexEvent: events_emitter.EventData) => {
          console.info("bindPopupOffsetTest_static_1000 get state result is: " + JSON.stringify(indexEvent));
          
          done();
        }
        try {
          events_emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("bindPopupOffsetTest_static_1000 on events_emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('PopupOptionsnull', 10, "")
        console.info("bindPopupOffsetTest_static_1000 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PopupOptionsnull', 10, "")));
        console.info('bindPopupOffsetTest_static_1000 END ');
      } catch (err) {
        expect().assertFail()
        console.info('bindPopupOffsetTest_static_1000 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}