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

class RecycleNavigationModifier implements AttributeModifier<NavigationAttribute> {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({ recyclePagesOnLowMemory: true, stackSizeLimit: 0 });
    instance.recoverable(true);
  }
}

class NoRecycleNavigationModifier implements AttributeModifier<NavigationAttribute> {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({ recyclePagesOnLowMemory: false, stackSizeLimit: 0 });
    instance.recoverable(false);
  }
}

class StackLimitModifier implements AttributeModifier<NavigationAttribute> {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({ recyclePagesOnLowMemory: true, stackSizeLimit: 2 });
    instance.recoverable(true);
  }
}

@Entry
@Component
struct ModifierRecyclePage {
  @Provide('modNavPathStack') navPathStack: NavPathStack = new NavPathStack();
  @State modifierType: number = 0; // 0=recycle, 1=noRecycle, 2=stackLimit
  @State saveStateResult: string = '';
  @State restoreStateResult: string = '';
  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('modNavPathStack', this.navPathStack);
  }

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'modPageStandard') {
      ModRecyclePageStandard()
    } else if (name === 'modPageSaveRestore') {
      ModRecyclePageSaveRestore({
        onSaveStateCallback: () => {
          this.saveStateResult = 'modifier_called';
          AppStorage.setOrCreate<string>('modSaveStateResult', 'modifier_called');
        },
        onRestoreStateCallback: (state: Record<string, Object>) => {
          this.restoreStateResult = state ? 'modifier_called_with_data' : 'modifier_called_null';
          AppStorage.setOrCreate<string>('modRestoreStateResult', this.restoreStateResult);
        }
      })
    }
  }

  build() {
    Navigation(this.navPathStack) {
      Scroll() {
        Column() {
          // Toggle between recycle and no-recycle modifier
        Row() {
          Button('use_recycle_modifier')
            .id('use_recycle_modifier')
            .key('use_recycle_modifier')
            .onClick(() => {
              this.modifierType = 0;
            })
            .margin(5)

          Button('use_no_recycle_modifier')
            .id('use_no_recycle_modifier')
            .key('use_no_recycle_modifier')
            .onClick(() => {
              this.modifierType = 1;
            })
            .margin(5)

          Button('use_stack_limit_modifier')
            .id('use_stack_limit_modifier')
            .key('use_stack_limit_modifier')
            .onClick(() => {
              this.modifierType = 2;
            })
            .margin(5)
        }

        // --- Duplicate-key test isolation buttons (unique ids, same actions) ---
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('use_recycle_modifier_0400')
            .id('use_recycle_modifier_0400')
            .key('use_recycle_modifier_0400')
            .onClick(() => { this.modifierType = 0; })
            .margin(5)

          Button('use_recycle_modifier_0700')
            .id('use_recycle_modifier_0700')
            .key('use_recycle_modifier_0700')
            .onClick(() => { this.modifierType = 0; })
            .margin(5)

          Button('use_no_recycle_modifier_0500')
            .id('use_no_recycle_modifier_0500')
            .key('use_no_recycle_modifier_0500')
            .onClick(() => { this.modifierType = 1; })
            .margin(5)

          Button('use_stack_limit_modifier_0600')
            .id('use_stack_limit_modifier_0600')
            .key('use_stack_limit_modifier_0600')
            .onClick(() => { this.modifierType = 2; })
            .margin(5)
        }

        // Push pages
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('mod_push_standard')
            .id('mod_push_standard')
            .key('mod_push_standard')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'modPageStandard' });
            })
            .margin(5)

          Button('mod_push_standard_0500')
            .id('mod_push_standard_0500')
            .key('mod_push_standard_0500')
            .onClick(() => { this.navPathStack.pushPath({ name: 'modPageStandard' }); })
            .margin(5)

          Button('mod_push_standard_0600')
            .id('mod_push_standard_0600')
            .key('mod_push_standard_0600')
            .onClick(() => { this.navPathStack.pushPath({ name: 'modPageStandard' }); })
            .margin(5)

          Button('mod_push_standard_0800')
            .id('mod_push_standard_0800')
            .key('mod_push_standard_0800')
            .onClick(() => { this.navPathStack.pushPath({ name: 'modPageStandard' }); })
            .margin(5)

          Button('mod_push_standard_0900')
            .id('mod_push_standard_0900')
            .key('mod_push_standard_0900')
            .onClick(() => { this.navPathStack.pushPath({ name: 'modPageStandard' }); })
            .margin(5)

          Button('mod_push_saveRestore')
            .id('mod_push_saveRestore')
            .key('mod_push_saveRestore')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'modPageSaveRestore' });
            })
            .margin(5)
        }

        // Stack operations
        Row() {
          Button('mod_pop')
            .id('mod_pop_btn')
            .key('mod_pop_btn')
            .onClick(() => {
              this.navPathStack.pop();
            })
            .margin(5)

          Button('mod_clear')
            .id('mod_clear_btn')
            .key('mod_clear_btn')
            .onClick(() => {
              this.navPathStack.clear();
            })
            .margin(5)
        }

        // Stack info
        Row() {
          Button('mod_get_stack_size')
            .id('mod_get_stack_size')
            .key('mod_get_stack_size')
            .onClick(() => {
              AppStorage.setOrCreate<number>('modStackSize', this.navPathStack.size());
            })
            .margin(5)

          Button('mod_get_all_path_names')
            .id('mod_get_all_path_names')
            .key('mod_get_all_path_names')
            .onClick(() => {
              let names: string[] = this.navPathStack.getAllPathName();
              AppStorage.setOrCreate<string>('modAllPathNames', names.join(','));
            })
            .margin(5)
        }
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .title('ModifierRecycle')
    .navDestination(this.PageMap)
    .id('testModNavigation')
    .key('testModNavigation')
    .attributeModifier(
      this.modifierType === 0 ? new RecycleNavigationModifier() :
      this.modifierType === 1 ? new NoRecycleNavigationModifier() :
      new StackLimitModifier()
    )
  }
}

@Component
struct ModRecyclePageStandard {
  build() {
    NavDestination() {
      Column() {
        Text('ModStandardPage')
          .id('modStandardPageText')
          .key('modStandardPageText')
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
  }
}

@Component
struct ModRecyclePageSaveRestore {
  onSaveStateCallback: () => void = () => {};
  onRestoreStateCallback: (state: Record<string, Object>) => void = () => {};

  build() {
    NavDestination() {
      Column() {
        Text('ModSaveRestorePage')
          .id('modSaveRestorePageText')
          .key('modSaveRestorePageText')
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
    .onRestoreState((saveState: Record<string, Object>) => {
      this.onRestoreStateCallback(saveState);
      if (saveState) {
        AppStorage.setOrCreate<string>('modRestoredData', JSON.stringify(saveState));
      }
    })
  }
}
