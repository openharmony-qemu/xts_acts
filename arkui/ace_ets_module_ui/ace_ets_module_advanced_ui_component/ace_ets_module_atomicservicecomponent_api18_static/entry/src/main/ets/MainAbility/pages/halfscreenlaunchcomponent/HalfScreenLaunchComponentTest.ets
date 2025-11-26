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
// import { HalfScreenLaunchComponent, LaunchController } from '@kit.ArkUI';
import { Entry, Component, Builder, Column, Image, TextArea, $r, TerminationInfo } from '@ohos.arkui.component';

@Entry
@Component
struct HalfScreenLaunchComponentTest {
  appId: string = '5765880207853275489'; //手机充值
  // controller: LaunchController = new LaunchController();
  build() {
    Column() {
      // HalfScreenLaunchComponent({
      //   content: this.ColumChild,
      //   appId:this.appId,
      //   options: {},
      //   onTerminated:  (info:TerminationInfo)=>{
      //   console.log('onTerminated info = '+info.want);
      // },
      //   onError: (err) => {
      //     console.error(' onError code: ' + err.code + ', message: ', err.message);
      //   }
      // }).width('100%').height('80vp')
    }
  }
  @Builder
  ColumChild() {
    Column() {
      Image($r('app.media.icon')).height(80).width(80)
      TextArea({text:'launch atomicservice'}).width(300)
    }.width('100%').height(100)
  }
}