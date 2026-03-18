'use static';
import { Entry, Component, Column, Button, Text, Image,
  Menu, MenuItem, Builder, LocalizedAlignment, $r } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import uiEffect from '@ohos.graphics.uiEffect';

@Entry
@Component
struct CommonMethodIndex {
  @Builder
  commonMenuBuilder() {
    Menu() {
      MenuItem({ content: 'common_menu_item' });
    }
  }

  @State widthStatus: string = 'init';
  @State heightStatus: string = 'init';
  @State ignoreLayoutSafeAreaStatus: string = 'init';
  @State responseRegionListStatus: string = 'init';
  @State backgroundColorStatus: string = 'init';
  @State materialFilterStatus: string = 'init';
  @State transform3DStatus: string = 'init';
  @State layoutGravityStatus: string = 'init';
  @State bindContextMenuWithResponseStatus: string = 'init';
  @State accessibilityStateDescriptionStatus: string = 'init';
  @State accessibilityActionOptionsStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('CommonMethodIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('responseRegionList')
        .id('commonMethodResponseRegionListBtn')
        .key('commonMethodResponseRegionListBtnKey')
        .responseRegion([{
          x: '0vp',
          y: '0vp',
          width: '100%',
          height: '100%'
        }])

      Button('backgroundColor')
        .id('commonMethodBackgroundColorBtn')
        .key('commonMethodBackgroundColorBtnKey')
        .backgroundColor('#ff0000')

      Column()
        .width('50%')
        .height('5%')
        .backgroundColor('#ffffffff')
        .materialFilter(uiEffect.createFilter().blur(10))
        .id('materialId')

      Image($r('app.media.icon')).id('commonMethodTransform3DBtn').key('commonMethodTransform3DBtnKey')
        .width(50)
        .height(50)
        .transform3D(undefined)

      Text('layoutGravity').id('commonMethodLayoutGravityBtn').key('commonMethodLayoutGravityBtnKey')
        .layoutGravity(LocalizedAlignment.TOP_START)

      Text('bindContextMenuWithResponse').id('commonMethodBindContextMenuWithResponseBtn')
        .key('commonMethodBindContextMenuWithResponseBtnKey')
        .bindContextMenuWithResponse(this.commonMenuBuilder)

      Text('accessibilityStateDescription').id('commonMethodAccessibilityStateDescriptionBtn')
        .key('commonMethodAccessibilityStateDescriptionBtnKey')
        .accessibilityStateDescription('state_desc')

      Text('accessibilityActionOptions').id('commonMethodAccessibilityActionOptionsBtn')
        .key('commonMethodAccessibilityActionOptionsBtnKey')
        .accessibilityActionOptions(undefined)

    }
    .width('100%')
    .height('100%');
  }
}
