'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeEach,
  it,
  expect,
  Level,
  beforeAll,
  Size,
  TestType,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import deviceInfo from "@ohos.deviceInfo"

export default function popupKeyboardAvoidMode() {
  describe("popupKeyboardAvoidMode", () => {
    let currentDeviceIsPC = false
    beforeAll(async (): Promise<void> => {
      console.info("popupKeyboardAvoidMode beforeAll start"); 
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api15.static", "EntryAbility")
      console.info("popupKeyboardAvoidMode beforeAll start")
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsPC = deviceTypeInfo === "2in1" ? true : false
      console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
      console.info("the value of the deviceType is " + deviceInfo.deviceType)
    })

    beforeEach(async () => {
      console.info("popupKeyboardAvoidMode beforeEach start")
      let options: router.RouterOptions = {
        url: "MainAbility/pages/popup/popupKeyboardAvoidMode",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        console.info(
          "get popupKeyboardAvoidMode state pages: " +
          JSON.stringify(pages)
        )
        if (!("popupKeyboardAvoidMode" == pages.name)) {
          console.info(
            "get popupKeyboardAvoidMode state pages.name: " +
            JSON.stringify(pages.name)
          )
          routerInstance.replaceUrl(options)
          await CommonFunc.sleep(2000)
        }
      } catch (err) {
        console.error("push popupKeyboardAvoidMode page error: " + err)
        expect().assertFail()
      }
    })

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100
     * @tc.name     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100
     * @tc.level    Level.LEVEL1
     */
    it("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100 START")
      
        await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("popup"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] popup click")
        await CommonFunc.sleep(1000)
        let confirm = await driver.findComponent(ON.text("confirm"))
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] confirm is null: " + (confirm == null))
        expect(confirm != null).assertTrue()

        await CommonFunc.sleep(1000)
        await (confirm?.click() as Promise<void>)
        await driver.triggerKey(2070, AppStorage.get<number>('displayID')?.toInt() ?? 0)
      
      console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] END")
      done()
    })

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0200
     * @tc.name     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0200
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0200
     * @tc.level    Level.LEVEL1
     */
    it("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0200", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0200 START")
      await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("popup"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] popup click")
        await CommonFunc.sleep(1000)
        let confirm = await driver.findComponent(ON.text("confirm"))
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] confirm is null: " + (confirm == null))
        expect(confirm != null).assertTrue()

        await CommonFunc.sleep(1000)
        await (confirm?.click() as Promise<void>)
        await driver.triggerKey(2070, AppStorage.get<number>('displayID')?.toInt() ?? 0)
      console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0200] END")
      done()
    })

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0300
     * @tc.name     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0300
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0300
     * @tc.level    Level.LEVEL1
     */
    it("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0300 START")
      await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("popup"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] popup click")
        await CommonFunc.sleep(1000)
        let confirm = await driver.findComponent(ON.text("confirm"))
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0100] confirm is null: " + (confirm == null))
        expect(confirm != null).assertTrue()

        await CommonFunc.sleep(1000)
        await (confirm?.click() as Promise<void>)
        await driver.triggerKey(2070, AppStorage.get<number>('displayID')?.toInt() ?? 0)
      console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0300] END")
      done()
    })

    /**
     * @tc.number   SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400
     * @tc.name     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400
     * @tc.desc     SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400
     * @tc.level    Level.LEVEL1
     */
    it("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400", Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400 START")
      
        await CommonFunc.sleep(1000)
        let driver: Driver = Driver.create()
        let btn = await driver.findComponent(ON.id("none"))
        await CommonFunc.sleep(1000)
        await (btn?.click() as Promise<void>)
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400] none click")
        await CommonFunc.sleep(1000)

        let btn1 = await driver.findComponent(
          ON.id("CustomPopup")
        )
        await CommonFunc.sleep(1000)
        await (btn1?.click() as Promise<void>)
        console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400] CustomPopup click")
        await CommonFunc.sleep(1000)

        let btn0 = await driver.findComponent(ON.id("ipt"))
        await CommonFunc.sleep(1000)
        await (btn0?.click() as Promise<void>)
        await CommonFunc.sleep(1000)

        let confirm = await driver.findComponent(ON.id("text"))

        expect(confirm != null).assertFalse()
        await driver.triggerKey(2070, AppStorage.get<number>('displayID')?.toInt() ?? 0)
      
      console.info("[SUB_ARKUI_ACE_ENGINE_POPUPKEYBOARDAVOIDMODE_STATIC_0400] END")
      done()
    })
  })
}