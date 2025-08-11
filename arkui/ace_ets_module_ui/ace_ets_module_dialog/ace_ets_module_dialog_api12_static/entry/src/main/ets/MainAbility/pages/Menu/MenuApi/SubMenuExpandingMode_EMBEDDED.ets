
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,AlertDialogParamWithButtons,DialogAlignment,MenuItemOptions,MenuItemGroupOptions,SubMenuExpandingMode,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,LevelOrder,ResourceStr,$r,Menu,MenuItem,MenuItemGroup,
  PickerTextStyle, CalendarAlign, Date, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,px2vp,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,AppStorage
} from '@ohos.arkui.stateManagement';
@Entry
@Component
struct SubMenuExpandingMode_EMBEDDED_Index {
  @State select: boolean = true
  private iconStr: ResourceStr = $r("app.media.icon")
  private iconStr2: ResourceStr = $r("app.media.app_icon")

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" } as MenuItemOptions )
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" } as MenuItemOptions)
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
        endIcon: this.iconStr2,
        builder: (): void => this.SubMenu()
      } as MenuItemOptions)
      MenuItemGroup({ header: '小标题' } as MenuItemGroupOptions) {
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项",
          endIcon: this.iconStr2,
          builder: (): void => this.SubMenu()
        } as MenuItemOptions)
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项",
          endIcon: this.iconStr2,
          builder: (): void => this.SubMenu()
        } as MenuItemOptions)
      }

      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
      } as MenuItemOptions)
    }.subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND).id("menu")
  }

  build() {
    Row() {
      Column() {
        Text('click to show menu')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .id('btn')
      .bindMenu(this.MyMenu)
      .width('100%')
    }
    .height('100%')
  }
}