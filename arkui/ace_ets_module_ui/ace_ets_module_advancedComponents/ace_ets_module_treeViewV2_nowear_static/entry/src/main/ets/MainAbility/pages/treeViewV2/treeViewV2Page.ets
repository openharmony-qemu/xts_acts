'use static'
import {
  Entry, Component, Column, Builder, Flex, FlexDirection, FlexAlign, ItemAlign, TextAlign, ClickEvent, HorizontalAlign,
  Divider, Resource, SideBarContainer, SideBarContainerType, LineCapStyle, ColumnOptions, Button, ButtonType, Text, $r,
  Row, State
}from '@kit.ArkUI';

import {
  TreeControllerV2,  TreeListenerV2,  TreeListenerManagerV2,  NodeParamV2,  TreeViewV2,  CallbackParamV2
} from '@ohos.arkui.advanced.TreeViewV2';


@Entry
@Component
struct TreeViewDemo {
  // 创建树视图组件的控制器
  private treeController: TreeControllerV2 = new TreeControllerV2();
  // 创建树视图组件的监听器
  private treeListener: TreeListenerV2 = TreeListenerManagerV2.getInstance().getTreeListener();
  @State clickId: number = 0;

  aboutToDisappear(): void {
    // 取消监听
    this.treeListener.offNodeClick(undefined);
    this.treeListener.offNodeAdd(undefined);
    this.treeListener.offNodeDelete(undefined);
    this.treeListener.offNodeMove(undefined);
  }

  // 创建右侧菜单操作区
  @Builder
  menuBuilder1() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('新增')
        .fontSize(16)
        .width(100)
        .height(30)
        .textAlign(TextAlign.Center)
        .onClick((event: ClickEvent) => {
          this.treeController.addNode();
        })
      Divider()
      Text('删除')
        .fontSize(16)
        .width(100)
        .height(30)
        .textAlign(TextAlign.Center)
        .onClick((event: ClickEvent) => {
          this.treeController.removeNode();
        })
      Divider()
      Text('重命名')
        .fontSize(16)
        .width(100)
        .height(30)
        .textAlign(TextAlign.Center)
        .onClick((event: ClickEvent) => {
          this.treeController.modifyNode();
        })
    }.width(100).border({ width: 1, color: 0x80808a, radius: '16dp' })
  }

  aboutToAppear(): void {
    // 注册监听
    this.treeListener.onNodeClick((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
    })
    this.treeListener.onNodeAdd((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
    })
    this.treeListener.onNodeDelete((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
    })
    this.treeListener.onceNodeMove((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
    })

    // 系统文件夹图片资源
    let normalResource: Resource = $r('sys.media.ohos_ic_normal_white_grid_folder');
    // 系统全选图片资源
    let selectedResource: Resource = $r('sys.media.ohos_ic_public_select_all');
    // 系统编辑图片资源
    let editResource: Resource = $r('sys.media.ohos_ic_public_edit');
    let nodeParam: NodeParamV2 = {
      parentNodeId: -1,
      currentNodeId: 1,
      isFolder: true,
      icon: normalResource,
      selectedIcon: selectedResource,
      editIcon: editResource,
      primaryTitle: 'Root Node',
      secondaryTitle: '6'
    };
    // 添加树节点
    this.treeController
      .addNode(nodeParam)
      .addNode({
        parentNodeId: 1,
        currentNodeId: 2,
        isFolder: false,
        primaryTitle: '项目1_1'
      })
      .addNode({
        parentNodeId: -1,
        currentNodeId: 7,
        isFolder: true,
        primaryTitle: 'Second Root'
      })
      .addNode({
        parentNodeId: -1,
        currentNodeId: 23,
        isFolder: true,
        icon: normalResource,
        selectedIcon: selectedResource,
        editIcon: editResource,
        primaryTitle: '目录3'
      })
      .addNode({
        parentNodeId: -1,
        currentNodeId: 24,
        isFolder: false,
        primaryTitle: '项目4'
      })
      .addNode({
        parentNodeId: -1,
        currentNodeId: 31,
        isFolder: true,
        icon: normalResource,
        selectedIcon: selectedResource,
        editIcon: editResource,
        primaryTitle: '目录5',
        secondaryTitle: '0'
      })
      .addNode({
        parentNodeId: -1,
        currentNodeId: 32,
        isFolder: true,
        icon: normalResource,
        selectedIcon: selectedResource,
        editIcon: editResource,
        primaryTitle: '目录6',
        secondaryTitle: '0'
      })
      .addNode({
        parentNodeId: 32,
        currentNodeId: 35,
        isFolder: true,
        icon: normalResource,
        selectedIcon: selectedResource,
        editIcon: editResource,
        primaryTitle: '目录6-1',
        secondaryTitle: '0'
      })
      .addNode({
        parentNodeId: -1,
        currentNodeId: 33,
        isFolder: true,
        icon: normalResource,
        selectedIcon: selectedResource,
        editIcon: editResource,
        primaryTitle: '目录7',
        secondaryTitle: '0'
      })
      .addNode({
        parentNodeId: 33,
        currentNodeId: 34,
        isFolder: false,
        primaryTitle: '项目8'
      })
      .addNode({ parentNodeId: -1,
        currentNodeId: 36,
        isFolder: false,
        primaryTitle: '项目9'
      })
      .buildDone();
    this.treeController.refreshNode(-1, '父节点', '子节点');
  }

  build() {
    Column() {
      SideBarContainer(SideBarContainerType.Embed) {
        TreeViewV2({ treeControllerV2: this.treeController })
        Row() {
          Divider().vertical(true).strokeWidth(2).color(0x000000).lineCap(LineCapStyle.Round)
          Column({ space: 30 } as ColumnOptions) {
            Text('ClickId=' + this.clickId).fontSize('16fp')
            Button('Add', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(90)
              .onClick((event: ClickEvent) => {
                this.treeController.addNode();
              })
            Button('Modify', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(90)
              .onClick((event: ClickEvent) => {
                this.treeController.modifyNode();
              })
            Button('Remove', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(120)
              .onClick((event: ClickEvent) => {
                this.treeController.removeNode();
              })
          }.height('100%').width('70%').alignItems(HorizontalAlign.Start).margin(10)
        }
      }
      .focusable(true)
      .showControlButton(false)
      .showSideBar(true)
    }
  }
}