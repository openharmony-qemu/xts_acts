import { Entry, Column,Builder, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, SymbolGlyphModifier, NavPathStack, Navigation, ColumnOptions,
  NavDestination, Navigation, LaunchMode, NavigationTitleMode, NavPathInfo} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State, Provide, Consume } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';


class NavParam {
  constructor(msg: string) {
    this.msg = msg
  }
  private msg: string = ''
}

@Entry
@Component
struct OnNewParamPage {
  @Provide stack: NavPathStack = new NavPathStack()


  @Builder
  pageMap(name: string) {
    if (name === 'aboutToAppear pageOne MOVE_TO_TOP_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'aboutToAppear',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.MOVE_TO_TOP_SINGLETON,
      })
    } else if (name === 'onReady pageOne STANDARD') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.STANDARD,
      })
    } else if (name === 'onReady pageTwo STANDARD') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageTwo',
        targetLaunchMode: LaunchMode.STANDARD,
      })
    } else if (name === 'onReady pageOne MOVE_TO_TOP_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.MOVE_TO_TOP_SINGLETON,
      })
    } else if (name === 'onReady pageTwo POP_TO_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageTwo',
        targetLaunchMode: LaunchMode.POP_TO_SINGLETON,
      })
    } else {
      Dest()
    }
  }

  build() {
    Column() {
      Column() {
  
      }
      Navigation(this.stack) {
        Button('pushPath pageOne')
          .onClick((e:ClickEvent) => {
  
          })
          .id('pushId')
          .height('10%')
      }
      .title('navBar')
      .titleMode(NavigationTitleMode.Mini)
      .navDestination(this.pageMap)
    }
  }
}


@Component
struct lifeCyclePush {
  @Consume stack: NavPathStack
  @State name: string = 'NA'
  pushLifeCycle: string = '__NA__'
  targetName: string = '__NA__'
  targetLaunchMode: LaunchMode = LaunchMode.STANDARD
  @Consume('paramString') paramString: string;

  launchModeToString(launchMode: LaunchMode) {
    if (launchMode === LaunchMode.STANDARD) {
      return 'STANDARD';
    } else if (launchMode === LaunchMode.NEW_INSTANCE) {
      return 'NEW_INSTANCE';
    } else if (launchMode === LaunchMode.POP_TO_SINGLETON) {
      return 'POP_TO_SINGLETON';
    } else if (launchMode === LaunchMode.MOVE_TO_TOP_SINGLETON) {
      return 'MOVE_TO_TOP_SINGLETON';
    } else {
      return 'NA';
    }
  }

  aboutToAppear(): void {
    if (this.pushLifeCycle === 'aboutToAppear' && this.targetName !== '__NA__') {

    }
  }

  build() {
    NavDestination() {
      NavBody()
    }
    .onReady((context) => {
      this.name = context.pathInfo.name
    })
    .onNewParam((param: Object|null|undefined):void => {
      this.paramString = JSON.stringify(param);
      console.log('TestTag', this.name, 'onNewParam, param: ' + JSON.stringify(param))
    })
  }
}

@Component
struct Dest {
  @Consume stack: NavPathStack
  @State name: string = 'NA'
  @Consume('paramString') paramString: string;

  build() {
    NavDestination() {
      NavBody()
    }
    .onReady((context) => {
      this.name = context.pathInfo.name
    })
    .onNewParam((param:  Object|null|undefined):void => {
      this.paramString = JSON.stringify(param);
      console.log('TestTag', this.name, 'onNewParam, param: ' + JSON.stringify(param))
    })
  }
}

@Component
struct NavBody {
  @Consume stack: NavPathStack
  build() {
    Column() {
      Button('STANDARD')
        .onClick((e:ClickEvent) => {

        })
        .id('standardId')
        .height('10%')
      Button('NEW_INSTANCE')
        .onClick((e:ClickEvent) => {

        })
        .id('instanceId')
        .height('10%')
      Button('MOVE_TO_TOP_SINGLETON')
        .onClick((e:ClickEvent) => {

        })
        .id('moveId')
        .height('10%')
      Button('POP_TO_SINGLETON')
        .onClick((e:ClickEvent) => {
 
        })
        .id('popId')
        .height('10%')
      }
      .width('100%')
  }
}