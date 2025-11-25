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

import ConsumeArray from './@stateTest/ConsumeArray.test.ets'
import ConsumeArray1 from './@stateTest/ConsumeArray1.test.ets'
//import ConsumeColor from './@stateTest/ConsumeColor.test.ets' //缺少页面
//import ConsumeHight from './@stateTest/ConsumeHight.test.ets' //缺少页面
import ConsumeNumber from './@stateTest/ConsumeNumber.test.ets'
import LinkArray from './@stateTest/LinkArray.test.ets'
//import LinkArray1 from './@stateTest/LinkArray1.test.ets' //缺少页面
import LinkColor from './@stateTest/LinkColor.test.ets'
//import LinkHight from './@stateTest/LinkHight.test.ets' //缺少页面
import LinkNumber from './@stateTest/LinkNumber.test.ets'
import objectLinkNumber from './@stateTest/objectLinkNumber.test.ets'
import PropArray from './@stateTest/PropArray.test.ets'
import PropArray1 from './@stateTest/PropArray1.test.ets'
import PropColor from './@stateTest/PropColor.test.ets'
//import PropHight from './@stateTest/PropHight.test.ets' //缺少页面
import PropNumber from './@stateTest/PropNumber.test.ets'
import ProvideArray from './@stateTest/ProvideArray.test.ets'
import ProvideArray1 from './@stateTest/ProvideArray1.test.ets'
//import ProvideColor from './@stateTest/ProvideColor.test.ets' //缺少页面
//import ProvideHight from './@stateTest/ProvideHight.test.ets' //缺少页面
import ProvideNumber from './@stateTest/ProvideNumber.test.ets'
import StateArray from './@stateTest/StateArray.test.ets'
import StateArray1 from './@stateTest/StateArray1.test.ets'
import StateColor from './@stateTest/StateColor.test.ets'
//import StateHight from './@stateTest/StateHight.test.ets' //缺少页面
import StateNumber from './@stateTest/StateNumber.test.ets'
import allowOverride from './allowOverrideTest/allowOverride.test';
//import appStorageJsunit from './AppStorage/AppStorageJsunit.test'; //缺少页面
import linkJsunit from './Link/LinkJsunit.test';

import provideBrother1 from './ProvideTest/provideBrother1.test.ets'
import provideBrother2 from './ProvideTest/provideBrother2.test.ets'
import provideComponent1 from './ProvideTest/provideComponent1.test.ets'
import provideComponent2 from './ProvideTest/provideComponent2.test.ets'
import provideParent2 from './ProvideTest/provideParent2.test.ets'
import provideParent3 from './ProvideTest/provideParent3.test.ets'
import provideParent4 from './ProvideTest/provideParent4.test.ets'
import provideParent5 from './ProvideTest/provideParent5.test.ets'
import provideParent6 from './ProvideTest/provideParent6.test.ets'

//import link1 from './Zhuang/link1.test.ets' //缺少页面
//import ObjectLink1 from './Zhuang/ObjectLink1.test.ets' //缺少页面
//import Prop1 from './Zhuang/Prop1.test.ets' //缺少页面
//import provide1 from './Zhuang/provide1.test.ets' //缺少页面
//import state1 from './Zhuang/state1.test.ets' //缺少页面
import StorageDeprecatedTest from './Zhuang/StorageDeprecatedTest.test';
import PersistentTest0040 from './Zhuang/PersistentTest0040.test';
//import NonUICallBackTest from './Zhuang/NonUICallBackTest.test'; //缺少页面


export default function testsuite() {
  ConsumeArray();//11.17SDK pass:2  filed：2   expect count type of "[object Array]" number is {"store_":[true]} equals count type of "[object Array]" number is [true]
  ConsumeArray1();//11.17SDK pass:1  filed：4
  //ConsumeColor(); //缺少页面
  //ConsumeHight(); //缺少页面
  ConsumeNumber();
  LinkArray();
  //LinkArray1(); //缺少页面
  LinkColor();
  //LinkHight(); //缺少页面
  LinkNumber();
  objectLinkNumber();
  PropArray();
  PropArray1();
  PropColor();
  //PropHight(); //缺少页面
  PropNumber();
  ProvideArray();
  ProvideArray1();
  //ProvideColor(); //缺少页面
  //ProvideHight(); //缺少页面
  ProvideNumber();
  StateArray();
  StateArray1();
  StateColor();
  // StateHight();
  StateNumber();
  allowOverride(); //全pass 注释
  // appStorageJsunit(); //缺少页面
  linkJsunit(); //全pass 注释
  provideBrother1();
  provideBrother2(); //全pass 注释
  provideComponent1();
  provideComponent2();//全pass 注释
  provideParent2();//全pass 注释
  provideParent3();
  provideParent4();//全pass 注释
  provideParent5();  //页面写法待确认
  provideParent6();
  // link1(); //缺少页面
  // ObjectLink1(); //缺少页面
  // Prop1(); //缺少页面
  // provide1(); //缺少页面
  // state1(); //缺少页面
  StorageDeprecatedTest();  //页面创建失败
  PersistentTest0040();//全pass 注释
  // NonUICallBackTest(); //缺少页面
}