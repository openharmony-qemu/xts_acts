'use static';
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

import {
  Entry, Component, Builder, Text, TextAttribute, Column, Button, ButtonAttribute, ClickEvent,
  Flex, Margin, FlexDirection, ItemAlign, FlexAlign, FlexWrap, HorizontalAlign, FontWeight, Navigation, NavDestination,
  NavPathStack, NavPathInfo, NavDestinationMode, NavigationTitleMode, Scroll, List, ListItem,
  Row, Stack, Padding, PopInfo, Color
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';

// BusinessError import kept for linker stability
// catch blocks use error.code/error.message directly (not as BusinessError) — works in both dynamic and static modes


class NavParamOne {
  public desc: string = 'NavParamOne'
  public color: string = '#ccc'
}

class NavParamTwo {
  public desc: string = 'NavParamTwo'
  constructor(desc?: string) {
    if (desc) { this.desc = desc; }
  }
}

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

  aboutToAppear(): void {
    AppStorage.setOrCreate<NavPathStack>('preloadNavPathStack', this.stack)
    this.stackNames = JSON.stringify(this.stack.getAllPathName())
  }

  resetState(): void {
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
  pageMap(name: string, param: Object|null|undefined) {
    if (name.startsWith('STANDARD')) {
      NavDest({ name: name, mode: NavDestinationMode.STANDARD, param: param ?? undefined })
    } else if (name.startsWith('DIALOG')) {
      NavDest({ name: name, mode: NavDestinationMode.DIALOG, param: param ?? undefined })
    }
  }

  build() {
    Column() {
      // === Top control panel - ALL buttons and status Text outside Navigation ===
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          // Status display texts (no prefix - tests read content attribute directly)
          Text(this.preloadResult)
            .id('preloadResult')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.onDestroyCalled)
            .id('onDestroyCalled')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.errorCode)
            .id('errorCode')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.errorMsg)
            .id('errorMsg')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.stackNames)
            .id('stackNames')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.thenCalled)
            .id('thenCalled')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.catchCalled)
            .id('catchCalled')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.onPopCalled)
            .id('onPopCalled')
            .fontSize(9)
            .height(20)
            .margin(1)
          Text(this.pushAfterPreloadResult)
            .id('pushAfterPreloadResult')
            .fontSize(9)
            .height(20)
            .margin(1)

          // Control buttons
          Button('pop')
            .id('preloadPopBtn')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pop();
              this.stackNames = JSON.stringify(this.stack.getAllPathName());
            })
            .margin(1)

          Button('clear')
            .id('preloadClearBtn')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.clear();
              this.resetState();
              this.stackNames = JSON.stringify(this.stack.getAllPathName());
            })
            .margin(1)

          // ========== Function call coverage ==========
          Button('Std')
            .id('btnPreloadStandard')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_1', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          Button('Dlg')
            .id('btnPreloadDialog')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('DIALOG_1', new NavParamTwo('ParamTag2')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Parameter coverage - NavPathInfo.param types ==========
          Button('StrP')
            .id('btnPreloadStringParam')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_2', 'stringParam'),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          Button('NumP')
            .id('btnPreloadNumberParam')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_3', 12345),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          Button('NoP')
            .id('btnPreloadNoParam')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_4', undefined),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Parameter coverage - PreloadOptions ==========
          Button('NoOpt')
            .id('btnPreloadNoOptions')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_5', new NavParamTwo('ParamTag5'))
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Parameter specification coverage - Error 401 ==========
          Button('Undef')
            .id('btnPreloadUndefined')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              let undefinedNavInfo = new NavPathInfo('', undefined);
              this.stack.preloadPath(undefinedNavInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } })
                .then(() => {
                  this.preloadResult = 'success'
                  this.thenCalled = 'true'
                }).catch((error: Error) => {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                  try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                  try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
                })
            })
            .margin(1)

          Button('EmptyN')
            .id('btnPreloadEmptyName')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Error 100005 - Builder not registered ==========
          Button('WrongN')
            .id('btnPreloadWrongName')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('PageWrong', new NavParamTwo('ParamTag1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Parameter spec coverage - null param ==========
          Button('NullP')
            .id('btnPreloadNullParam')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_6', undefined),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== NavPathInfo.onPop callback ==========
          Button('OnPop')
            .id('btnPreloadWithOnPop')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
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
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== NavPathInfo.isEntry ==========
          Button('IsEntryT')
            .id('btnPreloadIsEntryTrue')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              let navInfo: NavPathInfo = new NavPathInfo('STANDARD_12', new NavParamTwo('IsEntryTrue'));
              navInfo.isEntry = true;
              this.stack.preloadPath(navInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          Button('IsEntryF')
            .id('btnPreloadIsEntryFalse')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              let navInfo: NavPathInfo = new NavPathInfo('STANDARD_13', new NavParamTwo('IsEntryFalse'));
              navInfo.isEntry = false;
              this.stack.preloadPath(navInfo,
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Return value coverage ==========
          Button('ThenV')
            .id('btnPreloadThenVerify')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_7', new NavParamTwo('ThenVerify')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.thenCalled = 'true'
                this.preloadResult = 'success'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.catchCalled = 'true'
                this.preloadResult = 'error'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          Button('CatchV')
            .id('btnPreloadCatchVerify')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('nonexistent_route', new NavParamTwo('CatchVerify')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.thenCalled = 'true'
                this.preloadResult = 'success'
              }).catch((error: Error) => {
                this.catchCalled = 'true'
                this.preloadResult = 'error'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Error code 100006 - NavDestination not found ==========
          Button('NotFnd')
            .id('btnPreloadNotFound')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('UNKNOWN_DEST', undefined),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== PreloadOptions.onDestroy - trigger by clearing ==========
          Button('PClr')
            .id('btnPreloadThenClear')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
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
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Object param ==========
          Button('ObjP')
            .id('btnPreloadObjectParam')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              let paramObj = new NavParamOne()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_9', paramObj),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Multiple sequential preload (both STANDARD) ==========
          Button('Multi')
            .id('btnPreloadMultiple')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              let successCount: number = 0
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_10', new NavParamTwo('Multi1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                successCount++
                this.stack.preloadPath(
                  new NavPathInfo('STANDARD_10B', new NavParamTwo('Multi2')),
                  { onDestroy: () => { this.onDestroyCalled = 'true' } }
                ).then(() => {
                  successCount++
                  this.preloadResult = 'success_' + String(successCount)
                  this.thenCalled = 'true'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }).catch((error: Error) => {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                  try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                  try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
                })
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Preload then pushPath integration ==========
          Button('PushS')
            .id('btnPreloadThenPush')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_14', new NavParamTwo('PreloadPush')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
                // Push to same destination after preload
                this.stack.pushPath(new NavPathInfo('STANDARD_14', new NavParamTwo('PreloadPush')))
                setTimeout(() => {
                  this.pushAfterPreloadResult = 'pushed'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }, 1000)
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Preload then pushPath with different param ==========
          Button('PushD')
            .id('btnPreloadThenPushDiff')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_15', new NavParamTwo('PreloadParam')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                // Push with different param
                this.stack.pushPath(new NavPathInfo('STANDARD_15', new NavParamTwo('DifferentParam')))
                setTimeout(() => {
                  this.pushAfterPreloadResult = 'pushed_diff'
                  this.stackNames = JSON.stringify(this.stack.getAllPathName())
                }, 1000)
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Preload same name twice ==========
          Button('Same2')
            .id('btnPreloadSameTwice')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              let successCount: number = 0
              let failCount: number = 0
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_16', new NavParamTwo('SameTwice1')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                successCount++
              }).catch((error: Error) => {
                failCount++
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_16', new NavParamTwo('SameTwice2')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                successCount++
              }).catch((error: Error) => {
                failCount++
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
              setTimeout(() => {
                if (successCount === 2) {
                  this.preloadResult = 'success_2'
                  this.thenCalled = 'true'
                } else if (successCount === 1) {
                  this.preloadResult = 'success_1'
                  this.thenCalled = 'true'
                } else {
                  this.preloadResult = 'error'
                  this.catchCalled = 'true'
                }
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }, 3000)
            })
            .margin(1)

          // ========== Error 100005 - no builder registered for name ==========
          Button('NoBld')
            .id('btnPreloadNoBuilder')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              // 'NoBuilderPage' has no matching entry in pageMap
              this.stack.preloadPath(
                new NavPathInfo('NoBuilderPage', new NavParamTwo('NoBuilder')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== Preload with name-only NavPathInfo ==========
          Button('NameO')
            .id('btnPreloadNameOnly')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_17', undefined),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)

          // ========== PreloadOptions.onDestroy not called on success ==========
          Button('NoDstr')
            .id('btnPreloadOnDestroyNotCalled')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.resetState()
              this.stack.preloadPath(
                new NavPathInfo('STANDARD_18', new NavParamTwo('NoDestroy')),
                { onDestroy: () => { this.onDestroyCalled = 'true' } }
              ).then(() => {
                this.preloadResult = 'success'
                this.thenCalled = 'true'
                this.stackNames = JSON.stringify(this.stack.getAllPathName())
                // Do NOT clear the stack, so onDestroy should NOT be called
              }).catch((error: Error) => {
                this.preloadResult = 'error'
                this.catchCalled = 'true'
                try { this.errorCode = String(error.code) } catch (_e) { this.errorCode = '' }
                try { this.errorMsg = error.message } catch (_e) { this.errorMsg = '' }
              })
            })
            .margin(1)
        }
      }
      .width('100%')
      .height('55%')
      .border({ width: 2, color: Color.Black })

      Navigation(this.stack) {
        Column() {
          Text('NavigationPreload')
            .fontSize(16)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('45%')
      .navDestination(this.pageMap)
      .title('NavBar')
      .titleMode(NavigationTitleMode.Mini)
      .id('MyNavigation')
    }
    .width('100%')
    .height('100%')
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
