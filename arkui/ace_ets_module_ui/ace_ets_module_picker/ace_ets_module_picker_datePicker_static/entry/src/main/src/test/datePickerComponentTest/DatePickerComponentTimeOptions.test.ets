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

export default function DatePickerComponentTimeOptionsTest() {
  describe('DatePickerComponentTimeOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerComponentTimeOptionsTest beforeAll start')
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility')
      await UtilsTest.msSleep(SLEEP_TIME_L)
    })

    beforeEach(async () => {
      console.info('DatePickerComponentTimeOptionsTest beforeEach start')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentTimeOptions'
      }
      await Utils.sleep(SLEEP_TIME_L)
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info('DatePickerComponentTimeOptionsTest state pages: ' + JSON.stringify(pages))
        if (!('DatePickerComponentTimeOptions' == pages.name)) {
          routerInstance.pushUrl(options)
          await Utils.sleep(SLEEP_TIME_L)
        }
      } catch (err) {
        console.error('DatePickerComponentTimeOptionsTest pushUrl error: ' + err)
      }
      console.info('DatePickerComponentTimeOptionsTest beforeEach end')
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME_L)
      console.info('DatePickerComponentTimeOptionsTest after each called')
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_001
     * @tc.name     DatePickerComponentTimeOptions_static_001
     * @tc.desc     Test DatePickerComponent timeOptions.format default value (TimeFormat.HOUR_MINUTE)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_001 START')
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      expect(strJson.length > 0).assertTrue()
      let obj = JSON.parseJsonElement(strJson)
      let format: string = obj.getElement('$attrs').getString('format')
      expect(format).assertEqual('TimeFormat.HOUR_MINUTE')
      let textJson = inspector.getInspectorByKey('text_timeOptions_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('H:M')).assertTrue()
      console.info('DatePickerComponentTimeOptions_static_001 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_002
     * @tc.name     DatePickerComponentTimeOptions_static_002
     * @tc.desc     Test DatePickerComponent timeOptions.format switch to TimeFormat.HOUR_MINUTE_SECOND
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_002 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_format_hour_minute_second'))
      await (button?.click() as Promise<void>)
      console.info('btn_format_hour_minute_second click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let format: string = obj.getElement('$attrs').getString('format')
      expect(format).assertEqual('TimeFormat.HOUR_MINUTE_SECOND')
      let textJson = inspector.getInspectorByKey('text_timeOptions_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('H:M:S')).assertTrue()
      console.info('DatePickerComponentTimeOptions_static_002 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_003
     * @tc.name     DatePickerComponentTimeOptions_static_003
     * @tc.desc     Test DatePickerComponent timeOptions.useMilitaryTime default value (false)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_003 START')
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let useMilitaryTime: string = obj.getElement('$attrs').getString('useMilitaryTime')
      expect(useMilitaryTime).assertEqual('false')
      let textJson = inspector.getInspectorByKey('text_military_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('12H')).assertTrue()
      console.info('DatePickerComponentTimeOptions_static_003 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_004
     * @tc.name     DatePickerComponentTimeOptions_static_004
     * @tc.desc     Test DatePickerComponent timeOptions.useMilitaryTime switch to true via toggle
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_004 START')
      const driver = Driver.create()
      const toggle = await driver.findComponent(ON.id('toggle_military'))
      await (toggle?.click() as Promise<void>)
      console.info('toggle_military click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let useMilitaryTime: string = obj.getElement('$attrs').getString('useMilitaryTime')
      expect(useMilitaryTime).assertEqual('true')
      let textJson = inspector.getInspectorByKey('text_military_state')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('24H')).assertTrue()
      console.info('DatePickerComponentTimeOptions_static_004 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_005
     * @tc.name     DatePickerComponentTimeOptions_static_005
     * @tc.desc     Test DatePickerComponent timeOptions.loop default value (true)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_005 START')
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let loop: string = obj.getElement('$attrs').getString('loop')
      expect(loop).assertEqual('true')
      console.info('DatePickerComponentTimeOptions_static_005 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_006
     * @tc.name     DatePickerComponentTimeOptions_static_006
     * @tc.desc     Test DatePickerComponent timeOptions.loop switch to false
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_006 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_timeLoop_false'))
      await (button?.click() as Promise<void>)
      console.info('btn_timeLoop_false click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let loop: string = obj.getElement('$attrs').getString('loop')
      expect(loop).assertEqual('false')
      console.info('DatePickerComponentTimeOptions_static_006 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_007
     * @tc.name     DatePickerComponentTimeOptions_static_007
     * @tc.desc     Test DatePickerComponent timeOptions.loop switch back to true
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_007 START')
      const driver = Driver.create()
      const buttonFalse = await driver.findComponent(ON.id('btn_timeLoop_false'))
      await (buttonFalse?.click() as Promise<void>)
      await Utils.sleep(SLEEP_TIME_L)
      const buttonTrue = await driver.findComponent(ON.id('btn_timeLoop_true'))
      await (buttonTrue?.click() as Promise<void>)
      console.info('btn_timeLoop_true click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let loop: string = obj.getElement('$attrs').getString('loop')
      expect(loop).assertEqual('true')
      console.info('DatePickerComponentTimeOptions_static_007 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_008
     * @tc.name     DatePickerComponentTimeOptions_static_008
     * @tc.desc     Test DatePickerComponent timeOptions.enableHapticFeedback default value (true)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_008 START')
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let enableHapticFeedback: string = obj.getElement('$attrs').getString('enableHapticFeedback')
      expect(enableHapticFeedback).assertEqual('true')
      console.info('DatePickerComponentTimeOptions_static_008 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_009
     * @tc.name     DatePickerComponentTimeOptions_static_009
     * @tc.desc     Test DatePickerComponent timeOptions.enableHapticFeedback switch to false
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_009 START')
      const driver = Driver.create()
      const button = await driver.findComponent(ON.id('btn_timeHaptic_false'))
      await (button?.click() as Promise<void>)
      console.info('btn_timeHaptic_false click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let enableHapticFeedback: string = obj.getElement('$attrs').getString('enableHapticFeedback')
      expect(enableHapticFeedback).assertEqual('false')
      console.info('DatePickerComponentTimeOptions_static_009 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentTimeOptions_static_010
     * @tc.name     DatePickerComponentTimeOptions_static_010
     * @tc.desc     Test DatePickerComponent timeOptions.enableHapticFeedback switch back to true
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentTimeOptions_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeOptions_static_010 START')
      const driver = Driver.create()
      const buttonFalse = await driver.findComponent(ON.id('btn_timeHaptic_false'))
      await (buttonFalse?.click() as Promise<void>)
      await Utils.sleep(SLEEP_TIME_L)
      const buttonTrue = await driver.findComponent(ON.id('btn_timeHaptic_true'))
      await (buttonTrue?.click() as Promise<void>)
      console.info('btn_timeHaptic_true click success')
      await Utils.sleep(SLEEP_TIME_L)
      let strJson = inspector.getInspectorByKey('timePickerComponent_timeOptions')
      let obj = JSON.parseJsonElement(strJson)
      let enableHapticFeedback: string = obj.getElement('$attrs').getString('enableHapticFeedback')
      expect(enableHapticFeedback).assertEqual('true')
      console.info('DatePickerComponentTimeOptions_static_010 END')
      done()
    })
  })
}
