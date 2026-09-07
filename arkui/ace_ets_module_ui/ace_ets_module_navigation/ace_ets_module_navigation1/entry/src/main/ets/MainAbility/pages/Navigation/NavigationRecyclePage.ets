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

import { NavParamOne, NavParamTwo } from '../../common/NavParamModel';

@Entry
@Component
struct NavigationRecyclePage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();
  @State navigationRecoverable: boolean = true;
  @State destRecoverable: boolean = true;
  @State recycleOnLowMemory: boolean = true;
  @State stackSizeLimit: number = 0;
  @State saveStateResult: string = '';
  @State restoreStateResult: string = '';
  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageStandard') {
      RecyclePageStandard({ destRecoverable: this.destRecoverable })
    } else if (name === 'pageDialog') {
      RecyclePageDialog({ destRecoverable: this.destRecoverable })
    } else if (name === 'pageSaveRestore') {
      RecyclePageSaveRestore({
        destRecoverable: this.destRecoverable,
        onSaveStateCallback: () => {
          this.saveStateResult = 'called';
          AppStorage.setOrCreate<string>('saveStateResult', 'called');
        },
        onRestoreStateCallback: (state: Record<string, Object>) => {
          this.restoreStateResult = state ? 'called_with_data' : 'called_null';
          AppStorage.setOrCreate<string>('restoreStateResult', this.restoreStateResult);
        }
      })
    } else if (name === 'pageSaveEmpty') {
      RecyclePageSaveEmpty({
        destRecoverable: this.destRecoverable,
        onSaveStateCallback: () => {
          this.saveStateResult = 'called_empty';
          AppStorage.setOrCreate<string>('saveStateResult', 'called_empty');
        }
      })
    } else if (name === 'pageSaveRestoreB') {
      RecyclePageSaveRestoreB({
        destRecoverable: this.destRecoverable,
        onSaveStateCallback: () => {
          this.saveStateResult = 'called_B';
          AppStorage.setOrCreate<string>('saveStateResultB', 'called_B');
        },
        onRestoreStateCallback: (state: Record<string, Object>) => {
          this.restoreStateResult = state ? 'called_B_with_data' : 'called_B_null';
          AppStorage.setOrCreate<string>('restoreStateResultB', this.restoreStateResult);
        }
      })
    }
  }

  build() {
    Navigation(this.navPathStack) {
      Scroll() {
      Column() {
        // --- Navigation.recoverable toggle ---
        Row() {
          Button('nav_recoverable_true')
            .id('nav_recoverable_true')
            .key('nav_recoverable_true')
            .onClick(() => {
              this.navigationRecoverable = true;
            })
            .margin(5)

          Button('nav_recoverable_false')
            .id('nav_recoverable_false')
            .key('nav_recoverable_false')
            .onClick(() => {
              this.navigationRecoverable = false;
            })
            .margin(5)
        }

        // --- NavDestination.recoverable toggle ---
        Row() {
          Button('dest_recoverable_true')
            .id('dest_recoverable_true')
            .key('dest_recoverable_true')
            .onClick(() => {
              this.destRecoverable = true;
            })
            .margin(5)

          Button('dest_recoverable_false')
            .id('dest_recoverable_false')
            .key('dest_recoverable_false')
            .onClick(() => {
              this.destRecoverable = false;
            })
            .margin(5)
        }

        // --- recyclePagesOnLowMemory toggle ---
        Row() {
          Button('recycle_memory_true')
            .id('recycle_memory_true')
            .key('recycle_memory_true')
            .onClick(() => {
              this.recycleOnLowMemory = true;
            })
            .margin(5)

          Button('recycle_memory_false')
            .id('recycle_memory_false')
            .key('recycle_memory_false')
            .onClick(() => {
              this.recycleOnLowMemory = false;
            })
            .margin(5)
        }

        // --- stackSizeLimit toggle ---
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('stack_limit_0')
            .id('stack_limit_0')
            .key('stack_limit_0')
            .onClick(() => {
              this.stackSizeLimit = 0;
            })
            .margin(5)

          Button('stack_limit_1')
            .id('stack_limit_1')
            .key('stack_limit_1')
            .onClick(() => {
              this.stackSizeLimit = 1;
            })
            .margin(5)

          Button('stack_limit_3')
            .id('stack_limit_3')
            .key('stack_limit_3')
            .onClick(() => {
              this.stackSizeLimit = 3;
            })
            .margin(5)

          Button('stack_limit_minus1')
            .id('stack_limit_minus1')
            .key('stack_limit_minus1')
            .onClick(() => {
              this.stackSizeLimit = -1;
            })
            .margin(5)
        }

        // --- Push NavDestination pages ---
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('push_standard')
            .id('push_standard')
            .key('push_standard')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard' });
            })
            .margin(5)

          Button('push_dialog')
            .id('push_dialog')
            .key('push_dialog')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageDialog' });
            })
            .margin(5)

          Button('push_saveRestore')
            .id('push_saveRestore')
            .key('push_saveRestore')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageSaveRestore' });
            })
            .margin(5)

          Button('push_saveEmpty')
            .id('push_saveEmpty')
            .key('push_saveEmpty')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageSaveEmpty' });
            })
            .margin(5)

          Button('push_saveRestoreB')
            .id('push_saveRestoreB')
            .key('push_saveRestoreB')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageSaveRestoreB' });
            })
            .margin(5)
        }

        // --- Push multiple pages for stackSizeLimit test ---
        Row() {
          Button('push_3_standard')
            .id('push_3_standard')
            .key('push_3_standard')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
            })
            .margin(5)

          Button('push_5_standard')
            .id('push_5_standard')
            .key('push_5_standard')
            .onClick(() => {
              for (let i = 0; i < 5; i++) {
                this.navPathStack.pushPath({ name: 'pageStandard' });
              }
            })
            .margin(5)
        }

        // --- NavPathStack operations ---
        Row() {
          Button('pop')
            .id('recycle_pop_btn')
            .key('recycle_pop_btn')
            .onClick(() => {
              this.navPathStack.pop();
            })
            .margin(5)

          Button('clear')
            .id('recycle_clear_btn')
            .key('recycle_clear_btn')
            .onClick(() => {
              this.navPathStack.clear();
            })
            .margin(5)
        }

        // --- Duplicate-key test isolation buttons (unique ids, same actions) ---
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('nav_recoverable_true_0800')
            .id('nav_recoverable_true_0800')
            .key('nav_recoverable_true_0800')
            .onClick(() => { this.navigationRecoverable = true; })
            .margin(5)

          Button('nav_recoverable_false_0900')
            .id('nav_recoverable_false_0900')
            .key('nav_recoverable_false_0900')
            .onClick(() => { this.navigationRecoverable = false; })
            .margin(5)

          Button('recycle_memory_true_1000')
            .id('recycle_memory_true_1000')
            .key('recycle_memory_true_1000')
            .onClick(() => { this.recycleOnLowMemory = true; })
            .margin(5)

          Button('recycle_memory_false_1100')
            .id('recycle_memory_false_1100')
            .key('recycle_memory_false_1100')
            .onClick(() => { this.recycleOnLowMemory = false; })
            .margin(5)
        }

        Flex({ wrap: FlexWrap.Wrap }) {
          Button('push_standard_0600')
            .id('push_standard_0600')
            .key('push_standard_0600')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_0800')
            .id('push_standard_0800')
            .key('push_standard_0800')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_0900')
            .id('push_standard_0900')
            .key('push_standard_0900')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_1000')
            .id('push_standard_1000')
            .key('push_standard_1000')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_1100')
            .id('push_standard_1100')
            .key('push_standard_1100')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_1200')
            .id('push_standard_1200')
            .key('push_standard_1200')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)
        }

        Flex({ wrap: FlexWrap.Wrap }) {
          Button('push_standard_2500')
            .id('push_standard_2500')
            .key('push_standard_2500')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_2600')
            .id('push_standard_2600')
            .key('push_standard_2600')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_2700')
            .id('push_standard_2700')
            .key('push_standard_2700')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_standard_3000')
            .id('push_standard_3000')
            .key('push_standard_3000')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageStandard' }); })
            .margin(5)

          Button('push_saveRestore_1400')
            .id('push_saveRestore_1400')
            .key('push_saveRestore_1400')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageSaveRestore' }); })
            .margin(5)

          Button('push_saveRestore_2200')
            .id('push_saveRestore_2200')
            .key('push_saveRestore_2200')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageSaveRestore' }); })
            .margin(5)

          Button('push_saveRestore_2300')
            .id('push_saveRestore_2300')
            .key('push_saveRestore_2300')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageSaveRestore' }); })
            .margin(5)
        }

        Flex({ wrap: FlexWrap.Wrap }) {
          Button('push_standard_with_param_2800')
            .id('push_standard_with_param_2800')
            .key('push_standard_with_param_2800')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard', param: new NavParamTwo('ParamTag1') });
            })
            .margin(5)

          Button('push_standard_with_param_2900')
            .id('push_standard_with_param_2900')
            .key('push_standard_with_param_2900')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard', param: new NavParamTwo('ParamTag1') });
            })
            .margin(5)

          Button('push_3_standard_1900')
            .id('push_3_standard_1900')
            .key('push_3_standard_1900')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
            })
            .margin(5)

          Button('push_3_standard_2000')
            .id('push_3_standard_2000')
            .key('push_3_standard_2000')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
            })
            .margin(5)

          Button('push_3_standard_3100')
            .id('push_3_standard_3100')
            .key('push_3_standard_3100')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
              this.navPathStack.pushPath({ name: 'pageStandard' });
            })
            .margin(5)

          Button('recycle_pop_btn_2200')
            .id('recycle_pop_btn_2200')
            .key('recycle_pop_btn_2200')
            .onClick(() => { this.navPathStack.pop(); })
            .margin(5)

          Button('recycle_pop_btn_3000')
            .id('recycle_pop_btn_3000')
            .key('recycle_pop_btn_3000')
            .onClick(() => { this.navPathStack.pop(); })
            .margin(5)
        }

        // --- Stack info queries ---
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('get_stack_size')
            .id('recycle_get_stack_size')
            .key('recycle_get_stack_size')
            .onClick(() => {
              AppStorage.setOrCreate<number>('recycleStackSize', this.navPathStack.size());
            })
            .margin(5)

          Button('get_all_path_names')
            .id('recycle_get_all_path_names')
            .key('recycle_get_all_path_names')
            .onClick(() => {
              let names: string[] = this.navPathStack.getAllPathName();
              AppStorage.setOrCreate<string>('recycleAllPathNames', names.join(','));
            })
            .margin(5)

          Button('get_index_by_name')
            .id('recycle_get_index_by_name')
            .key('recycle_get_index_by_name')
            .onClick(() => {
              let indices: number[] = this.navPathStack.getIndexByName('pageStandard');
              AppStorage.setOrCreate<string>('recycleIndexByName', JSON.stringify(indices));
            })
            .margin(5)

          Button('get_param_by_index')
            .id('recycle_get_param_by_index')
            .key('recycle_get_param_by_index')
            .onClick(() => {
              let param: Object | undefined = this.navPathStack.getParamByIndex(0) as Object;
              AppStorage.setOrCreate<string>('recycleParamByIndex', param ? JSON.stringify(param) : 'undefined');
            })
            .margin(5)

          Button('get_param_by_name')
            .id('recycle_get_param_by_name')
            .key('recycle_get_param_by_name')
            .onClick(() => {
              let params: Object[] = this.navPathStack.getParamByName('pageStandard') as Object[];
              AppStorage.setOrCreate<string>('recycleParamByName', JSON.stringify(params));
            })
            .margin(5)
        }

        // --- Push with param ---
        Row() {
          Button('push_standard_with_param')
            .id('push_standard_with_param')
            .key('push_standard_with_param')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageStandard', param: new NavParamTwo('ParamTag1') });
            })
            .margin(5)

          Button('push_dialog_with_param')
            .id('push_dialog_with_param')
            .key('push_dialog_with_param')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageDialog', param: new NavParamTwo('ParamTag2') });
            })
            .margin(5)
        }

        // --- Isolation buttons for 3900 ---
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('recycle_memory_true_3900')
            .id('recycle_memory_true_3900')
            .key('recycle_memory_true_3900')
            .onClick(() => { this.recycleOnLowMemory = true; })
            .margin(5)

          Button('nav_recoverable_true_3900')
            .id('nav_recoverable_true_3900')
            .key('nav_recoverable_true_3900')
            .onClick(() => { this.navigationRecoverable = true; })
            .margin(5)

          Button('push_saveRestore_3900')
            .id('push_saveRestore_3900')
            .key('push_saveRestore_3900')
            .onClick(() => { this.navPathStack.pushPath({ name: 'pageSaveRestore' }); })
            .margin(5)
        }
      }
      .width('100%')
      }
      .width('100%')
      .height('100%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .title('NavigationRecycle')
    .navDestination(this.PageMap)
    .id('testNavigation')
    .key('testNavigation')
    .recoverable(this.navigationRecoverable)
    .configuration({
      recyclePagesOnLowMemory: this.recycleOnLowMemory,
      stackSizeLimit: this.stackSizeLimit
    })
  }
}

@Component
struct RecyclePageStandard {
  @Prop destRecoverable: boolean = true;

  build() {
    NavDestination() {
      Column() {
        Text('StandardPage')
          .id('standardPageText')
          .key('standardPageText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('StandardPage')
    .mode(NavDestinationMode.STANDARD)
    .recoverable(this.destRecoverable)
  }
}

@Component
struct RecyclePageDialog {
  @Prop destRecoverable: boolean = true;

  build() {
    NavDestination() {
      Column() {
        Text('DialogPage')
          .id('dialogPageText')
          .key('dialogPageText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('DialogPage')
    .mode(NavDestinationMode.DIALOG)
    .recoverable(this.destRecoverable)
  }
}

@Component
struct RecyclePageSaveRestore {
  @Prop destRecoverable: boolean = true;
  onSaveStateCallback: () => void = () => {};
  onRestoreStateCallback: (state: Record<string, Object>) => void = () => {};
  @State scrollOffset: OffsetResult = { xOffset: 0, yOffset: 0 };
  scroller: Scroller = new Scroller();

  build() {
    NavDestination() {
      Column() {
        Text('SaveRestorePage')
          .id('saveRestorePageText')
          .key('saveRestorePageText')
          .fontSize(20)

        Scroll(this.scroller) {
          Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
              Text(item.toString())
                .width('90%')
                .height(150)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item: number) => item.toString())
          }.width('100%')
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .onScrollStop(() => {
          this.scrollOffset = this.scroller.currentOffset();
        })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .title('SaveRestorePage')
    .mode(NavDestinationMode.STANDARD)
    .recoverable(this.destRecoverable)
    .onSaveState(() => {
      this.onSaveStateCallback();
      let record: Record<string, Object> = {
        'objOne': new NavParamOne(),
        'objTwo': new NavParamTwo(),
        'scrollOffset': this.scrollOffset,
        'string': 'myString',
        'bool': true,
        'vector': [10, 10]
      };
      return record;
    })
    .onRestoreState((saveState: Record<string, Object>) => {
      this.onRestoreStateCallback(saveState);
      if (saveState) {
        this.scrollOffset = saveState['scrollOffset'] as OffsetResult;
        AppStorage.setOrCreate<string>('restoredScrollOffset',
          JSON.stringify(this.scrollOffset));
      }
    })
    .onShown(() => {
      this.scroller.scrollTo({ xOffset: this.scrollOffset.xOffset, yOffset: this.scrollOffset.yOffset });
    })
  }
}

@Component
struct RecyclePageSaveEmpty {
  @Prop destRecoverable: boolean = true;
  onSaveStateCallback: () => void = () => {};

  build() {
    NavDestination() {
      Column() {
        Text('SaveEmptyPage')
          .id('saveEmptyPageText')
          .key('saveEmptyPageText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('SaveEmptyPage')
    .mode(NavDestinationMode.STANDARD)
    .recoverable(this.destRecoverable)
    .onSaveState(() => {
      this.onSaveStateCallback();
      let record: Record<string, Object> = {};
      return record;
    })
    .onRestoreState((saveState: Record<string, Object>) => {
      AppStorage.setOrCreate<string>('restoreEmptyResult',
        saveState ? 'called_with_data' : 'called_null');
    })
  }
}

@Component
struct RecyclePageSaveRestoreB {
  @Prop destRecoverable: boolean = true;
  onSaveStateCallback: () => void = () => {};
  onRestoreStateCallback: (state: Record<string, Object>) => void = () => {};

  build() {
    NavDestination() {
      Column() {
        Text('SaveRestorePageB')
          .id('saveRestorePageBText')
          .key('saveRestorePageBText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('SaveRestorePageB')
    .mode(NavDestinationMode.STANDARD)
    .recoverable(this.destRecoverable)
    .onSaveState(() => {
      this.onSaveStateCallback();
      let record: Record<string, Object> = {
        'pageBKey': 'pageBValue'
      };
      return record;
    })
    .onRestoreState((saveState: Record<string, Object>) => {
      this.onRestoreStateCallback(saveState);
      if (saveState) {
        AppStorage.setOrCreate<string>('restoredDataB', JSON.stringify(saveState));
      }
    })
  }
}
