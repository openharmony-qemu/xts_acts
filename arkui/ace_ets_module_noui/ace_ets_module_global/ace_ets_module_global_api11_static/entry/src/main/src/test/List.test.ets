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
  AppStorageJsunit();  // SDK11.19 pass
  basicJsunit();  //SDK11.19 pass
  globalJsunit1(); // SDK11.22  Pass: 3
  ResourceColor();  //SDK11.28 pass 2
  ResourceFloat();  //SDK11.28 pass 2
  ResourceInteger();  //SDK11.28 pass 2
  ResourcePlural();  //SDK11.28 pass 2
  ResourceStrarray(); //SDK11.28 pass 2
  ResourceString(); //SDK11.28 pass 2
  // systemAppJsunit();  //  SDK11.22  App.getInfo() 外领域 9个用例
  // webEditTextJsunit(); // 0 web相关，不用管
  // web9Jsunit(); // 3  pass  web相关，不用管
  // webJsunit();  // 31   web相关，不用管
  // webViewPageattrLackJsunit();  // 9   web相关，不用管
  // configurationJsunit();  // 国际化 不用管
  // SDK11.17 run: 19, Failure: 6, Error: 1, Pass: 11, Ignore: 0
}
