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
  NavigationMode,
  NavigationAttribute,
  Scroll,
  Column,
  Button,
  Text,
  Flex,
  FlexWrap,
  FlexAlign,
  ClickEvent,
  Padding,
  Color,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { NavigationModifier } from '@ohos.arkui.modifier';

class ModDisClearEnableModifier extends NavigationModifier {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({
      recyclePagesOnLowMemory: false,
      stackSizeLimit: 0,
      clearContentStackOnPrimaryNavigation: true
    });
  }
}

class ModDisClearDisableModifier extends NavigationModifier {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.configuration({
      recyclePagesOnLowMemory: false,
      stackSizeLimit: 0,
      clearContentStackOnPrimaryNavigation: false
    });
  }
}

@Entry
@Component
struct ModifierDisableClearTest {
  private stack: NavPathStack = new NavPathStack();
  @State enableClear: boolean = false;
  @State navMode: NavigationMode = NavigationMode.Stack;

  updateStackInfo(): void {
    AppStorage.setOrCreate<number>('clearModDisableStackSize', this.stack.size());
    let names: string[] = this.stack.getAllPathName();
    AppStorage.setOrCreate<string>('clearModDisableStackNames', names.join(','));
  }

  @Builder
  PageMap(name: string, param: Object | null | undefined) {
    if (name === 'modifierDisableDest') {
      ModifierDisableDestPage()
    }
  }

  build() {
    Column() {
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('clear_T')
            .id('enableClearTrue')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => { this.enableClear = true; })
            .margin(1)

          Button('clear_F')
            .id('enableClearFalse')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => { this.enableClear = false; })
            .margin(1)

          Button('split')
            .id('modeSplit')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => { this.navMode = NavigationMode.Split; })
            .margin(1)

          Button('push')
            .id('pushPath')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('modifierDisableDest', undefined));
              this.updateStackInfo();
            })
            .margin(1)

          Button('pop')
            .id('pop')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pop();
              this.updateStackInfo();
            })
            .margin(1)

          Button('clear')
            .id('clearModDisableStack')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.clear();
              this.updateStackInfo();
            })
            .margin(1)

          Button('get_sz')
            .id('clearModDisableGetStackSize')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => { this.updateStackInfo(); })
            .margin(1)
        }
      }
      .width('100%')
      .height('40%')
      .border({ width: 2, color: Color.Black })

      Navigation(this.stack) {
        Column() {
          Text('ModifierDisableClear')
            .fontSize(16)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('60%')
      .title('ModifierDisableClear')
      .mode(this.navMode)
      .navDestination(this.PageMap)
      .id('modifierDisableTestNavigation')
      .attributeModifier(
        this.enableClear ? new ModDisClearEnableModifier() : new ModDisClearDisableModifier()
      )
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct ModifierDisableDestPage {
  build() {
    NavDestination() {
      Column() {
        Text('ModifierDisableDestPage')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('ModifierDisableDest')
    .mode(NavDestinationMode.STANDARD)
    .onShown(() => {
      AppStorage.setOrCreate<string>('clearModDisableNavDestShown', 'modifierDisableDest');
    })
  }
}
