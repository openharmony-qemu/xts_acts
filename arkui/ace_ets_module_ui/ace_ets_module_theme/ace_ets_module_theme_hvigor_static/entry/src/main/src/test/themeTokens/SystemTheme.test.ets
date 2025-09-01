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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { Resource, ResourceColor } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { systemTheme } from '../../../ets/MainAbility/pages/themeTokensPages/SystemThemeTestPage';
import { frameTime, sleep } from '../Utils'
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import { checkColorTokens } from '../../../ets/MainAbility/themes/checkSystemTokens/CheckColorTokens.ets';
import { colorTheme } from '../../../ets/MainAbility/pages/customComponents/CustomColorList';
import { Theme } from '@ohos.arkui.theme';

export default function systemThemeTest() {
  const SUITE: string = 'SystemTokens';
  let themeLocal: Theme | undefined;
  let colorValues: Map<string, string> | undefined = new Map<string, string>();

  describe('ActsSystemTest', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/SystemThemeTestPage",
        };
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== "SystemThemeTestPage") {
          await routerInstance.pushUrl(options).then(() => {
            themeLocal = systemTheme;
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>(colorValuesKey)
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
    });
    afterAll(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.back();
      } catch (err) {
        console.error(`${SUITE} afterAll error:` + JSON.stringify(err));
      }
    });
    /**
     * @tc.number    : ActsSystemThemeColors_static_0100
     * @tc.name      : ActsSystemThemeColors_static_0100
     * @tc.desc      : Check system light / dark theme colors values
     * @tc.level     ：Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsSystemThemeColors_static_0100', Level.LEVEL2, () => {
      const CASE: string = 'ActsSystemThemeColors_static_0100';
      console.info(`${SUITE} ${CASE} START`);
      expect(colorValues?.size).assertLarger(0); // ensure that colorValues is not empty
      colorValues?.forEach((value, key): void => {
        const strJson = inspector.getInspectorByKey(`${key}${colorTheme}`);
        const backgroundColor =
          (JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor') as ResourceColor)
            .toString().toUpperCase();
        const checkColor = value;
        expect(backgroundColor).assertEqual(checkColor);
      })
      console.info(`${SUITE} ${CASE} END`);
    });
    /**
     * @tc.number    ：ActsSystemThemeColors_static_0200
     * @tc.name      ：ActsSystemThemeColors_static_0200
     * @tc.desc      : Check system light / dark theme tokens values
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsSystemThemeColors_static_0200', Level.LEVEL2, () => {
      const CASE: string = 'ActsSystemThemeColors_static_0200';
      const checkKeys: Array<string> = Object.keys(checkColorTokens);
      const checkValues = (Object.values(checkColorTokens) as Array<Any>);
      const themeKeys: Array<string> = themeLocal?.colors === undefined ?
      new Array<string>() : Object.keys(themeLocal?.colors as Object);
      const themeValues = themeLocal?.colors === undefined ?
      new Array<Resource>() : (Object.values(themeLocal?.colors as Object) as Array<Any>);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      // fillMap<string>(checkMap, checkKeys, checkValues);
      // fillMap<Resource>(themeMap, themeKeys, themeValues);
      themeMap.forEach(((value, key) => {
        // let themeToken: Resource;
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
    });
  })
}