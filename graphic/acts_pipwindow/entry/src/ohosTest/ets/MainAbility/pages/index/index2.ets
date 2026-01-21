/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import pipWindow from '@ohos.PiPWindow';

@Entry
@Component
struct Index2 {
  aboutToAppear() {
    console.info('TestAbility index aboutToAppear')
  }
 @State message: string = ''
   build() {
         Row() {
           Column() {
             Text(this.message)
               .id('getMessage')
               .fontSize(50)
               .fontWeight(FontWeight.Bold)
             Button()
               .id('startPip')
               .backgroundColor('#0D9FFB')
               .width('35%')
               .height('5%')
               .onClick(()=>{
                 let caseName = 'testPiPStateChangeOtherwithCloseMainWindow'
                 let pipController:pipWindow.PiPController| undefined = undefined;
                 let mXComponentController = new XComponentController();
                 let navId = "";
                 let contentWidth = 400;
                 let contentHeight = 600;
                 let config:pipWindow.PiPConfiguration = {
                   context: globalThis.abilityContext,
                   componentController: mXComponentController,
                   navigationId: navId,
                   templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
                   contentWidth: contentWidth,
                   contentHeight: contentHeight,
                   cornerAdsorptionEnabled: true
                 };
                 try {
                   const callback = async (state: pipWindow.PiPState, reason: string) => {
                     console.log(caseName + ' callback state: ' + state);
                     console.log(caseName + ' callback reason: ' + reason);
                     AppStorage.setOrCreate('reason', reason);
                     pipController?.off('stateChange')
                   }
                   pipWindow.create(config).then(async (data) => {
                     pipController = data;
                     console.log(` ${caseName} Succeeded in creating pip controller. Data:${data}`);
                     await pipController.startPiP()
                     pipController.on('stateChange', callback)
                     this.message = 'success'
                   }).catch(async (err:BusinessError) => {
                     console.log(`${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code)+':msg:'+JSON.stringify(err.message));
                     this.message = err.code + '';
                   });
                 } catch (error) {
                   console.log(`$${caseName} Failed. Cause` + JSON.stringify(error.code)+':msg:'+JSON.stringify(error.message));
                   this.message = error.code + '';
                 }
               })
           }
             .width('100%')
         }
             .height('100%')
   }
 }