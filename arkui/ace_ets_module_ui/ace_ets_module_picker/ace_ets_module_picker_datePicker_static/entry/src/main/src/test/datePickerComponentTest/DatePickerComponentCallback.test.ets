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

export default function DatePickerComponentCallbackTest() {
  describe('DatePickerComponentCallbackTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerComponentCallbackTest beforeAll start')
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility')
      await UtilsTest.msSleep(SLEEP_TIME_L)
    })

    beforeEach(async () => {
      console.info('DatePickerComponentCallbackTest beforeEach start')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentCallback'
      }
      await Utils.sleep(SLEEP_TIME_L)
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info('DatePickerComponentCallbackTest state pages: ' + JSON.stringify(pages))
        if (!('DatePickerComponentCallback' == pages.name)) {
          routerInstance.pushUrl(options)
          await Utils.sleep(SLEEP_TIME_L)
        }
      } catch (err) {
        console.error('DatePickerComponentCallbackTest pushUrl error: ' + err)
      }
      console.info('DatePickerComponentCallbackTest beforeEach end')
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME_L)
      console.info('DatePickerComponentCallbackTest after each called')
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_001
     * @tc.name     DatePickerComponentCallback_static_001
     * @tc.desc     Test DatePickerComponent date onChange callback initial state (triggered=false)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_001 START')
      let strJson = inspector.getInspectorByKey('datePickerComponent_callback_date')
      expect(strJson.length > 0).assertTrue()
      let obj = JSON.parseJsonElement(strJson)
      expect(obj.getElement('$type').getString('$type')).assertEqual('DatePickerComponent')
      let textJson = inspector.getInspectorByKey('text_date_onChange_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=false')).assertTrue()
      console.info('DatePickerComponentCallback_static_001 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_002
     * @tc.name     DatePickerComponentCallback_static_002
     * @tc.desc     Test DatePickerComponent date onChange callback triggers after swipe
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_002 START')
      let driver: Driver = Driver.create()
      await driver.swipe(10, 300, 10, 100, 500)
      await Utils.sleep(SLEEP_TIME_L * 2)
      let textJson = inspector.getInspectorByKey('text_date_onChange_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=true')).assertTrue()
      console.info('DatePickerComponentCallback_static_002 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_003
     * @tc.name     DatePickerComponentCallback_static_003
     * @tc.desc     Test DatePickerComponent date onScrollStop callback initial state (triggered=false)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_003 START')
      let textJson = inspector.getInspectorByKey('text_date_onScrollStop_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=false')).assertTrue()
      console.info('DatePickerComponentCallback_static_003 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_004
     * @tc.name     DatePickerComponentCallback_static_004
     * @tc.desc     Test DatePickerComponent date onScrollStop callback triggers after swipe
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_004 START')
      let driver: Driver = Driver.create()
      await driver.swipe(10, 300, 10, 100, 500)
      await Utils.sleep(SLEEP_TIME_L * 3)
      let textJson = inspector.getInspectorByKey('text_date_onScrollStop_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=true')).assertTrue()
      console.info('DatePickerComponentCallback_static_004 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_005
     * @tc.name     DatePickerComponentCallback_static_005
     * @tc.desc     Test DatePickerComponent time onChange callback initial state (triggered=false)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_005 START')
      let strJson = inspector.getInspectorByKey('datePickerComponent_callback_time')
      expect(strJson.length > 0).assertTrue()
      let textJson = inspector.getInspectorByKey('text_time_onChange_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=false')).assertTrue()
      console.info('DatePickerComponentCallback_static_005 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_006
     * @tc.name     DatePickerComponentCallback_static_006
     * @tc.desc     Test DatePickerComponent time onChange callback triggers after swipe
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_006 START')
      let driver: Driver = Driver.create()
      await driver.swipe(10, 600, 10, 400, 500)
      await Utils.sleep(SLEEP_TIME_L * 2)
      let textJson = inspector.getInspectorByKey('text_time_onChange_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=true')).assertTrue()
      console.info('DatePickerComponentCallback_static_006 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_007
     * @tc.name     DatePickerComponentCallback_static_007
     * @tc.desc     Test DatePickerComponent time onScrollStop callback initial state (triggered=false)
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_007 START')
      let textJson = inspector.getInspectorByKey('text_time_onScrollStop_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=false')).assertTrue()
      console.info('DatePickerComponentCallback_static_007 END')
      done()
    })

    /**
     * @tc.number   DatePickerComponentCallback_static_008
     * @tc.name     DatePickerComponentCallback_static_008
     * @tc.desc     Test DatePickerComponent time onScrollStop callback triggers after swipe
     * @tc.level    Level.LEVEL0
     */
    it('DatePickerComponentCallback_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentCallback_static_008 START')
      let driver: Driver = Driver.create()
      await driver.swipe(10, 600, 10, 400, 500)
      await Utils.sleep(SLEEP_TIME_L * 3)
      let textJson = inspector.getInspectorByKey('text_time_onScrollStop_result')
      let textObj = JSON.parseJsonElement(textJson)
      let content: string = textObj.getElement('$attrs').getString('content')
      expect(content.includes('triggered=true')).assertTrue()
      console.info('DatePickerComponentCallback_static_008 END')
      done()
    })
  })
}
