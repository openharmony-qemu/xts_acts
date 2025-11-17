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
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { ResourceColor } from '@ohos.arkui.component'
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import {
  textInputBackgroundColor,
  textInputPlaceholderColor,
  textInputThemeProperty,
  textInputThemeSetProperty
} from '../../../ets/MainAbility/pages/components/TextInputPage'
import { greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1'
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { frameTime, sleep } from '../Utils.test'

export default function textInputThemeTest() {
  const SUITE: string = `TextInputThemeTest`
  const textInputKeys: string [] = [
    'TextInput_Others_System',
    `TextInput_Password_System`,
    `TextInput_Inline_System`,
    `TextInput_Others_System_CustomAttrs`,
    `TextInput_Password_System_CustomAttrs`,
    `TextInput_Inline_System_CustomAttrs`,
    `TextInput_Others_WithTheme`,
    `TextInput_Password_WithTheme`,
    `TextInput_Inline_WithTheme`,
    `TextInput_Others_WithTheme_CustomAttrs`,
    `TextInput_Password_WithTheme_CustomAttrs`,
    `TextInput_Inline_WithTheme_CustomAttrs`
  ]
  let colorValues: Map<string, string> | undefined = new Map<string, string>();
  let localTheme: CustomTheme | undefined
  let changeTheme: boolean = false
  let themeSet: boolean | undefined = true

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    })

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: "MainAbility/pages/components/TextInputPage"
        }
        const pages: router.RouterState = routerInstance.getState()
        if (pages?.name !== `TextInputPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>(textInputThemeProperty)
            themeSet = AppStorage.get<boolean>(textInputThemeSetProperty)
            console.info(`${SUITE} router.pushUrl success`)
          })
        }
        colorValues = AppStorage.get(colorValuesKey);
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err))
      }

      if (changeTheme) {
        if ((AppStorage.get(textInputThemeProperty) as CustomTheme | undefined)?.colors?.fontEmphasize
          == redCustomTheme?.colors?.fontEmphasize) {
          AppStorage.setOrCreate(textInputThemeProperty, greenCustomTheme)
        } else {
          AppStorage.setOrCreate(textInputThemeProperty, redCustomTheme)
        }
        changeTheme = false
      }
      if (themeSet) {
        AppStorage.setOrCreate(textInputThemeSetProperty, true)
      } else {
        AppStorage.setOrCreate(textInputThemeSetProperty, false)
      }
      localTheme = AppStorage.get<boolean>(textInputThemeSetProperty) ?
      AppStorage.get<CustomTheme>(textInputThemeProperty) : undefined
    })

    afterEach(async () => {
      await sleep(frameTime)
      console.info("Prop after each called");
    })

    
    it(`ActsTextInputThemeColors_static_0100`, Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextInputThemeColors_static_0100`
      console.info(`${SUITE} ${CASE} START`)
      textInputKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return
        }
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`)
    })
    
    it(`ActsTextInputThemeColors_static_0200`, Level.LEVEL2, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextInputThemeColors_static_0200`
      console.info(`${SUITE} ${CASE} START`)
      textInputKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return
        }
        checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    })
    
    it(`ActsTextInputThemeColors_static_0300`, Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextInputThemeColors_static_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      textInputKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkWithTheme(localTheme, key, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`)
    })
    
    it(`ActsTextInputThemeColors_static_0400`, Level.LEVEL0, async (done: () => void): Promise<void> => {
      const CASE: string = `ActsTextInputThemeColors_static_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      textInputKeys.forEach((key) => {
        checkWithTheme(undefined, key, key.search(`CustomAttrs`) > 0, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
    })
  })
}

function checkWithTheme(localTheme: CustomTheme | undefined, key: string,
  customAttrs: boolean, colorValues: Map<string, string> | undefined) {
  const TextInputJSON = inspector.getInspectorByKey(key)
  const attrsTextInput = JSON.parseJsonElement(TextInputJSON).getElement('$attrs')
  const fontColor: ResourceColor = attrsTextInput.getString('fontColor').toString()
  expect(fontColor).assertEqual(localTheme?.colors?.fontPrimary ?? colorValues?.get(`fontPrimary`))
  const placeholderColor: ResourceColor = attrsTextInput.getString('placeholderColor').toString()
  expect(placeholderColor).assertEqual(customAttrs ?
    textInputPlaceholderColor : localTheme?.colors?.fontSecondary ?? colorValues?.get(`fontSecondary`))
  const caretColor: ResourceColor | undefined = attrsTextInput.getString('caretColor').toString()
  expect(caretColor).assertEqual(localTheme?.colors?.brand ?? colorValues?.get(`brand`))
  const backgroundColor: ResourceColor = attrsTextInput.getString('backgroundColor').toString()
  expect(backgroundColor).assertEqual(customAttrs ? textInputBackgroundColor :
    localTheme?.colors?.compBackgroundTertiary ?? colorValues?.get(`compBackgroundTertiary`))
}