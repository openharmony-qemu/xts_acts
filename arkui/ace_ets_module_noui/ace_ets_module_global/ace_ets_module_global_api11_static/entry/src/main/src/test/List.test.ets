'use static';
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
import AppStorageJsunit from './AppStorageTest/AppStorageJsunit.test';
import systemAppJsunit from './AppStorageTest/SystemAppJsunit.test';
import basicJsunit from './BasicTest/BasicJsunit.test';

import configurationJsunit from './configuration/ConfigurationJsunit.test';
import globalJsunit1 from './globalTest/global1.test';

import ResourceColor from './ResourceTest/ResourceColor.test'
import ResourceFloat from './ResourceTest/ResourceFloat.test'
import ResourceInteger from './ResourceTest/ResourceInteger.test'
import ResourcePlural from './ResourceTest/ResourcePlural.test'
import ResourceStrarray from './ResourceTest/ResourceStrarray.test'
import ResourceString from './ResourceTest/ResourceString.test'

import webEditTextJsunit from './webTest/web.test';
import web9Jsunit from './webTest/Web9Jsunit.test'
import webJsunit from './webTest/WebJsunitApi9.test'
import webViewPageattrLackJsunit from './webTest/webviewPageLackattr.test'

export default function testsuite() {
  AppStorageJsunit();  // 3   无page页   用例2和3存在注释  123pass 23未落地   Cannot find method 'size ()I' in class 'arkui.stateManagement.storage.localStorage.LocalStorage'
  systemAppJsunit();  // 9   无page页  1234589失败  67pass  （page41）App.getInfo() app Died
  basicJsunit();  // 1   无page页  pass

  globalJsunit1(); // 3 page存在注释,可能有影响  （test117）sendKeyEvent 报错 stream=Error in testglobal_sendKeyEvent_static_0002, @ohos.arkui.Test.ETSGLOBAL
  ResourceColor();  //2        1pass 1Failure  expect #FF773399 equals #FF998877
  ResourceFloat();  //2        1pass 2失败 (test102)findComponent的到的值是null 好像是因为第二个测试的页面加载失败了
  ResourceInteger();  //2        1pass 2失败 (test102)findComponent的到的值是null 好像是因为第二个测试的页面加载失败了
  ResourcePlural();  //2        1pass 2失败 (test102)findComponent的到的值是null 好像是因为第二个测试的页面加载失败了
  ResourceStrarray();  //2        1pass 2失败 (test102)findComponent的到的值是null 好像是因为第二个测试的页面加载失败了
  ResourceString();  //2        1pass 2失败 (test102)findComponent的到的值是null 好像是因为第二个测试的页面加载失败了
  webEditTextJsunit(); // 0 web相关，不用管
  web9Jsunit(); // 3  pass  web相关，不用管
  webJsunit();  // 31   web相关，不用管
  webViewPageattrLackJsunit();  // 9   web相关，不用管
  configurationJsunit();  // 1 app died
  // pass 58  fail 19  died 1
}
