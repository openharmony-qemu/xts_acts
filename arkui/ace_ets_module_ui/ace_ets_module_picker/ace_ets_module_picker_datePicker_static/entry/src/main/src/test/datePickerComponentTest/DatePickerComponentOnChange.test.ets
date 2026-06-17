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

export default function DatePickerComponentOnChangeTest() {
  describe('DatePickerComponentOnChangeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerComponentOnChangeTest beforeAll start')
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility')
      await UtilsTest.msSleep(SLEEP_TIME_L)
    })

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentOnChange',
      }
      await Utils.sleep(SLEEP_TIME_L)
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        if (!('DatePickerComponentOnChange' == pages.name)) {
          routerInstance.pushUrl(options)
          await Utils.sleep(SLEEP_TIME_L)
        }
      } catch (err) {
        console.error('DatePickerComponentOnChangeTest pushUrl error: ' + err)
      }
    })

    afterEach(() => {
      console.info('afterEach case')
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ONCHANGE_0100
     * @tc.name DatePickerComponentOnChange_trigger
     * @tc.desc Verify DatePickerComponent onChange callback triggered after swipe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('DatePickerComponentOnChange_trigger', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentOnChange_trigger START')
      const driver: Driver = Driver.create()
      try {
        let strJson = inspector.getInspectorByKey('text_onChange_triggered')
        let obj = JSON.parseJsonElement(strJson)
        let content: string = obj.getElement('$attrs').getString('content')
        expect(content).assertContain('onChangeTriggered: false')

        let datePickerComp: Component = await driver.findComponent(ON.id('datePickerComponent_onChange'))
        let bounds = await datePickerComp.getBounds()
        let centerX: number = (bounds.left + bounds.right) / 2
        let centerY: number = (bounds.top + bounds.bottom) / 2
        await driver.swipe(centerX, centerY, centerX, centerY + 50, 600)
        await CommonFunc.sleep(SLEEP_TIME_L)

        strJson = inspector.getInspectorByKey('text_onChange_triggered')
        obj = JSON.parseJsonElement(strJson)
        content = obj.getElement('$attrs').getString('content')
        expect(content).assertContain('onChangeTriggered: true')
        done()
      } catch (err) {
        console.error('DatePickerComponentOnChange_trigger error: ' + err)
        expect().assertFail()
        done()
      }
    })
  })
}
