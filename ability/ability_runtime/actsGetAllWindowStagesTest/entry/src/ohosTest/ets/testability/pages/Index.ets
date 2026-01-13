/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }
 @State message: string = 'Hello World'
  private myProxy: UIExtensionProxy | undefined = undefined;
   build() {
         Row() {
           Column() {
             UIExtensionComponent(
               {
                 bundleName: 'com.example.GetAllWindowStages',
                 abilityName: 'UIExtensionAbility',
                 moduleName: 'entry_test',
                 parameters: {
                   'ability.want.params.uiExtensionType': 'sys/commonUI',
                 }
               })
               .onRemoteReady((proxy) => {
                 this.myProxy = proxy;
               })
               .onReceive((data) => {
                 this.message = JSON.stringify(data);
               })
               .onTerminated((terminateInfo: TerminationInfo) => {
                 // 被拉起的UIExtensionAbility通过调用terminateSelfWithResult或者terminateSelf正常退出时，触发本回调函数。
                 // 回调返回UIExtensionAbility正常退出时的返回结果，包含结果码code和Want数据。
                 this.message = `terminate code: ${terminateInfo.code}, want: ${terminateInfo.want}`;
               })
               .onError((error: BusinessError) => {
                 // 被拉起的UIExtensionAbility在运行过程中发生异常时，触发本回调函数。
                 // 回调返回UIExtensionAbility发生异常时返回的错误码和错误信息。
                 this.message = `error code: ${error.code}, error msg: ${error.message}`;
               })
               .size({ width: 300, height: 300 })
               .border({
                 width: 5,
                 color: 0x317AF7,
                 radius: 10,
                 style: BorderStyle.Dotted
               })

             Text(this.message)
               .fontSize(50)
               .fontWeight(FontWeight.Bold)
             Button() {
               Text('next page')
                 .fontSize(20)
                 .fontWeight(FontWeight.Bold)
             }.type(ButtonType.Capsule)
             .margin({
               top: 20
             })
             .backgroundColor('#0D9FFB')
             .width('35%')
             .height('5%')
             .onClick(()=>{
             })
           }
             .width('100%')
         }
             .height('100%')
   }
 }