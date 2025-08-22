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

export interface ClickItem {
  name: string;
  callback: () => void;
  id?: string;
}

@Entry
@Component
struct Basic {
  @StorageLink('isShow') isShow: boolean = false;
  @StorageLink('isSheetShow') isSheetShow: boolean = false;
  @State mode: SheetMode = SheetMode.OVERLAY
  pathStack: NavPathStack = new NavPathStack()
  clickItem: Array<ClickItem> = [
    {
      name: 'push pageOne',
      callback: () => {
        
        this.pathStack.pushPath(new NavPathInfo('pageOne',null))
      },
      id: 'sheetPushId'
    } as ClickItem, {
    name: '开启半模态',
    callback: () => {
      this.isSheetShow = true;
      this.mode = SheetMode.OVERLAY
    },
    id: 'openSheetId'
  } as ClickItem
  ]

  build() {
    Column() {
      Scroll() {
        Column() {
          ForEach(this.clickItem, (item: ClickItem) => {
            Button(item.name).width(300).height(30).margin(10).onClick(item.callback).id(item.id)
          })
        }
      }.height('50%')
      CommonNavigation({pathStack: this.pathStack})
    }
  }
}