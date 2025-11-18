import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,SheetMode,NavDestinationActiveReason, CalendarAlign, Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume,StorageLink
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { CommonNavigation } from './CommonNavigation';
@Entry
@Component
struct OnActivePage {
  build() {
    Flex({ direction:FlexDirection.Column, alignItems:ItemAlign.Center, justifyContent: FlexAlign.Center }){
       Button('Overlay').onClick((e:ClickEvent) => {
           this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/OverlayTest'})
       }).id('overLayBtnId').height('10%')

      Button('基础场景').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/Basic'})
      }).id('baseBtnId').height('10%')

      Button('CustomDialog').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/CustomDialogTest'})
      }).id('dialogBtnId').height('10%')

      Button('半模态场景').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/BasicSheet01'})
      }).id('halfBtnId').height('10%')

      Button('全模态场景').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/BasicSheet02'})
      }).id('allBtnId').height('10%')
    }
  }
}