'use static';
import {
  Entry, Component, Column, Builder, Flex, FlexDirection, FlexAlign, ItemAlign, TextAlign, ClickEvent, HorizontalAlign,
  Divider, Resource, SideBarContainer, SideBarContainerType, LineCapStyle, ColumnOptions, Button, ButtonType, Text, $r,
  Row, State, Image, Color
}from '@kit.ArkUI';

import {
  TreeControllerV2,  TreeListenerV2,  TreeListenerManagerV2,  NodeParamV2,  TreeViewV2,  CallbackParamV2
} from '@ohos.arkui.advanced.TreeViewV2';

import { SymbolGlyphModifier } from '@kit.ArkUI';


@Entry
@Component
struct TreeViewDemo {
  // 创建树视图组件的控制器
  private treeController: TreeControllerV2 = new TreeControllerV2();
  // 创建树视图组件的监听器
  private treeListener: TreeListenerV2 = TreeListenerManagerV2.getInstance().getTreeListener();
  @State clickId: number = 0;
  @State callbackParamDisplay: string = 'No callback yet';
  @State testMessage: string = '';

  aboutToDisappear(): void {
    // 取消监听
    this.treeListener.offNodeClick(undefined);
    this.treeListener.offNodeAdd(undefined);
    this.treeListener.offNodeDelete(undefined);
    this.treeListener.offNodeModify(undefined);
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

  // 自定义容器组件Builder（用于container参数测试）
  @Builder
  customContainer(): void {
    Row() {
      Image($r('sys.media.ohos_ic_public_view'))
        .width(20)
        .height(20)
      Text('Custom Component')
        .fontSize(12)
        .fontColor(Color.Red)
    }
    .padding(5)
    .backgroundColor(Color.Yellow)
  }

  // 边界值测试方法
  testBoundaryCase(caseType: string): void {
    switch(caseType) {
      case 'emptyTitle':
        this.treeController.addNode({
          parentNodeId: -1,
          currentNodeId: 200,
          primaryTitle: '',
          isFolder: false
        });
        this.testMessage = 'Added node with empty title';
        break;
      case 'longTitle':
        this.treeController.addNode({
          parentNodeId: -1,
          currentNodeId: 201,
          primaryTitle: '超长标题测试字符串超过一百字符测试边界值显示效果验证',
          isFolder: false
        });
        this.testMessage = 'Added node with long title (>50 chars)';
        break;
      case 'invalidParent':
        this.treeController.addNode({
          parentNodeId: 999,
          currentNodeId: 202,
          primaryTitle: 'Invalid Parent Node',
          isFolder: false
        });
        this.testMessage = 'Added node with invalid parent ID (999)';
        break;
    }
  }

  aboutToAppear(): void {
    // 注册监听
    this.treeListener.onNodeClick((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onNodeAdd((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onNodeDelete((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onNodeModify((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onNodeMove((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onceNodeClick((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onceNodeAdd((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onceNodeDelete((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onceNodeModify((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
    })
    this.treeListener.onceNodeMove((callbackParam: CallbackParamV2) => {
      this.clickId = callbackParam.currentNodeId;
      this.callbackParamDisplay = `current:${callbackParam.currentNodeId}, parent:${callbackParam.parentNodeId ?? -1}, index:${callbackParam.childIndex ?? -1}`;
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
      // SymbolGlyphModifier测试节点
      .addNode({
        parentNodeId: -1,
        currentNodeId: 100,
        isFolder: true,
        symbolIconStyle: new SymbolGlyphModifier($r('sys.symbol.folder')),
        symbolSelectedIconStyle: new SymbolGlyphModifier($r('sys.symbol.checkmark_circle')),
        symbolEditIconStyle: new SymbolGlyphModifier($r('sys.symbol.pencil')),
        primaryTitle: 'Symbol Folder',
        secondaryTitle: '0'
      })
      .addNode({
        parentNodeId: 100,
        currentNodeId: 101,
        isFolder: false,
        symbolIconStyle: new SymbolGlyphModifier($r('sys.symbol.doc')),
        primaryTitle: 'Symbol File'
      })
      // container自定义组件测试节点
      .addNode({
        parentNodeId: -1,
        currentNodeId: 102,
        isFolder: false,
        primaryTitle: 'Container Node',
        container: this.customContainer
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
          Column({ space: 15 } as ColumnOptions) {
            Text('ClickId=' + this.clickId).fontSize('16fp')
            Text('CallbackParam: ' + this.callbackParamDisplay).fontSize('12fp').fontColor(Color.Blue)
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
            Divider().strokeWidth(1).color(0xCCCCCC)
            Text('Boundary Tests:').fontSize('14fp').fontColor(Color.Orange)
            Button('Test Empty Title', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0xFF5722).width(150)
              .onClick((event: ClickEvent) => {
                this.testBoundaryCase('emptyTitle');
              })
            Button('Test Long Title', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0xFF5722).width(150)
              .onClick((event: ClickEvent) => {
                this.testBoundaryCase('longTitle');
              })
            Button('Test Invalid Parent', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0xFF5722).width(150)
              .onClick((event: ClickEvent) => {
                this.testBoundaryCase('invalidParent');
              })
            Text(this.testMessage).fontSize('12fp').fontColor(Color.Red)
          }.height('100%').width('70%').alignItems(HorizontalAlign.Start).margin(10)
        }
      }
      .focusable(true)
      .showControlButton(false)
      .showSideBar(true)
    }
  }
}