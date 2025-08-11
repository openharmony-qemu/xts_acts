/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { frameTime, sleep } from '../Utils';
import { AlphabetIndexerKeys, alphabetIndexerThemeProperty } from '../../../ets/MainAbility/pages/components/AlphabetIndexerPage';
// import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme';
import { Theme, CustomTheme } from '@ohos.arkui.theme';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function alphabetIndexerThemeTest() {
  const SUITE: string = `AlphabetIndexerThemeTest`;
  let localTheme: Theme | undefined;
  let changeTheme: boolean = false;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe(SUITE, () => {
    beforeAll(() => {
      console.info("AlphabetIndexerPage beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      try {
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/AlphabetIndexerPage`,
        }
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== `AlphabetIndexerPage`) {
          await routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<Theme>(alphabetIndexerThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string,string>|undefined>(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });

    beforeEach(() => {
      if (!changeTheme) return;
      // if ((AppStorage.get<Theme>(alphabetIndexerThemeProperty) as Theme)?.colors?.fontEmphasize
      //   == redCustomTheme?.colors?.fontEmphasize) {
        // AppStorage.setOrCreate<Theme>(alphabetIndexerThemeProperty, greenCustomTheme);
      // } else {
        // AppStorage.setOrCreate<Theme>(alphabetIndexerThemeProperty, redCustomTheme);
      // }
      localTheme = AppStorage.get<Theme>(alphabetIndexerThemeProperty) ;
      changeTheme = false;
    })

    afterAll(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : ActsAlphabetIndexerThemeColors_static_0100
     * @tc.name      : ActsAlphabetIndexerThemeColors_static_0100
     * @tc.desc      : Check system colors values of the AlphabetIndexer component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsAlphabetIndexerThemeColors_static_0100`, Level.LEVEL2, () => {
      const CASE: string = `ActsAlphabetIndexerThemeColors_static_0100`;
      console.info(`${SUITE} ${CASE} START`);
      const indexerJSON = inspector.getInspectorByKey(AlphabetIndexerKeys.alphabetIndexerSystem);
      const indexerAttrs = JSON.parseJsonElement(indexerJSON).getElement('$attrs');
      const color = indexerAttrs.getString('color').toString().toUpperCase();
      expect(color).assertEqual(colorValues?.get(`fontSecondary`));
      const selectedColor = indexerAttrs?.getString('selectedColor').toString().toUpperCase();
      expect(selectedColor).assertEqual(colorValues?.get(`fontEmphasize`));
      const popupColor = indexerAttrs?.getString('popupColor').toString().toUpperCase();
      expect(popupColor).assertEqual(colorValues?.get(`fontEmphasize`));
      const popupUnselectedColor = indexerAttrs?.getString('popupUnselectedColor').toString().toUpperCase();
      expect(popupUnselectedColor).assertEqual(colorValues?.get(`fontPrimary`));
      const popupTitleBackground = indexerAttrs?.getString('popupTitleBackground').toString().toUpperCase();
      expect(popupTitleBackground).assertEqual(colorValues?.get(`compBackgroundTertiary`));
      const selectedBackgroundColor = indexerAttrs?.getString('selectedBackgroundColor').toString().toUpperCase();
      expect(selectedBackgroundColor).assertEqual(colorValues?.get(`compEmphasizeSecondary`));
      console.info(`${SUITE} ${CASE} END`);
    })
    /**
     * @tc.number    : ActsAlphabetIndexerThemeColors_static_0200
     * @tc.name      : ActsAlphabetIndexerThemeColors_static_0200
     * @tc.desc      : Check custom colors values of the AlphabetIndexer component
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsAlphabetIndexerThemeColors_static_0200`, Level.LEVEL2, () => {
      const CASE: string = `ActsAlphabetIndexerThemeColors_static_0200`;
      console.info(`${SUITE} ${CASE} START`);
      const indexerJSON = inspector.getInspectorByKey(AlphabetIndexerKeys.alphabetIndexerWithTheme);
      const indexerAttrs = JSON.parseJsonElement(indexerJSON).getElement('$attrs');
      const color = indexerAttrs.getString('color').toString().toUpperCase();
      expect(color).assertEqual(localTheme?.colors?.fontSecondary);
      const selectedColor = indexerAttrs?.getString('selectedColor').toString().toUpperCase();
      expect(selectedColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupColor = indexerAttrs?.getString('popupColor').toString().toUpperCase();
      expect(popupColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupUnselectedColor = indexerAttrs?.getString('popupUnselectedColor').toString().toUpperCase();
      expect(popupUnselectedColor).assertEqual(localTheme?.colors?.fontPrimary);
      const popupTitleBackground = indexerAttrs?.getString('popupTitleBackground').toString().toUpperCase();
      expect(popupTitleBackground).assertEqual(localTheme?.colors?.compBackgroundTertiary);
      const selectedBackgroundColor = indexerAttrs?.getString('selectedBackgroundColor').toString().toUpperCase();
      expect(selectedBackgroundColor).assertEqual(localTheme?.colors?.compEmphasizeSecondary);
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
    })
     /**
     * @tc.number    : ActsAlphabetIndexerThemeColors_static_0300
     * @tc.name      : ActsAlphabetIndexerThemeColors_static_0300
     * @tc.desc      : Check system colors values of the AlphabetIndexer component
     *                 after change theme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it(`ActsAlphabetIndexerThemeColors_static_0300`, Level.LEVEL0, async () => {
      const CASE: string = `ActsAlphabetIndexerThemeColors_static_0300`;
      console.info(`${SUITE} ${CASE} START`);
      await sleep(frameTime);
      const indexerJSON = inspector.getInspectorByKey(AlphabetIndexerKeys.alphabetIndexerWithTheme);
      const indexerAttrs = JSON.parseJsonElement(indexerJSON).getElement('$attrs');
      const color = indexerAttrs.getString('color').toString().toUpperCase();
      expect(color).assertEqual(localTheme?.colors?.fontSecondary);
      const selectedColor = indexerAttrs?.getString('selectedColor').toString().toUpperCase();
      expect(selectedColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupColor = indexerAttrs?.getString('popupColor').toString().toUpperCase();
      expect(popupColor).assertEqual(localTheme?.colors?.fontEmphasize);
      const popupUnselectedColor = indexerAttrs?.getString('popupUnselectedColor').toString().toUpperCase();
      expect(popupUnselectedColor).assertEqual(localTheme?.colors?.fontPrimary);
      const popupTitleBackground = indexerAttrs?.getString('popupTitleBackground').toString().toUpperCase();
      expect(popupTitleBackground).assertEqual(localTheme?.colors?.compBackgroundTertiary);
      const selectedBackgroundColor = indexerAttrs?.getString('selectedBackgroundColor').toString().toUpperCase();
      expect(selectedBackgroundColor).assertEqual(localTheme?.colors?.compEmphasizeSecondary);
      console.info(`${SUITE} ${CASE} END`);
    })
  })
}