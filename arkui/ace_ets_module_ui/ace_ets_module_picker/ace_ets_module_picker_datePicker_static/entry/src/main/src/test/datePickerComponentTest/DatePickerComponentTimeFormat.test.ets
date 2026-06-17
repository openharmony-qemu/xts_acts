'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import Utils from '../../../ets/MainAbility/common/Utils'
import { Driver, ON, Component } from '@ohos.UiTest'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UtilsTest } from '../Util.test'

const SLEEP_TIME_L = 1000
const SLEEP_TIME_S = 100

export default function DatePickerComponentTimeFormatTest() {
  describe('DatePickerComponentTimeFormatTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerComponentTimeFormatTest beforeAll start')
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility')
      await UtilsTest.msSleep(SLEEP_TIME_L)
    })

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentTimeFormat',
      }
      await Utils.sleep(SLEEP_TIME_L)
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        if (!('DatePickerComponentTimeFormat' == pages.name)) {
          routerInstance.pushUrl(options)
          await Utils.sleep(SLEEP_TIME_L)
        }
      } catch (err) {
        console.error('DatePickerComponentTimeFormatTest pushUrl error: ' + err)
      }
    })

    afterEach(() => {
      console.info('afterEach case')
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_TIMEFORMAT_0100
     * @tc.name DatePickerComponentTimeFormat_default
     * @tc.desc Verify DatePickerComponent default timeFormat text content contains 'timeFormat: 0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('DatePickerComponentTimeFormat_default', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeFormat_default START')
      const driver: Driver = Driver.create()
      try {
        let strJson = inspector.getInspectorByKey('text_timeFormat_value')
        let obj = JSON.parseJsonElement(strJson)
        let content: string = obj.getElement('$attrs').getString('content')
        expect(content).assertContain('timeFormat: 0')
        done()
      } catch (err) {
        console.error('DatePickerComponentTimeFormat_default error: ' + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_TIMEFORMAT_0200
     * @tc.name DatePickerComponentTimeFormat_hourMinuteSecond
     * @tc.desc Verify DatePickerComponent timeFormat changes to HOUR_MINUTE_SECOND after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('DatePickerComponentTimeFormat_hourMinuteSecond', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentTimeFormat_hourMinuteSecond START')
      const driver: Driver = Driver.create()
      try {
        let button: Component = await driver.findComponent(ON.id('button_timeFormat_hourMinuteSecond'))
        await button?.click()
        await CommonFunc.sleep(SLEEP_TIME_L)
        let strJson = inspector.getInspectorByKey('text_timeFormat_value')
        let obj = JSON.parseJsonElement(strJson)
        let content: string = obj.getElement('$attrs').getString('content')
        expect(content).assertContain('timeFormat: 1')
        done()
      } catch (err) {
        console.error('DatePickerComponentTimeFormat_hourMinuteSecond error: ' + err)
        expect().assertFail()
        done()
      }
    })
  })
}
