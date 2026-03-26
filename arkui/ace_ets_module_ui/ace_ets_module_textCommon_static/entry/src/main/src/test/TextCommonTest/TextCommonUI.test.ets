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
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function TextCommonUITest() {
  describe('TextCommonUITest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextCommonUITest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextCommonUITest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextCommon/TextCommonIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('TextCommonUITest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'TextCommonIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('TextCommonUITest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info('TextCommonUITest after each called');
    });

    /**
     * @tc.number TextCommonUITest_001
     * @tc.name textCommonDragPreviewBlue
     * @tc.desc Test SelectedDragPreviewStyle.color applied to Text component (Color.Blue)
     */
    it('textCommonDragPreviewBlue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextCommonUITest execute: textCommonDragPreviewBlue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textCommonDragPreviewBlue'));
        expect(node !== null).assertTrue();
        console.info('TextCommonUITest execute: textCommonDragPreviewBlue END');
        done();
      } catch (error) {
        console.error('TextCommonUITest execute: textCommonDragPreviewBlue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextCommonUITest_002
     * @tc.name textCommonDragPreviewUndef
     * @tc.desc Test SelectedDragPreviewStyle with undefined (resets to default)
     */
    it('textCommonDragPreviewUndef', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextCommonUITest execute: textCommonDragPreviewUndef START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textCommonDragPreviewUndef'));
        expect(node !== null).assertTrue();
        console.info('TextCommonUITest execute: textCommonDragPreviewUndef END');
        done();
      } catch (error) {
        console.error('TextCommonUITest execute: textCommonDragPreviewUndef error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextCommonUITest_003
     * @tc.name textCommonLineSpacingTrue
     * @tc.desc Test LineSpacingOptions.onlyBetweenLines=true applied to Text component
     */
    it('textCommonLineSpacingTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextCommonUITest execute: textCommonLineSpacingTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textCommonLineSpacingTrue'));
        expect(node !== null).assertTrue();
        let attrs = node.getElement('$attrs');
        let lineSpacing = attrs.getString('lineSpacing');
        console.info('TextCommonUITest: textCommonLineSpacingTrue lineSpacing = ' + lineSpacing);
        expect(lineSpacing !== null && lineSpacing.length > 0).assertTrue();
        console.info('TextCommonUITest execute: textCommonLineSpacingTrue END');
        done();
      } catch (error) {
        console.error('TextCommonUITest execute: textCommonLineSpacingTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextCommonUITest_004
     * @tc.name textCommonLineSpacingFalse
     * @tc.desc Test LineSpacingOptions.onlyBetweenLines=false applied to Text component
     */
    it('textCommonLineSpacingFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextCommonUITest execute: textCommonLineSpacingFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textCommonLineSpacingFalse'));
        expect(node !== null).assertTrue();
        let attrs = node.getElement('$attrs');
        let lineSpacing = attrs.getString('lineSpacing');
        console.info('TextCommonUITest: textCommonLineSpacingFalse lineSpacing = ' + lineSpacing);
        expect(lineSpacing !== null && lineSpacing.length > 0).assertTrue();
        console.info('TextCommonUITest execute: textCommonLineSpacingFalse END');
        done();
      } catch (error) {
        console.error('TextCommonUITest execute: textCommonLineSpacingFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextCommonUITest_005
     * @tc.name textCommonMaxLinesClip
     * @tc.desc Test MaxLinesOptions.overflowMode=MaxLinesMode.CLIP applied to TextArea
     */
    it('textCommonMaxLinesClip', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextCommonUITest execute: textCommonMaxLinesClip START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textCommonMaxLinesClip'));
        expect(node !== null).assertTrue();
        let attrs = node.getElement('$attrs');
        let maxLines = attrs.getString('maxLines');
        console.info('TextCommonUITest: textCommonMaxLinesClip maxLines = ' + maxLines);
        expect(maxLines !== null && maxLines.length > 0).assertTrue();
        console.info('TextCommonUITest execute: textCommonMaxLinesClip END');
        done();
      } catch (error) {
        console.error('TextCommonUITest execute: textCommonMaxLinesClip error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextCommonUITest_006
     * @tc.name textCommonMaxLinesScroll
     * @tc.desc Test MaxLinesOptions.overflowMode=MaxLinesMode.SCROLL applied to TextArea
     */
    it('textCommonMaxLinesScroll', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextCommonUITest execute: textCommonMaxLinesScroll START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textCommonMaxLinesScroll'));
        expect(node !== null).assertTrue();
        let attrs = node.getElement('$attrs');
        let maxLines = attrs.getString('maxLines');
        console.info('TextCommonUITest: textCommonMaxLinesScroll maxLines = ' + maxLines);
        expect(maxLines !== null && maxLines.length > 0).assertTrue();
        console.info('TextCommonUITest execute: textCommonMaxLinesScroll END');
        done();
      } catch (error) {
        console.error('TextCommonUITest execute: textCommonMaxLinesScroll error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
