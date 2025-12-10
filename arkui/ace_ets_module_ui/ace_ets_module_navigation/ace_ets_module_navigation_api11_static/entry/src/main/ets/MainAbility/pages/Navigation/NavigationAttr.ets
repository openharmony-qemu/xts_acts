'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,AnimateParam,NavPathInfo,
  NavigationTitleMode,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,NavigationTransitionProxy,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, NavContentInfo,NavigationOperation,NavigationAnimatedTransition
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { CustomTransition, AnimateCallback } from './common/CustomNavigationUtils'
@Entry
@Component
struct NavigationApi1 {
  @Provide pageInfos: NavPathStack = new NavPathStack()
  @State finishTransitionTest:string = '111'
  @State customNavContentTransitionTest: string = '333'
  @State x: number = 0
  @State scaleVal: number = 1

  @Builder pageOneTmp() {
    NavDestination() {
      Column() {
        Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .id('pushPathByName_test')
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushPathByName('pageTwo', null) //将name指定的NavDestination页面信息入栈，传递的数据为param
          })
      }.width('100%').height('100%')
    }
    .title('pageOne')
    .mode(NavDestinationMode.STANDARD)
    .onBackPressed((): boolean => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
    .translate({x: this.x, y: 0, z: 0})
    .backgroundColor(Color.White)
  }

  aboutToAppear() {
    CustomTransition.getInstance().registerNavParam('pageOne', (isPush: boolean, isExit: boolean) => {
      this.x = isExit ? 0 : 300;
    }, (isPush: boolean, isExit: boolean)=> {
      this.x = isExit ? -300 : 0;
    }, 200);
    if (this.pageInfos === undefined) {
      this.pageInfos = new NavPathStack();
    }
    this.pageInfos.pushPath(new NavPathInfo('pageOne',null), false)

  }


  aboutToDisappear() {
    CustomTransition.getInstance().unRegisterNavParam('pageOne')
  }

  build() {
    Column() {
      Text('' + this.finishTransitionTest).id('finishTransitionTest_api')
      Text('' + this.customNavContentTransitionTest).id('customNavContentTransitionTest_api')
      Navigation(this.pageInfos) {
        this.pageOneTmp()
      }.title('NavIndex')
      .customNavContentTransition((from: NavContentInfo, to: NavContentInfo, operation: NavigationOperation) => {
        this.customNavContentTransitionTest = '222'
        console.log('customNavContentTransition改变1:' + this.customNavContentTransitionTest);
        console.log('customNavContentTransition改变2:' + this.customNavContentTransitionTest);
        let customAnimation: NavigationAnimatedTransition = {
          onTransitionEnd: (isSuccess: boolean) => {
            console.log(`current transition result is ${isSuccess}`);
          },
          timeout: 700,
          transition: (transitionProxy: NavigationTransitionProxy) => {
            console.log("trigger transition callback");
            let fromParam: AnimateCallback = CustomTransition.getInstance().getAnimateParam(String(from.name));
            let toParam: AnimateCallback = CustomTransition.getInstance().getAnimateParam(String(to.name));
            console.log(`toParam`);
            fromParam.start(operation == NavigationOperation.PUSH, true);
            toParam.start(operation == NavigationOperation.PUSH, false);
            console.log(`toParam.start`);
            animateTo({ duration: toParam.timeout as int, onFinish: () => {
              transitionProxy.finishTransition();
              this.finishTransitionTest = '444'
              console.log('finishTransition改变:' + this.finishTransitionTest);

            } }, () => {
              fromParam.finish(operation === NavigationOperation.PUSH, true)
              toParam.finish(operation === NavigationOperation.PUSH, false);
            })
          }
        };
        return customAnimation;
      })
    }
  }
}