/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { beforeAll, afterEach, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium-dynamic';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 130800;
let emitKey = '';

export default function ActsWebTextFragment() {
  describe('ActsWebTextFragmentTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebTextFragment',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('WebTextFragment' == pages.name)) {
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error('push WebTextFragment page error: ' + err);
      }
      await waitForComponent('webTextFragmentButton');
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    afterEach(async (done: Function) => {
      try {
        let backData: events_emitter.EventData = {
          data: {
            'ACTION': emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: EVENT_ID_SET_SUITE_KEY,
          priority: events_emitter.EventPriority.LOW
        };
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info('emit emitKey err: ' + JSON.stringify(err));
      }
      done();
    })

    /**
     * @tc.name   testShouldOfferLinkToText
     * @tc.number SUB_WEB_TEXTFRAGMENT_SHOULDOFFER_0100
     * @tc.desc   shouldOfferLinkToText in onContextMenuShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShouldOfferLinkToText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitShouldOfferLinkToText';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent('testShouldOfferLinkToText', true, 130810, done);
        sendEventByKey('webTextFragmentButton', 10, '');
      })

    /**
     * @tc.name   testGetTextFragmentGeneratedLink
     * @tc.number SUB_WEB_TEXTFRAGMENT_GENERATEDLINK_0200
     * @tc.desc   getTextFragmentGeneratedLink in onContextMenuShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextFragmentGeneratedLink', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitGetTextFragmentGeneratedLink';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent('testGetTextFragmentGeneratedLink', true, 130820, done);
        sendEventByKey('webTextFragmentButton', 10, '');
      })

    /**
     * @tc.name   testIsOverTextFragment
     * @tc.number SUB_WEB_TEXTFRAGMENT_ISOVER_0300
     * @tc.desc   isOverTextFragment in onContextMenuShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsOverTextFragment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitIsOverTextFragment';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent('testIsOverTextFragment', true, 130830, done);
        sendEventByKey('webTextFragmentButton', 10, '');
      })

    /**
     * @tc.name   testCopyLinkToTextMenu
     * @tc.number SUB_WEB_TEXTFRAGMENT_COPYLINK_0400
     * @tc.desc   copyLinkToTextMenu in onContextMenuShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCopyLinkToTextMenu', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitCopyLinkToTextMenu';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent('testCopyLinkToTextMenu', true, 130840, done);
        sendEventByKey('webTextFragmentButton', 10, '');
      })

    /**
     * @tc.name   testRemoveFragments
     * @tc.number SUB_WEB_TEXTFRAGMENT_REMOVE_0500
     * @tc.desc   removeFragments in onContextMenuShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveFragments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitRemoveFragments';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent('testRemoveFragments', true, 130850, done);
        sendEventByKey('webTextFragmentButton', 10, '');
      })

    /**
     * @tc.name   testOnContextMenuUpdate
     * @tc.number SUB_WEB_TEXTFRAGMENT_MENUUPDATE_0600
     * @tc.desc   onContextMenuUpdate callback registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnContextMenuUpdate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitOnContextMenuUpdate';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        Utils.registerEvent('testOnContextMenuUpdate', true, 130860, done);
        sendEventByKey('webTextFragmentButton', 10, '');
      })
  })
}
