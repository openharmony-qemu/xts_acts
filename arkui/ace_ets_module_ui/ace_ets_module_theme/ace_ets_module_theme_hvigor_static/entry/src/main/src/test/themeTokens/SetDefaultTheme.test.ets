'use static';
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
import { CustomColors, CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
import { defaultThemeProperty } from '../../../ets/MainAbility/pages/themeTokensPages/SetDefaultThemeTestPage';
import { redThemeColors } from '../../../ets/MainAbility/themes/customTheme/RedCustomThemeColor';
import { fillMap } from '../Utils.test';
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import {
  GreenCustomThemeColors,
  greenThemeColors
} from '../../../ets/MainAbility/themes/customTheme/GreenCustomThemeColor';

export default function setDefaultThemeTest() {
  const SUITE: string = 'SetDefaultTheme';
  let themeLocal: CustomTheme | undefined = undefined;
  let changeTheme: boolean = false;
  // 1.1是导入的 导入会引发运行时错误
  const defaultThemeProperty: string = 'DefaultThemeProperty';

  describe('ActsSetDefaultThemeTest', () => {
    beforeAll(async () => {
      console.info('ActsSetDefaultThemeTest startAbility');
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })
    beforeEach(() => {
      try {
        const options: router.RouterOptions = {
          url: "MainAbility/pages/themeTokensPages/SetDefaultThemeTestPage",
        };
        const routerInstance = AppStorage.get<Router>("router") as Router
        const pages: router.RouterState = routerInstance.getState();
        if (pages?.name !== "SetDefaultThemeTestPage") {
          routerInstance.pushUrl(options).then(() => {
            themeLocal = AppStorage.get<CustomTheme>(defaultThemeProperty);
            console.info(`${SUITE} router.pushUrl success`);
          });
          await UtilsTest.msSleep(4000)
        }
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err));
      }
      if (!changeTheme) return;
      if ((AppStorage.get<CustomTheme>(defaultThemeProperty as string))?.colors?.fontEmphasize
        == redCustomTheme?.colors?.fontEmphasize) {
        ThemeControl.setDefaultTheme(greenCustomTheme);
      } else {
        ThemeControl.setDefaultTheme(redCustomTheme);
      }
      themeLocal = AppStorage.get<CustomTheme>(defaultThemeProperty);
      changeTheme = false;
    })

    afterAll(() => {
      const router = AppStorage.get<Router>("router") as Router
      router.back()
    });

    /**
     * @tc.number    : ActsSetDefaultThemeColors_static_0100
     * @tc.name      : ActsSetDefaultThemeColors_static_0100
     * @tc.desc      : Check initial theme values use API setDefaultTheme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsSetDefaultThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsSetDefaultThemeColors_0100';
      const checkKeys: string[] = Object.getOwnPropertyNames(redThemeColors);
      const checkValues = (Object.values(redThemeColors) as Object as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal!.colors!);
      const themeValues: string[] = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal!.colors!) as Object as string[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, string> = new Map<string, string>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<string>(themeMap, themeKeys, themeValues);
      themeMap.forEach(((value, key) => {
        let themeToken: string;
        themeToken = value;
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      changeTheme = true;
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
    /**
     * @tc.number    : ActsSetDefaultThemeColors_static_0200
     * @tc.name      : ActsSetDefaultThemeColors_static_0200
     * @tc.desc      : Check changed theme values using API setDefaultTheme
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsSetDefaultThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = 'ActsSetDefaultThemeColors_0200';
      const checkKeys: string[] = Object.keys(greenThemeColors);
      const checkValues = (Object.values(greenThemeColors) as Object as string[]);
      const themeKeys: string[] = themeLocal?.colors === undefined ?
        [] : Object.keys(themeLocal!.colors!);
      const themeValues: Resource[] = themeLocal?.colors === undefined ?
        [] : (Object.values(themeLocal!.colors!) as Object as Resource[]);
      const checkMap: Map<string, string> = new Map<string, string>();
      const themeMap: Map<string, Resource> = new Map<string, Resource>();
      fillMap<string>(checkMap, checkKeys, checkValues);
      fillMap<Resource>(themeMap, themeKeys, themeValues);
      console.log('test DefaultTheme themeMap : ' + JSON.stringify(themeMap))
      console.log('test DefaultTheme checkMap : ' + JSON.stringify(checkMap))
      themeMap.forEach(((value, key) => {
        let themeToken = (value as Resource)?.params?.[0] ?? "";
        const checkToken = checkMap.get(key);
        expect(themeToken).assertEqual(checkToken);
      }));
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}