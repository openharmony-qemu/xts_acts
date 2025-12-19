import observer from '@ohos.arkui.observer';
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Entry, Component, Flex, FlexDirection,Padding, TextAlign, NavigationTitleMode, NavigationMode,NavPathInfo,
  Column, ColumnOptions, Row, Builder, TouchEvent,Color, WrappedBuilder, NodeContainer, ResourceStr,NavDestination,NavPathStack,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, CustomBuilderT, Navigation,NavDestinationActiveReason
} from '@ohos.arkui.component'
import { State, Consume, Provide } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavRouterExample {
  private stack: NavPathStack = new NavPathStack();
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State showFlag: ResourceStr = ''
  @State showLanYa: boolean = false


  aboutToAppear() {
    let context:UIContext | undefined = this.getUIContext()
    if(context!=undefined){
      console.log("=================================== 1");
      let contextObserver = context.getUIObserver();
      console.log("=================================== 2");
      contextObserver.onNavDestinationUpdate((e)=>{
        console.log("=================================== 3");
        this.showFlag = '30'
      });
    }
  }

  build() {
    Column() {
      Navigation(this.stack) {
        if(!this.showLanYa){
          NavDestination() {
            Row() {
              Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin).backgroundColor(Color.Pink)
              Text(`WLAN`).fontSize(22).fontWeight(500).textAlign(TextAlign.Center)
            }
            .width('90%')
            .height(72)
            NavDestination() {
              Flex({ direction: FlexDirection.Row }) {
                Text('wifi').fontSize(30).padding({ left: 35 } as Padding)
              }
            }
            .hideTitleBar(false)
            .backgroundColor('#0c182431')
          }.backgroundColor(this.isActiveWLAN ? '#ccc' : '#fff')
          .borderRadius(24)
          .onActive((reason: NavDestinationActiveReason) => {
            this.isActiveWLAN = true
          })
          .onInactive((reason: NavDestinationActiveReason) => {
            this.isActiveWLAN = false
          })
          .onClick((e:ClickEvent) => {
            this.showLanYa = !this.showLanYa  //自动化点击后，appDied，手动不会
          })
          .id("Wlan_Id")
        }
        if(this.showLanYa) {
          NavDestination() {
            Row() {
              Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin).backgroundColor(Color.Pink)
              Text(`蓝牙`)
                .fontSize(22)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
            }
            .id('lanYa_id')
            .width('90%')
            .height(72)
            NavDestination() {
              Flex({ direction: FlexDirection.Row }) {
                Text(this.showFlag.toString()).fontSize(30).padding({ left: 35 } as Padding).key('showFlag_id')
              }
            }.hideTitleBar(false).backgroundColor('#0c182431')
          }
          .backgroundColor(this.isActiveBluetooth ? '#ccc' : '#fff')
          .borderRadius(24)
          .onActive((reason: NavDestinationActiveReason) => {
            this.isActiveBluetooth = true
          })
          .onInactive((reason: NavDestinationActiveReason) => {
            this.isActiveBluetooth = false
          })
        }

      }
      .title("Navigation")
      .title('设置')
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .hideTitleBar(false)
      .hideToolBar(true)
    }
    .width('100%')
    .height('100%')
  }
}