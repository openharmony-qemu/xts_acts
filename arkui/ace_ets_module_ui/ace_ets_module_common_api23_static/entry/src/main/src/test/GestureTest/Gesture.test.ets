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

const SLEEP_TIME = 1000;

export default function GestureTest() {
  describe('GestureTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('GestureTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.common.api23.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('GestureTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Gesture/Gesture',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('GestureTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'Gesture') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('GestureTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('GestureTest after each called');
    });

    /**
     * @tc.number GestureTest_001
     * @tc.name gestureTypeBoxSelect
     * @tc.desc Verify GestureType BOX_SELECT_GESTURE enum value=8 via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gestureTypeBoxSelect', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: gestureTypeBoxSelect START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('gestureTypeBoxSelectCase');
        console.info('GestureTest gestureTypeBoxSelectCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('boxSelectGestureValue=8')).assertEqual(true);

        console.info('GestureTest execute: gestureTypeBoxSelect END');
        done();
      } catch (error) {
        console.error('GestureTest execute: gestureTypeBoxSelect error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number GestureTest_002
     * @tc.name gestureTypeWebScroll
     * @tc.desc Verify GestureType WEB_SCROLL_GESTURE enum value=9 via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gestureTypeWebScroll', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: gestureTypeWebScroll START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('gestureTypeWebScrollCase');
        console.info('GestureTest gestureTypeWebScrollCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('webScrollGestureValue=9')).assertEqual(true);

        console.info('GestureTest execute: gestureTypeWebScroll END');
        done();
      } catch (error) {
        console.error('GestureTest execute: gestureTypeWebScroll error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number GestureTest_003
     * @tc.name gestureTypeTextFieldSelect
     * @tc.desc Verify GestureType TEXT_FIELD_SELECT_GESTURE enum value=10 via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gestureTypeTextFieldSelect', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: gestureTypeTextFieldSelect START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('gestureTypeTextFieldSelectCase');
        console.info('GestureTest gestureTypeTextFieldSelectCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('textFieldSelectGestureValue=10')).assertEqual(true);

        console.info('GestureTest execute: gestureTypeTextFieldSelect END');
        done();
      } catch (error) {
        console.error('GestureTest execute: gestureTypeTextFieldSelect error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number GestureTest_004
     * @tc.name gestureTypeContextMenuHover
     * @tc.desc Verify GestureType CONTEXT_MENU_HOVER_GESTURE enum value=11 via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gestureTypeContextMenuHover', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: gestureTypeContextMenuHover START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('gestureTypeContextMenuHoverCase');
        console.info('GestureTest gestureTypeContextMenuHoverCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('contextMenuHoverGestureValue=11')).assertEqual(true);

        console.info('GestureTest execute: gestureTypeContextMenuHover END');
        done();
      } catch (error) {
        console.error('GestureTest execute: gestureTypeContextMenuHover error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number GestureTest_005
     * @tc.name tapGestureDistanceThreshold
     * @tc.desc Verify TapGestureHandler distanceThreshold property value via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tapGestureDistanceThreshold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: tapGestureDistanceThreshold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('tapGestureDistanceThresholdCase');
        console.info('GestureTest tapGestureDistanceThresholdCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('distanceThresholdValue=6')).assertEqual(true);

        console.info('GestureTest execute: tapGestureDistanceThreshold END');
        done();
      } catch (error) {
        console.error('GestureTest execute: tapGestureDistanceThreshold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number GestureTest_006
     * @tc.name longPressAllowableMovement
     * @tc.desc Verify LongPressGestureHandler allowableMovement property value via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('longPressAllowableMovement', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: longPressAllowableMovement START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('longPressAllowableMovementCase');
        console.info('GestureTest longPressAllowableMovementCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('allowableMovementValue=8')).assertEqual(true);

        console.info('GestureTest execute: longPressAllowableMovement END');
        done();
      } catch (error) {
        console.error('GestureTest execute: longPressAllowableMovement error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number GestureTest_007
     * @tc.name longPressGetAllowableMovement
     * @tc.desc Verify LongPressRecognizer getAllowableMovement method return value via Inspector and AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('longPressGetAllowableMovement', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GestureTest execute: longPressGetAllowableMovement START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let nodeRaw = inspector.getInspectorByKey('longPressGetAllowableMovementCase');
        console.info('GestureTest longPressGetAllowableMovementCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('GesturePageState') ?? '';
        expect(stateSnapshot.includes('getAllowableMovementValue=10')).assertEqual(true);

        console.info('GestureTest execute: longPressGetAllowableMovement END');
        done();
      } catch (error) {
        console.error('GestureTest execute: longPressGetAllowableMovement error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
