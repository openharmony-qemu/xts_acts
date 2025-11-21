import { Router } from '@ohos.arkui.UIContext';
import { Entry, Column, Component, Text, Button, Navigation, NavigationTitleMode, ClickEvent, Margin, NavigationMode} from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct OnNewParamRouter {
  build() {
    Navigation() {
      Column() {
        Button('push pageOne')
          .onClick((e:ClickEvent) => {
            const router = AppStorage.get<Router>("router") as Router
            router.pushUrl({ url: 'MainAbility/pages/router/PageOne'})
          })
          .id('pushId')
          .height('10%')
      }
    }
    .title('MainPage')
    .hideBackButton(true)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }
}

