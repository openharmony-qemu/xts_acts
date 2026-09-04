'use static';
import {
  Entry,
  Component,
  Builder,
  Navigation,
  NavDestination,
  NavPathStack,
  NavPathInfo,
  NavDestinationMode,
  NavigationTitleMode,
  NavigationAttribute,
  AttributeModifier,
  Scroll,
  Scroller,
  ScrollDirection,
  BarState,
  Column,
  ColumnOptions,
  Row,
  Button,
  ButtonType,
  Text,
  TextAlign,
  FontWeight,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FlexWrap,
  ForEach,
  Stack,
  OffsetResult,
  ClickEvent,
  Margin,
  Padding,
  Color,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

class NavParamOne {
  public desc: string = 'NavParamOne'
  public color: string = '#ccc'
}

class NavParamTwo {
  public desc: string = 'NavParamTwo'

  constructor(desc?: string) {
    if (desc) {
      this.desc = desc;
    }
  }
}

@Entry
@Component
struct NavigationRecyclePage {
  private stack: NavPathStack = new NavPathStack();
  @State navigationRecoverable: boolean = true;
  @State destRecoverable: boolean = true;
  @State recycleOnLowMemory: boolean = true;
  @State saveStateResult: string = '';
  @State restoreStateResult: string = '';
  @State stackSizeLimit: number = 0;
  @State clearContentStack: boolean = false;

  aboutToAppear(): void {
    this.updateStackInfo();
  }

  updateStackInfo(): void {
    AppStorage.setOrCreate<number>('recycleStackSize', this.stack.size());
    try {
      let names: string[] = this.stack.getAllPathName();
      AppStorage.setOrCreate<string>('recycleAllPathNames', names.join(','));
    } catch (e) {
      AppStorage.setOrCreate<string>('recycleAllPathNames', '');
    }
    // NOTE: getIndexByName, getParamByIndex, getParamByName are NOT called here
    // because in 'use static' mode they trigger Koala interop serialization which
    // can cause native-layer crashes (Resource deserialization error) that JS
    // try-catch cannot intercept. These APIs are only called via dedicated buttons.
  }

  @Builder
  PageMap(name: string, param: Object|null|undefined) {
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
        onRestoreStateCallback: (state: Record<string, Object> | null) => {
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
        onRestoreStateCallback: (state: Record<string, Object> | null) => {
          this.restoreStateResult = state ? 'called_B_with_data' : 'called_B_null';
          AppStorage.setOrCreate<string>('restoreStateResultB', this.restoreStateResult);
        }
      })
    }
  }

  build() {
    Column() {
      // === Top control panel - always visible above Navigation ===
      // All buttons OUTSIDE Navigation so they remain accessible after NavDestination push
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          // Push pages
          Button('push_std')
            .id('push_standard')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageStandard', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_dlg')
            .id('push_dialog')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageDialog', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_SR')
            .id('push_saveRestore')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageSaveRestore', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_SE')
            .id('push_saveEmpty')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageSaveEmpty', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_SRB')
            .id('push_saveRestoreB')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageSaveRestoreB', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_std_p')
            .id('push_standard_with_param')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageStandard', new NavParamTwo('ParamTag1')));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_dlg_p')
            .id('push_dialog_with_param')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageDialog', new NavParamTwo('ParamTag2')));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_3')
            .id('push_3_standard')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('pageStandard', undefined));
              this.stack.pushPath(new NavPathInfo('pageStandard', undefined));
              this.stack.pushPath(new NavPathInfo('pageStandard', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('push_5')
            .id('push_5_standard')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              for (let i = 0; i < 5; i++) {
                this.stack.pushPath(new NavPathInfo('pageStandard', undefined));
              }
              this.updateStackInfo();
            })
            .margin(1)

          // NavPathStack operations
          Button('pop')
            .id('recycle_pop_btn')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pop();
              this.updateStackInfo();
            })
            .margin(1)

          Button('clear')
            .id('recycle_clear_btn')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.clear();
              this.updateStackInfo();
            })
            .margin(1)

          // Stack info queries
          Button('get_size')
            .id('recycle_get_stack_size')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              AppStorage.setOrCreate<number>('recycleStackSize', this.stack.size());
            })
            .margin(1)

          Button('get_names')
            .id('recycle_get_all_path_names')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              try {
                let names: string[] = this.stack.getAllPathName();
                AppStorage.setOrCreate<string>('recycleAllPathNames', names.join(','));
              } catch (e) {
                AppStorage.setOrCreate<string>('recycleAllPathNames', '');
              }
            })
            .margin(1)

          Button('get_idx')
            .id('recycle_get_index_by_name')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              try {
                let indices = this.stack.getIndexByName('pageStandard');
                AppStorage.setOrCreate<string>('recycleIndexByName', JSON.stringify(indices));
              } catch (e) {
                AppStorage.setOrCreate<string>('recycleIndexByName', '[]');
              }
            })
            .margin(1)

          Button('get_pidx')
            .id('recycle_get_param_by_index')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              try {
                let param: Object | null | undefined = this.stack.size() > 0 ? this.stack.getParamByIndex(0) : null;
                AppStorage.setOrCreate<string>('recycleParamByIndex', param ? JSON.stringify(param) : 'undefined');
              } catch (e) {
                AppStorage.setOrCreate<string>('recycleParamByIndex', 'error');
              }
            })
            .margin(1)

          Button('get_pname')
            .id('recycle_get_param_by_name')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              try {
                let params: (Object | null | undefined)[] = this.stack.getParamByName('pageStandard');
                AppStorage.setOrCreate<string>('recycleParamByName', JSON.stringify(params));
              } catch (e) {
                AppStorage.setOrCreate<string>('recycleParamByName', 'error');
              }
            })
            .margin(1)

          // --- Navigation.recoverable toggle ---
          Button('nav_rec_T')
            .id('nav_recoverable_true')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.navigationRecoverable = true;
            })
            .margin(1)

          Button('nav_rec_F')
            .id('nav_recoverable_false')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.navigationRecoverable = false;
            })
            .margin(1)

          // --- NavDestination.recoverable toggle ---
          Button('dest_T')
            .id('dest_recoverable_true')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.destRecoverable = true;
            })
            .margin(1)

          Button('dest_F')
            .id('dest_recoverable_false')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.destRecoverable = false;
            })
            .margin(1)

          // --- recyclePagesOnLowMemory toggle ---
          Button('mem_T')
            .id('recycle_memory_true')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.recycleOnLowMemory = true;
            })
            .margin(1)

          Button('mem_F')
            .id('recycle_memory_false')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.recycleOnLowMemory = false;
            })
            .margin(1)

          // --- stackSizeLimit toggle ---
          Button('lim_0')
            .id('stack_limit_0')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stackSizeLimit = 0;
            })
            .margin(1)

          Button('lim_1')
            .id('stack_limit_1')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stackSizeLimit = 1;
            })
            .margin(1)

          Button('lim_3')
            .id('stack_limit_3')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stackSizeLimit = 3;
            })
            .margin(1)

          Button('lim_-1')
            .id('stack_limit_minus1')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stackSizeLimit = -1;
            })
            .margin(1)

          // --- clearContentStackOnPrimaryNavigation toggle ---
          Button('clr_T')
            .id('clear_stack_true')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.clearContentStack = true;
            })
            .margin(1)

          Button('clr_F')
            .id('clear_stack_false')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.clearContentStack = false;
            })
            .margin(1)
        }
      }
      .width('100%')
      .height('55%')
      .border({ width: 2, color: Color.Black })

      // === Navigation below the control panel ===
      Navigation(this.stack) {
        Column() {
          Text('NavigationRecycle')
            .fontSize(16)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('45%')
      .navDestination(this.PageMap)
      .id('testNavigation')
      .recoverable(this.navigationRecoverable)
      .configuration({
        recyclePagesOnLowMemory: this.recycleOnLowMemory,
        stackSizeLimit: this.stackSizeLimit === 0 ? 0 :
          this.stackSizeLimit === 1 ? 1 :
          this.stackSizeLimit === 3 ? 3 : -1,
        clearContentStackOnPrimaryNavigation: this.clearContentStack
      })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct RecyclePageStandard {
  destRecoverable: boolean = true;

  build() {
    NavDestination() {
      Column() {
        Text('StandardPage')
          .id('standardPageText')
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
  destRecoverable: boolean = true;

  build() {
    NavDestination() {
      Column() {
        Text('DialogPage')
          .id('dialogPageText')
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
  destRecoverable: boolean = true;
  onSaveStateCallback: () => void = () => {};
  onRestoreStateCallback: (state: Record<string, Object> | null) => void = () => {};
  @State scrollOffset: OffsetResult = { xOffset: 0, yOffset: 0 } as OffsetResult;
  scroller: Scroller = new Scroller();

  build() {
    NavDestination() {
      Column() {
        Text('SaveRestorePage')
          .id('saveRestorePageText')
          .fontSize(20)

        Scroll(this.scroller) {
          Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[], (item: number) => {
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
          this.scrollOffset = this.scroller.currentOffset()!;
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
    .onRestoreState((saveState: Record<string, Object> | null) => {
      this.onRestoreStateCallback(saveState);
      if (saveState) {
        let offsetObj = saveState['scrollOffset'];
        if (offsetObj) {
          this.scrollOffset = offsetObj as OffsetResult;
        }
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
  destRecoverable: boolean = true;
  onSaveStateCallback: () => void = () => {};

  build() {
    NavDestination() {
      Column() {
        Text('SaveEmptyPage')
          .id('saveEmptyPageText')
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
    .onRestoreState((saveState: Record<string, Object> | null) => {
      AppStorage.setOrCreate<string>('restoreEmptyResult',
        saveState ? 'called_with_data' : 'called_null');
    })
  }
}

@Component
struct RecyclePageSaveRestoreB {
  destRecoverable: boolean = true;
  onSaveStateCallback: () => void = () => {};
  onRestoreStateCallback: (state: Record<string, Object> | null) => void = () => {};

  build() {
    NavDestination() {
      Column() {
        Text('SaveRestorePageB')
          .id('saveRestorePageBText')
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
    .onRestoreState((saveState: Record<string, Object> | null) => {
      this.onRestoreStateCallback(saveState);
      if (saveState) {
        AppStorage.setOrCreate<string>('restoredDataB', JSON.stringify(saveState));
      }
    })
  }
}
