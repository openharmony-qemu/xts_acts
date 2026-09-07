/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct NavigationAttrSupplement {
  @State navBarPositionIndex: number = 0;
  @State navModeIndex: number = 0;
  @State hideNavBar: boolean = false;
  @State hideTitleBar: boolean = false;
  @State hideBackButton: boolean = false;
  @State titleModeIndex: number = 0;
  @State hideToolBar: boolean = false;
  @State hideToolBarAnimated: boolean = false;
  @State titleTypeIndex: number = 0;
  @State menusTypeIndex: number = 0;
  @State toolbarTypeIndex: number = 0;
  @State constructorType: number = 1;
  @State chainingTest: boolean = false;

  pageInfos: NavPathStack = new NavPathStack();
  homePathInfo: HomePathInfo = { name: 'homePage' };
  messageManager: MessageManager = new MessageManager();

  navBarPosition: NavBarPosition[] = [NavBarPosition.Start, NavBarPosition.End];
  navMode: NavigationMode[] = [NavigationMode.Stack, NavigationMode.Split, NavigationMode.Auto];
  titleMode: NavigationTitleMode[] = [NavigationTitleMode.Mini, NavigationTitleMode.Full];

  @Builder
  titleCustomBuilder() {
    Text('CustomTitle')
  }

  @Builder
  menusCustomBuilder() {
    Text('Menu')
  }

  @Builder
  toolbarCustomBuilder() {
    Text('Toolbar')
  }

  @Builder
  PageMap(name: string) {
  }

  onPageShow() {
    console.info('NavigationAttrSupplement onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.info('NavigationAttrSupplement message = ' + message.name + '--' + message.value);
      if (message.name === 'navBarPositionIndex') {
        this.navBarPositionIndex = message.value;
      }
      if (message.name === 'navModeIndex') {
        this.navModeIndex = message.value;
      }
      if (message.name === 'hideNavBar') {
        this.hideNavBar = message.value;
      }
      if (message.name === 'hideTitleBar') {
        this.hideTitleBar = message.value;
      }
      if (message.name === 'hideBackButton') {
        this.hideBackButton = message.value;
      }
      if (message.name === 'titleModeIndex') {
        this.titleModeIndex = message.value;
      }
      if (message.name === 'hideToolBar') {
        this.hideToolBar = message.value;
      }
      if (message.name === 'hideToolBarAnimated') {
        this.hideToolBarAnimated = message.value;
      }
      if (message.name === 'titleTypeIndex') {
        this.titleTypeIndex = message.value;
      }
      if (message.name === 'menusTypeIndex') {
        this.menusTypeIndex = message.value;
      }
      if (message.name === 'toolbarTypeIndex') {
        this.toolbarTypeIndex = message.value;
      }
      if (message.name === 'constructorType') {
        this.constructorType = message.value;
      }
      if (message.name === 'chainingTest') {
        this.chainingTest = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    if (this.constructorType === 2) {
      Navigation(this.pageInfos, this.homePathInfo) {
        Column() {
        }
      }
      .key('NavigationAttrSupplement_nav')
      .navDestination(this.PageMap)
      .navBarPosition(this.navBarPosition[this.navBarPositionIndex])
      .mode(this.navMode[this.navModeIndex])
      .hideNavBar(this.chainingTest ? true : this.hideNavBar)
      .title(this.titleTypeIndex === 1 ? this.titleCustomBuilder : 'Title')
      .hideTitleBar(this.chainingTest ? true : this.hideTitleBar)
      .hideBackButton(this.chainingTest ? true : this.hideBackButton)
      .titleMode(this.titleMode[this.titleModeIndex])
      .menus(this.menusTypeIndex === 1 ? this.menusCustomBuilder : [])
      .toolbarConfiguration(this.toolbarTypeIndex === 1 ? this.toolbarCustomBuilder : [])
      .hideToolBar(this.chainingTest ? true : (this.hideToolBarAnimated ? true : this.hideToolBar),
        this.hideToolBarAnimated)
    } else if (this.constructorType === 1) {
      Navigation(this.pageInfos) {
        Column() {
        }
      }
      .key('NavigationAttrSupplement_nav')
      .navDestination(this.PageMap)
      .navBarPosition(this.navBarPosition[this.navBarPositionIndex])
      .mode(this.navMode[this.navModeIndex])
      .hideNavBar(this.chainingTest ? true : this.hideNavBar)
      .title(this.titleTypeIndex === 1 ? this.titleCustomBuilder : 'Title')
      .hideTitleBar(this.chainingTest ? true : this.hideTitleBar)
      .hideBackButton(this.chainingTest ? true : this.hideBackButton)
      .titleMode(this.titleMode[this.titleModeIndex])
      .menus(this.menusTypeIndex === 1 ? this.menusCustomBuilder : [])
      .toolbarConfiguration(this.toolbarTypeIndex === 1 ? this.toolbarCustomBuilder : [])
      .hideToolBar(this.chainingTest ? true : (this.hideToolBarAnimated ? true : this.hideToolBar),
        this.hideToolBarAnimated)
    } else {
      Navigation() {
        Column() {
        }
      }
      .key('NavigationAttrSupplement_nav')
      .navDestination(this.PageMap)
      .navBarPosition(this.navBarPosition[this.navBarPositionIndex])
      .mode(this.navMode[this.navModeIndex])
      .hideNavBar(this.chainingTest ? true : this.hideNavBar)
      .title(this.titleTypeIndex === 1 ? this.titleCustomBuilder : 'Title')
      .hideTitleBar(this.chainingTest ? true : this.hideTitleBar)
      .hideBackButton(this.chainingTest ? true : this.hideBackButton)
      .titleMode(this.titleMode[this.titleModeIndex])
      .menus(this.menusTypeIndex === 1 ? this.menusCustomBuilder : [])
      .toolbarConfiguration(this.toolbarTypeIndex === 1 ? this.toolbarCustomBuilder : [])
      .hideToolBar(this.chainingTest ? true : (this.hideToolBarAnimated ? true : this.hideToolBar),
        this.hideToolBarAnimated)
    }
  }
}
