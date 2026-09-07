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
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';

let emitKey = "emitUserAgent";

export default function webJsunit2(): void {
  describe('ActsAceWebDevTestG2', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/conponentadd/webg',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get webg state success " + JSON.stringify(pages));
        if (!("webg" == pages.name)) {
          console.info("get webg state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push webg page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("webg beforeEach start");
    })
    afterEach(async (): Promise<void> => {
      console.info("webg afterEach start:" + emitKey);
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
     * @tc.number   SUB_WEB_DELETEALLGEOLOCATIONG_STATIC_0100
     * @tc.name     testDeleteAllGeolocationG_static_001
     * @tc.desc     test deleteAllGeolocation with incognito null, expect success
     * @tc.level    Level.LEVEL3
     */
    it('testDeleteAllGeolocationG_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          emitKey = "emitDeleteAllGeolocationGNull";
          Utils.emitEvent(emitKey, 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testDeleteAllGeolocationG_static_001", true, 618, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('webg_webcomponent', 10, '');
        } catch (error) {
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_WEB_DELETEALLGEOLOCATIONG_STATIC_0200
     * @tc.name     testDeleteAllGeolocationG_static_002
     * @tc.desc     test deleteAllGeolocation with incognito undefined, expect success
     * @tc.level    Level.LEVEL3
     */
    it('testDeleteAllGeolocationG_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          emitKey = "emitDeleteAllGeolocationGUndefined";
          Utils.emitEvent(emitKey, 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testDeleteAllGeolocationG_static_002", true, 619, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('webg_webcomponent', 10, '');
        } catch (error) {
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_WEB_DELETEALLDATAG_STATIC_0100
     * @tc.name     testDeleteAllDataG_static_001
     * @tc.desc     test deleteAllData with incognito null, expect success
     * @tc.level    Level.LEVEL3
     */
    it('testDeleteAllDataG_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          emitKey = "emitDeleteAllDataGNull";
          Utils.emitEvent(emitKey, 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testDeleteAllDataG_static_001", true, 620, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('webg_webcomponent', 10, '');
        } catch (error) {
          expect().assertFail();
        }
      })

    /**
     * @tc.number   SUB_WEB_DELETEALLDATAG_STATIC_0200
     * @tc.name     testDeleteAllDataG_static_002
     * @tc.desc     test deleteAllData with incognito undefined, expect success
     * @tc.level    Level.LEVEL3
     */
    it('testDeleteAllDataG_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          emitKey = "emitDeleteAllDataGUndefined";
          Utils.emitEvent(emitKey, 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testDeleteAllDataG_static_002", true, 621, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('webg_webcomponent', 10, '');
        } catch (error) {
          expect().assertFail();
        }
      })
  })
}
