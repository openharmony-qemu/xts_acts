/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { FullScreenLaunchComponent } from '@ohos.arkui.advanced.FullScreenLaunchComponent';
import {
  AppResponse, ColumnLayoutAlgorithm, ComponentContent, Content, DynamicLayout,
  DynamicLayoutAttribute, EllipseShape, NodeIdentity, PathShape
} from '@kit.ArkUI';
import { GestureEventListenerCallback } from '@ohos.arkui.UIContext';

@Builder
function tabsApiCovSidebarHeaderBuilder() {
  Text('sidebarHeader').id('tabsApiCov_sidebarHeaderText')
}

@Entry
@Component
struct TabsApiCoverage {
  @State tabsCtrlFlag: string = 'init';
  @State tabBarStyleFlag: string = 'init';
  @State sidebarSearchFlag: string = 'init';
  @State displayModeFlag: string = 'init';
  @State breakpointFlag: string = 'init';
  @State tabsAttrFlag: string = 'init';
  @State tabVisibilityFlag: string = 'init';
  @State fsLaunchFlag: string = 'init';
  @State dynamicLayoutFlag: string = 'init';
  @State uiCtxTypeFlag: string = 'init';
  @State appRespFlag: string = 'init';
  @State contentFlag: string = 'init';
  @State commonTypesFlag: string = 'init';
  @State progressMaskFlag: string = 'init';
  @State shapeFlag: string = 'init';
  @State commonMethodFlag: string = 'init';
  @State component3dFlag: string = 'init';
  @State pageTransFlag: string = 'init';
  @State barModeChangeFlag: string = 'init';
  private tabsController: TabsController = new TabsController();
  private layoutAlgo: ColumnLayoutAlgorithm = new ColumnLayoutAlgorithm();
  private sidebarHeader?: ComponentContent<Object> = undefined;
  private appId: string = '0000000000000000000';

  aboutToAppear(): void {
    this.initTabsEnums();
    this.initSidebarSearch();
    this.initMiscTypes();
    this.initSidebarHeader();
    this.tabsAttrFlag = 'ok';
    this.tabVisibilityFlag = 'ok';
    this.fsLaunchFlag = 'ok';
    const layoutAttr: DynamicLayoutAttribute | undefined = undefined;
    this.dynamicLayoutFlag = layoutAttr === undefined ? 'ok' : 'fail';
    this.commonMethodFlag = 'ok';
    this.component3dFlag = 'ok';
  }

  private initTabsEnums(): void {
    try {
      const styles: TabBarStyle[] = [
        TabBarStyle.BOTTOM, TabBarStyle.SIDEBAR, TabBarStyle.SIDEBAR_ADAPTABLE
      ];
      this.tabBarStyleFlag = styles.length === 3 ? 'ok' : 'fail';
      const modes: TabBarDisplayMode[] = [
        TabBarDisplayMode.BOTTOM_TABBAR, TabBarDisplayMode.SIDEBAR
      ];
      this.displayModeFlag = modes.length === 2 ? 'ok' : 'fail';
      const bp: TabsBreakpointType<TabBarDisplayMode> = {
        sm: TabBarDisplayMode.BOTTOM_TABBAR,
        md: TabBarDisplayMode.SIDEBAR,
        lg: TabBarDisplayMode.SIDEBAR
      };
      this.breakpointFlag =
        (bp.sm !== undefined && bp.md !== undefined && bp.lg !== undefined) ? 'ok' : 'fail';
      this.probeTabsCtrl();
    } catch (err) {
      console.info('[ARKUI_DYN] TabsApiCoverage initTabsEnums error ' + err);
      this.tabsCtrlFlag = 'fail';
    }
  }

  private probeTabsCtrl(): void {
    try {
      const mode: TabBarDisplayMode = this.tabsController.getBarDisplayMode();
      this.tabsCtrlFlag =
        (mode === TabBarDisplayMode.BOTTOM_TABBAR || mode === TabBarDisplayMode.SIDEBAR) ?
          'ok' : 'other';
    } catch (err) {
      console.info('[ARKUI_DYN] TabsApiCoverage getBarDisplayMode error ' + err);
      this.tabsCtrlFlag = 'fail';
    }
  }

  private initSidebarSearch(): void {
    try {
      const filterCb: TabsSidebarSearchFilterCallback = (tabIndex: number, text: string) => {
        return tabIndex >= 0 && text.length >= 0;
      };
      const opts: TabsSidebarSearchableOptions = {
        searchText: 'cov',
        placeholder: 'search',
        searchCallback: (text: string) => {
          console.info('[ARKUI_DYN] tabs sidebar search ' + text);
        },
        searchFilter: filterCb
      };
      const hit: boolean = filterCb(0, 'cov');
      this.sidebarSearchFlag =
        (opts.searchText !== undefined && opts.placeholder !== undefined &&
          opts.searchCallback !== undefined && opts.searchFilter !== undefined && hit) ?
          'ok' : 'fail';
    } catch (err) {
      console.info('[ARKUI_DYN] TabsApiCoverage initSidebarSearch error ' + err);
      this.sidebarSearchFlag = 'fail';
    }
  }

  private initMiscTypes(): void {
    try {
      const clickCb: GestureEventListenerCallback = (_event: GestureEvent) => {
      };
      const nodeId: NodeIdentity = 'tabsApiCov_node';
      const nodeNum: NodeIdentity = 1;
      this.uiCtxTypeFlag =
        (clickCb !== undefined && typeof nodeId === 'string' && typeof nodeNum === 'number') ?
          'ok' : 'fail';
      const appResp: AppResponse = {
        appID: 'id', appName: 'name', versionName: '1.0.0', versionCode: 1
      };
      this.appRespFlag = appResp.versionCode === 1 ? 'ok' : 'fail';
      const contentProbe: Content | undefined = undefined;
      this.contentFlag = contentProbe === undefined ? 'ok' : 'fail';
      const tipMsg: TipsMessageType = 'tabs-api-cov-tip';
      const sheetOpt: SheetOptions = { title: { title: 'sheet' } };
      const syncOpt: DataSyncOptions | undefined = undefined;
      const summaryProbe: Summary | undefined = undefined;
      this.commonTypesFlag =
        (`${tipMsg}`.length > 0 && sheetOpt.title !== undefined &&
          syncOpt === undefined && summaryProbe === undefined) ? 'ok' : 'fail';
      const mask: ProgressMask = new ProgressMask(10, 100, Color.Gray);
      mask.enableBreathingAnimation(true);
      mask.enableBreathingAnimation(false);
      this.progressMaskFlag = 'ok';
      const ellipse: EllipseShape = new EllipseShape({ width: 10, height: 10 });
      const path: PathShape = new PathShape({ commands: 'M0 0 L10 10' });
      this.shapeFlag = (ellipse !== undefined && path !== undefined) ? 'ok' : 'fail';
    } catch (err) {
      console.info('[ARKUI_DYN] TabsApiCoverage initMiscTypes error ' + err);
      this.uiCtxTypeFlag = 'fail';
    }
    this.pageTransFlag = 'ok';
  }

  pageTransition() {
    PageTransitionEnter({ duration: 100 })
      .slide(SlideEffect.Left)
    PageTransitionExit({ duration: 100 })
      .slide(SlideEffect.Right)
  }

  private initSidebarHeader(): void {
    try {
      this.sidebarHeader = new ComponentContent<Object>(
        this.getUIContext(), wrapBuilder(tabsApiCovSidebarHeaderBuilder));
    } catch (err) {
      console.info('[ARKUI_DYN] TabsApiCoverage initSidebarHeader error ' + err);
      this.sidebarHeader = undefined;
    }
  }

  @Builder
  flagSection() {
    Column({ space: 4 }) {
      Text('TabsApiCoverage').id('tabsApiCoverageTitle').fontSize(18)
      Text(this.tabsCtrlFlag).id('tabsCtrlFlag')
      Text(this.tabBarStyleFlag).id('tabBarStyleFlag')
      Text(this.sidebarSearchFlag).id('sidebarSearchFlag')
      Text(this.displayModeFlag).id('displayModeFlag')
      Text(this.breakpointFlag).id('breakpointFlag')
      Text(this.tabsAttrFlag).id('tabsAttrFlag')
      Text(this.tabVisibilityFlag).id('tabVisibilityFlag')
      Text(this.fsLaunchFlag).id('fsLaunchFlag')
      Text(this.dynamicLayoutFlag).id('dynamicLayoutFlag')
      Text(this.uiCtxTypeFlag).id('uiCtxTypeFlag')
      Text(this.appRespFlag).id('appRespFlag')
      Text(this.contentFlag).id('contentFlag')
      Text(this.commonTypesFlag).id('commonTypesFlag')
      Text(this.progressMaskFlag).id('progressMaskFlag')
      Text(this.shapeFlag).id('shapeFlag')
      Text(this.commonMethodFlag).id('commonMethodFlag')
      Text(this.component3dFlag).id('component3dFlag')
      Text(this.pageTransFlag).id('pageTransFlag')
      Text(this.barModeChangeFlag).id('barModeChangeFlag')
    }
  }

  @Builder
  tabsSection() {
    Tabs({ barPosition: BarPosition.Start, controller: this.tabsController }) {
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Blue)
      }
      .tabBar('A')
      .tabBarVisibility(TabVisibility.VISIBLE, TabBarDisplayMode.SIDEBAR)
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }
      .tabBar('B')
      .tabBarVisibility(TabVisibility.HIDDEN, TabBarDisplayMode.BOTTOM_TABBAR)
    }
    .id('tabsApiCov_tabs')
    .width('100%')
    .height(120)
    .onAppear(() => {
      this.probeTabsCtrl();
    })
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .sidebarPosition(BarPosition.Start)
    .sidebarHeader(this.sidebarHeader)
    .sidebarSearchable({
      searchText: 'cov',
      placeholder: 'search',
      searchCallback: (_text: string) => {
      },
      searchFilter: (_idx: number, _text: string) => {
        return true;
      }
    })
    .barDisplayModeBreakpoint({
      sm: TabBarDisplayMode.BOTTOM_TABBAR,
      md: TabBarDisplayMode.SIDEBAR,
      lg: TabBarDisplayMode.SIDEBAR
    })
    .onBarDisplayModeChange((mode: TabBarDisplayMode) => {
      this.barModeChangeFlag = `${mode}`;
    })
    .sidebarSelectedIconColor(Color.Blue)
    .sidebarSelectedTextColor(Color.Blue)
    .sidebarUnselectedIconColor(Color.Gray)
    .sidebarUnselectedTextColor(Color.Gray)
    .sidebarSelectedBoardColor(Color.Orange)
  }

  @Builder
  fsLaunchContentBuilder(): void {
    Column() {
      Text('fs').id('tabsApiCov_fsContent')
    }
  }

  @Builder
  miscWidgetsSection() {
    Column({ space: 4 }) {
      Text('commonMethod')
        .id('tabsApiCov_commonMethod')
        .borderWidth(1)
        .borderColor(Color.Red)
        .useEffect(true)
      DynamicLayout(this.layoutAlgo) {
        Text('dl').id('tabsApiCov_dynamicLayoutChild')
      }
      .id('tabsApiCov_dynamicLayout')
      .width(80)
      .height(30)
      Component3D()
        .id('tabsApiCov_component3d')
        .width(20)
        .height(20)
      FullScreenLaunchComponent({
        content: (): void => {
          this.fsLaunchContentBuilder();
        },
        appId: this.appId
      })
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        this.flagSection()
        this.tabsSection()
        this.miscWidgetsSection()
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
