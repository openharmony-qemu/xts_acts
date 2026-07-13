'use static';
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
export default function refreshOffsetUndefined() {
  describe('refreshOffsetUndefined', () => {
    beforeAll(async (): Promise<void> => {
      console.info('refreshOffsetUndefined beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.refresh.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('refreshOffsetUndefined beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshOffsetUndefined',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('refreshOffsetUndefined state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'refreshOffsetUndefined') {
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error('refreshOffsetUndefined replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('refreshOffsetUndefined after each called');
    });

    /**
     * @tc.name   refreshOffsetUndefined_static_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_STATIC_TEST_0100
     * @tc.desc   Set refreshOffset for the refresh to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshOffsetUndefined_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[refreshOffsetUndefined_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('refresh_offset_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let defStrJson = inspector.getInspectorByKey('refresh_offset_noSet');
      let defObj = JSON.parseJsonElement(defStrJson);
      console.info("[refreshOffsetUndefined_static_0100] refreshOffset: " +
        JSON.stringify(obj.getElement('$attrs').getString('refreshOffset')));
      console.info("[refreshOffsetUndefined_static_0100] defObj refreshOffset: " +
        JSON.stringify(defObj.getElement('$attrs').getString('refreshOffset')));
      expect(obj.getElement('$attrs').getString('refreshOffset')).assertEqual(defObj.getElement('$attrs').getString('refreshOffset'));
      console.info('[refreshOffsetUndefined_static_0100] END');
      done();
    });

  })
}