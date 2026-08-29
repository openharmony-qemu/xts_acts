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
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavBarDisableClearTest {
  private stack: NavPathStack = new NavPathStack();

  updateStackInfo(): void {
    AppStorage.setOrCreate<number>('clearDisableStackSize', this.stack.size());
    let names: string[] = this.stack.getAllPathName();
    AppStorage.setOrCreate<string>('clearDisableStackNames', names.join(','));
  }

  @Builder
  PageMap(name: string, param: Object | null | undefined) {
    if (name === 'navBarDisableDest') {
      NavBarDisableDestPage()
    }
  }

  build() {
    Column() {
      Scroll() {
        Flex({ wrap: FlexWrap.Wrap }) {
          Button('push')
            .id('pushPath')
            .fontSize(9)
            .height(24)
            .padding({ left: 2, right: 2, top: 1, bottom: 1 } as Padding)
            .onClick((e: ClickEvent) => {
              this.stack.pushPath(new NavPathInfo('navBarDisableDest', undefined));
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

          Button('get_sz')
            .id('clearDisableGetStackSize')
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
          Text('NavBarDisableClear')
            .fontSize(16)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('60%')
      .title('NavBarDisableClear')
      .navDestination(this.PageMap)
      .id('navBarDisableNavigation')
      .configuration({
        recyclePagesOnLowMemory: false,
        stackSizeLimit: 0,
        clearContentStackOnPrimaryNavigation: false
      })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct NavBarDisableDestPage {
  build() {
    NavDestination() {
      Column() {
        Text('NavBarDisableDestPage')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('NavBarDisableDest')
    .mode(NavDestinationMode.STANDARD)
    .onShown(() => {
      AppStorage.setOrCreate<string>('clearDisableNavDestShown', 'navBarDisableDest');
    })
  }
}
