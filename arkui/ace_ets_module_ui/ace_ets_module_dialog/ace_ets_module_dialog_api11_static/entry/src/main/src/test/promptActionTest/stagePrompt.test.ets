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

export default function stagePromptTest() {
  describe('stagePromptTest', () => {
    
    beforeAll(() => {
      console.info("stagePromptTest beforeAll start")
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      console.info("stagePromptTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/stagePrompt',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get stagePrompt state pages: " + JSON.stringify(pages));
        if (!("stagePrompt" == pages.name)) {
          console.info("get stagePrompt state pages.name: " + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push stagePrompt page error: " + err);
      }

    });
    afterEach(() => {
      
      
      
    })
    afterAll(() => {
      
      
    })

    /*
         * @tc.number   testPromptActionShowToast001_static
         * @tc.name     testPromptActionShowToast001_static
         * @tc.desc     testPromptActionShowToast001_static
         * @tc.level    Level.LEVEL2
         */
    it('testPromptActionShowToast001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testPromptActionShowToast001_static START');
      try {
        let innerEventOne: events_emitter.InnerEvent = {
          eventId: 60220,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testPromptActionShowToast001_static get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as Record<string, RecordData>)?.["STATUS"]).assertEqual(true);
          done();
        }
        try {
          events_emitter.on(innerEventOne, callback1);
        } catch (err) {
          console.info("testPromptActionShowToast001_static on events_emitter err : " + JSON.stringify(err));
        }
        console.info("onSelect_001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showToastText', 10, "")));
        console.info('testPromptActionShowToast001_static END ');
      } catch (err) {
        expect().assertFail()
        console.info('testPromptActionShowToast001_static ERR  ' + JSON.stringify(err));
      }
      done();
    });


    /*
         * @tc.number   testPromptActionShowToast002_static
         * @tc.name     testPromptActionShowToast002_static
         * @tc.desc     testPromptActionShowToast002_static
         * @tc.level    Level.LEVEL2
         */
    it('testPromptActionShowToast002_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testPromptActionShowToast002_static START');
      try {
        let innerEventTwo: events_emitter.InnerEvent = {
          eventId: 60221,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testPromptActionShowToast002_static get event state result is: " + JSON.stringify(eventData));
          
          done();
        }
        try {
          events_emitter.on(innerEventTwo, callback1);
        } catch (err) {
          console.info("testPromptActionShowToast002_static on events_emitter err : " + JSON.stringify(err));
        }
        console.info("onSelect_001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
        console.info('testPromptActionShowToast002_static END ');
      } catch (err) {
        expect().assertFail()
        console.info('testPromptActionShowToast002_static ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
         * @tc.number   testPromptActionShowToast003_static
         * @tc.name     testPromptActionShowToast003_static
         * @tc.desc     testPromptActionShowToast003_static
         * @tc.level    Level.LEVEL2
         */
    it('testPromptActionShowToast003_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testPromptActionShowToast003_static START');
      try {
        let innerEventThree: events_emitter.InnerEvent = {
          eventId: 60222,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testPromptActionShowToast003_static get event state result is: " + JSON.stringify(eventData));
          
          done();
        }
        try {
          events_emitter.on(innerEventThree, callback1);
        } catch (err) {
          console.info("testPromptActionShowToast003_static on events_emitter err : " + JSON.stringify(err));
        }
        console.info("onSelect_001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
        console.info('testPromptActionShowToast003_static END ');
      } catch (err) {
        expect().assertFail()
        console.info('testPromptActionShowToast003_static ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
         * @tc.number   testPromptActionShowToast004_static
         * @tc.name     testPromptActionShowToast004_static
         * @tc.desc     testPromptActionShowToast004_static
         * @tc.level    Level.LEVEL2
         */
    it('testPromptActionShowToast004_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testPromptActionShowToast004_static START');
      try {
        let innerEventFour: events_emitter.InnerEvent = {
          eventId: 60223,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testPromptActionShowToast004_static get event state result is: " + JSON.stringify(eventData));
          
          done();
        }
        try {
          events_emitter.on(innerEventFour, callback1);
        } catch (err) {
          console.info("testPromptActionShowToast004_static on events_emitter err : " + JSON.stringify(err));
        }
        console.info("onSelect_001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
        console.info('testPromptActionShowToast004_static END ');
      } catch (err) {
        expect().assertFail()
        console.info('testPromptActionShowToast004_static ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /*
         * @tc.number   testPromptActionShowToast005_static
         * @tc.name     testPromptActionShowToast005_static
         * @tc.desc     testPromptActionShowToast005_static
         * @tc.level    Level.LEVEL2
         */
    it('testPromptActionShowToast005_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testPromptActionShowToast005_static START');
      try {
        let innerEventFive: events_emitter.InnerEvent = {
          eventId: 60224,
          priority: events_emitter.EventPriority.LOW
        }
        let callback1 = (eventData: events_emitter.EventData) => {
          console.info("testPromptActionShowToast005_static get event state result is: " + JSON.stringify(eventData));
          
          done();
        }
        try {
          events_emitter.on(innerEventFive, callback1);
        } catch (err) {
          console.info("testPromptActionShowToast005_static on events_emitter err : " + JSON.stringify(err));
        }
        console.info("onSelect_001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('showDialogText', 10, "")));
        console.info('testPromptActionShowToast005_static END ');
      } catch (err) {
        expect().assertFail()
        console.info('testPromptActionShowToast005_static  ERR  ' + JSON.stringify(err));
      }
      done();
    });
  })
}