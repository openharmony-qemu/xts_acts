struct CapiHandDetect {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CapiHandDetect';
  @State StepTips: string =  '提示：下面所有预期结果打印，需要在hilog日志中，搜索关键字handEvent，查看最后一组hand1与hand2的值\n' +
  @State StepTips: string =  '提示：单一手势左右手识别接口，返回值hand1与hand2为:未知=0，左手=1，右手=2当前仅在当前旗舰手机机型上能正确识别，其它设备均识别为0，下面所有预期结果打印，需要在hilog日志中，搜索关键字handEvent，查看最后一组hand1与hand2的值\n' +
    '操作步骤：1、左手拿手机，左手长按‘单一手势+onTouch’按钮\n'+'\n'+
    '预期结果：hand1与hand2打印1“\n'+
    '操作步骤：左手拿手机，右手长按‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手长按‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手长按‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n'+
    '操作步骤：左手拿手机，右手长按‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手拖动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手拖动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手拖动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手拖动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指拖动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：双指捏合‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：双指旋转‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手滑动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手滑动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手滑动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手滑动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指滑动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手点击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手点击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手点击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手点击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手双击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手双击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手双击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手双击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，左手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指点击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：双指双击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手长按+拖动‘并行手势组’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手长按+拖动‘并行手势组’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手长按+拖动‘并行手势组’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手长按+拖动‘并行手势组’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按+拖动‘并行手势组’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手触摸‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手触摸‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手触摸‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手触摸‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指触摸‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手长按+拖动‘顺序手势组’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：左手拿手机，右手长按+拖动‘顺序手势组’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：右手拿手机，左手长按+拖动‘顺序手势组’按钮\n' + '预期结果：hand1与hand2打印1“\n' +
    '操作步骤：右手拿手机，右手长按+拖动‘顺序手势组’按钮\n' + '预期结果：hand1与hand2打印2“\n' +
    '操作步骤：左手拿手机，左手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按+拖动‘顺序手势组’按钮\n' + '预期结果：hand1与hand2打印0“\n';
  @State Vue: boolean = false;
  @State CapiHandDetectVue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false


  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
    if (this.CapiHandDetectVue == false) {
      Button({ stateEffect: this.CapiHandDetectVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')


      })
    } else {
      Button({ stateEffect: this.Vue }) {
      Button({ stateEffect: this.CapiHandDetectVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.text1 === 'HOVER_ENTER' && this.text2 === 'HOVER_MOVE' && this.text3 === 'HOVER_EXIT' &&this.text4 === 'HOVER_CANCEL') {
        this.Vue = true;
        this.CapiHandDetectVue = true;
      }
    }, 500)
  }

        }).backgroundColor(Color.White)
          .onAppear(() => {
            nativeNode.createNativeNode("xcomponentId", this.getUIContext());
            this.Vue = true;
            this.CapiHandDetectVue = true;
          })
          .height("70%")
          .width("100%")
