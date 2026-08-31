'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import wifiManager from '@ohos.wifiManager';
import { Driver, ON} from '@ohos.UiTest';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'wifiUtilsTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async openWifi() : Promise<void> {
    let state: boolean = wifiManager.isWifiActive();
    hilog.info(domain, tag, '当前wifi状态 isWifiActive:' + state);
    if (!state) {
      wifiManager.enableWifi();
      for (let i = 0; i <= 200; i++) {
        if (wifiManager.isWifiActive()) {
          hilog.info(domain, tag, "WiFi已成功开启");
          break;
        }
        hilog.info(domain, tag, "等待WiFi开启中...");
        await Utils.msSleep(100);
      }
    } else {
      hilog.info(domain, tag, '无需操作wifi状态 isWifiActive:' + state);
      hilog.info(domain, tag, 'wifi is open');
    }
  }

  static async closeWifi() : Promise<void> {
    let state: boolean = wifiManager.isWifiActive();
    hilog.info(domain, tag, '当前wifi状态 isWifiActive:' + state);
    if (state) {
      wifiManager.disableWifi();
      for (let i = 0; i <= 200; i++) {
        if (!wifiManager.isWifiActive()) {
          hilog.info(domain, tag, "WiFi已成功关闭");
          break;
        }
        hilog.info(domain, tag, "等待WiFi关闭中...");
        await Utils.msSleep(100);
      }
    } else {
      hilog.info(domain, tag, '无需操作wifi状态 isWifiActive:' + state);
      hilog.info(domain, tag, 'wifi is close');
    }
  }
  static async clickText(text_respond: string): Promise<void> {
    try {
      hilog.info(domain, tag,'clickText start');
      let driver = Driver.create();
      await driver.delayMs(1000);
      hilog.info(domain, tag,'get button start');
      let button = await driver.findComponent(ON.text(text_respond));
      hilog.info(domain, tag,"get button success" + JSON.stringify(button));
      let i = 0;
      while (button == null) {
        hilog.info(domain, tag,"get button success")
        i++;
        button = await driver.findComponent(ON.text(text_respond));
        hilog.info(domain, tag,"get button while" + JSON.stringify(button));
        await driver.delayMs(1000);
        if(i > 30){
          break;
        }
      };
      hilog.info(domain, tag,"get button break" + JSON.stringify(button));
      await button!.click();
      await driver.delayMs(2000);
      hilog.info(domain, tag,'clickText end');
    } catch (err) {
      hilog.info(domain, tag,'nearLink clickRequestPermission failed' + err);
    }
  }
}