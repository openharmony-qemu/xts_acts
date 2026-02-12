'use static'

import { CustomTransition, AnimateCallback } from './CustomNavigationUtils'
import {
  NavigationAnimatedTransition,
  ButtonType,
  NavContentInfo,
  NavigationOperation,
  Navigation,
  NavPathStack,
  NavPathInfo,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  AttributeModifier,
  NavigationAttribute,
  Entry
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyNavigationModifier implements AttributeModifier<NavigationAttribute> {
  public isUndefined: boolean = false;
  public changeCount: number = 0;

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.customNavContentTransition(this.isUndefined ? undefined :
      (from: NavContentInfo, to: NavContentInfo, operation: NavigationOperation):
        NavigationAnimatedTransition | undefined => {
        this.changeCount++;
        console.log('[Modifier] customNavContentTransition, changeCount: ' + this.changeCount)
        // 返回 undefined 表示使用默认转场动效
        return undefined
      })
  }
}

@Entry
@Component
struct NavigationExample {
  pageInfos: NavPathStack = new NavPathStack();
  @State modifier: MyNavigationModifier = new MyNavigationModifier();

  build() {
    Column() {
      Text('changeCount:' + this.modifier.changeCount).id('changeCountText')

      Navigation(this.pageInfos) {
        Text('this navigation bar')

        Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule })
          .id('pushButton')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            //将name指定的NavDestination页面信息入栈，传递的数据为param
            this.pageInfos.pushDestinationByName('pageOne', CustomTransition.getInstance().getAnimationId());
          })
      }
      .title('NavIndex')
      .attributeModifier(this.modifier)
      .height('50%')

      Button('customNavContentTransition:' + this.modifier.changeCount + ' ' + this.modifier.isUndefined)
        .id('toggleButton')
        .onClick((e: ClickEvent) => {
          // 创建新的 Modifier 实例以触发重新应用
          let newModifier = new MyNavigationModifier()
          newModifier.isUndefined = !this.modifier.isUndefined
          newModifier.changeCount = this.modifier.changeCount
          this.modifier = newModifier
        })
    }
  }
}

