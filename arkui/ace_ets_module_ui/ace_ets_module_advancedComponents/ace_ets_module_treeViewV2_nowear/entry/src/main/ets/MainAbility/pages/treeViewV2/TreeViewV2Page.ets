import { TreeControllerV2, TreeListenerV2, TreeListenerManagerV2, NodeParamV2, TreeViewV2, CallbackParamV2 } from '@kit.ArkUI';

@Entry
@ComponentV2
struct TreeViewV2Demo {
  private treeControllerV2: TreeControllerV2 = new TreeControllerV2();
  private treeListenerV2: TreeListenerV2 = TreeListenerManagerV2.getInstance().getTreeListener();
  @Local clickNodeId: number = 0;

  aboutToDisappear(): void {
    this.treeListenerV2.offNodeClick();
    this.treeListenerV2.offNodeAdd();
    this.treeListenerV2.offNodeDelete();
    this.treeListenerV2.offNodeModify();
    this.treeListenerV2.offNodeMove();
  }

  @Builder menuBuilder(): void {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('新增').fontSize(16).width(100).height(30).textAlign(TextAlign.Center)
        .onClick((event: ClickEvent) => {
          this.treeControllerV2.addNode();
        })
      Divider()
      Text('删除').fontSize(16).width(100).height(30).textAlign(TextAlign.Center)
        .onClick((event: ClickEvent) => {
          this.treeControllerV2.removeNode();
        })
      Divider()
      Text('重命名').fontSize(16).width(100).height(30).textAlign(TextAlign.Center)
        .onClick((event: ClickEvent) => {
          this.treeControllerV2.modifyNode();
        })
    }.width(100).border({width: 1, color: 0x80808a, radius: '16dp'})
  }

  aboutToAppear(): void {
    this.treeListenerV2.onNodeClick((callbackParam: CallbackParamV2) => {
      this.clickNodeId = callbackParam.currentNodeId;
    })
    this.treeListenerV2.onNodeAdd((callbackParam: CallbackParamV2) => {
      this.clickNodeId = callbackParam.currentNodeId;
    })
    this.treeListenerV2.onNodeDelete((callbackParam: CallbackParamV2) => {
      this.clickNodeId = callbackParam.currentNodeId;
    })
    this.treeListenerV2.onceNodeMove((callbackParam: CallbackParamV2) => {
      this.clickNodeId = callbackParam.currentNodeId;
      console.info(`Node moved to index: ${callbackParam.childIndex}`);
    })

    let normalResource: Resource = $r('sys.media.ohos_ic_normal_white_grid_folder');
    let selectedResource: Resource = $r('sys.media.ohos_ic_public_select_all');
    let editResource: Resource = $r('sys.media.ohos_ic_public_edit');

    let nodeParam: NodeParamV2 = {
      parentNodeId:-1,
      currentNodeId: 1,
      isFolder: true,
      icon: normalResource,
      selectedIcon: selectedResource,
      editIcon: editResource,
      primaryTitle: 'Root Node',
      secondaryTitle: '6'
    };

    this.treeControllerV2
      .addNode(nodeParam)
      .addNode({parentNodeId:1, currentNodeId: 2, isFolder: false, primaryTitle: '项目1_1' })
      .addNode({ parentNodeId:-1, currentNodeId: 7, isFolder: true, primaryTitle: 'Folder 1' })
      .addNode({ parentNodeId:7, currentNodeId: 71, isFolder: false, primaryTitle: 'File 2' })
      .addNode({ parentNodeId:-1, currentNodeId: 23, isFolder: true,
        icon: normalResource, selectedIcon: selectedResource,
        editIcon: editResource, primaryTitle: '目录3' })
      .addNode({ parentNodeId:-1, currentNodeId: 24, isFolder: false, primaryTitle: 'File 1' })
      .addNode({ parentNodeId:-1, currentNodeId: 31, isFolder: true,
        icon: normalResource, selectedIcon: selectedResource,
        editIcon: editResource, primaryTitle: '目录5', secondaryTitle: '0' })
      .addNode({ parentNodeId:-1, currentNodeId: 32, isFolder: true,
        icon: normalResource, selectedIcon: selectedResource,
        editIcon: editResource, primaryTitle: '目录6', secondaryTitle: '0' })
      .addNode({ parentNodeId:32, currentNodeId: 35, isFolder: true,
        icon: normalResource, selectedIcon: selectedResource,
        editIcon: editResource, primaryTitle: '目录6-1', secondaryTitle: '0' })
      .addNode({ parentNodeId:-1, currentNodeId: 33, isFolder: true,
        icon: normalResource, selectedIcon: selectedResource,
        editIcon: editResource, primaryTitle: '目录7', secondaryTitle: '0' })
      .addNode({ parentNodeId:33, currentNodeId: 34, isFolder: false, primaryTitle: '项目8' })
      .addNode({ parentNodeId:-1, currentNodeId: 36, isFolder: false, primaryTitle: '项目9' })
      .buildDone();

    this.treeControllerV2.refreshNode(-1, '父节点', '子节点');
  }

  build(): void {
    Column() {
      SideBarContainer(SideBarContainerType.Embed) {
        TreeViewV2({ treeControllerV2: this.treeControllerV2 })
        Row() {
          Divider().vertical(true).strokeWidth(2).color(0x000000).lineCap(LineCapStyle.Round)
          Column({ space: 30 }) {
            Text('ClickNodeId=' + this.clickNodeId).fontSize('16fp')
            Button('Add', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(90)
              .onClick((event: ClickEvent) => {
                this.treeControllerV2.addNode();
              })
            Button('Modify', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(90)
              .onClick((event: ClickEvent) => {
                this.treeControllerV2.modifyNode();
              })
            Button('Remove', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8).backgroundColor(0x317aff).width(120)
              .onClick((event: ClickEvent) => {
                this.treeControllerV2.removeNode();
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