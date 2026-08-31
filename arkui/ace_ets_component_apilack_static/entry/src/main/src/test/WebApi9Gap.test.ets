'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { $r, Color } from '@ohos.arkui.component'
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
import { RecordData } from '@ohos.base';

let emitKey = "emitUserAgent";

export default function webApi9GapJsunit(): void {
  describe('ActsAceWebApi9GapTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webapi9',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get webapi9 state success " + JSON.stringify(pages));
        if (!("webapi9" == pages.name)) {
          console.info("get webapi9 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push webapi9 page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("webapi9 beforeEach start");
    })
    afterEach(async (): Promise<void> => {
      console.info("webapi9 afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          } as Record<String,RecordData>
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
    })

    /**
     * @tc.number   SUB_WEB_PUTACCEPTCOOKIEENABLEDAPI9_STATIC_0100
     * @tc.name     testPutAcceptCookieEnabledApi9_static_001
     * @tc.desc     test putAcceptCookieEnabled with accept null, expect 401 error
     * @tc.level    Level.LEVEL3
     */
    it('testPutAcceptCookieEnabledApi9_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          emitKey = "emitPutAcceptCookieEnabledApi9Null";
          Utils.emitEvent(emitKey, 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testPutAcceptCookieEnabledApi9_static_001", 401, 835, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('webcomponentapi9', 10, '');
        } catch (error) {
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_WEB_PUTACCEPTCOOKIEENABLEDAPI9_STATIC_0200
     * @tc.name     testPutAcceptCookieEnabledApi9_static_002
     * @tc.desc     test putAcceptCookieEnabled with accept undefined, expect 401 error
     * @tc.level    Level.LEVEL3
     */
    it('testPutAcceptCookieEnabledApi9_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          emitKey = "emitPutAcceptCookieEnabledApi9Undefined";
          Utils.emitEvent(emitKey, 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testPutAcceptCookieEnabledApi9_static_002", 401, 836, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('webcomponentapi9', 10, '');
        } catch (error) {
          expect().assertFail();
        }
      })
  })
}
