/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import { NavParamOne, NavParamTwo } from '../../common/NavParamModel';

@Entry
@Component
struct NavigationPreload {
  @State stack: NavPathStack = new NavPathStack()
  @State preloadResult: string = 'idle'
  @State onDestroyCalled: string = 'false'
  @State errorCode: string = ''
  @State errorMsg: string = ''
  @State stackNames: string = ''
  @State thenCalled: string = 'false'
  @State catchCalled: string = 'false'
  @State onPopCalled: string = 'false'
  @State pushAfterPreloadResult: string = 'idle'
  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.stack);
    this.stackNames = JSON.stringify(this.stack.getAllPathName())
  }

  resetState() {
    this.preloadResult = 'idle'
    this.onDestroyCalled = 'false'
    this.errorCode = ''
    this.errorMsg = ''
    this.thenCalled = 'false'
    this.catchCalled = 'false'
    this.onPopCalled = 'false'
    this.pushAfterPreloadResult = 'idle'
  }

  @Builder
  pageMap(name: string, param: Object) {
    if (name.startsWith('STANDARD')) {
      NavDest({ name: name, mode: NavDestinationMode.STANDARD, param: param })
    } else if (name.startsWith('DIALOG')) {
      NavDest({ name: name, mode: NavDestinationMode.DIALOG, param: param })
    }
  }

  build() {
    Navigation(this.stack) {
      Scroll() {
        Column() {
          // Result display area
          Text(this.preloadResult)
            .id('preloadResult')
            .key('preloadResult')
            .fontSize(20)
            .margin({ top: 10 } as Margin)
          Text(this.onDestroyCalled)
            .id('onDestroyCalled')
            .key('onDestroyCalled')
            .fontSize(20)
          Text(this.errorCode)
            .id('errorCode')
            .key('errorCode')
            .fontSize(20)
          Text(this.errorMsg)
            .id('errorMsg')
            .key('errorMsg')
            .fontSize(20)
          Text(this.stackNames)
            .id('stackNames')
            .key('stackNames')
            .fontSize(20)
          Text(this.thenCalled)
            .id('thenCalled')
            .key('thenCalled')
            .fontSize(20)
          Text(this.catchCalled)
            .id('catchCalled')
            .key('catchCalled')
            .fontSize(20)
          Text(this.onPopCalled)
            .id('onPopCalled')
            .key('onPopCalled')
            .fontSize(20)
          Text(this.pushAfterPreloadResult)
            .id('pushAfterPreloadResult')
            .key('pushAfterPreloadResult')
            .fontSize(20)

          // ========== Duplicate-key test isolation buttons (unique ids, same actions) ==========
          Button('Preload STANDARD 0300')
            .id('btnPreloadStandard_0300')
            .key('btnPreloadStandard_0300')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_1', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload STANDARD 0400')
            .id('btnPreloadStandard_0400')
            .key('btnPreloadStandard_0400')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_1', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload STANDARD 1200')
            .id('btnPreloadStandard_1200')
            .key('btnPreloadStandard_1200')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_1', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload STANDARD 3000')
            .id('btnPreloadStandard_3000')
            .key('btnPreloadStandard_3000')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_1', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload DIALOG 0500')
            .id('btnPreloadDialog_0500')
            .key('btnPreloadDialog_0500')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('DIALOG_1', new NavParamTwo('ParamTag2')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload Wrong Name 1900')
            .id('btnPreloadWrongName_1900')
            .key('btnPreloadWrongName_1900')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('PageWrong', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload Wrong Name 2600')
            .id('btnPreloadWrongName_2600')
            .key('btnPreloadWrongName_2600')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('PageWrong', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload Empty Name 1600')
            .id('btnPreloadEmptyName_1600')
            .key('btnPreloadEmptyName_1600')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload NotFound 2700')
            .id('btnPreloadNotFound_2700')
            .key('btnPreloadNotFound_2700')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('UNKNOWN_DEST', null),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload Undefined 3500')
            .id('btnPreloadUndefined_3500')
            .key('btnPreloadUndefined_3500')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let undefinedNavInfo = new NavPathInfo('', undefined);
              this.stack.preloadPath(undefinedNavInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } })
                .then(() => {
                  this.preloadResult = 'success'
                  this.thenCalled = 'true'
                }).catch((error: BusinessError) => {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                  this.errorCode = String(error.code)
                  this.errorMsg = error.message
                })
            })

          // ========== Function call coverage ==========
          Button('Preload STANDARD')
            .id('btnPreloadStandard')
            .key('btnPreloadStandard')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_1', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload DIALOG')
            .id('btnPreloadDialog')
            .key('btnPreloadDialog')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('DIALOG_1', new NavParamTwo('ParamTag2')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Parameter coverage - NavPathInfo.param types ==========
          Button('Preload String Param')
            .id('btnPreloadStringParam')
            .key('btnPreloadStringParam')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_2', 'stringParam'),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload Number Param')
            .id('btnPreloadNumberParam')
            .key('btnPreloadNumberParam')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_3', 12345),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload No Param')
            .id('btnPreloadNoParam')
            .key('btnPreloadNoParam')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_4', null),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Parameter coverage - PreloadOptions ==========
          Button('Preload No Options')
            .id('btnPreloadNoOptions')
            .key('btnPreloadNoOptions')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_5', new NavParamTwo('ParamTag5'))
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Parameter specification coverage - Error 401 ==========
          Button('Preload Undefined Info')
            .id('btnPreloadUndefined')
            .key('btnPreloadUndefined')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let undefinedNavInfo = new NavPathInfo('', undefined);
              this.stack.preloadPath(undefinedNavInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } })
                .then(() => {
                  this.preloadResult = 'success'
                  this.thenCalled = 'true'
                }).catch((error: BusinessError) => {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                  this.errorCode = String(error.code)
                  this.errorMsg = error.message
                })
            })

          Button('Preload Empty Name')
            .id('btnPreloadEmptyName')
            .key('btnPreloadEmptyName')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Error 100005 - Builder not registered ==========
          Button('Preload Wrong Name')
            .id('btnPreloadWrongName')
            .key('btnPreloadWrongName')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('PageWrong', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Parameter spec coverage - null param ==========
          Button('Preload Null Param')
            .id('btnPreloadNullParam')
            .key('btnPreloadNullParam')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_6', null),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== NavPathInfo.onPop callback ==========
          Button('Preload With OnPop')
            .id('btnPreloadWithOnPop')
            .key('btnPreloadWithOnPop')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let navInfo: NavPathInfo = new NavPathInfo('STANDARD_11', new NavParamTwo('OnPopTest'));
              navInfo.onPop = (popInfo: PopInfo) => {
                this.onPopCalled = 'true'
              };
              this.stack.preloadPath(navInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== NavPathInfo.isEntry ==========
          Button('Preload IsEntry True')
            .id('btnPreloadIsEntryTrue')
            .key('btnPreloadIsEntryTrue')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let navInfo: NavPathInfo = new NavPathInfo('STANDARD_12', new NavParamTwo('IsEntryTrue'));
              navInfo.isEntry = true;
              this.stack.preloadPath(navInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload IsEntry False')
            .id('btnPreloadIsEntryFalse')
            .key('btnPreloadIsEntryFalse')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let navInfo: NavPathInfo = new NavPathInfo('STANDARD_13', new NavParamTwo('IsEntryFalse'));
              navInfo.isEntry = false;
              this.stack.preloadPath(navInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Return value coverage ==========
          Button('Preload Then Verify')
            .id('btnPreloadThenVerify')
            .key('btnPreloadThenVerify')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_7', new NavParamTwo('ThenVerify')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.thenCalled = 'true'
                this.preloadResult = 'success'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.catchCalled = 'true'
                this.preloadResult = 'error'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          Button('Preload Catch Verify')
            .id('btnPreloadCatchVerify')
            .key('btnPreloadCatchVerify')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('nonexistent_route', new NavParamTwo('CatchVerify')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.thenCalled = 'true'
                this.preloadResult = 'success'
              }).catch((error: BusinessError) => {
                this.catchCalled = 'true'
                this.preloadResult = 'error'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Error code 100006 - NavDestination not found ==========
          Button('Preload Not Found')
            .id('btnPreloadNotFound')
            .key('btnPreloadNotFound')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('UNKNOWN_DEST', null),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== PreloadOptions.onDestroy - trigger by clearing ==========
          Button('Preload Then Clear')
            .id('btnPreloadThenClear')
            .key('btnPreloadThenClear')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_8', new NavParamTwo('DestroyVerify')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
                setTimeout(() => {
                  this.stack.clear()
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }, 500)
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Object param ==========
          Button('Preload Object Param')
            .id('btnPreloadObjectParam')
            .key('btnPreloadObjectParam')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let paramObj = new NavParamOne()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_9', paramObj),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Multiple sequential preload ==========
          Button('Preload Multiple')
            .id('btnPreloadMultiple')
            .key('btnPreloadMultiple')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let successCount: number = 0
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_10', new NavParamTwo('Multi1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                successCount++
                this.stack.preloadPath(
                  new NavPathInfo('DIALOG_10', new NavParamTwo('Multi2')),
                  { onDestroy: () => { this.onDestroyCalled = 'true' } }
                ).then(() => {
                  successCount++
                  this.preloadResult = 'success_' + String(successCount)
                  this.thenCalled = 'true'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }).catch((error: BusinessError) => {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                  this.errorCode = String(error.code)
                  this.errorMsg = error.message
                })
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Preload then pushPath integration ==========
          Button('Preload Then Push Same')
            .id('btnPreloadThenPush')
            .key('btnPreloadThenPush')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_14', new NavParamTwo('PreloadPush')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
                this.stack.pushPath({ name: 'STANDARD_14', param: new NavParamTwo('PreloadPush') })
                setTimeout(() => {
                  this.pushAfterPreloadResult = 'pushed'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }, 1000)
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Preload then pushPath with different param ==========
          Button('Preload Then Push Diff Param')
            .id('btnPreloadThenPushDiff')
            .key('btnPreloadThenPushDiff')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_15', new NavParamTwo('PreloadParam')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stack.pushPath({ name: 'STANDARD_15', param: new NavParamTwo('DifferentParam') })
                setTimeout(() => {
                  this.pushAfterPreloadResult = 'pushed_diff'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }, 1000)
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Preload same name twice ==========
          Button('Preload Same Twice')
            .id('btnPreloadSameTwice')
            .key('btnPreloadSameTwice')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              let callCount: number = 0
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_16', new NavParamTwo('SameTwice1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                callCount++
                this.stack.preloadPath(
                  new NavPathInfo('STANDARD_16', new NavParamTwo('SameTwice2')),
                  { onDestroy: () => { this.onDestroyCalled = 'true' } }
                ).then(() => {
                  callCount++
                  this.preloadResult = 'success_' + String(callCount)
                  this.thenCalled = 'true'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }).catch((error: BusinessError) => {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                  this.errorCode = String(error.code)
                  this.errorMsg = error.message
                })
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Error 100005 - no builder registered for name ==========
          Button('Preload No Builder')
            .id('btnPreloadNoBuilder')
            .key('btnPreloadNoBuilder')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('NoBuilderPage', new NavParamTwo('NoBuilder')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== Preload with name-only NavPathInfo ==========
          Button('Preload Name Only')
            .id('btnPreloadNameOnly')
            .key('btnPreloadNameOnly')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_17', null),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })

          // ========== PreloadOptions.onDestroy not called on success ==========
          Button('Preload OnDestroy Not Called')
            .id('btnPreloadOnDestroyNotCalled')
            .key('btnPreloadOnDestroyNotCalled')
            .fontSize(16)
            .margin({ top: 10 } as Margin)
            .onClick(() => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_18', new NavParamTwo('NoDestroy')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: BusinessError) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                this.errorCode = String(error.code)
                this.errorMsg = error.message
              })
            })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .height('100%')
    }
    .navDestination(this.pageMap)
    .title('NavBar')
    .titleMode(NavigationTitleMode.Mini)
    .id('MyNavigation')
    .key('MyNavigation')
  }
}

@Component
struct NavDest {
  @State name: string = ''
  @State mode: NavDestinationMode = NavDestinationMode.STANDARD
  @State param: Object | undefined = undefined

  build() {
    NavDestination() {
      Column() {
        Text(this.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('Param: ' + (this.param ? JSON.stringify(this.param) : 'undefined'))
          .fontSize(16)
          .margin({ top: 10 } as Margin)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .mode(this.mode)
    .title(this.name)
  }
}
