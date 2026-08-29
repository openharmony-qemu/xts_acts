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
  Column,
  Row,
  Button,
  ButtonType,
  ClickEvent,
  Text,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FlexWrap,
  FontWeight,
  ForEach,
  Stack,
  Color,
  Padding,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { NavigationModifier, NavDestinationModifier } from '@ohos.arkui.modifier';

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

class RecycleNavigationModifier extends NavigationModifier {
  constructor() {
    super()
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({ recyclePagesOnLowMemory: true, stackSizeLimit: 0 });
    instance.recoverable(true);
  }
}

class NoRecycleNavigationModifier extends NavigationModifier {
  constructor() {
    super()
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({ recyclePagesOnLowMemory: false, stackSizeLimit: 0 });
    instance.recoverable(false);
  }
}

class StackLimitModifier extends NavigationModifier {
  constructor() {
    super()
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({ recyclePagesOnLowMemory: true, stackSizeLimit: 2 });
    instance.recoverable(true);
  }
}

class ClearStackModifier extends NavigationModifier {
  constructor() {
    super()
  }

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({
      recyclePagesOnLowMemory: true,
      stackSizeLimit: 0,
      clearContentStackOnPrimaryNavigation: true
    });
    instance.recoverable(true);
  }
}

@Entry
@Component
struct ModifierRecyclePage {
  private stack: NavPathStack = new NavPathStack();
  @State modifierType: number = 0; // 0=recycle, 1=noRecycle, 2=stackLimit, 3=clearStack
  @State saveStateResult: string = '';
  @State restoreStateResult: string = '';

  updateModStackInfo(): void {
    AppStorage.setOrCreate<number>('modStackSize', this.stack.size());
    let names: string[] = this.stack.getAllPathName();
    AppStorage.setOrCreate<string>('modAllPathNames', names.join(','));
  }

  @Builder
  PageMap(name: string, param: Object|null|undefined) {
    if (name === 'modPageStandard') {
      ModRecyclePageStandard()
    } else if (name === 'modPageSaveRestore') {
      ModRecyclePageSaveRestore({
        onSaveStateCallback: () => {
          this.saveStateResult = 'modifier_called';
          AppStorage.setOrCreate<string>('modSaveStateResult', 'modifier_called');
        },
        onRestoreStateCallback: (state: Record<string, Object> | null) => {
          this.restoreStateResult = state ? 'modifier_called_with_data' : 'modifier_called_null';
          AppStorage.setOrCreate<string>('modRestoreStateResult', this.restoreStateResult);
        }
      })
    }
  }

  build() {
    Column() {
      // === Top control panel - always visible above Navigation ===
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          // Modifier type toggle (must be outside Navigation for post-push access)
          Button('mod_recycle')
            .id('use_recycle_modifier')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.modifierType = 0;
            })
            .margin(1)

          Button('mod_noRec')
            .id('use_no_recycle_modifier')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.modifierType = 1;
            })
            .margin(1)

          Button('mod_limStk')
            .id('use_stack_limit_modifier')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.modifierType = 2;
            })
            .margin(1)

          Button('mod_clrStk')
            .id('use_clear_stack_modifier')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.modifierType = 3;
            })
            .margin(1)

          // Push pages (must be outside Navigation for post-push access)
          Button('m_push_std')
            .id('mod_push_standard')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('modPageStandard', undefined));
              this.updateModStackInfo();
            })
            .margin(1)

          Button('m_push_SR')
            .id('mod_push_saveRestore')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('modPageSaveRestore', undefined));
              this.updateModStackInfo();
            })
            .margin(1)

          // Stack operations
          Button('m_pop')
            .id('mod_pop_btn')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pop();
              this.updateModStackInfo();
            })
            .margin(1)

          Button('m_clear')
            .id('mod_clear_btn')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.clear();
              this.updateModStackInfo();
            })
            .margin(1)

          // Stack info
          Button('m_get_sz')
            .id('mod_get_stack_size')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              AppStorage.setOrCreate<number>('modStackSize', this.stack.size());
            })
            .margin(1)

          Button('m_get_nm')
            .id('mod_get_all_path_names')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              let names: string[] = this.stack.getAllPathName();
              AppStorage.setOrCreate<string>('modAllPathNames', names.join(','));
            })
            .margin(1)
        }
      }
      .width('100%')
      .height('40%')
      .border({ width: 2, color: Color.Black })

      // === Navigation below the control panel ===
      Navigation(this.stack) {
        Column() {
          Text('ModifierRecycle')
            .fontSize(16)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('60%')
      .title('ModifierRecycle')
      .navDestination(this.PageMap)
      .id('testModNavigation')
      .attributeModifier(
        this.modifierType === 0 ? new RecycleNavigationModifier() :
        this.modifierType === 1 ? new NoRecycleNavigationModifier() :
        this.modifierType === 2 ? new StackLimitModifier() :
        new ClearStackModifier()
      )
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct ModRecyclePageStandard {
  build() {
    NavDestination() {
      Column() {
        Text('ModStandardPage')
          .id('modStandardPageText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('ModStandardPage')
    .mode(NavDestinationMode.STANDARD)
    .recoverable(true)
    .onShown(() => {
      AppStorage.setOrCreate<string>('modNavDestShown', 'modStandardPage');
    })
  }
}

@Component
struct ModRecyclePageSaveRestore {
  onSaveStateCallback: () => void = () => {};
  onRestoreStateCallback: (state: Record<string, Object> | null) => void = () => {};

  build() {
    NavDestination() {
      Column() {
        Text('ModSaveRestorePage')
          .id('modSaveRestorePageText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('ModSaveRestorePage')
    .mode(NavDestinationMode.STANDARD)
    .recoverable(true)
    .onSaveState(() => {
      this.onSaveStateCallback();
      let record: Record<string, Object> = {
        'objOne': new NavParamOne(),
        'objTwo': new NavParamTwo(),
      };
      return record;
    })
    .onRestoreState((saveState: Record<string, Object> | null) => {
      this.onRestoreStateCallback(saveState);
      if (saveState) {
        AppStorage.setOrCreate<string>('modRestoredData', JSON.stringify(saveState));
      }
    })
    .onShown(() => {
      AppStorage.setOrCreate<string>('modNavDestShown', 'modSaveRestorePage');
    })
  }
}
