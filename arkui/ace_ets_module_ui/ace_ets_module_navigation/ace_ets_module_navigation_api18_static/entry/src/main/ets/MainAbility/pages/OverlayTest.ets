import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,SheetMode,NavDestinationActiveReason, CalendarAlign, Visibility,Date,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack,ComponentContent,wrapBuilder} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume,StorageLink
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { CommonNavigation } from './CommonNavigation';


@Component
struct OverlayComponent {
  build() {
    Column() {
      Button('关闭Overlay').onClick((e:ClickEvent) => {
        this.getUIContext().getOverlayManager().hideAllComponentContents()
      }).id('closeOverLayId')
    }.backgroundColor(Color.White)
  }
}

@Builder
function overlayBuilder() {
  OverlayComponent()
}

@Entry
@Component
struct OverlayTest {
  pathStack: NavPathStack = new NavPathStack();
  // @Provide({ allowOverride: 'pathStack' }) pathStack: NavPathStack = new NavPathStack();
  builderComponent:ComponentContent<never> = new ComponentContent<never>(this.getUIContext(), wrapBuilder(overlayBuilder))
  clickItems: Array<ClickItem> = [{
    name: 'push pageOne',
    callback: () => {
      console.log("============================= ")
      this.pathStack.pushDestination(new NavPathInfo( 'pageOne', new Object())).then(() => {
        console.log('testOnActive pageOne success');
      }).catch((err: Error) => {
        console.log(`testOnActive pageOne failed: ${err.code}, message: ${err.message}`);
      })
    },
    id: 'overLayPushId'
  } as ClickItem, {
    name: '开启Overlay',
    callback: () => {
      this.getUIContext().getOverlayManager().addComponentContent(this.builderComponent)
      this.getUIContext().getOverlayManager().showComponentContent(this.builderComponent)
    },
    id: 'openOverLayId'
  } as ClickItem
  ]

  build() {
    Column() {
      ForEach(this.clickItems, (item: ClickItem) => {
        Button(item.name).width(300).height(30).onClick(item.callback).margin(10).id(item.id)
      })
       CommonNavigation({pathStack: this.pathStack, title: 'Overlay Page Navigation'})
    }
  }
}

export interface ClickItem {
  name: string;
  callback: () => void;
  id?: string;
}