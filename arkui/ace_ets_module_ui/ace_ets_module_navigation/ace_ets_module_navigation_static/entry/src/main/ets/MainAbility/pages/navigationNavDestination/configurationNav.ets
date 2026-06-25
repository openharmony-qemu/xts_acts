'use static'
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
import { Entry, Text, Column, Component, Button, ClickEvent, ComponentV2, NavPathStack, Navigation,
  NavigationTitleMode, NavigationSystemTransitionType, NavDestinationMode, NavDestination, Scroll,
  Row, RowOptions, Color, ColumnOptions, NavPathInfo, ScrollEffectOptions, NavigationTitleOptions,
  NavigationMenuItem, NavigationCommonTitle, NavDestinationCommonTitle, Dimension, FontWeight, NavigationMode,
  ForEach, $r, ScrollEffectType, BarStyle,
  ReuseObject
} from '@ohos.arkui.component'
import { State, Provider, Param, Require, Local, Consumer, Consume } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

class StandardHelper {
  public static standardCnt: int = 0;
}

class NavParamOne {
  public desc: string = 'NavParamOne'
}

@Entry
@ComponentV2
struct configurationSaveState {
  @Provider('navigationStack') stack: NavPathStack = new NavPathStack()
  @Provider('stackSizeLimit') stackSizeLimit_: int = 1;
  @Provider('saveStateTxt') saveStateTxt: string = 'init'
  @Provider('restoreStateTxt') restoreStateTxt: string = 'init'
  @Local allDestinations: string = '[]'

  aboutToAppear(): void {
    this.getUIContext().getUIObserver().onNavDestinationUpdate(() => {
      this.allDestinations = JSON.stringify(this.stack.getAllPathName());
    })
  }

  @Builder
  pageMap(name: string) {
    if (name) {
      NavDest({
        name: name,
        mode: name.substring(0, 8) === 'STANDARD' ? NavDestinationMode.STANDARD : NavDestinationMode.DIALOG
      })
    }
  }

  build() {
    Column({space: 10} as ColumnOptions) {
      Text(this.allDestinations)
        .id('all_destinations_text')
        .fontSize(20)

      Navigation(this.stack) {
        NavBody()
      }
      .title('NavBar')
      .height('80%')
      .titleMode(NavigationTitleMode.Mini)
      .navDestination(this.pageMap)
      .configuration({stackSizeLimit: this.stackSizeLimit_})
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct NavDest {
  @Param name: string = ''
  @Param mode: NavDestinationMode = NavDestinationMode.STANDARD;
  @Consumer('saveStateTxt') saveStateTxt: string = '0'
  @Consumer('restoreStateTxt') restoreStateTxt: string = '0'

  build() {
    NavDestination() {
      Column() {
        Text(`onSaveState: ${this.saveStateTxt}`)
          .id('nav_save_state_text')
          .fontSize(14)
        Text(`onRestoreState: ${this.restoreStateTxt}`)
          .id('nav_restore_state_text')
          .fontSize(14)
        NavBody()
      }
    }
    .mode(this.mode)
    .title(this.name)
    .onSaveState(() => {
      this.saveStateTxt = 'success'
      console.info('[NavState]', `${this.name} onSaveState`);
      let record: Record<string, Object> = {
        'objOne': new NavParamOne(),
      };
      return record;
    })
    .onRestoreState((saveState: Record<String,Object>|null) => {
      this.restoreStateTxt = 'success'
      console.info('[NavState]', `${this.name} onRestoreState`);
      if (!saveState) {
        console.error('[NavState]', `-- save state is null or undefined`);
        return;
      }
      console.info('[NavState]', `-- save state: ${JSON.stringify(saveState)}`);
    })
  }
}

@ComponentV2
struct NavBody {
  @Consumer('navigationStack') stack: NavPathStack = new NavPathStack()
  @Consumer('stackSizeLimit') stackSizeLimit_: int = 0;

  build() {
    Scroll() {
      Column() {
        Button(`limit [${this.stackSizeLimit_}]`)
          .id('stack_limit_btn')
          .backgroundColor('#ccc')
        Row({space: 5} as RowOptions) {
          Button('push')
            .id('push_standard_btn')
            .onClick(() => {
              let name = 'STANDARD' + JSON.stringify(StandardHelper.standardCnt++)
              this.stack.pushPath(new NavPathInfo(name,null))
            })
          Button('replacePath')
            .id('replace_restore_btn')
            .onClick(() => {
              this.stack.replacePath(new NavPathInfo('NavParamOne',null))
            })
        }
        .border({width: 1})
        .padding(10)
        .margin(10)
      }

    }

  }
}