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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE = 'MainAbility/pages/segmentButtonEnableStateAnimation/segmentButtonEnableStateAnimation';
const TITLE_ID = 'segV1_title';
const SLEEP_TIME = 500;
const SUITE = 'SegmentButtonEnableStateAnimationTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function SegmentButtonEnableStateAnimationTest() {
  describe('SegmentButtonEnableStateAnimationTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.dialog.button.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('segV1_mounted');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(600);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }

      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');

      AppStorage.delete('segV1_mounted');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100
     * @tc.name SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100
     * @tc.desc Test segmentButtonEnableStateAnimation page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'segmentV1_pageLoads START');
      try {
        const n = await Driver.create().findComponent(ON.id(TITLE_ID));
        expect(n !== undefined).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200
     * @tc.name SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200
     * @tc.desc Test aboutToAppear: AppStorage segV1_mounted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'segmentV1_mounted_flag START');
      try {
        expect(AppStorage.get<boolean>('segV1_mounted')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300
     * @tc.name SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300
     * @tc.desc Test inspector.getInspectorByKey: node segV1_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_segV1_body START');
      try {
        const node = JSON.parseJsonElement(inspector.getInspectorByKey('segV1_body'));
        expect(node != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400
     * @tc.name SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400
     * @tc.desc Test inspector.getInspectorByKey: node segV1_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_segV1_title START');
      try {
        const node = JSON.parseJsonElement(inspector.getInspectorByKey('segV1_title'));
        expect(node != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_driver_find_segment_tab_text_t1_0500
     * @tc.name SUB_arkui_segment_button_enable_state_anim_driver_find_segment_tab_text_t1_0500
     * @tc.desc Test Driver.findComponent: segment tab text T1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_driver_find_segment_tab_text_t1_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'driver_find_segment_tab_text_T1 START');
      try {
        const driver = Driver.create();
        let t = await driver.findComponent(ON.text('T1', MatchPattern.EQUALS));
        if (!t) {
          t = await driver.findComponent(ON.text('T1', MatchPattern.CONTAINS));
        }
        expect(!!t).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
