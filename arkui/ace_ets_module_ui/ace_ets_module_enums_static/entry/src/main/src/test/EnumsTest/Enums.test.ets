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
import { DialogDisplayMode, FocusWrapMode, EventQueryType, CompetitionStrategy, SystemProperties } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function EnumsTest() {
  describe('EnumsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.enums.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Enums/EnumsIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] EnumsTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "EnumsIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] EnumsTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] EnumsTest afterEach end');
    });

    /**
     * @tc.number EnumsTest_001
     * @tc.name dialogDisplayModeScreenBased
     * @tc.desc Test DialogDisplayMode.SCREEN_BASED enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogDisplayModeScreenBased', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: dialogDisplayModeScreenBased START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DialogDisplayMode.SCREEN_BASED).assertEqual(0);
        console.info('[ARKUI_NEW] EnumsTest execute: dialogDisplayModeScreenBased END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: dialogDisplayModeScreenBased error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_002
     * @tc.name dialogDisplayModeWindowBased
     * @tc.desc Test DialogDisplayMode.WINDOW_BASED enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dialogDisplayModeWindowBased', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: dialogDisplayModeWindowBased START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DialogDisplayMode.WINDOW_BASED).assertEqual(1);
        console.info('[ARKUI_NEW] EnumsTest execute: dialogDisplayModeWindowBased END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: dialogDisplayModeWindowBased error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_003
     * @tc.name focusWrapModeDefault
     * @tc.desc Test FocusWrapMode.DEFAULT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('focusWrapModeDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: focusWrapModeDefault START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(FocusWrapMode.DEFAULT).assertEqual(0);
        console.info('[ARKUI_NEW] EnumsTest execute: focusWrapModeDefault END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: focusWrapModeDefault error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_004
     * @tc.name focusWrapModeWrapWithArrow
     * @tc.desc Test FocusWrapMode.WRAP_WITH_ARROW enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('focusWrapModeWrapWithArrow', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: focusWrapModeWrapWithArrow START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(FocusWrapMode.WRAP_WITH_ARROW).assertEqual(1);
        console.info('[ARKUI_NEW] EnumsTest execute: focusWrapModeWrapWithArrow END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: focusWrapModeWrapWithArrow error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_005
     * @tc.name eventQueryTypeOnClick
     * @tc.desc Test EventQueryType.ON_CLICK enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('eventQueryTypeOnClick', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: eventQueryTypeOnClick START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(EventQueryType.ON_CLICK).assertEqual(0);
        console.info('[ARKUI_NEW] EnumsTest execute: eventQueryTypeOnClick END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: eventQueryTypeOnClick error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_006
     * @tc.name competitionStrategyDefault
     * @tc.desc Test CompetitionStrategy.DEFAULT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('competitionStrategyDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: competitionStrategyDefault START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(CompetitionStrategy.DEFAULT).assertEqual(0);
        console.info('[ARKUI_NEW] EnumsTest execute: competitionStrategyDefault END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: competitionStrategyDefault error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_007
     * @tc.name competitionStrategyCompetition
     * @tc.desc Test CompetitionStrategy.COMPETITION enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('competitionStrategyCompetition', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: competitionStrategyCompetition START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(CompetitionStrategy.COMPETITION).assertEqual(1);
        console.info('[ARKUI_NEW] EnumsTest execute: competitionStrategyCompetition END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: competitionStrategyCompetition error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_008
     * @tc.name systemPropertiesBreakPoint
     * @tc.desc Test SystemProperties.BREAK_POINT string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('systemPropertiesBreakPoint', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesBreakPoint START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(SystemProperties.BREAK_POINT).assertEqual('system.arkui.breakpoint');
        console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesBreakPoint END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: systemPropertiesBreakPoint error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_009
     * @tc.name systemPropertiesWindowAvoidArea
     * @tc.desc Test SystemProperties.WINDOW_AVOID_AREA string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('systemPropertiesWindowAvoidArea', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowAvoidArea START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(SystemProperties.WINDOW_AVOID_AREA).assertEqual('system.window.avoidarea');
        console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowAvoidArea END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowAvoidArea error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_010
     * @tc.name systemPropertiesWindowAvoidAreaPx
     * @tc.desc Test SystemProperties.WINDOW_AVOID_AREA_PX string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('systemPropertiesWindowAvoidAreaPx', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowAvoidAreaPx START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(SystemProperties.WINDOW_AVOID_AREA_PX).assertEqual('system.window.avoidarea.px');
        console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowAvoidAreaPx END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowAvoidAreaPx error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_011
     * @tc.name systemPropertiesWindowSize
     * @tc.desc Test SystemProperties.WINDOW_SIZE string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('systemPropertiesWindowSize', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowSize START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(SystemProperties.WINDOW_SIZE).assertEqual('system.window.size');
        console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowSize END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowSize error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_012
     * @tc.name systemPropertiesWindowSizePx
     * @tc.desc Test SystemProperties.WINDOW_SIZE_PX string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('systemPropertiesWindowSizePx', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowSizePx START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(SystemProperties.WINDOW_SIZE_PX).assertEqual('system.window.size.px');
        console.info('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowSizePx END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] EnumsTest execute: systemPropertiesWindowSizePx error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number EnumsTest_013
     * @tc.name enumsListRendered
     * @tc.desc Verify List component in Enums page renders with enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enumsListRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: enumsListRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('enumsList');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] enumsListRendered error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number EnumsTest_014
     * @tc.name enumsDividerRendered
     * @tc.desc Verify Divider component in Enums page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enumsDividerRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: enumsDividerRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('enumsDivider');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] enumsDividerRendered error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number EnumsTest_015
     * @tc.name enumValuesFromPage
     * @tc.desc Verify enum values stored by page in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enumValuesFromPage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] EnumsTest execute: enumValuesFromPage START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('enumValues');
        console.info('[ARKUI_NEW] enumValues = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val!.indexOf('DDM_SCREEN=0') >= 0).assertTrue();
        expect(val!.indexOf('DDM_WINDOW=1') >= 0).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] enumValuesFromPage error:' + error); expect().assertFail(); done(); }
    });
  });
}
