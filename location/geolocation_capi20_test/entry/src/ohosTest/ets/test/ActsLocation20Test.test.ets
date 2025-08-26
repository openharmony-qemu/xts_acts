/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import locationcapi20 from 'liblocationcapi20.so'
import { abilityAccessCtrl, common, Permissions, UIAbility } from '@kit.AbilityKit';
import { Driver, ON, Component } from '@kit.TestKit';
import { deviceInfo } from '@kit.BasicServicesKit';

const OS_LOCATION_ERR_OK = 0;
let deviceTypeInfo: string = deviceInfo.deviceType;

export async function LocationSwitchOn() {
  const driver = await Driver.create();
  await driver.swipe(500, 50, 500, 500, 40000);
  let component = await driver.findComponent(ON.text('位置信息'));
  let bounds = await component.getBounds()
  const width = bounds.right - bounds.left;
  const height = bounds.bottom - bounds.top;
  const clickX = bounds.left + width / 2;
  const clickY = bounds.top - 50;
  await driver.click(clickX, clickY);
  await driver.swipe(500, 1000, 500, 50, 40000);
  return
}

export async function LocationSwitchOnPhone() {
  const driver = await Driver.create();
  await driver.swipe(1150, 50, 1150, 1000, 40000);
  let component = await driver.findComponent(ON.text('位置'));
  let bounds = await component.getBounds()
  const width = bounds.right - bounds.left;
  const height = bounds.bottom - bounds.top;
  const clickX = bounds.left + width / 2;
  const clickY = bounds.top - 50;
  await driver.click(clickX, clickY);
  await driver.swipe(1150, 1000, 1150, 50, 40000);
  return
}

export default function ActsLocation20Test() {
  describe('ActsLocation20Test', () => {
    beforeAll(async (done: Function) => {
      let driver: Driver = await Driver.create();
      let permissions: Permissions[] = ['ohos.permission.APPROXIMATELY_LOCATION', "ohos.permission.LOCATION"];
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.requestPermissionsFromUser(getContext(), permissions).then(async (data) => {
        setTimeout(() => {
            done()
        }, 5000)
      })
      let text: Component = await driver.findComponent(ON.text('允许本次使用'));
      if (deviceTypeInfo == 'default') {
        text = await driver.findComponent(ON.text('允许本次使用'));
      } else if (deviceTypeInfo == 'phone') {
        text = await driver.findComponent(ON.text('本次使用允许'));
      }
      if (text) {
        await text.click();
      } else {
        console.info("====>click error====");
      }
    })

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StartLocating_Test_0102
     * @tc.name    : testLocationKitOH_Location_StartLocatingTest0102
     * @tc.desc    : test OH_Location_StartLocating1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StartLocatingTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testLocationKitOH_Location_StartLocatingTest0102 start====");
          let result = locationcapi20.OH_Location_StartLocating1();
          console.info("====>testLocationKitOH_Location_StartLocatingTest0102 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testLocationKitOH_Location_StartLocatingTest0102 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      }
    )

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StopLocating_Test_0101
     * @tc.name    : testLocationKitOH_Location_StopLocatingTest0101
     * @tc.desc    : test OH_Location_StopLocating.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StopLocatingTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testLocationKitOH_Location_StopLocatingTest0101 start====");
          let result = locationcapi20.OH_Location_StopLocating1();
          console.info("====>testLocationKitOH_Location_StopLocatingTest0101 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testLocationKitOH_Location_StopLocatingTest0101 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })

    afterAll(async (done: Function) => {
      if (deviceTypeInfo == 'default') {
        LocationSwitchOn()
      } else if (deviceTypeInfo == 'phone') {
        LocationSwitchOnPhone()
      }
      setTimeout(() => {
        done()
      }, 5000)
    }
    )
  })
}
