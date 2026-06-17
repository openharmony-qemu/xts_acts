'use static'
/*
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
import { describe, beforeEach, it, expect, Level, beforeAll, afterEach } from '../../../../hypium/index'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import Utils from '../../../ets/MainAbility/common/Utils'
import { Driver, ON } from '@ohos.UiTest'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UtilsTest } from '../Util.test'

const SLEEP_TIME_L = 1000
const SLEEP_TIME_S = 100

export default function DatePickerComponentDateOptionsTest() {
  describe('DatePickerComponentDateOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerComponentDateOptionsTest beforeAll start')
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility')
      await UtilsTest.msSleep(SLEEP_TIME_L)
    })

    beforeEach(async () => {
      console.info('DatePickerComponentDateOptionsTest beforeEach start')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentDateOptions'
      }
      await Utils.sleep(SLEEP_TIME_L)
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info('DatePickerComponentDateOptionsTest state pages: ' + JSON.stringify(pages))
        if (!('DatePickerComponentDateOptions' == pages.name)) {
          routerInstance.pushUrl(options)
          await Utils.sleep(SLEEP_TIME_L)
        }
      } catch (err) {
        console.error('DatePickerComponentDateOptionsTest pushUrl error: ' + err)
      }
      console.info('DatePickerComponentDateOptionsTest beforeEach end')
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME_L)
      console.info('DatePickerComponentDateOptionsTest after each called')
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_001
     * @tc.name     DatePickerComponentDateOptions_static_001
     * @tc.desc     Test DatePickerComponent dateOptions.mode default value (DateMode.DATE)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_001 START')
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      expect(strJson.length > 0).assertTrue()
      let obj = JSON.parseJsonElement(strJson)
      let mode: string = obj.getElement('$attrs').getString('mode')
      expect(mode).assertEqual('DateMode.DATE')
      let textJson = inspector.getInspectorByKey('text_dateOptions_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('DATE')).assertTrue()
      console.info('DatePickerComponentDateOptions_static_001 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_002
     * @tc.name     DatePickerComponentDateOptions_static_002
     * @tc.desc     Test DatePickerComponent dateOptions.mode switch to DateMode.YEAR_AND_MONTH
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_002 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_mode_year_month'))
      await (button?.click() as Promise<void>)
      console.info('btn_mode_year_month click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let mode: string = obj.getElement('$attrs').getString('mode')
      expect(mode).assertEqual('DateMode.YEAR_AND_MONTH')
      let textJson = inspector.getInspectorByKey('text_dateOptions_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('YEAR_MONTH')).assertTrue()
      console.info('DatePickerComponentDateOptions_static_002 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_003
     * @tc.name     DatePickerComponentDateOptions_static_003
     * @tc.desc     Test DatePickerComponent dateOptions.mode switch to DateMode.MONTH_AND_DAY
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_003 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_mode_month_day'))
      await (button?.click() as Promise<void>)
      console.info('btn_mode_month_day click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let mode: string = obj.getElement('$attrs').getString('mode')
      expect(mode).assertEqual('DateMode.MONTH_AND_DAY')
      let textJson = inspector.getInspectorByKey('text_dateOptions_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('MONTH_DAY')).assertTrue()
      console.info('DatePickerComponentDateOptions_static_003 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_004
     * @tc.name     DatePickerComponentDateOptions_static_004
     * @tc.desc     Test DatePickerComponent dateOptions.lunar default value (false)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_004 START')
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let lunar: string = obj.getElement('$attrs').getString('lunar')
      expect(lunar).assertEqual('false')
      let textJson = inspector.getInspectorByKey('text_lunar_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('OFF')).assertTrue()
      console.info('DatePickerComponentDateOptions_static_004 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_005
     * @tc.name     DatePickerComponentDateOptions_static_005
     * @tc.desc     Test DatePickerComponent dateOptions.lunar switch to true via toggle
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_005 START')
      const driver = Driver.create()
      const toggle = await driver.findComponent(ON.id('toggle_lunar'))
      await (toggle?.click() as Promise<void>)
      console.info('toggle_lunar click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let lunar: string = obj.getElement('$attrs').getString('lunar')
      expect(lunar).assertEqual('true')
      let textJson = inspector.getInspectorByKey('text_lunar_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('ON')).assertTrue()
      console.info('DatePickerComponentDateOptions_static_005 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_006
     * @tc.name     DatePickerComponentDateOptions_static_006
     * @tc.desc     Test DatePickerComponent dateOptions.loop default value (true)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_006 START')
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let loop: string = obj.getElement('$attrs').getString('loop')
      expect(loop).assertEqual('true')
      console.info('DatePickerComponentDateOptions_static_006 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_007
     * @tc.name     DatePickerComponentDateOptions_static_007
     * @tc.desc     Test DatePickerComponent dateOptions.loop switch to false
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_007 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_loop_false'))
      await (button?.click() as Promise<void>)
      console.info('btn_loop_false click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let loop: string = obj.getElement('$attrs').getString('loop')
      expect(loop).assertEqual('false')
      console.info('DatePickerComponentDateOptions_static_007 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_008
     * @tc.name     DatePickerComponentDateOptions_static_008
     * @tc.desc     Test DatePickerComponent dateOptions.loop switch back to true
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_008 START')
      const driver = Driver.create()
      const buttonFalse = await driver.findComponent(ON.id('btn_loop_false'))
      await (buttonFalse?.click() as Promise<void>)
      await Utils.sleep(SLEEP_TIME_L)
      const buttonTrue = await driver.findComponent(ON.id('btn_loop_true'))
      await (buttonTrue?.click() as Promise<void>)
      console.info('btn_loop_true click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let loop: string = obj.getElement('$attrs').getString('loop')
      expect(loop).assertEqual('true')
      console.info('DatePickerComponentDateOptions_static_008 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_009
     * @tc.name     DatePickerComponentDateOptions_static_009
     * @tc.desc     Test DatePickerComponent dateOptions.enableHapticFeedback default value (true)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_009 START')
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let enableHapticFeedback: string = obj.getElement('$attrs').getString('enableHapticFeedback')
      expect(enableHapticFeedback).assertEqual('true')
      console.info('DatePickerComponentDateOptions_static_009 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_010
     * @tc.name     DatePickerComponentDateOptions_static_010
     * @tc.desc     Test DatePickerComponent dateOptions.enableHapticFeedback switch to false
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_010 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_haptic_false'))
      await (button?.click() as Promise<void>)
      console.info('btn_haptic_false click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let enableHapticFeedback: string = obj.getElement('$attrs').getString('enableHapticFeedback')
      expect(enableHapticFeedback).assertEqual('false')
      console.info('DatePickerComponentDateOptions_static_010 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentDateOptions_static_011
     * @tc.name     DatePickerComponentDateOptions_static_011
     * @tc.desc     Test DatePickerComponent dateOptions.enableHapticFeedback switch back to true
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentDateOptions_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateOptions_static_011 START')
      const driver = Driver.create()
      const buttonFalse = await driver.findComponent(ON.id('btn_haptic_false'))
      await (buttonFalse?.click() as Promise<void>)
      await Utils.sleep(SLEEP_TIME_L)
      const buttonTrue = await driver.findComponent(ON.id('btn_haptic_true'))
      await (buttonTrue?.click() as Promise<void>)
      console.info('btn_haptic_true click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('datePickerComponent_dateOptions')
      let obj = JSON.parseJsonElement(strJson)
      let enableHapticFeedback: string = obj.getElement('$attrs').getString('enableHapticFeedback')
      expect(enableHapticFeedback).assertEqual('true')
      console.info('DatePickerComponentDateOptions_static_011 END')
      done()
    })
  })
}
