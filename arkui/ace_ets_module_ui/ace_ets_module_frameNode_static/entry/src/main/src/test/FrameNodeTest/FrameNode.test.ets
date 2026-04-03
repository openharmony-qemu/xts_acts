'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIState, FrameNodeOptions } from 'arkui.FrameNode';

const SLEEP_TIME = 1000;

export default function FrameNodeTest() {
  describe('FrameNodeTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] FrameNodeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.frameNode.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/FrameNode/FrameNodeIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== "FrameNodeIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] FrameNodeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    it('uiStateNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(UIState.NORMAL).assertEqual(0);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiStatePressed', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(UIState.PRESSED).assertEqual(1);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiStateFocused', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(UIState.FOCUSED).assertEqual(2);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiStateDisabled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(UIState.DISABLED).assertEqual(4);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiStateSelected', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(UIState.SELECTED).assertEqual(8);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('frameNodeOptionsConstruct', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let opts: FrameNodeOptions = { supportMultiThread: true };
        expect(opts.supportMultiThread).assertEqual(true);
        let opts2: FrameNodeOptions = { supportMultiThread: false };
        expect(opts2.supportMultiThread).assertEqual(false);
        let opts3: FrameNodeOptions = {};
        expect(opts3.supportMultiThread).assertEqual(undefined);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('frameNodePageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('frameNodeRoot'));
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });
  });
}
