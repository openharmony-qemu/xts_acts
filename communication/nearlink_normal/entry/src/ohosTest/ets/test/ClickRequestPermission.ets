/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { Driver } from '@ohos.UiTest';
import { clickGetPermission, getbutton } from "./Tools"
import { abilityAccessCtrl} from '@kit.AbilityKit';
import manager from '@ohos.nearlink.manager';
export async function clickRequestPermission(texting?: string): Promise<void> {
  let UI_CLICK_ALLOWED = "允许";
  try {
    let return_boolean: boolean;
    return_boolean = manager.isNearLinkSupported();
    if(return_boolean ===false){
      return;
    }
    // 当测试套有权限时，跳过
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let data: abilityAccessCtrl.PermissionStatus = atManager.getSelfPermissionStatus('ohos.permission.ACCESS_NEARLINK');
    console.info(`[nearlink_Permission_test] getSelfPermissionStatus result is ${data}`);
    if (data === 0) {
      console.info(`[nearlink_Permission_test] getSelfPermissionStatus success, result: ${data}`);
    } else {
      console.info('[nearlink_Permission_test] clickRequestPermission start');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await getbutton(driver,UI_CLICK_ALLOWED);
      console.info("[nearlink_Permission_test] get button break" + JSON.stringify(button));
      await button.click();
      console.info('[nearlink_Permission_test] click success');
      await driver.delayMs(2000);
      console.info('[nearlink_Permission_test] clickRequestPermission end');
    }
    if (texting === "辅助包执行"){
      await clickGetPermission();
    }else {
      console.info('[nearlink_Permission_test] 不用获取辅助包权限');
    }
  } catch (err) {
    console.info('[nearlink_Permission_test] clickGetPermission failed');
  }
}