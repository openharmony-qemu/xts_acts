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

import { UIExtensionContentSession } from '@kit.AbilityKit';
import { uiExtension, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct ExtensionErrorCode {

  @State clickNum: number = 0
  @State longPressNum: number = 0
  @State message: string = ''

  build() {
    Column() {

      Row(){
        Text('错误码验证结果 ：')
        Text(this.message + '')
          .id('errorMessage')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }

      Button('getWindowAvoidArea401')
        .id('getWindowAvoidArea401')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.getWindowAvoidArea(-1)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('onAvoidAreaChange401')
        .id('onAvoidAreaChange401')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.on('avoidAreaChange', null)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('onWindowSizeChange401')
        .id('onWindowSizeChange401')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.on('windowSizeChange', null)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
      Button('createSubWindowWithOptions1')
        .id('createSubWindowWithOptions1')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: false,
              isModal:true,
              modalityType:window.ModalityType.APPLICATION_MODALITY,
              maximizeSupported:true,
              outlineEnabled:true
            };
            extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions1', subWindowConfig)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('createSubWindowWithOptions2')
        .id('createSubWindowWithOptions2')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: true,
              isModal:false,
              modalityType:window.ModalityType.WINDOW_MODALITY,
              maximizeSupported:false,
              outlineEnabled:false
            };
            extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions2', subWindowConfig)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('createSubWindowWithOptions401')
        .id('createSubWindowWithOptions401')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.createSubWindowWithOptions('', null)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('createSubWindowWithOptionsnull')
        .id('createSubWindowWithOptionsnull')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.createSubWindowWithOptions(null, null)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('createSubWindowWithOptionsundefined')
        .id('createSubWindowWithOptionsundefined')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.createSubWindowWithOptions(undefined, undefined)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('createSubWindowWithOptions2Null')
        .id('createSubWindowWithOptions2Null')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.createSubWindowWithOptions(null, null,true)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('createSubWindowWithOptions2undefined')
        .id('createSubWindowWithOptions2undefined')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.createSubWindowWithOptions(undefined, undefined,false)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
        Button('createSubWindowWithOptions2_')
        .id('createSubWindowWithOptions2_')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            extensionWindow?.createSubWindowWithOptions('', null,false)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })


      Button('按钮')
        .id('clickBtn')
        .onClick(() => this.clickNum++)
        .gesture(
          LongPressGesture({ repeat: true })
            .onAction((event: GestureEvent|undefined) => {
              if(event){
                if(event.repeat) {
                  this.longPressNum++
                }
              }
            })
        )

    }.width('100%').height('100%')
  }
}