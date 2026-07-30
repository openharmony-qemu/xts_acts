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

class StandardHelper {
  public static standardCnt: number = 0;
}

class NavParamOne {
  public desc: string = 'NavParamOne'
}

@Entry
@ComponentV2
struct configurationSaveState {
  @Provider('navigationStack') stack: NavPathStack = new NavPathStack()
  @Provider('stackSizeLimit') stackSizeLimit_: number = 1;
  @Provider('saveStateTxt') saveStateTxt: string = 'init'
  @Provider('restoreStateTxt') restoreStateTxt: string = 'init'
  @Local allDestinations: string = '[]'

  aboutToAppear(): void {
    this.getUIContext().getUIObserver().on('navDestinationUpdate', () => {
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
    Column() {
      Text(this.allDestinations)
        .id('all_destinations_text')
        .fontSize(20)
      
      Navigation(this.stack) {
        Button('stackSizeLimit undefined')
      }
      .title('undefined')
      .height('5%')
      .titleMode(NavigationTitleMode.Mini)
      .navDestination(this.pageMap)
      .configuration({stackSizeLimit: undefined})

      Navigation(this.stack) {
        Button('stackSizeLimit null')
      }
      .title('null')
      .height('5%')
      .titleMode(NavigationTitleMode.Mini)
      .navDestination(this.pageMap)
      .configuration({stackSizeLimit: null})

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
    .onRestoreState((saveState: Record<string, Object>) => {
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
  @Consumer('stackSizeLimit') stackSizeLimit_: number = 0;

  build() {
    Scroll() {
      Column() {
        Button(`limit [${this.stackSizeLimit_}]`)
          .id('stack_limit_btn')
          .backgroundColor('#ccc')
        Row({space: 5}) {
          Button('push')
            .id('push_standard_btn')
            .onClick(() => {
              this.stack.pushPath({name: 'STANDARD ' + JSON.stringify(StandardHelper.standardCnt++)})
            })
          Button('replacePath')
            .id('replace_restore_btn')
            .onClick(() => {
              this.stack.replacePath({name: 'NavParamOne'})
            })
        }
        .border({width: 1})
        .padding(10)
        .margin(10)
      }

    }

  }
}