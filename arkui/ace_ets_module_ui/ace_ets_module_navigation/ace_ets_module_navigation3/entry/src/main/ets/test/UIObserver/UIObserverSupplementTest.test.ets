/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import { uiObserver } from '@kit.ArkUI';

export default function UIObserverSupplementTest() {
  describe('UIObserverSupplementTest', () => {

    // ==================== uiObserver namespace APIs ====================

    /**
     * @tc.name   SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100
     * @tc.number SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100
     * @tc.desc   Test uiObserver.on(type:'navDestinationUpdate', callback) registers listener successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100 START');
      try {
        const callback = (info: uiObserver.NavDestinationInfo) => {
          console.info('SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100 callback name: ' + info.name);
        };
        uiObserver.on('navDestinationUpdate', callback);
        console.info('SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100 on success');
        uiObserver.off('navDestinationUpdate', callback);
        expect(true).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_UIObserver_on_navDestinationUpdate_callback_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100
     * @tc.number SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100
     * @tc.desc   Test uiObserver.off(type:'navDestinationUpdate', options:{navigationId}, callback?) with navigationId options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100 START');
      try {
        const callback = (info: uiObserver.NavDestinationInfo) => {
          console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100 callback');
        };
        // on with options
        uiObserver.on('navDestinationUpdate', { navigationId: 'testNavId' }, callback);
        console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100 on with options success');
        // off with options and callback
        uiObserver.off('navDestinationUpdate', { navigationId: 'testNavId' }, callback);
        console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100 off with options and callback success');

        // on again and off without callback (removes all listeners for this options)
        uiObserver.on('navDestinationUpdate', { navigationId: 'testNavId' }, callback);
        uiObserver.off('navDestinationUpdate', { navigationId: 'testNavId' });
        console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100 off with options without callback success');
        expect(true).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_UIObserver_off_navDestinationUpdate_withOptions_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100
     * @tc.number SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100
     * @tc.desc   Test uiObserver.off(type:'navDestinationUpdate', callback?) removes listener with and without callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100 START');
      try {
        const callback = (info: uiObserver.NavDestinationInfo) => {
          console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100 callback');
        };
        // Register then off with callback
        uiObserver.on('navDestinationUpdate', callback);
        uiObserver.off('navDestinationUpdate', callback);
        console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100 off with callback success');

        // Register then off without callback (removes all)
        uiObserver.on('navDestinationUpdate', callback);
        uiObserver.off('navDestinationUpdate');
        console.info('SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100 off without callback success');
        expect(true).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_UIObserver_off_navDestinationUpdate_callback_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100
     * @tc.number SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100
     * @tc.desc   Test uiObserver.off(type:'tabContentUpdate', options, callback?) return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100 START');
      try {
        const callback = (info: uiObserver.TabContentInfo) => {
          console.info('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100 callback, index: ' + info.index);
        };
        const options: uiObserver.ObserverOptions = { id: 'testTabsId' };

        // Register listener with options
        uiObserver.on('tabContentUpdate', options, callback);
        console.info('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100 on with options success');

        // Off with options and callback
        uiObserver.off('tabContentUpdate', options, callback);
        console.info('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100 off with options and callback success');

        // Register again and off without callback
        uiObserver.on('tabContentUpdate', options, callback);
        uiObserver.off('tabContentUpdate', options);
        console.info('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100 off with options without callback success');
        expect(true).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_UIObserver_off_tabContentUpdate_withOptions_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100
     * @tc.number SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100
     * @tc.desc   Test uiObserver.on(type:'tabContentUpdate', callback) registers listener successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100 START');
      try {
        const callback = (info: uiObserver.TabContentInfo) => {
          console.info('SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100 callback, state: ' + info.state);
        };
        // on with callback only (no options)
        uiObserver.on('tabContentUpdate', callback);
        console.info('SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100 on with callback success');

        // off without callback to clean up
        uiObserver.off('tabContentUpdate');
        console.info('SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100 off success');
        expect(true).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_UIObserver_on_tabContentUpdate_callback_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

  });
}
